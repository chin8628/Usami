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
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Profiles;
import model.User;

/**
 *
 * @author bellkung
 */
@WebServlet(name = "ViewProfile", urlPatterns = {"/ViewProfile/"})
public class ViewProfile extends HttpServlet {

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
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String id = request.getParameter("id");
            
            ServletContext ctx = getServletContext();
            Connection conn = (Connection) ctx.getAttribute("connection");
            
            HttpSession session = request.getSession();
            User user = (User) session.getAttribute("user");
            
            User userInPage = new User(conn, id);
            Profiles profileInPage = new Profiles(conn, id);
            
            if (user.getUsername().equals(id)) {
                request.setAttribute("btn-show", "hidden");
                
            } else {
                // Check follow
                PreparedStatement pstmt = conn.prepareStatement("SELECT * FROM usami.User_follow WHERE user_id = ? AND follower_id = ?");
                pstmt.setString(1, id);
                pstmt.setString(2, user.getUsername());

                ResultSet rs = pstmt.executeQuery();

                if (rs.next()) {
                    request.setAttribute("btn-follow", "btn-danger");
                    request.setAttribute("btn-follow-text", "Unfollow");
                } else {
                    request.setAttribute("btn-follow", "btn-success");
                    request.setAttribute("btn-follow-text", "Follow");
                }
                request.setAttribute("btn-show", "");
            }
            
            
            
            request.setAttribute("user", userInPage);
            request.setAttribute("profile", profileInPage);
            
            RequestDispatcher obj = request.getRequestDispatcher("/profile.jsp");
            obj.forward(request, response);
            
            
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
        } catch (SQLException ex) {
            Logger.getLogger(ViewProfile.class.getName()).log(Level.SEVERE, null, ex);
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
        } catch (SQLException ex) {
            Logger.getLogger(ViewProfile.class.getName()).log(Level.SEVERE, null, ex);
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
