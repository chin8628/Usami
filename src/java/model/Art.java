/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.*;

/**
 *
 * @author frostnoxia
 */
public class Art {
    
    private String url;
    private String price;
    private String title;
    private String id;
    private String userId;
    private String desc;
    private String upload_date;

    public Art(Connection conn, String image_id) {
        try {
            PreparedStatement pstmt = conn.prepareStatement("SELECT * FROM usami.Image WHERE image_id = ?");
            pstmt.setString(1, image_id);
            
            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                this.id = image_id;
                this.title = rs.getString("image_name");
                this.url = rs.getString("image_url");
                this.desc = rs.getString("desc");
                this.upload_date = rs.getString("upload_date");
                this.userId = rs.getString("user_id");
            }
            
            
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    public String getUpload_date() {
        return upload_date;
    }

    public void setUpload_date(String upload_date) {
        this.upload_date = upload_date;
    }
    
    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getDesc() {
        return desc;
    }

    public void setDesc(String desc) {
        this.desc = desc;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }
    
    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }
    
    
    
    
}
