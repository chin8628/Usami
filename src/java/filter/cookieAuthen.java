/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package filter;

import java.io.IOException;
import java.io.PrintStream;
import java.io.PrintWriter;
import java.io.StringWriter;
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
import static model.Hash.hashPassword;

/**
 *
 * @author Chiib_000
 */
public class cookieAuthen implements Filter {

    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        String path = ((HttpServletRequest) request).getRequestURI();
        System.out.println(path);
        if (path.equals("/Usami/") || path.equals("/Usami/SignIn")) {
            chain.doFilter(request, response);

        } else {

            HttpServletRequest req = (HttpServletRequest) request;
            HttpServletResponse res = (HttpServletResponse) response;
            HttpSession session = req.getSession();
            System.out.println(session);
            Cookie[] cookies = req.getCookies();

            if (session != null) {
                chain.doFilter(request, response);

            }
            if (cookies != null && cookies.length > 1) {
                String hcookie = hashPassword(cookies[1].getValue() + cookies[2].getValue());

                if (hcookie.equals(cookies[3].getValue())) {
                    
                    //Profiles profile = new Profiles(conn, cookies[1].getValue());
                    //User user = new User(conn, cookies[1].getValue());
                    //session.setAttribute("user", user);
                    //session.setAttribute("profile", profile);

                } else {

                }

            } else {

            }

        }
    }

    @Override
    public void destroy() {

    }
    private String pathToBeIgnored;

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        pathToBeIgnored = filterConfig.getInitParameter("/auth.jsp");
    }

}
