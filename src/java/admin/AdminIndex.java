/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package admin;

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

/**
 *
 * @author frostnoxia
 */
@WebServlet(name = "AdminIndex", urlPatterns = {"/AdminIndex"})
public class AdminIndex extends HttpServlet {

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
            
            PreparedStatement pstmt;
            
            pstmt = conn.prepareStatement("SELECT AllDays.MyJoinDate, COUNT( I.image_id ) AS NumberJoined\n" +
                "FROM ( SELECT @curDate := Date_Add(@curDate, INTERVAL -1 day) AS MyJoinDate\n" +
                "       FROM ( SELECT @curDate := DATE(NOW()) + INTERVAL 1 day  ) sqlvars, Image LIMIT 7 ) AllDays\n" +
                "       LEFT JOIN Image I\n" +
                "       ON AllDays.MyJoinDate = DATE(I.upload_date)\n" +
                "GROUP BY AllDays.MyJoinDate");
            
            ResultSet rs = pstmt.executeQuery();
            
            ArrayList<String> allUploadTitle = new ArrayList<String>();
            ArrayList<String> allUploadValue = new ArrayList<String>();
            ArrayList<String> allSaleValue = new ArrayList<String>();
            ArrayList<String> allDate = new ArrayList<String>();
            
            while(rs.next()){
            
                allDate.add(rs.getString("MyJoinDate"));
                allUploadTitle.add("'" + rs.getString("MyJoinDate") + "'");
                allUploadValue.add(rs.getInt("NumberJoined") + "");
            }
            
            for(int i=0; i<7;i++){
                pstmt = conn.prepareStatement("SELECT count(buy_date) sale FROM usami.User_buy WHERE DATE(buy_date) = ?");
                pstmt.setString(1, allDate.get(i));
                
                rs = pstmt.executeQuery();
                
                if(rs.next()){
                    allSaleValue.add(rs.getInt("sale") + "");
                }
            }
            
            String allUploadTitleOut = String.join(",", allUploadTitle);
            String allUploadValueOut = String.join(",", allUploadValue);
            String allSaleValueOut = String.join(",", allSaleValue);
            
            request.setAttribute("uploadTitle", allUploadTitleOut);
            request.setAttribute("uploadValue", allUploadValueOut);
            request.setAttribute("saleValue", allSaleValueOut);
            
            out.println(allUploadTitleOut);
            out.println(allUploadValueOut);
            
            RequestDispatcher obj = request.getRequestDispatcher("/administrator/index.jsp");
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
            Logger.getLogger(AdminIndex.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(AdminIndex.class.getName()).log(Level.SEVERE, null, ex);
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
