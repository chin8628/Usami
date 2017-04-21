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
import model.ArtTag;
import model.Profiles;
import model.User;

/**
 *
 * @author frostnoxia
 */
@WebServlet(name = "EditArt", urlPatterns = {"/EditArt"})
public class EditArt extends HttpServlet {

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

            HttpSession session = request.getSession();
            Profiles profile = (Profiles) session.getAttribute("profile");
            
            
            ServletContext ctx = getServletContext();
            Connection conn = (Connection) ctx.getAttribute("connection");
            User user = null;
            
            try {
                user = new User(conn, profile.getUsername());
            } catch (SQLException ex) {
                Logger.getLogger(EditArt.class.getName()).log(Level.SEVERE, null, ex);
            }
            
            String artId = request.getParameter("id");
            String title = request.getParameter("title");
            String desc = request.getParameter("desc");
            String tempPrice = request.getParameter("price");
            if(tempPrice == null || !user.getU_type().equals("prm")) {
                tempPrice = "0";
            }
            int price = Integer.parseInt(tempPrice);
            String[] allTag = request.getParameter("tags").split(",");
            
            Art art = new Art(conn, artId);
            art.setTitle(title);
            art.setDesc(desc);
            art.getProduct().setPrice(price);
            art.updateArts();
            
            PreparedStatement pstmt;
            try {                
                // Delete all tag
                pstmt = conn.prepareStatement("DELETE FROM usami.Tag_has WHERE image_id = ?");
                pstmt.setString(1, artId);
                pstmt.executeUpdate();
                
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
            
            out.println(art.getProduct());
            out.println(art.getProduct().getProduct_id());
            
            
            art.updateArts();
            
            // Edit Tag
            for (String tag: allTag) {
                ArtTag artTag = new ArtTag(conn, tag);
                if (artTag.getTag_id() == 0) {
                    artTag.insertTag();
                }
                artTag.insertTag_has(artId);
            }
            
            request.setAttribute("message", "Edit Successful");
            request.setAttribute("mtype", "pass");
            response.sendRedirect("/Usami/Storage");
            
            
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
        } catch (Exception ex) {
            Logger.getLogger(EditArt.class.getName()).log(Level.SEVERE, null, ex);
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
        } catch (Exception ex) {
            Logger.getLogger(EditArt.class.getName()).log(Level.SEVERE, null, ex);
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
