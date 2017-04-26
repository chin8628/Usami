/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package filter;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.ServletContext;
import static model.Hash.hashPassword;
import model.Profiles;
import model.User;

/**
 *
 * @author Chiib_000
 */
public class CookieAuthen implements Filter {

    private FilterConfig config;

    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {

        String uid = null;
        String email = null;
        String signature = null;

        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;

        HttpSession session = req.getSession();
        Cookie[] cookies = req.getCookies();
        if (cookies != null) {
            for (Cookie ck : cookies) {
                if (ck.getName().equals("UID")) {
                    uid = ck.getValue();
                }
                if (ck.getName().equals("EMAIL")) {
                    email = ck.getValue();
                }
                if (ck.getName().equals("SIGN")) {
                    signature = ck.getValue();
                }
            }
        }
        String path = req.getRequestURI();
        System.out.println(path);

        if (path.matches("\\/Usami\\/(SignIn|SignUp|CheckEmail|CheckUsername)+") || path.startsWith("/Usami/asset") || path.startsWith("/Usami/non-auth")) {
            chain.doFilter(request, response); //next to filter Prevent img/protected 
        } else if (path.equals("/Usami/")) {

            if (session.getAttribute("user") != null && session.getAttribute("profile") != null) {
                res.sendRedirect("/Usami/Index");
            } else {
                if (signature != null) {
                    //Start hash check
                    if (hashPassword(uid + email).equals(signature)) {
                        ServletContext ctx = this.config.getServletContext();
                        Connection conn = (Connection) ctx.getAttribute("connection");
                        try {
                            Profiles profile = new Profiles(conn, uid);
                            User user = new User(conn, uid);
                            session.setAttribute("user", user);
                            session.setAttribute("profile", profile);
                        } catch (SQLException ex) {
                            Logger.getLogger(CookieAuthen.class.getName()).log(Level.SEVERE, null, ex);
                        }
                        res.sendRedirect("/Usami/Index");
                        return;
                    } else {
                        for (Cookie ck : cookies) {
                            ck.setMaxAge(0);
                            res.addCookie(ck);
                        }
                    }//End Hash Check     
                }
                chain.doFilter(request, response);
            }
        } else {

            if (session.getAttribute("user") != null && session.getAttribute("profile") != null) {
                chain.doFilter(request, response);
            } else {
                if (signature != null) {
                    //Start hash check
                    if (hashPassword(uid + email).equals(signature)) {
                        ServletContext ctx = this.config.getServletContext();
                        Connection conn = (Connection) ctx.getAttribute("connection");
                        try {
                            Profiles profile = new Profiles(conn, uid);
                            User user = new User(conn, uid);
                            session.setAttribute("user", user);
                            session.setAttribute("profile", profile);
                        } catch (SQLException ex) {
                            Logger.getLogger(CookieAuthen.class.getName()).log(Level.SEVERE, null, ex);
                        }
                        chain.doFilter(request, response);
                        return;
                    } else {
                        for (Cookie ck : cookies) {
                            ck.setMaxAge(0);
                            res.addCookie(ck);
                        }
                    }//End Hash Check  
                }
                res.sendRedirect("/Usami/");
            }
        }
    }

    @Override
    public void destroy() {

    }

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        this.config = filterConfig;
    }

}