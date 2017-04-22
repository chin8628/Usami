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
import static model.Hash.hashPassword;

/**
 *
 * @author bellkung
 */
public class User {
    private String username;
    private String password;
    private String email;
    private int coin;
    private Timestamp exp_date;
    private String u_type;
    private Connection conn;
    private String fexp_date;
    
    public User(String username) {
        this.username = username;
    }

    public User(Connection conn, String username) throws SQLException {
        PreparedStatement pstmt = conn.prepareStatement("SELECT *, DATE_FORMAT(exp_date,'%b %d %Y %h:%i %p') 'fexp_date' FROM usami.User WHERE user_id = ?");
        pstmt.setString(1, username);
        ResultSet rs = pstmt.executeQuery();
        
        if (rs.next()) {
            this.username = username;
            this.password = rs.getString("password");
            this.email = rs.getString("email");
            this.coin = rs.getInt("coin");
            this.exp_date = rs.getTimestamp("exp_date");
            this.u_type = rs.getString("u_type");
            this.fexp_date = rs.getString("fexp_date");
        }
    }

    public void addNewUser(Connection conn) throws SQLException {
        PreparedStatement pstmt = conn.prepareStatement("INSERT INTO usami.User VALUES(?,?,?,?,?,?)");
        pstmt.setString(1, this.username);
        pstmt.setString(2, hashPassword(this.password));
        pstmt.setString(3, this.email);
        pstmt.setInt(4, this.coin);
        pstmt.setTimestamp(5, this.exp_date);
        pstmt.setString(6, this.u_type);
        pstmt.executeUpdate();
    }
    
    public void UpdatePremium(Connection conn) throws SQLException {
        PreparedStatement pstmt = conn.prepareStatement("UPDATE usami.User SET exp_date = ?, u_type = ?, coin = ? WHERE user_id = ?");
        pstmt.setTimestamp(1, this.exp_date);
        pstmt.setString(2, this.u_type);
        pstmt.setInt(3, coin);
        pstmt.setString(4, username);
        pstmt.executeUpdate();
    }
    
    public void ChangeCoin(Connection conn) throws SQLException {
        PreparedStatement pstmt = conn.prepareStatement("UPDATE usami.User SET coin = ? WHERE user_id = ?");
        pstmt.setFloat(1, coin);
        pstmt.setString(2, username);
        pstmt.executeUpdate();
    }
    
    public void changeEmail(Connection conn) throws SQLException {
        PreparedStatement pstmt = conn.prepareStatement("UPDATE usami.User SET email = ? WHERE user_id = ?");
        pstmt.setString(1, email);
        pstmt.setString(2, username);
        pstmt.executeUpdate();
    }
    
    public void changePassword(Connection conn) throws SQLException {
        PreparedStatement pstmt = conn.prepareStatement("UPDATE usami.User SET password = ? WHERE user_id = ?");
        pstmt.setString(1, password);
        pstmt.setString(2, username);
        pstmt.executeUpdate();
    }
    
    public boolean confirmPass(Connection conn, String cPass) throws SQLException {
        PreparedStatement pstmt = conn.prepareStatement("SELECT password FROM usami.User WHERE user_id = ? AND password = ?");
        pstmt.setString(1, username);
        pstmt.setString(2, cPass);
        ResultSet rs = pstmt.executeQuery();
        
        if (rs.next()) {
            return true;
        }
        return false;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getCoin() {
        return coin;
    }

    public void setCoin(int coin) {
        this.coin = coin;
    }

    public Timestamp getExp_date() {
        return exp_date;
    }

    public void setExp_date(Timestamp exp_date) {
        this.exp_date = exp_date;
    }

    public String getU_type() {
        return u_type;
    }

    public void setU_type(String u_type) {
        this.u_type = u_type;
    }

    public Connection getConn() {
        return conn;
    }

    public void setConn(Connection conn) {
        this.conn = conn;
    }

    public String getFexp_date() {
        return fexp_date;
    }

    public void setFexp_date(String fexp_date) {
        this.fexp_date = fexp_date;
    }
    
    
    
    
}
