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
import java.util.ArrayList;
import java.util.Calendar;
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
import model.ArtTag;
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
            
            Float price;
            String tempPrice = request.getParameter("price");
            if(tempPrice == null || !profile.getU_type().equals("prm")) {
                price = 0f;
            } else {
                price = Float.parseFloat(tempPrice);
                if(price <= 0f) {
                    price = 0f;
                }
            }

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
                        .toFile(new File(savePath + File.separator + "protected" + File.separator + artId + ".original" + ".jpg"));
                
                BufferedImage bimg = ImageIO.read(new File(savePath + File.separator + "protected" + File.separator + artId + ".original" + ".jpg"));
                int width = bimg.getWidth();
                int height = bimg.getHeight();
                
                File oriArt = new File(savePath + File.separator + fileName);
                
                if(width > height) {
                        if(width >= 1920) {
                            Thumbnails.of(oriArt)
                                .size(1920, 1080)
                                .toFile(new File(savePath + File.separator + "protected" + File.separator + artId + ".resized" + ".jpg"));
                            Thumbnails.of(oriArt)
                                .size(1920, 1080)
                                .watermark(Positions.CENTER, ImageIO.read(new File(savePath + File.separator + "watermark.png")), 0.5f)
                                .toFile(new File(savePath + File.separator + artId + "" + ".jpg"));
                        } else {
                            Thumbnails.of(oriArt)
                                .scale(1.0)
                                .toFile(new File(savePath + File.separator + "protected" + File.separator + artId + ".resized" + ".jpg"));
                            Thumbnails.of(oriArt)
                                .scale(1.0)
                                .watermark(Positions.CENTER, ImageIO.read(new File(savePath + File.separator + "watermark.png")), 0.5f)
                                .toFile(new File(savePath + File.separator + artId + "" + ".jpg"));
                        }
                    
                } else {
                    if(height >= 1920) {
                        Thumbnails.of(oriArt)
                                .size(1080, 1920)
                                .toFile(new File(savePath + File.separator + "protected" + File.separator + artId + ".resized" + ".jpg"));
                        Thumbnails.of(oriArt)
                                .size(1080, 1920)
                                .watermark(Positions.CENTER, ImageIO.read(new File(savePath + File.separator + "watermark.png")), 0.5f)
                                .toFile(new File(savePath + File.separator + artId + "" + ".jpg"));
                    } else {
                        Thumbnails.of(oriArt)
                                .scale(1.0)
                                .toFile(new File(savePath + File.separator + "protected" + File.separator + artId + ".resized" + ".jpg"));
                        Thumbnails.of(oriArt)
                                .scale(1.0)
                                .watermark(Positions.CENTER, ImageIO.read(new File(savePath + File.separator + "watermark.png")), 0.5f)
                                .toFile(new File(savePath + File.separator + artId + "" + ".jpg"));
                    }
                }
               

                File file = new File(savePath + File.separator + fileName);
                file.delete();

            ServletContext ctx = getServletContext();
            Connection conn = (Connection) ctx.getAttribute("connection");

            PreparedStatement pstmt;
                pstmt = conn.prepareStatement("INSERT INTO usami.image VALUES(?,?,?,?,?,?,?,?)");
                pstmt.setString(1, artId);
                pstmt.setString(2, artId + ".jpg");
                pstmt.setString(3, artName);
                pstmt.setString(4, artDesc);
                pstmt.setTimestamp(5, new Timestamp(calendar.getTime().getTime()));
                pstmt.setString(6, profile.getUsername());
                pstmt.setInt(7, 0);
                pstmt.setInt(8, 1);
                pstmt.executeUpdate();
                
                pstmt = conn.prepareStatement("INSERT INTO usami.product VALUES(?,?,?,?,?)");
                Timestamp temp = new Timestamp(calendar.getTime().getTime());
                pstmt.setString(1, (artId + temp.toString()).hashCode() + "");
                pstmt.setFloat(2, price);
                pstmt.setString(3, "usr");
                pstmt.setString(4, artId);
                pstmt.setString(5, profile.getUsername());
                
                pstmt.executeUpdate();
                
                // Set Tag
                String[] tags = request.getParameter("tags").split(",");
                for (String tag: tags) {
                    ArtTag artTag = new ArtTag(conn, tag);
                    if (artTag.getTag_id() == 0) {
                        artTag.insertTag();
                    }
                    artTag.insertTag_has(artId);
                    
                }
                
            } catch (SQLException ex) {
                request.setAttribute("message", "Upload Failed");
                request.setAttribute("mtype", "fail");
                ex.printStackTrace();
                return;
            }

            request.setAttribute("message", "Upload Successful");
            request.setAttribute("mtype", "pass");
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
