<%-- 
    Document   : BookList
    Created on : Jan 6, 2024, 2:18:34 PM
    Author     : fauzanzairimi 
--%>

<%@page import="com.Model.Car"%>
<%@page import="com.Dao.CarDao"%>
<%@page import="java.util.List"%>
<%@page import="com.Model.Book"%>
<%@page import="com.Dao.BookDao"%>
<%@page import="com.Model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <title> Car Rental </title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="https://unpkg.com/tailwindcss@^2/dist/tailwind.min.css" rel="stylesheet">

        <style>

            .mySlides {
                display:none;
            }
            body {
                font-family: "Times New Roman", Georgia, Serif;
            }
            h1, h2, h3, h4, h5, h6 {
                font-family: "Playfair Display";
                letter-spacing: 5px;
            }


            table {
                width: 100%;
                border-collapse: collapse;
            }

            th, td {
                padding: 10px;
                text-align: left;
                border-bottom: 1px solid #ddd;
            }

            th {
                background-color: #f2f2f2;
            }

            tr:hover {
                background-color: #f5f5f5;
            }





            .footer {
                background-color: #f2f2f2;
                padding: 10px;
                text-align: center;
                font-size: 14px;
                color: #888;
            }

            .footer a {
                color: #555;
                text-decoration: none;
            }

            .footer a:hover {
                text-decoration: underline;
            }


        </style>
    </head>
    <body>
        <%
            User user = (User) request.getSession().getAttribute("user");
            int userid = user.getUserid();
            BookDao bookDao = new BookDao();
            List<Book> listBook = bookDao.retrieveAllBookByUserId(userid);
        %>

        <div class="w3-top">
            <div class="w3-bar w3-white w3-padding w3-card" style="letter-spacing:4px;">
                <a href="UserPage.jsp" class="w3-bar-item w3-button">Car Rental</a>
                <a href ="BookList.jsp "class="w3-bar-item w3-button">Booking</a>

                <div class="w3-right w3-hide-small"> <p>Hi <%=user.getUsername()%> ! </p>
                    <!-- Right-sided navbar links. Hide them on small screens -->
                    <div class="w3-right w3-hide-small">
                        <a href ="EditUser.jsp?id=<%=user.getUserid()%>" <i style='font-size:24px' class='fas'>&#xf406;</i></a>
                        <a href="<%=request.getContextPath()%>/UserController?action=signout" class="w3-bar-item w3-button" value="Logout" >Log Out</a>
                    </div>
                </div>
            </div>   
        </div>


        <div class="w3-main" style="margin-left:100px;margin-top:43px;">
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title> List Of Booking</title>
        </head>
        <div class="w3-row w3-padding-64" id="">
            <div class="w3-col l6 w3-padding-large">

                <body>
                    <h1>History Booking</h1>

                    <table class="table table-striped" style = width:800px>
                        <thead>
                            <tr>
                                <th scope="col"></th>
                                <th scope="col">Car Name</th>
                                <th scope="col">Car Type</th>
                                <th scope="col">Pick Up Date</th>
                                <th scope="col">Return Date</th> 
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                int rowNumber = 1;
                                for (Book book : listBook) {

                            %>

                            <%                                int carid = book.getCarid();
                                CarDao carDao = new CarDao();

                                Car car = new Car();
                                car = carDao.retrieveCarById(carid);
                            %>


                            <tr>
                                <td><%= rowNumber++%></td>
                                <td><%=car.getCarname()%></td>
                                <td><%=car.getCartype()%></td>
                                <td><%=book.getPickupdate()%></td>
                                <td><%=book.getReturndate()%></td>
                            </tr>  

                            <%
                                }

                            %>
                        </tbody>
                    </table>

            </div>
        </div>
    </div>
