<%-- 
    Document   : image
    Created on : Jan 6, 2024, 8:36:51 AM
    Author     : fauzanzairimi 
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>

<%
    String id = request.getParameter("id");
    Blob image = null;
    Connection con = null;
    byte[] imgData = null;
    Statement stmt = null;
    ResultSet rs = null;

    try {
        Class.forName("com.mysql.jdbc.Driver");
//        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/s57907_kindergartensystem", "s57907", "s579072w#");
        con = DriverManager.getConnection("jdbc:mysql://localhost:4306/carrental", "root", "");
        stmt = con.createStatement();
        rs = stmt.executeQuery("select carimage from car where carid  =" + id);
        if (rs.next()) {
            image = rs.getBlob(1);
            imgData = image.getBytes(1, (int) image.length());
        } else {
            out.println("Display Blob Example");
            out.println("image not found for given id>");
            return;
        }

        // display the image
        response.setContentType("image/gif");
        OutputStream o = response.getOutputStream();
        o.write(imgData);
        o.flush();
        o.close();
    } catch (Exception e) {
        out.println("Unable To Display image");
        out.println("Image Display Error=" + e.getMessage());
        return;
    } finally {
        try {
            rs.close();
            stmt.close();
            con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>