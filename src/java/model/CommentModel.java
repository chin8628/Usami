/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;

/**
 *
 * @author bellkung
 */
public class CommentModel {
    private String username;
    private String image_id;
    private String first_name;
    private String last_name;
    private Timestamp comm_date;
    private String fcomm_date;
    private String text;
    private String url_image;
    private String title;
    
    public CommentModel() {
        
    }
    
    public CommentModel(Connection conn, String username, String image_id, Timestamp time) throws SQLException {
        
        String sql = "SELECT * FROM usami.Comment WHERE user_id = ? AND image_id = ? AND comm_date = ?";
        PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, username);
        pstmt.setString(2, image_id);
        pstmt.setTimestamp(3, time);
        
        this.username = username;
        this.image_id = image_id;
        this.comm_date = time;
        
        ResultSet rs = pstmt.executeQuery();
        
        if(rs.next()){
            this.text = rs.getString("text");
        }
        
    }
    
    public String getId(){
    
        return (image_id + "" + username + "" + comm_date).hashCode() + "";
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getImage_id() {
        return image_id;
    }

    public void setImage_id(String image_id) {
        this.image_id = image_id;
    }

    public String getFirst_name() {
        return first_name;
    }

    public void setFirst_name(String first_name) {
        this.first_name = first_name;
    }

    public String getLast_name() {
        return last_name;
    }

    public void setLast_name(String last_name) {
        this.last_name = last_name;
    }

    public Timestamp getComm_date() {
        return comm_date;
    }

    public void setComm_date(Timestamp comm_date) {

        this.comm_date = comm_date;
    }
    
    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public String getUrl_image() {
        return url_image;
    }

    public void setUrl_image(String url_image) {
        this.url_image = url_image;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getFcomm_date() {
        return fcomm_date;
    }

    public void setFcomm_date(String fcomm_date) {
        this.fcomm_date = fcomm_date;
    }
    
    
    

}
