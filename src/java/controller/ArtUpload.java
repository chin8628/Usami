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
import net.coobird.thumbnailator.Thumbnails;

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
            Profiles profile = (Profiles) se.getAttribute("user");
            
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
            
            
            if(!acceptedFile.contains((fileName.substring(fileName.length()-4)).toLowerCase())) {
                out.println((fileName.substring(fileName.length()-4)).toLowerCase());
                response.sendRedirect("Error.jsp");
                return;
            }
            
            fileName = new File(fileName).getName();
            part.write(savePath + File.separator + fileName);
            
            
            try{
                 BufferedImage bufferedImage;

                bufferedImage = ImageIO.read(new File(savePath + File.separator + fileName));

                // create a blank, RGB, same width and height, and a white background
                BufferedImage newBufferedImage = new BufferedImage(bufferedImage.getWidth(),
                            bufferedImage.getHeight(), BufferedImage.TYPE_INT_RGB);
                newBufferedImage.createGraphics().drawImage(bufferedImage, 0, 0, Color.WHITE, null);

                // write to jpeg file
                ImageIO.write(newBufferedImage, "jpg", new File(savePath + File.separator + artId + ".jpg"));

                File file = new File(savePath + File.separator + fileName);
                file.delete();
                
            } catch (Exception e) {
                response.sendRedirect("Error.jsp");
                return;
            }
            
            
            ServletContext ctx = getServletContext();
            Connection conn = (Connection) ctx.getAttribute("connection");
        
            PreparedStatement pstmt;
            try {
                pstmt = conn.prepareStatement("INSERT INTO usami.Image VALUES(?,?,?,?,?,?)");
                pstmt.setString(1, artId);
                pstmt.setString(2, artId + ".jpg");
                pstmt.setString(3, artName);
                pstmt.setString(4, artDesc);
                pstmt.setTimestamp(5, new Timestamp(calendar.getTime().getTime()));
                pstmt.setString(6, profile.getUsername());
                pstmt.executeUpdate();
                } catch (SQLException ex) {
                    ex.printStackTrace();
                    response.sendRedirect("Error.jsp");
                    return;
                }
            
            response.sendRedirect("upload.jsp");
            return;
        }
    }

    
    private String extractFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String s : items) {
            if (s.trim().startsWith("filename")) {
                return s.substring(s.indexOf("=") + 2, s.length()-1);
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
