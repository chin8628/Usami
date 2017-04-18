/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package filter;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.Arrays;
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
public class cookieAuthen implements Filter {

    private FilterConfig config;

    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        String path = ((HttpServletRequest) request).getRequestURI();
        System.out.println(path);
        if (path.equals("/Usami/") || path.equals("/Usami/SignIn") || path.startsWith("/Usami/asset")) {
            chain.doFilter(request, response);
        } else {

            HttpServletRequest req = (HttpServletRequest) request;
            HttpServletResponse res = (HttpServletResponse) response;

            HttpSession session = req.getSession();
            Cookie[] cookies = req.getCookies();

            if (session != null) {
                System.out.println("Have session ID : " + session.getId());

                if (session.getAttribute("user") != null
                        && session.getAttribute("profile") != null) {
                    chain.doFilter(request, response);
                    return;
                } else {
                    if (cookies != null && cookies.length == 3) {
                        System.out.println("Have Cookie !!");

                        String hcookie = hashPassword(cookies[0].getValue() + cookies[1].getValue());

                        if (hcookie.equals(cookies[2].getValue())) {
                            System.out.println("Hash Pass !!");

                            ServletContext ctx = this.config.getServletContext();
                            Connection conn = (Connection) ctx.getAttribute("connection");

                            try {
                                System.out.println("Session setAtt !!");
                                Profiles profile = new Profiles(conn, cookies[1].getValue());
                                User user = new User(conn, cookies[1].getValue());
                                session.setAttribute("user", user);
                                session.setAttribute("profile", profile);
                            } catch (SQLException ex) {
                                Logger.getLogger(cookieAuthen.class.getName()).log(Level.SEVERE, null, ex);
                            }

                            chain.doFilter(request, response);

                        } else {
                            System.out.println("Fake Cookie !!");
                            cookies[1].setMaxAge(0);
                            cookies[2].setMaxAge(0);
                            cookies[3].setMaxAge(0);
                            res.sendRedirect("/Usami");
                        }

                    } else {
                        System.out.println("Null Cookie !!");
                        res.sendRedirect("/Usami");
                    }
                }
            } else {
                res.sendRedirect("/Usami");
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
