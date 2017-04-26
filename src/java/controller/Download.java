/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.sql.Connection;
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
@WebServlet(name = "Download", urlPatterns = {"/Download/"})
public class Download extends HttpServlet {

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
            response.setContentType("image/jpg");
            
            HttpSession se = request.getSession();
            User profile = (User) se.getAttribute("user");
            ServletContext ctx = getServletContext();
            Connection conn = (Connection) ctx.getAttribute("connection");
            
            String mode = request.getParameter("mode");
            Art art = new Art(conn, request.getParameter("id"));
            response.setHeader("Content-disposition","attachment; filename=" + art.getTitle() + ".jpg");
            String appPath = request.getServletContext().getRealPath("");
            String savePath = appPath + "/asset/img/art";
            
            String modeString = "";
            
            
            if(art.checkPur(profile.getUsername()) || art.getUserId().equals(profile.getUsername())) {
                if(mode.equals("o")) {
                    modeString=".original";
                } else {
                    modeString=".resized";
                }
            } else {
                if(art.getProduct().getPrice() == 0) {
                    
                        if(mode.equals("o")) {
                            if(profile.getU_type().equals("STD")){
                                request.setAttribute("message", "Only Premium user are allowed to download free original photos");
                                request.setAttribute("mtype", "fail");
                                response.sendRedirect("/Usami/View/?id=" + art.getId());
                                return;
                            }
                            modeString=".original";
                        } else {
                            modeString=".resized";
                        }
                    
                } else {
                    request.setAttribute("message", "You do not owned this art");
                    request.setAttribute("mtype", "fail");
                    response.sendRedirect("/Usami/View/?id=" + art.getId());
                    return;
                }
            }
            
                    
                    

            OutputStream out = response.getOutputStream();
            FileInputStream in = new FileInputStream(savePath + File.separator + "protected" + File.separator + art.getId() + modeString + ".jpg");
            byte[] buffer = new byte[4096];
            int length;
            while ((length = in.read(buffer)) > 0){
                out.write(buffer, 0, length);
            }
            in.close();
            out.flush();
            
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
