/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author frostnoxia
 */
public class Product {
    
    private String product_id;
    private Float price;
    private String pgroup_id;
    private String image_id;
    private String user_id;
    private Connection conn;
    
    public Product(Connection conn, String id) {
        
        this.conn = conn;
        product_id = id;
        
        try {
            PreparedStatement pstmt;
            ResultSet rs;
            
            pstmt = conn.prepareStatement("SELECT * FROM usami.Product WHERE image_id = ?");
            pstmt.setString(1, image_id);
            
            rs = pstmt.executeQuery();
            if (rs.next()) {
                this.price = rs.getFloat("price");
                this.pgroup_id = rs.getString("pgroup_id");
                this.image_id = rs.getString("image_id");
                this.user_id = rs.getString("user_id");
            }
            
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    public void update() {
        
        try {
            PreparedStatement pstmt;
            ResultSet rs;
            
            pstmt = conn.prepareStatement("UPDATE usami.Product SET price=? WHERE product_id = ?");
            pstmt.setFloat(1, price);
            pstmt.setString(2, product_id);
            
            pstmt.executeUpdate();
            
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        
    }
    
    public String getProduct_id() {
        return product_id;
    }

    public void setProduct_id(String product_id) {
        this.product_id = product_id;
    }

    public Float getPrice() {
        return price;
    }

    public void setPrice(Float price) {
        this.price = price;
    }

    public String getPgroup_id() {
        return pgroup_id;
    }

    public void setPgroup_id(String pgroup_id) {
        this.pgroup_id = pgroup_id;
    }

    public String getImage_id() {
        return image_id;
    }

    public void setImage_id(String image_id) {
        this.image_id = image_id;
    }

    public String getUser_id() {
        return user_id;
    }

    public void setUser_id(String user_id) {
        this.user_id = user_id;
    }
    
    
    
    
}
