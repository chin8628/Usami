/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

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
import javax.servlet.http.HttpSession;
import model.ArtTag;
import model.Profiles;

/**
 *
 * @author frostnoxia
 */
@WebServlet(name = "EditArt", urlPatterns = {"/EditArt"})
public class EditArt extends HttpServlet {

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
            Profiles user = (Profiles) session.getAttribute("profile");
            
            ServletContext ctx = getServletContext();
            Connection conn = (Connection) ctx.getAttribute("connection");
            
            String artId = request.getParameter("id");
            String title = request.getParameter("title");
            String desc = request.getParameter("desc");
            String[] allTag = request.getParameter("tags").split(",");
            
            PreparedStatement pstmt;
            try {
                pstmt = conn.prepareStatement("UPDATE usami.Image SET image_name = ?, Image.desc = ? WHERE image_id = ?;");
                pstmt.setString(1, title);
                pstmt.setString(2, desc);
                pstmt.setString(3, artId);
                pstmt.executeUpdate();
                
                // Delete all tag
                pstmt = conn.prepareStatement("DELETE FROM usami.Tag_has WHERE image_id = ?");
                pstmt.setString(1, artId);
                pstmt.executeUpdate();
                
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
            
            // Edit Tag
            for (String tag: allTag) {
                ArtTag artTag = new ArtTag(conn, tag);
                if (artTag.getTag_id() == 0) {
                    artTag.insertTag();
                }
                artTag.insertTag_has(artId);
            }
            
            response.sendRedirect("/Usami/Storage");
            
            
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
            Logger.getLogger(EditArt.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(EditArt.class.getName()).log(Level.SEVERE, null, ex);
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
