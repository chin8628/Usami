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
import model.User;

/**
 *
 * @author frostnoxia
 */
@WebServlet(name = "Pocket", urlPatterns = {"/Pocket"})
public class Pocket extends HttpServlet {

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
            
            HttpSession session = request.getSession();
            User user = (User)session.getAttribute("user");
            ServletContext ctx = getServletContext();
            Connection conn = (Connection) ctx.getAttribute("connection");
            
            String cur_coin = user.getCoin() + "";
            
            int in_coin = 0;
            int out_coin = 0;
            
            try {
                PreparedStatement pstmt = conn.prepareStatement("SELECT sum(buy_price) " +
                        "FROM User_buy u " +
                        "JOIN Product p " +
                        "USING (product_id) " +
                        "WHERE p.user_id = ?");
                
                Timestamp time = new Timestamp(Calendar.getInstance().getTime().getTime());
                time.setTime(time.getTime() - 2592000);
                
                pstmt.setString(1, user.getUsername());
                
                ResultSet rs = pstmt.executeQuery();
                if(rs.next()) {
                    in_coin = rs.getInt(1);
                }
                
                pstmt = conn.prepareStatement("SELECT sum(buy_price) " +
                        "FROM User_buy " +
                        "WHERE user_id = ?");
                
                time = new Timestamp(Calendar.getInstance().getTime().getTime());
                time.setTime(time.getTime() - 2592000);
                
                pstmt.setString(1, user.getUsername());
                
                rs = pstmt.executeQuery();
                if(rs.next()) {
                    out_coin = rs.getInt(1);
                }
                
                
            } catch (SQLException ex) {
                Logger.getLogger(Pocket.class.getName()).log(Level.SEVERE, null, ex);
            }
            
            request.setAttribute("cur_coin", cur_coin);
            request.setAttribute("in_coin", in_coin);
            request.setAttribute("out_coin", out_coin);
            
            RequestDispatcher obj = request.getRequestDispatcher("/pocket.jsp");
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
