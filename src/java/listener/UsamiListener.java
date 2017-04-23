/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package listener;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
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
            conn = getMariadb().getConnection();
            sce.getServletContext().setAttribute("connection", conn);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        try {
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(UsamiListener.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private DataSource getUsami() throws NamingException {
        Context c = new InitialContext();
        return (DataSource) c.lookup("java:comp/env/usami");
    }

    private DataSource getMariadb() throws NamingException {
        Context c = new InitialContext();
        return (DataSource) c.lookup("java:comp/env/mariadb");
    }

    
    
}
