/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package auth;

import static model.Hash.hashPassword;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author bellkung
 */
@WebServlet(name = "SignUp", urlPatterns = {"/SignUp"})
public class SignUp extends HttpServlet {

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
            String[] fullname = request.getParameter("fullname").split("\\s+");
            String firstname = fullname[0];
            String lastname = "";
            if (fullname.length == 2) {
                lastname = fullname[1];
            }
            String username = request.getParameter("username");
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String repassword = request.getParameter("re-password");
            
            ServletContext ctx = getServletContext();
            Connection conn = (Connection) ctx.getAttribute("connection");
        
            PreparedStatement pstmt;
            try {
                pstmt = conn.prepareStatement("INSERT INTO usami.User VALUES(?,?,?,?,?,?)");
                pstmt.setString(1, username);
                pstmt.setString(2, hashPassword(password));
                pstmt.setString(3, email);
                pstmt.setInt(4, 0);
                pstmt.setTimestamp(5, Timestamp.valueOf("2013-09-04 13:30:00"));
                pstmt.setString(6, "STD");
                pstmt.executeUpdate();
                
                pstmt = conn.prepareStatement("INSERT INTO usami.Profile(user_id, first_name, last_name) VALUES(?,?,?)");
                pstmt.setString(1, username);
                pstmt.setString(2, firstname);
                pstmt.setString(3, lastname);
                pstmt.executeUpdate();

//                RequestDispatcher obj = request.getRequestDispatcher("non-auth/auth.jsp");
                response.sendRedirect("non-auth/auth.jsp");
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
