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
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Art;

/**
 *
 * @author frostnoxia
 */
@WebServlet(name = "DeleteArt", urlPatterns = {"/DeleteArt/"})
public class DeleteArt extends HttpServlet {

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
            
            String id = request.getParameter("id2");
            
            ServletContext ctx = getServletContext();
            Connection conn = (Connection) ctx.getAttribute("connection");
            
            String appPath = request.getServletContext().getRealPath("");
            String savePath = appPath + "/asset/img/art";
            
            
            Art art = new Art(conn, id);
            art.setStatus(0);
            art.updateArts();
            
            
            PreparedStatement pstmt;
            try {
                pstmt = conn.prepareStatement("DELETE FROM usami.Product WHERE image_id = ?;");
                pstmt.setString(1, id);
                pstmt.executeUpdate();
                
                pstmt = conn.prepareStatement("DELETE FROM usami.Comment WHERE image_id = ?;");
                pstmt.setString(1, id);
                pstmt.executeUpdate();
                
                pstmt = conn.prepareStatement("DELETE FROM usami.Tag_has WHERE image_id = ?;");
                pstmt.setString(1, id);
                pstmt.executeUpdate();
                
                pstmt = conn.prepareStatement("DELETE FROM usami.Tag WHERE tag_id NOT IN (SELECT tag_id FROM usami.Tag_has);");
                pstmt.executeUpdate();
                
                
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
            
            
            request.setAttribute("message", "Art Deleted");
            request.setAttribute("mtype", "norm");
            
            String key = request.getParameter("key");
            String mode = request.getParameter("mode");
            
            
            if(key == null){
                response.sendRedirect("/Usami/Storage");
            } else {
                response.sendRedirect("/Usami/AdminSearch/?key=" + key + "&mode=" + mode);
            }
            
            
            
            
            
        }
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
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(DeleteArt.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(DeleteArt.class.getName()).log(Level.SEVERE, null, ex);
        }
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
