/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
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
import org.apache.tomcat.util.http.fileupload.FileItem;
import org.apache.tomcat.util.http.fileupload.RequestContext;
import org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author frostnoxia
 */
@WebServlet(name = "EditProfile", urlPatterns = {"/EditProfile"})
@MultipartConfig
public class EditProfile extends HttpServlet {

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

            HttpSession session = request.getSession();
            Profiles profile = (Profiles) session.getAttribute("profile");
            User user = (User) session.getAttribute("user");
            
            String fName = request.getParameter("firstname");
            String lName = request.getParameter("lastname");
            String email = request.getParameter("email");
            String password = request.getParameter("old-password");
            String newPassword = request.getParameter("new-password");
            String rePassword = request.getParameter("re-password");
            
            try {
                ServletContext ctx = getServletContext();
                Connection conn = (Connection) ctx.getAttribute("connection");
                
                if (user.confirmPass(conn, hashPassword(password))) {
                    
                    String appPath = request.getServletContext().getRealPath("");
                    String savePath = appPath + "/asset/img/avatar-img";

                    File fileSaveDir = new File(savePath);
                    if (!fileSaveDir.exists()) {
                        fileSaveDir.mkdir();
                    }
                    
                    Part part = request.getPart("avatar");
                    try {
                        String fileName = profile.getUsername() + "_" + extractFileName(part);
                        fileName = new File(fileName).getName();
                        part.write(savePath + File.separator + fileName);

                        Thumbnails.of(new File(savePath + File.separator + fileName))
                        .size(512, 512)
                        .toFile(new File(savePath + File.separator + profile.getUsername().hashCode() + ".jpg"));
                        profile.setUrl_image(profile.getUsername().hashCode() + ".jpg");

                    } catch (Exception e){
                        e.printStackTrace();
                    }
                    
                    profile.setFirst_name(fName);
                    profile.setLast_name(lName);
                    user.setEmail(email);
                    
                    user.changeEmail(conn);
                    profile.editProfile(conn);
                    
                    if (!newPassword.equals("")){
                        if (hashPassword(newPassword).equals(hashPassword(rePassword))) {
                            user.setPassword(hashPassword(newPassword));
                            user.changePassword(conn);
                            request.setAttribute("pass", "success");
                        }
                        else {
                            request.setAttribute("pass", "incorrect");
                        }
                    }
                    else {
                        request.setAttribute("pass", "success");
                    }
                    
                    session.setAttribute("user", user);
                    session.setAttribute("profile", profile);
                } else {
                    request.setAttribute("pass", "notpass");
                }
                
                
                //update password
                
                
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
            
            //call Profile update here
            
            getServletContext().getRequestDispatcher("/setting/profile.jsp").forward(request, response);
            
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
