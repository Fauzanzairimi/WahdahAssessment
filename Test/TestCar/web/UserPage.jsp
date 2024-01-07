<%-- 
    Document   : UserPage
    Created on : Jan 6, 2024, 7:35:51 AM
    Author     : fauzanzairimi 
--%>



<%@page import="com.Model.Car"%>
<%@page import="com.Dao.CarDao"%>
<%@page import="com.Model.User"%>
<%@page import="java.util.List"%>

<html>
    <head>
        <title>Car Rental </title>
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
        %>

        <div class="w3-top">
            <div class="w3-bar w3-white w3-padding w3-card" style="letter-spacing:4px;">
                <a href="UserPage.jsp" class="w3-bar-item w3-button">Car Rental</a>
                <a href =" BookList.jsp "class="w3-bar-item w3-button">Booking</a>

                <div class="w3-right w3-hide-small"> <p>Hi <%=user.getUsername()%> ! </p>
                    <!-- Right-sided navbar links. Hide them on small screens -->
                    <div class="w3-right w3-hide-small">
                        <a href ="EditUser.jsp?id=<%=user.getUserid()%>" <i style='font-size:24px' class='fas'>&#xf406;</i></a>
                        <a href="<%=request.getContextPath()%>/UserController?action=signout" class="w3-bar-item w3-button" value="Logout" >Log Out</a>
                    </div>
                </div>
            </div>   
        </div>

<div class="w3-content" style="max-width:1100px">
     <div class="w3-row w3-padding-64" id="Car">
        <div class="m-10 flex justify-center">
       
            <div class="p-10 grid grid-cols-1 sm:grid-cols-1 md:grid-cols-3 lg:grid-cols-3 xl:grid-cols-3 gap-5">
                <%
                    CarDao carDao = new CarDao();
                    List<Car> listcar = carDao.getAllCar();
                    for (Car car : listcar) {
                %>

                <div class="bg-gray-100 rounded-3xl overflow-hidden shadow-lg">
                    <div class="px-6 py-4 text-center w-full">
                        <img class="w-full h-auto object-fit object-center" src="/TestCar/image/image.jsp?id=<%=car.getCarid()%>" alt=" Car">
                    </div>
                    <div class="px-6 py-4">
                        <div class="font-bold text-xl mb-2">
                            <%=car.getCarname()%>
                        </div>

                        <div>
                            <label class="text-gray-1000 text-base"> Type: </label>
                            <span>
                                <%=car.getCartype()%>
                            </span>
                        </div>

                        <div>
                            <label class="text-gray-1000 text-base"> Rental Price Perday: </label>
                            <span>
                                RM <%=car.getCarprice()%>.00
                            </span>
                        </div>
                        <br>
                        <div>
                            <tr>
                            <a href="Book.jsp?id=<%=car.getCarid()%>"  class="inline-block bg-blue-200 square-full px-3 py-1 text-sm font-semibold text-gray-700 mr-2 mb-2 hover:bg-gray-400">Book</a>
                                                     
                        </tr>
                        </div>    
                    </div>
                </div>
                <%
                    }
                %>

            </div>
        </div>
    </div>
</div>

</body>
</html>