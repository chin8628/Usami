/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Utility;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Art;

/**
 *
 * @author frostnoxia
 */
public class Searcher {
    
    private Connection conn;
    private String sql;
    private PreparedStatement pstmt;
    private ResultSet rs;
    
    public Searcher (Connection conn) {
    
        this.conn = conn;
        
    }
    
    public ArrayList<Art> searchArt(String key){
    
        sql = "SELECT DISTINCT image_id FROM Image JOIN Profile USING (user_id) JOIN Tag_has USING (image_id) JOIN Tag using (tag_id) \n" +
"WHERE lower(image_name) like ? " +
"OR lower(first_name) like ? " +
"OR lower(last_name) like ? " +
"OR lower(tag_name) LIKE ? " +
"OR lower(image_id) like ? ";
        
        
        try {
            pstmt = conn.prepareCall(sql);
            pstmt.setString(1, "%" + key + "%");
            pstmt.setString(2, "%" + key + "%");
            pstmt.setString(3, "%" + key + "%");
            pstmt.setString(4, "%" + key + "%");
            pstmt.setString(5, "%" + key + "%");
            rs = pstmt.executeQuery();
        
            ArrayList<Art> allArt = new ArrayList<Art>();
            
            Art temp;
            
            while(rs.next()) {
                temp = new Art(conn, rs.getString("image_id"));
                allArt.add(temp);
            }
            
            return allArt;
            
        } catch (SQLException ex) {
            Logger.getLogger(Searcher.class.getName()).log(Level.SEVERE, null, ex);
            return new ArrayList<Art>();
        }
        
    }
    
}
