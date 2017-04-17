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
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Art;

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
            
            String tag_name = request.getParameter("tag");
            
            PreparedStatement pstmt, pstmt2;
            ResultSet rs, rs2;
            
            ArrayList<Art> arts = new ArrayList<>();
            
            try {
                pstmt = conn.prepareStatement("SELECT * FROM usami.Tag WHERE tag_name = ?");
                pstmt.setString(1, tag_name);
                
                rs = pstmt.executeQuery();
                int tag_id = 0;
                if (rs.next()) {
                    tag_id = rs.getInt("tag_id");
                }
                
                pstmt = conn.prepareStatement("SELECT * FROM usami.Tag_has WHERE tag_id = ?");
                pstmt.setInt(1, tag_id);
                
                rs = pstmt.executeQuery();
                while (rs.next()) {
                    pstmt2 = conn.prepareStatement("SELECT * FROM usami.Image WHERE image_id = ?");
                    pstmt2.setString(1, rs.getString("image_id"));
                    rs2 = pstmt2.executeQuery();
                    
                    if (rs2.next()) {
                        Art art = new Art(conn, rs.getString("image_id"));
                        arts.add(art);
                    }
                }
                
                request.setAttribute("arts", arts);
                request.setAttribute("tag_name", request.getParameter("tag"));
                
                RequestDispatcher obj = request.getRequestDispatcher("/gallery.jsp");
                obj.forward(request, response);
                
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
