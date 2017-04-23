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
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Calendar;
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
            user = new User(conn, user.getUsername());
            session.setAttribute("user", user);
            
            User userInPage = new User(conn, id);
            Profiles profileInPage = new Profiles(conn, id);
            PreparedStatement pstmt;
            ResultSet rs;
            
            if (user.getUsername().equals(id)) {
                request.setAttribute("btnShow", "hidden");
                
            } else {
                // Check follow
                pstmt = conn.prepareStatement("SELECT * FROM usami.User_follow WHERE user_id = ? AND follower_id = ?");
                pstmt.setString(1, id);
                pstmt.setString(2, user.getUsername());

                rs = pstmt.executeQuery();

                if (rs.next()) {
                    request.setAttribute("btnFollow", "btn-danger");
                    request.setAttribute("btnFollowText", "Unfollow");
                    request.setAttribute("btnColor", "btn-red");
                } else {
                    request.setAttribute("btnFollow", "btn-success");
                    request.setAttribute("btnFollowText", "Follow");
                    request.setAttribute("btnColor", "btn-green");
                }
                request.setAttribute("btnShow", "");
            }
            
            // Count Follower
            pstmt = conn.prepareStatement("SELECT COUNT(follower_id) FROM usami.User_follow WHERE user_id = ?");
            pstmt.setString(1, id);
            
            rs = pstmt.executeQuery();
            if(rs.next()) {
                request.setAttribute("countFollower", rs.getInt(1));
            }
            
            
            // Count Following
            pstmt = conn.prepareStatement("SELECT COUNT(user_id) FROM usami.User_follow WHERE follower_id = ?");
            pstmt.setString(1, id);
            
            rs = pstmt.executeQuery();
            if(rs.next()) {
                request.setAttribute("countFollowing", rs.getInt(1));
            }
            
            // Show All tag
            pstmt = conn.prepareStatement("SELECT * FROM usami.Profile_focus WHERE user_id = ?");
            pstmt.setString(1, id);
            
            rs = pstmt.executeQuery();
            ArrayList<ArtTag> allTag = new ArrayList<>();
            while (rs.next()) {
                ArtTag tag = new ArtTag(conn, rs.getInt("tag_id"));
                allTag.add(tag);
            }
            
            // Count Visited All Time
            pstmt = conn.prepareStatement("SELECT SUM(view) FROM usami.Image WHERE user_id = ?");
            pstmt.setString(1, id);
            
            rs = pstmt.executeQuery();
            if (rs.next()) {
                request.setAttribute("visited", rs.getInt(1));
            }
            
            // Count Favorite All Time
            pstmt = conn.prepareStatement("SELECT COUNT(f.user_id) FROM usami.User_favorite f JOIN usami.Image i "
                    + "USING (image_id) WHERE i.user_id = ?");
            pstmt.setString(1, id);
            
            rs = pstmt.executeQuery();
            if (rs.next()) {
                request.setAttribute("favorited", rs.getInt(1));
            }
            
            // Show Arts Upload
            pstmt = conn.prepareStatement("SELECT * FROM usami.Image WHERE user_id = ?");
            pstmt.setString(1, id);
            
            ArrayList<Art> allArt = new ArrayList<>();
            rs = pstmt.executeQuery();
            while (rs.next()) {
                Art art = new Art(conn, rs.getString("image_id"));
                allArt.add(art);
            }
            
            //count income
            int in_coin = 0;
            pstmt = conn.prepareStatement("SELECT sum(buy_price) " +
                        "FROM User_buy u " +
                        "JOIN Product p " +
                        "USING (product_id) " +
                        "WHERE p.user_id = ?");
                
                Timestamp time = new Timestamp(Calendar.getInstance().getTime().getTime());
                time.setTime(time.getTime() - 2592000);
                
                pstmt.setString(1, user.getUsername());
                
                rs = pstmt.executeQuery();
                if(rs.next()) {
                    in_coin = rs.getInt(1);
                }
                
            //display chart
            
            ArrayList<String> allDate = new ArrayList<String>();
            ArrayList<String> allSaleValue = new ArrayList<String>();
            ArrayList<String> allUploadTitle = new ArrayList<String>();
            
            for(int i=6; i>=0; i--){
                pstmt = conn.prepareStatement("SELECT sum(buy_price) amount, DATE(NOW()) - INTERVAL ? DAY day FROM usami.User_buy u JOIN usami.Product p USING (product_id) WHERE DATE(buy_date) = DATE(NOW()) - INTERVAL ? DAY AND p.user_id = ?");
                pstmt.setInt(1, i);
                pstmt.setInt(2, i);
                pstmt.setString(3, user.getUsername());
                
                rs = pstmt.executeQuery();
                if(rs.next()){
                    allDate.add(rs.getString("day"));
                    allUploadTitle.add("'" + rs.getString("day") + "'");
                    allSaleValue.add(rs.getInt("amount") + "");
                }
                
            }
            
            
            String allSaleValueOut = String.join(",", allSaleValue);
            String allUploadTitleOut = String.join(",", allUploadTitle);
            
            
            request.setAttribute("chartDate", allUploadTitleOut);
            request.setAttribute("chartSale", allSaleValueOut);
            request.setAttribute("allArt", allArt);
            request.setAttribute("coin", in_coin);
            request.setAttribute("user", userInPage);
            request.setAttribute("profile", profileInPage);
            request.setAttribute("allTag", allTag);
            
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
