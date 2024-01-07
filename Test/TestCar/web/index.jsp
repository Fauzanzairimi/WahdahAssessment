<%-- 
    Document   : index
    Created on : Jan 5, 2024, 6:21:48 PM
    Author     : fauzanzairimi 
--%>

<%@page import="java.util.List"%>
<%@page import="com.Model.Car"%>
<%@page import="com.Dao.CarDao"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Car Rental</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
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

            select, input {
                width: 100%;
                padding: 5px;
            }

            .filter-row {
                display: flex;
            }

            .filter-row th {
                flex: 1;
            }

            .filter-row th:first-child {
                border-radius: 5px 0 0 5px;
            }

            .filter-row th:last-child {
                border-radius: 0 5px 5px 0;
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

        <!-- Navbar (sit on top) -->
        <div class="w3-top">
            <div class="w3-bar w3-white w3-padding w3-card" style="letter-spacing:4px;">
                <a href="#Car" class="w3-bar-item w3-button">Car Rental</a>
                <!-- Right-sided navbar links. Hide them on small screens -->
                <div class="w3-right w3-hide-small">
                    <a href="#Car" class="w3-bar-item w3-button">Car</a>
                    <a href="#contact" class="w3-bar-item w3-button">Contact</a>
                    <a href="Login.jsp" class="w3-bar-item w3-button">Log In</a>
                </div>
            </div>
        </div>





        <!-- Page content -->
        <div class="w3-content" style="max-width:1100px">
            <!-- Menu Section -->
            <div class="w3-row w3-padding-64" id="Car">
                <form action="<%=request.getContextPath()%>/CarController?action=filter" method="POST">
                    <select name="cartypefiltered">
                        <option value="All">All</option>
                        <option value="Perodua">Perodua</option>
                        <option value="Proton">Proton</option>
                        <option value="Mazda">Mazda</option>
                        <option value="Toyota">Toyota</option>
                        <option value="Honda">Honda</option>
                    </select>
                    <br><br>
                    <input type="submit" value="Filter">
                </form>

                <div class="m-10 flex justify-center">
                </div>
                <div>
                    <div class="p-10 grid grid-cols-1 sm:grid-cols-1 md:grid-cols-3 lg:grid-cols-3 xl:grid-cols-3 gap-5">
                        <%
                            CarDao carDao = new CarDao();
                            List<Car> listcar = carDao.getAllCar();

                            List<Car> filteredCarList = (List<Car>) request.getAttribute("filteredCarList");
                            List<Car> displayList = (filteredCarList != null) ? filteredCarList : listcar;

                            for (Car car : displayList) {
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
                                    <a href="Login.jsp" class="inline-block bg-blue-200 square-full px-3 py-1 text-sm font-semibold text-gray-700 mr-2 mb-2 hover:bg-gray-400">Book</a>
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



        <hr>

        <!-- Contact Section -->
        <div class="w3-container w3-padding-64" id="contact">
            <h1>Contact</h1><br>
            <p>We offer full-service catering for any event, large or small. We understand your needs and we will cater the food to satisfy the biggerst criteria of them all, both look and taste. Do not hesitate to contact us.</p>
            <p class="w3-text-blue-grey w3-large"><b>Catering Service, 42nd Living St, 43043 New York, NY</b></p>
            <p>You can also contact us by phone 00553123-2323 or email catering@catering.com, or you can send us a message here:</p>
            <form action="/action_page.php" target="_blank">
                <p><input class="w3-input w3-padding-16" type="text" placeholder="Name" required name="Name"></p>
                <p><input class="w3-input w3-padding-16" type="number" placeholder="How many people" required name="People"></p>
                <p><input class="w3-input w3-padding-16" type="datetime-local" placeholder="Date and time" required name="date" value="2020-11-16T20:00"></p>
                <p><input class="w3-input w3-padding-16" type="text" placeholder="Message \ Special requirements" required name="Message"></p>
                <p><button class="w3-button w3-light-grey w3-section" type="submit">SEND MESSAGE</button></p>
            </form>
        </div>

        <!-- End page content -->
    </div>

    <!-- Footer -->
    <footer class="w3-center w3-light-grey w3-padding-32">
        <p>Powered by <a href="https://www.w3schools.com/w3css/default.asp" title="W3.CSS" target="_blank" class="w3-hover-text-green">w3.css</a></p>
    </footer>

</body>
</html>

