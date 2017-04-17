/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.awt.Color;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import javax.imageio.ImageIO;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import static model.Hash.hashPassword;
import model.Profiles;
import model.User;
import net.coobird.thumbnailator.Thumbnails;
import net.coobird.thumbnailator.geometry.Positions;

/**
 *
 * @author frostnoxia
 */
@WebServlet(name = "ArtUpload", urlPatterns = {"/ArtUpload"})
@MultipartConfig
public class ArtUpload extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */

            HttpSession se = request.getSession();
            User profile = (User) se.getAttribute("user");

            Calendar calendar = Calendar.getInstance();

            String appPath = request.getServletContext().getRealPath("");
            String savePath = appPath + "/asset/img/art";
            String artName = request.getParameter("title");
            String artDesc = request.getParameter("desc");
            String artId = (profile.getUsername() + artName + new Timestamp(calendar.getTime().getTime()).toString()).hashCode() + "";

            File fileSaveDir = new File(savePath);
            if (!fileSaveDir.exists()) {
                fileSaveDir.mkdir();
            }

            Part part = request.getPart("art");
            String fileName = profile.getUsername() + "_" + extractFileName(part);

            ArrayList<String> acceptedFile = new ArrayList<String>();
            acceptedFile.add(".jpg");
            acceptedFile.add(".bmp");
            acceptedFile.add(".png");
            acceptedFile.add(".gif");

            if (!acceptedFile.contains((fileName.substring(fileName.length() - 4)).toLowerCase())) {
                out.println((fileName.substring(fileName.length() - 4)).toLowerCase());
                response.sendRedirect("Error.jsp");
                return;
            }

            fileName = new File(fileName).getName();
            part.write(savePath + File.separator + fileName);

            try {

                Thumbnails.of(new File(savePath + File.separator + fileName))
                        .scale(1.0)
                        .toFile(new File(savePath + File.separator + artId + ".original" + ".jpg"));
                
                BufferedImage bimg = ImageIO.read(new File(savePath + File.separator + artId + ".original" + ".jpg"));
                int width = bimg.getWidth();
                int height = bimg.getHeight();
                
                if(width > height) {
                        if(width >= 1920) {
                            Thumbnails.of(new File(savePath + File.separator + fileName))
                                .size(1920, 1080)
                                .toFile(new File(savePath + File.separator + artId + ".resized" + ".jpg"));
                            Thumbnails.of(new File(savePath + File.separator + fileName))
                                .size(1920, 1080)
                                .watermark(Positions.CENTER, ImageIO.read(new File(savePath + File.separator + "watermark.png")), 0.5f)
                                .toFile(new File(savePath + File.separator + artId + "" + ".jpg"));
                        } else {
                            Thumbnails.of(new File(savePath + File.separator + fileName))
                                .scale(1.0)
                                .toFile(new File(savePath + File.separator + artId + ".resized" + ".jpg"));
                            Thumbnails.of(new File(savePath + File.separator + fileName))
                                .scale(1.0)
                                .watermark(Positions.CENTER, ImageIO.read(new File(savePath + File.separator + "watermark.png")), 0.5f)
                                .toFile(new File(savePath + File.separator + artId + "" + ".jpg"));
                        }
                    
                } else {
                    if(height >= 1920) {
                        Thumbnails.of(new File(savePath + File.separator + fileName))
                                .size(1080, 1920)
                                .toFile(new File(savePath + File.separator + artId + ".resized" + ".jpg"));
                        Thumbnails.of(new File(savePath + File.separator + fileName))
                                .size(1080, 1920)
                                .watermark(Positions.CENTER, ImageIO.read(new File(savePath + File.separator + "watermark.png")), 0.5f)
                                .toFile(new File(savePath + File.separator + artId + "" + ".jpg"));
                    } else {
                        Thumbnails.of(new File(savePath + File.separator + fileName))
                                .scale(1.0)
                                .toFile(new File(savePath + File.separator + artId + ".resized" + ".jpg"));
                        Thumbnails.of(new File(savePath + File.separator + fileName))
                                .scale(1.0)
                                .watermark(Positions.CENTER, ImageIO.read(new File(savePath + File.separator + "watermark.png")), 0.5f)
                                .toFile(new File(savePath + File.separator + artId + "" + ".jpg"));
                    }
                }
               

                File file = new File(savePath + File.separator + fileName);
                file.delete();
                

            } catch (Exception ex) {
                ex.printStackTrace();
                response.sendRedirect("Error.jsp");
                return;
            }

            ServletContext ctx = getServletContext();
            Connection conn = (Connection) ctx.getAttribute("connection");

            PreparedStatement pstmt, pstmt2;
            ResultSet rs, rs2;
            try {
                pstmt = conn.prepareStatement("INSERT INTO usami.image VALUES(?,?,?,?,?,?)");
                pstmt.setString(1, artId);
                pstmt.setString(2, artId + ".jpg");
                pstmt.setString(3, artName);
                pstmt.setString(4, artDesc);
                pstmt.setTimestamp(5, new Timestamp(calendar.getTime().getTime()));
                pstmt.setString(6, profile.getUsername());
                pstmt.executeUpdate();
                
                // Set Tag
                String[] tags = request.getParameter("tags").split(",");
                for (String tag: tags) {
                    pstmt = conn.prepareStatement("SELECT * FROM usami.Tag WHERE tag_name = ?;");
                    pstmt.setString(1, tag);
                    
                    rs = pstmt.executeQuery();
                    int tag_id = 0;
                    if (!rs.next()) {
                        pstmt2 = conn.prepareStatement("INSERT INTO usami.Tag(tag_name) VALUES(?);");
                        pstmt2.setString(1, tag);
                        pstmt2.executeUpdate();
                        
                        pstmt2 = conn.prepareStatement("SELECT * FROM usami.Tag WHERE tag_name = ?;");
                        pstmt2.setString(1, tag);
                        rs2 = pstmt.executeQuery();
                        if (rs2.next()) {
                            tag_id = rs2.getInt("tag_id");
                        }
                        
                    } else {
                        tag_id = rs.getInt("tag_id");
                    }
                    
                    pstmt = conn.prepareStatement("INSERT INTO usami.Tag_has VALUES(?,?);");
                    pstmt.setInt(1, tag_id);
                    pstmt.setString(2, artId);
                    pstmt.executeUpdate();
                    
                }
                
            } catch (SQLException ex) {
                ex.printStackTrace();
                response.sendRedirect("Error.jsp");
                return;
            }

            response.sendRedirect("/Usami/View/?id=" + artId);
            return;
        }
    }

    private String extractFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String s : items) {
            if (s.trim().startsWith("filename")) {
                return s.substring(s.indexOf("=") + 2, s.length() - 1);
            }
        }
        return "";
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
