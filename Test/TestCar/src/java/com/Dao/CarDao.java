/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.Dao;

import com.Model.Car;
import database.DBConnection;
import static database.DBConnection.getConnection;
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
public class CarDao {

    private final Connection con;

    public CarDao() throws SQLException, ClassNotFoundException {
        con = DBConnection.getConnection();
    }

    public List<Car> getAllCar() throws ClassNotFoundException, SQLException {

        List<Car> cars = new ArrayList<>();

        String mySQLQuery = "select * from car";

        try ( Connection connection = getConnection();  PreparedStatement preparedStatement
                = connection.prepareStatement(mySQLQuery);) {
            System.out.print(preparedStatement);

            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                int carid = rs.getInt("carid");
                String cartype = rs.getString("cartype");
                String carname = rs.getString("carname");
                int carprice = rs.getInt("carprice");
                cars.add(new Car(carid, cartype, carname, carprice));
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        } finally {
            con.close();
        }
        return cars;
    }

    public List<Car> getAllCarbyType(String cartypefiltered) throws ClassNotFoundException, SQLException {
        List<Car> cars = new ArrayList<>();

        String mySQLQuery;

        if ("All".equals(cartypefiltered)) {
            mySQLQuery = "SELECT * FROM car";
        } else {
            mySQLQuery = "SELECT * FROM car WHERE cartype = ?";
        }

        try ( Connection connection = getConnection();  PreparedStatement preparedStatement = connection.prepareStatement(mySQLQuery)) {

            if (!"All".equals(cartypefiltered)) {
                preparedStatement.setString(1, cartypefiltered);
            }

            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                int carid = rs.getInt("carid");
                String carType = rs.getString("cartype");
                String carname = rs.getString("carname");
                int carprice = rs.getInt("carprice");
                cars.add(new Car(carid, carType, carname, carprice));
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        } finally {
            con.close();
        }

        return cars;
    }

    public Car retrieveCarById(int carid) throws ClassNotFoundException, SQLException {

        Car car = new Car();

        try {
            PreparedStatement myPS = DBConnection.getConnection()
                    .prepareStatement("select * from car where carid=?");

            myPS.setInt(1, carid);
            ResultSet rs = myPS.executeQuery();

            while (rs.next()) {
                car.setCarid(rs.getInt("carid"));
                car.setCarname(rs.getString("carname"));
                car.setCartype(rs.getString("cartype"));
                car.setCarprice(rs.getInt("carprice"));
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        } finally {
            con.close();
        }
        return car;
    }
}
