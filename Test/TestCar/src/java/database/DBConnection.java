/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author fauzanzairimi
 */
public class DBConnection {
    private static final String URL = "jdbc:mysql://localhost:4306/carrental";
    private static final String DRIVER_NAME = "com.mysql.jdbc.Driver";
    private static final String USERNAME = "root";
    private static final String PASSWORD = "";

    private static Connection conn;

    public static Connection getConnection() throws ClassNotFoundException {
        try {
            Class.forName(DRIVER_NAME);

            conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
        } catch (ClassNotFoundException | SQLException e) {
            e.getMessage();
        }
        return conn;
    }
}
