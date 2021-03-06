/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Timestamp;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author frostnoxia
 */
@WebServlet(name = "AdminDeleteComment", urlPatterns = {"/AdminDeleteComment"})
public class AdminDeleteComment extends HttpServlet {

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

            ServletContext ctx = getServletContext();
            Connection conn = (Connection) ctx.getAttribute("connection");
            
            String image_id = request.getParameter("image_id");
            String username = request.getParameter("username");
            Timestamp time = new Timestamp(Long.parseLong(request.getParameter("comm_date")));
            
            out.println(image_id);
            out.println(username);
            out.println(time);
            
            try {
                PreparedStatement pstmt = conn.prepareStatement("DELETE FROM usami.Comment WHERE user_id=? AND image_id=? AND comm_date=?");
                pstmt.setString(1, username);
                pstmt.setString(2, image_id);
                pstmt.setTimestamp(3, time);
                
                pstmt.executeUpdate();
                
                String key = request.getParameter("key");
                String mode = request.getParameter("mode");
                response.sendRedirect("/Usami/AdminSearch/?key=" + key + "&mode=" + mode);
                return;
                
            } catch (SQLException ex) {
                ex.printStackTrace();
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
