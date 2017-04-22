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
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Calendar;
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
import model.User;

/**
 *
 * @author frostnoxia
 */
@WebServlet(name = "Buy", urlPatterns = {"/Buy"})
public class Buy extends HttpServlet {

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
            ArrayList<Art> cart = (ArrayList<Art>) session.getAttribute("cart");
            User user = (User)session.getAttribute("user");
            ServletContext ctx = getServletContext();
            Connection conn = (Connection) ctx.getAttribute("connection");
            
            Float total = 0f;
            
            for(Art inCart: cart) {
                total += inCart.getProduct().getPrice();
            }
            
            if(cart.size() == 0) {
                //error code
                response.sendRedirect("/Usami/cart.jsp");
                return;
            } else if(user.getCoin() < total) {
                //insufficient coin
                response.sendRedirect("/Usami/cart.jsp");
                return;
            } else {
                user.setCoin((int) (user.getCoin() - total));
                user.ChangeCoin(conn);
                PreparedStatement pstmt;
                for(Art art: cart) {
                    pstmt = conn.prepareStatement("INSERT INTO usami.User_buy VALUES (?,?,?,?)");
                    pstmt.setString(1, user.getUsername());
                    pstmt.setString(2, art.getProduct().getProduct_id());
                    pstmt.setTimestamp(3, new Timestamp(Calendar.getInstance().getTime().getTime()));
                    pstmt.setFloat(4, art.getProduct().getPrice());
                    
                    pstmt.executeUpdate();
                    
                    User creator = new User(conn, art.getUserId());
                    creator.setCoin((int) (creator.getCoin() + art.getProduct().getPrice()));
                    creator.ChangeCoin(conn);
                }
                
                
                cart = new ArrayList<Art>();
                total = 0f;
                
                session.setAttribute("cart", cart);
                session.setAttribute("total", total);
                
                response.sendRedirect("/Usami/cart.jsp");
                
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(Buy.class.getName()).log(Level.SEVERE, null, ex);
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
        try  {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(Buy.class.getName()).log(Level.SEVERE, null, ex);
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
