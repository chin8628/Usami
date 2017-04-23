/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.Calendar;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author bellkung
 */
public class Transaction {
    private Connection conn;
    private int tran_id;
    private String tran_type;
    private String user_id;
    private String date_time;
    
    public Transaction(Connection conn, String user_id) {
        this.conn = conn;
        this.user_id = user_id;
        
    }
    
    public void deposit(int amount) {
        try {
            Calendar calendar = Calendar.getInstance();
            PreparedStatement pstmt = conn.prepareStatement("INSERT INTO usami.Transaction(user_id, tran_type, amount, date) "
                    + "VALUES (?,?,?,?);");
            pstmt.setString(1, this.user_id);
            pstmt.setString(2, "DEP");
            pstmt.setInt(3, amount);
            pstmt.setTimestamp(4, new Timestamp(calendar.getTime().getTime()));
            
            pstmt.executeUpdate();
            
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }
    
    public void withdraw(int amount) {
        try {
            Calendar calendar = Calendar.getInstance();
            PreparedStatement pstmt = conn.prepareStatement("INSERT INTO usami.Transaction(user_id, tran_type, amount, date) "
                    + "VALUES (?,?,?,?);");
            pstmt.setString(1, this.user_id);
            pstmt.setString(2, "WIT");
            pstmt.setInt(3, amount);
            pstmt.setTimestamp(4, new Timestamp(calendar.getTime().getTime()));
            
            pstmt.executeUpdate();
            
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }


    public int getTran_id() {
        return tran_id;
    }

    public void setTran_id(int tran_id) {
        this.tran_id = tran_id;
    }

    public String getTran_type() {
        return tran_type;
    }

    public void setTran_type(String tran_type) {
        this.tran_type = tran_type;
    }

    public String getUser_id() {
        return user_id;
    }

    public void setUser_id(String user_id) {
        this.user_id = user_id;
    }

    public String getDate_time() {
        return date_time;
    }

    public void setDate_time(String date_time) {
        this.date_time = date_time;
    }
    
    
}
