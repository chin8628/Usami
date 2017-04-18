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
    private String fullname;
    private String allTag;
    private int view;
    private Connection conn;

    private Product product;

    public int getView() {
        return view;
    }

    public void setView(int view) {
        this.view = view;
    }

    public Connection getConn() {
        return conn;
    }

    public void setConn(Connection conn) {
        this.conn = conn;
    }
    
    public Art(Connection conn, String image_id) {
        
        try {
            
            this.conn = conn;
            PreparedStatement pstmt;
            ResultSet rs;
            
            pstmt = this.conn.prepareStatement("SELECT * FROM usami.Image WHERE image_id = ?");
            pstmt.setString(1, image_id);
            
            rs = pstmt.executeQuery();
            if (rs.next()) {
                this.id = image_id;
                this.title = rs.getString("image_name");
                this.url = rs.getString("image_url");
                this.desc = rs.getString("desc");
                this.upload_date = rs.getString("upload_date");
                this.userId = rs.getString("user_id");
                this.view = rs.getInt("view");
            }
            
            pstmt = this.conn.prepareStatement("SELECT * FROM usami.Profile WHERE user_id = ?");
            pstmt.setString(1, this.userId);
            
            rs = pstmt.executeQuery();
            if (rs.next()) {
                this.fullname = rs.getString("first_name") + " " + rs.getString("last_name");
            }
            
            product = new Product(conn, this.id);
            
            
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }
    
    public void updateArts() {
        try {
            PreparedStatement pstmt = this.conn.prepareStatement("UPDATE usami.Image SET image_name = ?, Image.desc = ?, view = ? WHERE image_id = ?");
            pstmt.setString(1, this.title);
            pstmt.setString(2, this.desc);
            pstmt.setInt(3, this.view);
            pstmt.setString(4, this.id);
            pstmt.executeUpdate();
            
            product.update();
            
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }
    
    public void getCurrentTags() {
        ArtTag artTag = new ArtTag(this.conn, id, true);
        this.allTag = artTag.getAllTag();
    }

    public Product getProduct() {
        return product;
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
    
    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public String getAllTag() {
        return allTag;
    }

    public void setAllTag(String allTag) {
        this.allTag = allTag;
    }
    
    
    
    
}
