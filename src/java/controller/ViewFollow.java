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
import java.util.ArrayList;
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
@WebServlet(name = "ViewFollow", urlPatterns = {"/ViewFollow/"})
public class ViewFollow extends HttpServlet {

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
            
            ServletContext ctx = getServletContext();
            Connection conn = (Connection) ctx.getAttribute("connection");
            HttpSession session = request.getSession();
            User user = (User) session.getAttribute("user");
            
            ArrayList<Profiles> allFollowing = new ArrayList<>();
            ArrayList<Profiles> allFollower = new ArrayList<>();
            PreparedStatement pstmt;
            ResultSet rs;
            Profiles profile;
            
            
            // Follower
            pstmt  = conn.prepareStatement("SELECT * FROM usami.User_follow WHERE user_id = ?");
            pstmt.setString(1, request.getParameter("id"));
            
            rs = pstmt.executeQuery();
            while (rs.next()) {
                profile = new Profiles(conn, rs.getString("follower_id"));
                allFollower.add(profile);
            }
            
            // Following
            pstmt = conn.prepareStatement("SELECT * FROM usami.User_follow WHERE follower_id = ?");
            pstmt.setString(1, request.getParameter("id"));
            
            rs = pstmt.executeQuery();
            while (rs.next()) {
                profile = new Profiles(conn, rs.getString("user_id"));
                allFollowing.add(profile);
            }
            
            request.setAttribute("allFollowing", allFollowing);
            request.setAttribute("allFollower", allFollower);
            RequestDispatcher obj = request.getRequestDispatcher("/follow.jsp");
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
            Logger.getLogger(ViewFollow.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(ViewFollow.class.getName()).log(Level.SEVERE, null, ex);
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
