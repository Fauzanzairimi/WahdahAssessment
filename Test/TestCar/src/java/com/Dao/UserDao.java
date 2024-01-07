/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.Dao;

import com.Model.User;
import database.DBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author fauzanzairimi
 */
public class UserDao {
    
    
     private final Connection con;
    
    public UserDao() throws SQLException, ClassNotFoundException{
        con = DBConnection.getConnection();
    }
    
     public void save(User user) throws SQLException {
        try {
            String mySQLQuery = "insert into user (username,useremail, password, userpn) values(?, ?, ?,?)";

            PreparedStatement myPS = con.prepareStatement(mySQLQuery);

            myPS.setString(1, user.getUsername());
            myPS.setString(2, user.getUseremail());
            myPS.setString(3, user.getPassword());
            myPS.setInt(4, user.getPhoneno());
          

            myPS.executeUpdate();

        } catch (SQLException e) {
            System.out.println(e.getMessage());

        } finally {
            con.close();
        }
    }

    public User authentication (String useremail, String password) throws SQLException{
        ResultSet rs = null;
        User user = null;
        
        try {
            String mySQLQuery = "select * from user where useremail=? and password=?";
            PreparedStatement ps = con.prepareStatement(mySQLQuery);
            
            ps.setString(1, useremail);
            ps.setString(2, password);
            
            rs = ps.executeQuery();
            
            while(rs.next()){
                user = new User();
                
                user.setUseremail(useremail);
                user.setPassword(password);
                user.setUserid(rs.getInt(1));
                user.setUsername(rs.getString(2));

            }
            con.close();
            
        } catch (SQLException e){
            System.out.println(e.getMessage());
            
        } finally {
            if(rs != null){
                rs.close();
            }
            con.close();
        }
        
        return user;
    }
    
     public void update(User user) {

        try {
            String myQ = "update user set  username=?, useremail=? WHERE userid=?";

            PreparedStatement myPS = con.prepareStatement(myQ);

            myPS.setString(1, user.getUsername());
            myPS.setString(2, user.getUseremail());
            myPS.setInt(3, user.getUserid());
            myPS.executeUpdate();

        } catch (SQLException e) {
            System.out.println(e.getMessage());

        } finally {
            try {
                con.close();
            } catch (SQLException ex) {
                Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

    }
    
}
