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
import model.ArtTag;
import model.User;

/**
 *
 * @author bellkung
 */
@WebServlet(name = "Gallery", urlPatterns = {"/Gallery/"})
public class Gallery extends HttpServlet {

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
            
            ServletContext ctx = getServletContext();
            Connection conn = (Connection) ctx.getAttribute("connection");
            
            HttpSession session = request.getSession();
            User user = (User) session.getAttribute("user");
            
            PreparedStatement pstmt;
             ResultSet rs;
            
            if (request.getParameter("tag") != null) {
                int tag_id = Integer.parseInt(request.getParameter("tag"));
            
                ArrayList<Art> arts = new ArrayList<>();
                ArtTag tag = new ArtTag(conn, tag_id);
                tag.getImageID();

                for (String img_id: tag.getAllImgID()) {
                    Art art = new Art(conn, img_id);
                    if(art.getStatus() == 1 ) arts.add(art);
                }

                // Follow Tag
                
                try {
                    pstmt = conn.prepareStatement("SELECT * FROM usami.Profile_focus p "
                            + "JOIN usami.Tag t USING (tag_id) WHERE t.tag_id = ? AND p.user_id = ?");
                    pstmt.setInt(1, tag_id);
                    pstmt.setString(2, user.getUsername());

                    rs = pstmt.executeQuery();
                    if (rs.next()) {
                        request.setAttribute("btnFollow", "btn-danger");
                        request.setAttribute("btnFollowText", "Unfollow");
                    } else {
                        request.setAttribute("btnFollow", "btn-success");
                        request.setAttribute("btnFollowText", "Follow");
                    }

                } catch (SQLException ex) {
                    ex.printStackTrace();
                }
                request.setAttribute("arts", arts);
                request.setAttribute("tag", tag);
                
            } else if (request.getParameter("art") != null) {
                
                // Recommend For You
                if (request.getParameter("art").equals("recommend")) {
                    ArrayList<Art> artRecommend = new ArrayList<>();
                    try {
                        pstmt = conn.prepareStatement("SELECT DISTINCT i.image_id FROM usami.Profile_focus p JOIN usami.Tag_has t USING (tag_id) " +
                                "JOIN usami.Image i USING (image_id) WHERE  p.user_id = ? AND status = 1 " +
                                "ORDER BY upload_date DESC;");
                        pstmt.setString(1, user.getUsername());
                        rs = pstmt.executeQuery();
                        while (rs.next()) {
                            Art art = new Art(conn, rs.getString("image_id"));
                            artRecommend.add(art);
                        }
                        request.setAttribute("artGallery", artRecommend);
                        request.setAttribute("artType", "Recommend For You");
                    } catch (SQLException ex) {
                        ex.printStackTrace();
                    }
                
                    
                // Random Art
                } else if (request.getParameter("art").equals("random")) {
                    ArrayList<Art> artRandom = new ArrayList<>();
                    try {
                        pstmt = conn.prepareStatement("SELECT * FROM usami.Image ORDER BY RAND();");
                        rs = pstmt.executeQuery();
                        
                        while (rs.next()) {
                            Art art = new Art(conn, rs.getString("image_id"));
                            artRandom.add(art);
                        }
                        request.setAttribute("artGallery", artRandom);
                        request.setAttribute("artType", "Random Art");
                        
                    } catch (SQLException ex) {
                        ex.printStackTrace();
                    }
                    
                // Popular Art
                } else if (request.getParameter("art").equals("popular")) {
                    ArrayList<Art> artPopular = new ArrayList<>();
                    try {
                        pstmt = conn.prepareStatement("SELECT * FROM Image ORDER BY view DESC;");
                        rs = pstmt.executeQuery();
                        
                        while (rs.next()) {
                            Art art = new Art(conn, rs.getString("image_id"));
                            artPopular.add(art);
                        }
                        
                        request.setAttribute("artGallery", artPopular);
                        request.setAttribute("artType", "Popular Art");
                        
                    } catch (SQLException ex) {
                        ex.printStackTrace();
                    }
                
                // Following Art
                } else if (request.getParameter("art").equals("following")) {
                    ArrayList<Art> artFollowing = new ArrayList<>();
                    try {
                        pstmt =  conn.prepareStatement("SELECT * FROM User_follow JOIN Image USING (user_id) WHERE follower_id = ? LIMIT 8");
                        pstmt.setString(1, user.getUsername());
                        rs = pstmt.executeQuery();
                        
                        while (rs.next()) {
                            Art art = new Art(conn, rs.getString("image_id"));
                            artFollowing.add(art);
                        }
                        
                        request.setAttribute("artGallery", artFollowing);
                        request.setAttribute("artType", "New Work: Following");
                        
                    } catch (SQLException ex) {
                        ex.printStackTrace();
                    }
                }
                
            }
            
            
                
            RequestDispatcher obj = request.getRequestDispatcher("/gallery.jsp");
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
