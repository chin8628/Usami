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
import model.Profiles;

/**
 *
 * @author frostnoxia
 */
@WebServlet(name = "Storage", urlPatterns = {"/Storage"})
public class Storage extends HttpServlet {

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
            
            PreparedStatement pstmt =  conn.prepareStatement(""
                    + "SELECT * "
                    + "FROM usami.Image "
                    + "WHERE user_id = '" + user.getUsername() + "' "
                            + "AND status = 1 "
                    + "ORDER BY upload_date DESC ");
            
            ResultSet rs = pstmt.executeQuery();
            
            ArrayList<Art> allArt = new ArrayList<Art>();
            
            while (rs.next()){
                Art art = new Art(conn, rs.getString("image_id"));
                art.getCurrentTags();
                allArt.add(art);
            }
            
            pstmt = conn.prepareStatement("SELECT *, DATE_FORMAT(b.buy_date,'%b %d %Y %h:%i %p') 'fbuy_date' FROM usami.User_buy b JOIN usami.Product p USING(product_id) "
                        + "JOIN usami.Image i USING(image_id) WHERE b.user_id = ? ORDER BY b.buy_date DESC");
                pstmt.setString(1, user.getUsername());
                rs = pstmt.executeQuery();
            
            ArrayList<Art> allPur = new ArrayList<Art>();
            
            while (rs.next()){
                Art art = new Art(conn, rs.getString("image_id"));
                art.getCurrentTags();
                allPur.add(art);
            }

            request.setAttribute("allArt", allArt);
            request.setAttribute("allPur", allPur);
            RequestDispatcher obj = request.getRequestDispatcher("/storage.jsp");
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
            Logger.getLogger(Storage.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(Storage.class.getName()).log(Level.SEVERE, null, ex);
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
