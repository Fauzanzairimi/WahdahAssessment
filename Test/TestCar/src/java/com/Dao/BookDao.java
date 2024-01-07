/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.Dao;

import com.Model.Book;
import database.DBConnection;
import static database.DBConnection.getConnection;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author fauzanzairimi
 */
public class BookDao {
    private final Connection con;

    public BookDao() throws SQLException, ClassNotFoundException {
        con = DBConnection.getConnection();
    }
    
    public void addBook(Book book) throws SQLException, IOException {
        try {
            String mySQLQuery = "insert into book(pickupdate,returndate, userid, carid) values(?,?,?,?)";

            PreparedStatement myPS = con.prepareStatement(mySQLQuery);

            myPS.setString(1, book.getPickupdate());
            myPS.setString(2, book.getReturndate());
            myPS.setInt(3, book.getUserid());
            myPS.setInt(4, book.getCarid());
            myPS.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        } finally {
            con.close();
        }
    }
    
     public List<Book> retrieveAllBookByUserId(int userid) throws ClassNotFoundException, SQLException {

        List<Book> books = new ArrayList<>();

        String mySQLQuery = "select * from book where userid=" + userid;

        try ( Connection connection = getConnection();  PreparedStatement preparedStatement
                = connection.prepareStatement(mySQLQuery);) {
            System.out.print(preparedStatement);

            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                int bookid = rs.getInt("bookid");
                String pickupdate = rs.getString("pickupdate");
                String returndate = rs.getString("returndate");
                int carid = rs.getInt("carid");
                
                Book book = new Book();

                book.setBookid(bookid);
                book.setPickupdate(pickupdate);
                book.setReturndate(returndate);
                book.setCarid(carid);
                books.add(book);

            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        } finally {
            con.close();
        }
        return books;
    }

}
