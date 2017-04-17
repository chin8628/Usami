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
import model.Art;
import model.Profiles;
import model.User;

/**
 *
 * @author frostnoxia
 */
@WebServlet(name = "Index", urlPatterns = {"/Index"})
public class Index extends HttpServlet {

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
            /* TODO output your page here. You may use following sample code. */
            HttpSession session = request.getSession();
            Profiles user = (Profiles) session.getAttribute("profile");
            ServletContext ctx = getServletContext();
            Connection conn = (Connection) ctx.getAttribute("connection");
            PreparedStatement pstmt;
            ResultSet rs;
            
            pstmt =  conn.prepareStatement(""
                    + "SELECT * FROM User_watch JOIN Image USING (image_id) GROUP BY (image_id) ORDER BY count(image_id) DESC LIMIT 8");
            
            rs = pstmt.executeQuery();
            
            ArrayList<Art> popArt = new ArrayList<Art>();
            
            
            while (rs.next()){
                Art art = new Art(conn, rs.getString("image_id"));
                art.setPrice("free");
                popArt.add(art);
                
            }
            request.setAttribute("popArt", popArt);
            
            pstmt =  conn.prepareStatement("SELECT * FROM User_follow JOIN Image USING (user_id) WHERE follower_id = '"+user.getUsername()+"' LIMIT 8");
            
            rs = pstmt.executeQuery();
            
            ArrayList<Art> folArt = new ArrayList<Art>();
            
            
            while (rs.next()){
                Art art = new Art(conn, rs.getString("image_id"));
                art.setPrice("free");

                folArt.add(art);
                
            }
            request.setAttribute("folArt", folArt);
            
            // Count Follower
            pstmt = conn.prepareStatement("SELECT COUNT(follower_id) FROM usami.User_follow WHERE user_id = ?");
            pstmt.setString(1, user.getUsername());
            
            rs = pstmt.executeQuery();
            if(rs.next()) {
                request.setAttribute("countFollower", rs.getInt(1));
            }
            
            
            // Count Following
            pstmt = conn.prepareStatement("SELECT COUNT(user_id) FROM usami.User_follow WHERE follower_id = ?");
            pstmt.setString(1, user.getUsername());
            
            rs = pstmt.executeQuery();
            if(rs.next()) {
                request.setAttribute("countFollowing", rs.getInt(1));
            }
            
            RequestDispatcher obj = request.getRequestDispatcher("index.jsp");
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
            Logger.getLogger(Index.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(Index.class.getName()).log(Level.SEVERE, null, ex);
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
