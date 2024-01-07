<%-- 
    Document   : EditUser
    Created on : Jan 6, 2024, 7:48:01 AM
    Author     : fauzanzairimi 
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%@page import="com.Model.User"%>
<%@page import="com.Dao.UserDao"%>



<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="https://cdn.tailwindcss.com"></script>
        <title>Edit User Profile</title>
        <%
            int userid = Integer.parseInt(request.getParameter("id"));
            UserDao userDao = new UserDao();

            User user = (User) request.getSession().getAttribute("user");
        %>
        
    <body class="bg-image" style="background-color: lightgray ; height: 100vh">
        <div class="flex items-center justify-between flex-wrap bg-teal p-6">
            <div class="flex items-center flex-no-shrink text-black mr-6">
                <a href="UserPage.jsp" class="flex items-center flex-no-shrink text-black mr-6 hover:text-gray-200">
                    <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="currentColor"  viewBox="0 0 16 16">
                    <path d="m3.86 8.753 5.482 4.796c.646.566 1.658.106 1.658-.753V3.204a1 1 0 0 0-1.659-.753l-5.48 4.796a1 1 0 0 0 0 1.506z"/>
                    </svg> 
                    <span class="pl-2 font-semibold text-xl tracking-tight">Back</span>
                </a>
            </div>
        </div>
        <div class=" min-h-screen flex flex-col rounded">
            <div class="sm:flex sm:space-x-2 justify-center my-auto rounded-3xl w-full flex flex-col items-center justify-center px-60">
                <div class="flex items-center flex-no-shrink text-black mb-14">
                    <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="currentColor" viewBox="0 0 16 16" >
                    <path d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0zm4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4zm-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664h10z"/>
                    </svg>
                    <span class="pl-2 font-semibold text-xl tracking-tight">Edit Profile User</span>
                </div>
                <div class="bg-gray-100 px-6 py-8 rounded-t-3xl shadow-md text-black w-full">
                    <form class="mt-8 space-y-6" name="FormEditUser" action="UserController" method="POST">
                        <div class="rounded-md shadow-sm -space-y-px">

                            <div>
                                <label class="font-bold"> Full Name</label>
                                <input type="text" name="username" value="<%=user.getUsername()%>" class="appearance-none rounded-none relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-t-md focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 focus:z-10 sm:text-sm">
                            </div>
                            <br>
                            <div>
                                <label class="font-bold"> Email</label>
                                <input type="text" name="useremail" value="<%=user.getUseremail()%>" class="appearance-none rounded-none relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-t-md focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 focus:z-10 sm:text-sm">
                            </div>
                            <div>
                                <label class="font-bold">Password</label>
                                <input type="password" name="password" id="password" value="<%=user.getPassword()%>" class="appearance-none rounded-none relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-t-md focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 focus:z-10 sm:text-sm" oninput="validatePassword()">
                                <span id="passwordError" style="color: red;"></span>
                            </div>
                            <br>
                            

                           
                            <br>

                            <br>
                            <div class="flex items-center">
                                <button onclick="return confirm('Are sure to update the changes?')" type="submit" name="action" value="update" class="mr-2 group relative w-full flex justify-center py-2 px-4 border border-transparent text-sm font-medium rounded-md text-white bg-gray-800 hover:bg-gray-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500">
                                    <span class="absolute left-0 inset-y-0 flex items-center pl-3">
                                        <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5" viewBox="0 0 20 20" fill="currentColor">
                                        <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-8.707l-3-3a1 1 0 00-1.414 0l-3 3a1 1 0 001.414 1.414L9 9.414V13a1 1 0 102 0V9.414l1.293 1.293a1 1 0 001.414-1.414z" clip-rule="evenodd" />
                                        </svg>
                                    </span>
                                    Update
                                </button>

                                <input name="userid" type="hidden" value="<%=user.getUserid()%>">
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>    
    </body>
</html>
