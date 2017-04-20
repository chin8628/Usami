/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import static model.Hash.hashPassword;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Profiles;
import model.User;

/**
 *
 * @author Chiib_000
 */
@WebServlet(name = "SignIn", urlPatterns = {"/SignIn"})
public class SignIn extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     * @throws java.sql.SQLException
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {

        String sql_pstm = "SELECT user_id, email FROM user WHERE user_id = ? AND password = ?";
        HttpSession session = request.getSession();

        ServletContext ctx = getServletContext();
        Connection conn = (Connection) ctx.getAttribute("connection");
        PreparedStatement pstm = conn.prepareStatement(sql_pstm);

        pstm.setString(1, request.getParameter("username"));
        pstm.setString(2, hashPassword(request.getParameter("password")));

        ResultSet rs = pstm.executeQuery();

        if (!rs.next()) {
            //add warning text when incorrect ************************
            /*
            
             */
            response.sendRedirect("/Usami");

        } else {

            Profiles profile = new Profiles(conn, request.getParameter("username"));
            User user = new User(conn, request.getParameter("username"));
            session.setAttribute("user", user);
            session.setAttribute("profile", profile);
            if (true) { // set check remember me box
                Cookie user_coki;
                String uid = rs.getString("user_id");
                String mail = rs.getString("email");
                String sign = hashPassword(uid+mail);
                        
                user_coki = new Cookie("UID", uid);
                user_coki.setMaxAge(60 * 60 * 24 * 7); // Exp 7 Day
                //user_coki.setSecure(true);
                response.addCookie(user_coki);
                
                user_coki = new Cookie("EMAIL", mail);
                user_coki.setMaxAge(60 * 60 * 24 * 7); // Exp 7 Day
                //user_coki.setSecure(true);
                response.addCookie(user_coki);
                
                user_coki = new Cookie("SIGN", sign);
                user_coki.setMaxAge(60 * 60 * 24 * 7); // Exp 7 Day
                //user_coki.setSecure(true);
                response.addCookie(user_coki);
                
                response.sendRedirect("/Usami/Index");
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
            Logger.getLogger(SignIn.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(SignIn.class.getName()).log(Level.SEVERE, null, ex);
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
