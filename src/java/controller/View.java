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
import model.Art;
import model.CommentModel;
import model.Profiles;
import sun.java2d.cmm.Profile;

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
            
            PreparedStatement pstmt =  conn.prepareStatement(""
                    + "SELECT * "
                    + "FROM usami.Image i "
                    + "JOIN usami.Profile p "
                    + "USING (user_id) "
                    + "WHERE image_id = '" + request.getParameter("id") +"';");
            
            ResultSet rs = pstmt.executeQuery();

            Art art = new Art();
            Profiles profile = null;
            
            
            if (rs.next()){
                art.setUrl(rs.getString("image_url"));
                art.setTitle(rs.getString("image_name"));
                art.setId(rs.getString("image_id"));
                art.setPrice("free");
                art.setUserId(rs.getString("user_id"));
                art.setDesc(rs.getString("desc"));
                art.setUpload_date(rs.getString("upload_date"));
                
                profile = new Profiles(conn, rs.getString("user_id"));
                
                
            }

            ArrayList<CommentModel> allComm = new ArrayList<>();
                CommentModel comm;
                
                pstmt = conn.prepareStatement("SELECT p.user_id, i.image_id, p.first_name, p.last_name, c.comm_date, c.text, p.profile_image "
                + "FROM usami.Profile p JOIN usami.Comment c USING (user_id) JOIN usami.Image i USING (image_id) "
                + "WHERE i.image_id ='"+ request.getParameter("id")+"' ORDER BY c.comm_date DESC;");
                rs = pstmt.executeQuery();
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
                
                
                request.setAttribute("allComm", allComm);
                
            request.setAttribute("art", art);
            request.setAttribute("owner", profile);
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