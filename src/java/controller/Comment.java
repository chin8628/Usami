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
import java.util.Calendar;
import java.util.*;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.CommentModel;
import model.Profiles;

/**
 *
 * @author bellkung
 */
@WebServlet(name = "Comment", urlPatterns = {"/Comment"})
public class Comment extends HttpServlet {

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
            String text = request.getParameter("comment");
            Calendar calendar = Calendar.getInstance();
            
            ServletContext ctx = getServletContext();
            Connection conn = (Connection) ctx.getAttribute("connection");
            
            HttpSession session = request.getSession();
            Profiles user = (Profiles) session.getAttribute("profile");
            
            try {
                PreparedStatement pstmt = conn.prepareStatement("INSERT INTO usami.Comment VALUES(?,?,?,?)");
                pstmt.setString(1, (String) user.getUsername());
                pstmt.setString(2, "12345");
                pstmt.setString(3, text);
                pstmt.setTimestamp(4, new Timestamp(calendar.getTime().getTime()));
                pstmt.executeUpdate();
                
                ArrayList<CommentModel> allComm = new ArrayList<>();
                CommentModel comm;
                
                pstmt = conn.prepareStatement("SELECT p.user_id, i.image_id, p.first_name, p.last_name, c.comm_date, c.text, p.profile_image "
                + "FROM usami.Profile p JOIN usami.Comment c USING (user_id) JOIN usami.Image i USING (image_id) "
                + "WHERE i.image_id ='"+"12345"+"' ORDER BY c.comm_date DESC;");
                ResultSet rs = pstmt.executeQuery();
                while (rs.next()){
                    comm = new CommentModel();
                    comm.setUsername(rs.getString("user_id"));
                    comm.setImage_id(rs.getString("image_id"));
                    comm.setFirst_name(rs.getString("first_name"));
                    comm.setLast_name(rs.getString("last_name"));
                    comm.setComm_date(rs.getString("comm_date"));
                    comm.setText(rs.getString("text"));
                    comm.setUrl_image(rs.getString("profile_image"));
                    allComm.add(comm);
                }
                
//                CommentModel comm = new CommentModel(conn, "12345"); // send db and image_id
                
                request.setAttribute("allComm", allComm);
                RequestDispatcher obj = request.getRequestDispatcher("art.jsp");
                obj.forward(request, response);
//                response.sendRedirect("art.jsp");
                
                
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
