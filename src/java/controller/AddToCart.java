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
@WebServlet(name = "AddToCart", urlPatterns = {"/AddToCart/"})
public class AddToCart extends HttpServlet {

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
            ServletContext ctx = getServletContext();
            Connection conn = (Connection) ctx.getAttribute("connection");
            String backUrl = request.getParameter("origin");
            User profile = (User) session.getAttribute("user");
            
            ArrayList<Art> cart = (ArrayList<Art>) session.getAttribute("cart");
            if(cart == null) {
                cart = new ArrayList<Art>();
            }
            
            Float total = (Float) session.getAttribute("total");
            if(total == null) {
                total = 0f;
            }
            
            Art art = new Art(conn, request.getParameter("id"));
            
            PreparedStatement pstmt;
            try {
                pstmt = conn.prepareStatement("SELECT product_id FROM User_buy WHERE user_id = ?");
                pstmt.setString(1, profile.getUsername());
                ResultSet rs = pstmt.executeQuery();
                
                while(rs.next()) {
                    if(art.getProduct().getProduct_id().equals(rs.getString("product_id"))) {
                        
                        request.setAttribute("status", "bought");
                        response.sendRedirect(backUrl);
                        return;
                    }
                }
                
            } catch (SQLException ex) {
                Logger.getLogger(AddToCart.class.getName()).log(Level.SEVERE, null, ex);
            }
            
            
            
            boolean isDuplicate = false;
            
             
            for(Art inCart: cart) {
                if(art.getId().equals(inCart.getId())) {
                    isDuplicate = true;
                    break;
                }
            }
            
            if(!isDuplicate) {
                cart.add(art);
            }

            total = 0f;
            
            for(Art inCart: cart) {
                total += inCart.getProduct().getPrice();
            }
                        
            session.setAttribute("cart", cart);
            session.setAttribute("total", total);
            request.setAttribute("status", isDuplicate + "");
            
            response.sendRedirect(backUrl);
            
            
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
