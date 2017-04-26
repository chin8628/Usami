/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletResponse;


/**
 *
 * @author Chiib_000
 */
public class ProtectedPath implements Filter {
    
    private FilterConfig config;
    
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        HttpServletResponse res = (HttpServletResponse) response;
        res.sendRedirect("/Usami/Index");
    }
    
    @Override
    public void destroy() {
        
    }
    
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        this.config = filterConfig;
    }
    
}
