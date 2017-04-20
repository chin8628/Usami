/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.*;
import java.util.*;
import java.util.stream.Collectors;

/**
 *
 * @author bellkung
 */
public class ArtTag {
    private int tag_id;
    private String tag_name;
    private ArrayList<String> allImgID;
    private String allTag;
    private Connection conn;

    public ArtTag(Connection conn, String tag_name) {
        
        try {
            this.conn = conn;
            
            PreparedStatement pstmt = this.conn.prepareStatement("SELECT * FROM usami.Tag WHERE tag_name = ?");
            pstmt.setString(1, tag_name);
            
            ResultSet rs = pstmt.executeQuery(); 
            if (rs.next()) {
                this.tag_id = rs.getInt("tag_id");
            } else {
                this.tag_id = 0;
            }
            this.tag_name = tag_name;
            
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }
    
    public ArtTag(Connection conn, int tag_id) {
        
        try {
            this.conn = conn;
            
            PreparedStatement pstmt = this.conn.prepareStatement("SELECT * FROM usami.Tag WHERE tag_id = ?");
            pstmt.setInt(1, tag_id);
            
            ResultSet rs = pstmt.executeQuery(); 
            if (rs.next()) {
                this.tag_id = tag_id;
                this.tag_name = rs.getString("tag_name");
            }
            
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }
    
    public ArtTag(Connection conn, String image_id, boolean mode) {
        if (mode) {
            try {
                this.conn = conn;

                PreparedStatement pstmt = this.conn.prepareStatement("SELECT * FROM usami.Tag_has WHERE image_id = ?");
                pstmt.setString(1, image_id);
                
                ResultSet rs = pstmt.executeQuery();
                ArrayList<String> tags = new ArrayList<>();
                while (rs.next()) {
                    tags.add(getName(rs.getInt("tag_id")));
                }
                
                this.allTag = tags.stream().collect(Collectors.joining(","));

            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
    }
    
    private String getName(int tag_id) {
        PreparedStatement pstmt;
        try {
            pstmt = this.conn.prepareStatement("SELECT * FROM usami.Tag WHERE tag_id = ?");
            pstmt.setInt(1, tag_id);
            
            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                return rs.getString("tag_name");
            }
            
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return "";
        
    }
    
    public void getImageID() {
        try {
            
            PreparedStatement pstmt = this.conn.prepareStatement("SELECT * FROM usami.Tag_has WHERE tag_id = ?");
            pstmt.setInt(1, tag_id);
            
            ResultSet rs = pstmt.executeQuery(); 
            allImgID = new ArrayList<>();
            while (rs.next()) {
                allImgID.add(rs.getString("image_id"));
            }
            
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }
    
    
    public void insertTag() {
        try {
            
            PreparedStatement pstmt = this.conn.prepareStatement("INSERT INTO usami.Tag(tag_name) VALUES(?);");
            pstmt.setString(1, this.tag_name);
            pstmt.executeUpdate();
            
            pstmt = this.conn.prepareStatement("SELECT * FROM usami.Tag WHERE tag_name = ?");
            pstmt.setString(1, this.tag_name);
            
            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                this.tag_id = rs.getInt("tag_id");
            }
            
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }
    
    public void insertTag_has(String artId) {
        try {
            
            PreparedStatement pstmt = this.conn.prepareStatement("INSERT INTO usami.Tag_has VALUES(?,?);");
            pstmt.setInt(1, this.tag_id);
            pstmt.setString(2, artId);
            pstmt.executeUpdate();
             
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }
    
    public boolean checkTag_has(String artId) {
        try {
            
            PreparedStatement pstmt = this.conn.prepareStatement("SELECT * FROM usami.Tag_has WHERE tag_id = ? AND image_id = ?");
            pstmt.setInt(1, this.tag_id);
            pstmt.setString(2, artId);
            
            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                return true;
            }
            
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return false;
    }
    
    public boolean checkCountTag() {
        try {
            PreparedStatement pstmt = this.conn.prepareStatement("SELECT COUNT(tag_id) FROM usami.Tag_has WHERE tag_id = ?");
            pstmt.setInt(1, this.tag_id);
            
            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                if (rs.getInt(1) > 0) {
                    return true;
                }
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return false;
    }
    
    public void deleteTag() {
        try {
            PreparedStatement pstmt = this.conn.prepareStatement("DELETE FROM usami.Tag WHERE tag_id = ?");
            pstmt.setInt(1, this.tag_id);
            pstmt.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }
    
    public void followTag(String user_id) {
        try {
            PreparedStatement pstmt = this.conn.prepareStatement("INSERT INTO usami.Profile_focus VALUES(?, ?)");
            pstmt.setString(1, user_id);
            pstmt.setInt(2, this.tag_id);
            pstmt.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }
    
    public void unfollowTag(String user_id) {
        try {
            PreparedStatement pstmt = this.conn.prepareStatement("DELETE FROM usami.Profile_focus WHERE tag_id = ? AND user_id = ?");
            pstmt.setInt(1, this.tag_id);
            pstmt.setString(2, user_id);
            pstmt.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }
    
    public int getTag_id() {
        return tag_id;
    }

    public void setTag_id(int tag_id) {
        this.tag_id = tag_id;
    }

    public String getTag_name() {
        return tag_name;
    }

    public void setTag_name(String tag_name) {
        this.tag_name = tag_name;
    }

    public ArrayList<String> getAllImgID() {
        return allImgID;
    }

    public void setAllImgID(ArrayList<String> allImgID) {
        this.allImgID = allImgID;
    }

    public String getAllTag() {
        return allTag;
    }

    public void setAllTag(String allTag) {
        this.allTag = allTag;
    }

    
}
