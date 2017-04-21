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
import model.CommentModel;
import model.Profiles;
import model.User;

/**
 *
 * @author frostnoxia
 */
@WebServlet(name = "View", urlPatterns = {"/View/"})
public class View extends HttpServlet {

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
            
            ServletContext ctx = getServletContext();
            Connection conn = (Connection) ctx.getAttribute("connection");
            HttpSession session = request.getSession();
            User user = (User) session.getAttribute("user");
            
            PreparedStatement pstmt;
            ResultSet rs;
            
            Art art = new Art(conn, request.getParameter("id"));
            
            if(art.getStatus() != 1) {
                response.sendRedirect("/Usami/Error/?id=404");
            }
            
            art.setView(art.getView()+1);
            
            art.updateArts();
            
            pstmt =  conn.prepareStatement(""
                    + "SELECT * "
                    + "FROM usami.Image i "
                    + "JOIN usami.Profile p "
                    + "USING (user_id) "
                    + "WHERE image_id = '" + request.getParameter("id") +"';");
            
            rs = pstmt.executeQuery();

            // View Arts
            Profiles profile = null;
            
            if (rs.next()){
                art = new Art(conn, rs.getString("image_id"));
                profile = new Profiles(conn, rs.getString("user_id"));
 
            }

            //View Comments
            ArrayList<CommentModel> allComm = new ArrayList<>();
            CommentModel comm;

            pstmt = conn.prepareStatement("SELECT p.user_id, i.image_id, p.first_name, p.last_name, DATE_FORMAT(c.comm_date,'%b %d %Y %h:%i %p') 'fcomm_date', c.text, p.profile_image "
            + "FROM usami.Profile p JOIN usami.Comment c USING (user_id) JOIN usami.Image i USING (image_id) "
            + "WHERE i.image_id ='"+ request.getParameter("id")+"' ORDER BY c.comm_date DESC;");
            rs = pstmt.executeQuery();
            while (rs.next()){
                comm = new CommentModel();
                comm.setUsername(rs.getString("user_id"));
                comm.setImage_id(rs.getString("image_id"));
                comm.setFirst_name(rs.getString("first_name"));
                comm.setLast_name(rs.getString("last_name"));
                comm.setComm_date(rs.getString("fcomm_date"));
                comm.setText(rs.getString("text"));
                comm.setUrl_image(rs.getString("profile_image"));
                allComm.add(comm);
            }
            
            // Favorite Button
            pstmt = conn.prepareStatement("SELECT COUNT(image_id) FROM usami.User_favorite WHERE image_id = ?");
            pstmt.setString(1, request.getParameter("id"));
            rs = pstmt.executeQuery();
            if (rs.next()) {
                request.setAttribute("count", rs.getInt(1));
            }
            
            pstmt = conn.prepareStatement("SELECT * FROM usami.User_favorite WHERE user_id = ? AND image_id = ?");
            pstmt.setString(1, user.getUsername());
            pstmt.setString(2, request.getParameter("id"));
            rs = pstmt.executeQuery();
            if (rs.next()) {
                request.setAttribute("btn-fav", "btn-success");
            } else {
                request.setAttribute("btn-fav", "btn-default");
            }
            
            // Follow Button
            
            if (art.getUserId().equals(user.getUsername())) {
                request.setAttribute("btn-show", "hidden");
            } else {
                pstmt = conn.prepareStatement("SELECT * FROM usami.User_follow WHERE user_id = ? AND follower_id = ?");
                pstmt.setString(1, art.getUserId());
                pstmt.setString(2, user.getUsername());

                rs = pstmt.executeQuery();

                if (rs.next()) {
                    request.setAttribute("btn-follow", "btn-danger");
                    request.setAttribute("btn-follow-text", "Unfollow");
                } else {
                    request.setAttribute("btn-follow", "btn-success");
                    request.setAttribute("btn-follow-text", "Follow");
                }
                request.setAttribute("btn-show", "");
            }
            
            //Show Tag
            pstmt = conn.prepareStatement("SELECT * FROM usami.Tag_has WHERE image_id = ?;");
            pstmt.setString(1, request.getParameter("id"));
            
            ArrayList<ArtTag> allTag = new ArrayList<>();
            rs = pstmt.executeQuery();
            while (rs.next()) {
                
                ArtTag tag = new ArtTag(conn, rs.getInt("tag_id"));
                allTag.add(tag);
                
            }
            
            request.setAttribute("allTag", allTag);
            request.setAttribute("allComm", allComm);  
            request.setAttribute("art", art);
            request.setAttribute("owner", profile);
            request.setAttribute("user", user);
            RequestDispatcher obj = request.getRequestDispatcher("/art.jsp");
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
            Logger.getLogger(View.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(View.class.getName()).log(Level.SEVERE, null, ex);
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
