
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

/**
 *
 * @author boon8
 */
public class EncodeFilter implements Filter {
    
    private FilterConfig filterConfig = null;
  
    public void doFilter(ServletRequest request, ServletResponse response,
            FilterChain chain)
            throws IOException, ServletException {

            response.setContentType("text/html; charset=UTF-8");
            response.setCharacterEncoding("UTF-8");
            request.setCharacterEncoding("UTF-8");
            
            chain.doFilter(request, response);

    }

    public FilterConfig getFilterConfig() {
        return (this.filterConfig);
    }

    public void destroy() {        
    }

    public void init(FilterConfig filterConfig) {        

    }

}
