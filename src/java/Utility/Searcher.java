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
import model.CommentModel;
import model.User;

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
    
        sql = "SELECT DISTINCT image_id FROM usami.Image JOIN usami.Profile USING (user_id) JOIN usami.Tag_has USING (image_id) JOIN usami.Tag using (tag_id) \n" +
"WHERE lower(image_name) like ? " +
"OR lower(first_name) like ? " +
"OR lower(last_name) like ? " +
"OR lower(CONCAT(first_name,' ',last_name)) like ? " +
"OR lower(tag_name) LIKE ? " +
"OR lower(image_id) like ? ";
        
        
        try {
            pstmt = conn.prepareCall(sql);
            pstmt.setString(1, "%" + key + "%");
            pstmt.setString(2, "%" + key + "%");
            pstmt.setString(3, "%" + key + "%");
            pstmt.setString(4, "%" + key + "%");
            pstmt.setString(5, "%" + key + "%");
            pstmt.setString(6, "%" + key + "%");
            rs = pstmt.executeQuery();
        
            ArrayList<Art> allArt = new ArrayList<Art>();
            
            Art temp;
            
            while(rs.next()) {
                temp = new Art(conn, rs.getString("image_id"));
                temp.getCurrentTags();
                allArt.add(temp);
            }
            
            return allArt;
            
        } catch (SQLException ex) {
            Logger.getLogger(Searcher.class.getName()).log(Level.SEVERE, null, ex);
            return new ArrayList<Art>();
        }
        
    }
    
    public ArrayList<User> searchUser(String key){
    
        sql = "SELECT DISTINCT user_id FROM usami.User JOIN usami.Profile USING (user_id) "
                + "WHERE user_id LIKE ? "
                + "OR first_name LIKE ? "
                + "OR lower(CONCAT(first_name,' ',last_name)) like ? "
                + "OR last_name LIKE ? ";
        
        
        try {
            pstmt = conn.prepareCall(sql);
            pstmt.setString(1, "%" + key + "%");
            pstmt.setString(2, "%" + key + "%");
            pstmt.setString(3, "%" + key + "%");
            pstmt.setString(4, "%" + key + "%");
            rs = pstmt.executeQuery();
        
            ArrayList<User> allUser = new ArrayList<User>();
            
            User temp;
            
            while(rs.next()) {
                temp = new User(conn, rs.getString("user_id"));
                allUser.add(temp);
            }
            
            return allUser;
            
        } catch (SQLException ex) {
            Logger.getLogger(Searcher.class.getName()).log(Level.SEVERE, null, ex);
            return new ArrayList<User>();
        }
        
    }
    
    public ArrayList<CommentModel> searchComment(String key){
    
        sql = "SELECT * FROM usami.Comment c JOIN usami.Image i USING (image_id) JOIN usami.Profile p ON (c.user_id = p.user_id) " +
            "WHERE lower(i.image_name) like ? " +
            "OR lower(p.first_name) like ? " +
            "OR lower(p.last_name) like ? " +
            "OR lower(p.user_id) like ? " +
            "OR lower(CONCAT(p.first_name,' ', p.last_name)) like ? " +
            "OR lower(c.image_id) like ? "
                + "OR lower(c.text) like ?";
        
        
        try {
            pstmt = conn.prepareCall(sql);
            pstmt.setString(1, "%" + key + "%");
            pstmt.setString(2, "%" + key + "%");
            pstmt.setString(3, "%" + key + "%");
            pstmt.setString(4, "%" + key + "%");
            pstmt.setString(5, "%" + key + "%");
            pstmt.setString(6, "%" + key + "%");
            pstmt.setString(7, "%" + key + "%");
            rs = pstmt.executeQuery();
        
            ArrayList<CommentModel> allCom = new ArrayList<CommentModel>();
            
            CommentModel temp;
            
            while(rs.next()) {
                temp = new CommentModel(conn, rs.getString("user_id"), rs.getString("image_id"), rs.getTimestamp("comm_date"));
                allCom.add(temp);
            }
            
            return allCom;
            
        } catch (SQLException ex) {
            Logger.getLogger(Searcher.class.getName()).log(Level.SEVERE, null, ex);
            return new ArrayList<CommentModel>();
        }
        
    }
    
}
