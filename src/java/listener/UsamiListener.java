/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package listener;

import java.sql.Connection;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.sql.DataSource;

/**
 * Web application lifecycle listener.
 *
 * @author bellkung
 */
public class UsamiListener implements ServletContextListener {

    private Connection conn; 
    
    @Override
    public void contextInitialized(ServletContextEvent sce) {
        try {
            conn = getUsami().getConnection();
            sce.getServletContext().setAttribute("connection", conn);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    private DataSource getUsami() throws NamingException {
        Context c = new InitialContext();
        return (DataSource) c.lookup("java:comp/env/usami");
    }
    
    
}
