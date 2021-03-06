/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.*;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author frostnoxia
 */
public class Art {
    
    private String url;
    private String title;
    private String id;
    private String userId;
    private String desc;
    private String upload_date;
    private String fullname;
    private String allTag;
    private int view;
    private Connection conn;
    private int status;

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }
    
    
    
    
    private String buy_date;
    private String customerName;
    private String customerId;

    private Product product;
    
    public boolean downloadAble(String user_id, int mode) {
        try {
                User user = new User(conn, user_id);
                if(userId.equals(user_id)){
                    return true;
                } else {
                if(product.getPrice() == 0) {
                    if(mode == 0) {
                        return !user.getU_type().equals("STD");
                    } else {
                        return true;
                    }
                } else {
                    return checkPur(user_id);
                }
                }
                
        } catch (SQLException ex) {
                Logger.getLogger(Art.class.getName()).log(Level.SEVERE, null, ex);
                return false;
        }

    }
    
    public boolean checkPur(String user_id) {
        
        try {
            PreparedStatement pstmt = conn.prepareStatement(""
                    + "SELECT * "
                    + "FROM usami.User_buy "
                    + "WHERE user_id = ? "
                    + "AND product_id = ? ");
            
            pstmt.setString(1, user_id);
            pstmt.setString(2, product.getProduct_id());
            
            ResultSet rs = pstmt.executeQuery();
            if(rs.next()) {
                //purchased
                return true;
            } else {
                //not purchased
                return false;
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(Art.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
        
    }

    public boolean isInCart(ArrayList<Art> cart) {
        
        if(cart == null) {
            return false;
        }
        for(Art a: cart) {
            if(a.getProduct().getProduct_id().equals(product.getProduct_id())) {
                return true;
            }
        }
        
        return false;
        
    }
    
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
            
            pstmt = this.conn.prepareStatement("SELECT *, DATE_FORMAT(upload_date,'%b %d %Y %h:%i %p') 'fupload_date' "
                    + "FROM usami.Image WHERE image_id = ?");
            pstmt.setString(1, image_id);
            
            rs = pstmt.executeQuery();
            if (rs.next()) {
                this.id = image_id;
                this.title = rs.getString("image_name");
                this.url = rs.getString("image_url");
                this.desc = rs.getString("desc");
                this.upload_date = rs.getString("fupload_date");
                this.userId = rs.getString("user_id");
                this.view = rs.getInt("view");
                this.status = rs.getInt("status");
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
            PreparedStatement pstmt = this.conn.prepareStatement("UPDATE usami.Image SET image_name = ?, Image.desc = ?, view = ?, status = ? WHERE image_id = ?");
            pstmt.setString(1, this.title);
            pstmt.setString(2, this.desc);
            pstmt.setInt(3, this.view);
            pstmt.setInt(4, this.status);
            pstmt.setString(5, this.id);
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
        try{
            float tempp = getProduct().getPrice();
            int p = (int) tempp;
            if(p > 0) {
                return p + "";
            } else {
                return "free";
            }
        } catch (Exception e){
            return "free";
        }
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

    public String getBuy_date() {
        return buy_date;
    }

    public void setBuy_date(String buy_date) {
        this.buy_date = buy_date;
    }

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    public String getCustomerId() {
        return customerId;
    }

    public void setCustomerId(String customerId) {
        this.customerId = customerId;
    }

    
    
    
    
    
    
    
}
