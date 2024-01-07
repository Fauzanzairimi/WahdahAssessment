<%-- 
    Document   : Book
    Created on : Jan 6, 2024, 1:35:13 PM
    Author     : fauzanzairimi 
--%>

<%@page import="com.Dao.CarDao"%>
<%@page import="com.Model.Car"%>
<%@page import="com.Model.User"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="https://unpkg.com/tailwindcss@^2/dist/tailwind.min.css" rel="stylesheet">
        <title>Book Car</title>
        <style>
            body {
                background-color: white ;
            }

            table {
                width: 100%;
                border-collapse: collapse;
                margin-top: 20px;
            }

            th, td {
                border: 1px solid transparent; /* Set border color to transparent */
                padding: 8px;
                text-align: left;
            }

            th {
                background-color: #f2f2f2;
            }

            /* Add space between columns */
            td.space {
                width: 20px; /* Adjust the width as needed */
            }
        </style>


    </head>
    <body>
        <div class="flex items-center justify-between flex-wrap bg-teal p-6">
            <a href="UserPage.jsp" class="flex items-center flex-no-shrink text-black mr-6 hover:text-gray-200">
                <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M11 19l-7-7 7-7m8 14l-7-7 7-7" />
                </svg>  
                <span class="pl-2 font-semibold text-xl tracking-tight">Car Rental</span>
            </a>
        </div>
        <div class="bg-white-500 min-h-screen flex flex-col rounded">
            <div class="sm:flex sm:space-x-2 justify-center my-auto rounded-3xl w-full flex flex-col items-center justify-center px-60">
                <div class="flex items-center flex-no-shrink text-black mb-14">
                    <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5" viewBox="0 0 20 20" fill="currentColor">
                    <path fill-rule="evenodd" d="M18 5v8a2 2 0 01-2 2h-5l-5 4v-4H4a2 2 0 01-2-2V5a2 2 0 012-2h12a2 2 0 012 2zM7 8H5v2h2V8zm2 0h2v2H9V8zm6 0h-2v2h2V8z" clip-rule="evenodd" />
                    </svg>
                    <span class="pl-2 blackfont-semibold text-xl tracking-tight ">Book Car</span>
                </div>
                <div class="p-10">
                    <%
                        User user = (User) request.getSession().getAttribute("user");
                        int userid = user.getUserid();
                        Car car = new Car();

                        int carid = Integer.parseInt(request.getParameter("id"));
                        CarDao carDao = new CarDao();
                        car = carDao.retrieveCarById(carid);
                    %>
                    <!--Card 1-->
                    <div class="max-w-7xl mx-auto">
                        <div class="bg-gray-100 px-6 py-8 rounded-t-3xl shadow-md text-black w-full">
                            <div style="text-align: center;">
                                <img class="w-auto h-56 mx-auto mb-4" class="lazy" src="/TestCar/image/image.jsp?id=<%=car.getCarid()%>" alt="Car">
                            </div>
                            <div class="mb-8">
                                <div class="text-gray-900 font-bold text-xl mb-2">
                                    <%=car.getCarname()%>
                                </div>
                                <p class="text-gray-700 text-base">
                                    Type: <%=car.getCartype()%>
                                </p>
                                <br>
                                <p class="text-gray-700 text-base">
                                    Price Perday: RM <%=car.getCarprice()%>
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
                <br>
                <div class="bg-gray-100 px-6 py-8 rounded-t-3xl shadow-md text-black w-full">
                    <form class="mt-8 space-y-6" action="<%=request.getContextPath()%>/BookController" method="POST" >
                        <div class="rounded-md shadow-sm -space-y-px">
                            <div class="form-row">
                                <div>

                                    <div>
                                        <table>
                                            <thead>
                                                <tr>
                                                    <th>Pickup Date:</th>
                                                    <th class="space"></th>
                                                    <th class="space"></th>
                                                    <th>Return Date:</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td>
                                                        <input type="date" class="form-control-file" name="pickupdate" min="<%=java.time.LocalDate.now()%>" required>
                                                    </td>
                                                    <td class="space"></td>
                                                    <td class="space"></td>
                                                    <td>
                                                        <input type="date" class="form-control-file" name="returndate" min="<%=java.time.LocalDate.now()%>" required>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>

                                </div>

                                <script>
                                    document.addEventListener('DOMContentLoaded', function () {
                                        var currentDate = new Date().toISOString().split('T')[0];

                                        var pickupDateInput = document.querySelector('input[name="pickupdate"]');
                                        var returnDateInput = document.querySelector('input[name="returndate"]');

                                        pickupDateInput.setAttribute('min', currentDate);
                                        returnDateInput.setAttribute('min', currentDate);
                                    });
                                </script>

                                <br>

                                <div>
                                    <input type="hidden" name="userid"  value="<%=user.getUserid()%>">
                                </div>
                                <div>
                                    <input type="hidden" name="carid"  value="<%=car.getCarid()%>">
                                </div>
                                <div class="flex items-center">
                                    <button type="submit" name="action" value="add" class="mr-3 group relative w-full flex justify-center py-2 px-4 border border-transparent text-sm font-medium rounded-md text-white bg-gray-800 hover:bg-gray-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500">
                                        <span class="absolute left-0 inset-y-0 flex items-center pl-3">
                                            <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5" viewBox="0 0 20 20" fill="currentColor">
                                            <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-8.707l-3-3a1 1 0 00-1.414 0l-3 3a1 1 0 001.414 1.414L9 9.414V13a1 1 0 102 0V9.414l1.293 1.293a1 1 0 001.414-1.414z" clip-rule="evenodd" />
                                            </svg>
                                        </span>
                                        Submit
                                    </button>
                                    <a href="ParentPage.jsp" class="group relative w-full flex justify-center py-2 px-4 border border-transparent text-sm font-medium rounded-md text-white bg-gray-800 hover:bg-gray-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500">
                                        <span class="absolute left-0 inset-y-0 flex items-center pl-3">
                                            <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5" viewBox="0 0 20 20" fill="currentColor">
                                            <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zM8.707 7.293a1 1 0 00-1.414 1.414L8.586 10l-1.293 1.293a1 1 0 101.414 1.414L10 11.414l1.293 1.293a1 1 0 001.414-1.414L11.414 10l1.293-1.293a1 1 0 00-1.414-1.414L10 8.586 8.707 7.293z" clip-rule="evenodd" />
                                            </svg>
                                        </span>
                                        Cancel
                                    </a>
                                </div>
                            </div>
                    </form>
                </div>
            </div>
        </div>
    </body>

</html>