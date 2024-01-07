/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.Controller;

import com.Dao.UserDao;
import com.Model.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author fauzanzairimi
 */
@WebServlet(name = "UserController", urlPatterns = {"/UserController"})
public class UserController extends HttpServlet {

 
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException, ClassNotFoundException {
        
        String action = request.getParameter("action");
        
        if (action != null){
            switch(action){
              
                case "Register":
                    saveUser(request, response);
                    break;
                    
                case "login":
                    retrieve(request, response);
                    break;
                    
                case "update":
                    update(request, response);
                    break;
              
                    
                case "signout":
                    signOut(request, response);
                    break;
            }
        } else {
            response.sendRedirect(request.getContextPath() + "index.jsp");
        }
        
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(UserController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(UserController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(UserController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(UserController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    private void saveUser(HttpServletRequest req, HttpServletResponse resp) 
            throws SQLException, ServletException, IOException, ClassNotFoundException{
        
        //get all data from signup
        String username = req.getParameter("username");
        String useremail = req.getParameter("useremail");
        String password = req.getParameter("password");
        int userpn = Integer.parseInt(req.getParameter("userpn"));
       
       
        
        //keep data into javabeans
        User user = new User();
        
        user.setUsername(username);
        user.setUseremail(useremail);
        user.setPassword(password);
        user.setPhoneno(userpn);
        
        
        
        
        //pass the bean to DAO
        UserDao User = new UserDao();
        User.save(user);
        
        //save the bean as attribute and pass to view
       
        resp.sendRedirect("Login.jsp");
    }
    
    private void retrieve(HttpServletRequest req, HttpServletResponse resp) throws SQLException, ServletException, IOException, ClassNotFoundException{
        
        if(req.getParameter("action") != null){
            
            String useremail = req.getParameter("useremail");
            String password = req.getParameter("password");
            
            UserDao userDao = new UserDao();
            
            try {
                User user = userDao.authentication(useremail, password);
                
                if(user != null){
                    
                    HttpSession session = req.getSession();
                    session.setAttribute("user", user);
                    resp.sendRedirect("UserPage.jsp");
                    
                } else {
                    req.setAttribute("error", "Invalid username or password!");
                    RequestDispatcher rd = req.getRequestDispatcher("Login.jsp");
                    rd.forward(req,resp);
                }
                
            } catch (SQLException e){
                throw new ServletException(e);
            }
        }
        
    }
    
    private void update(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException, ClassNotFoundException {
        
       
        String username = request.getParameter("username");
        String useremail = request.getParameter("useremail");
        int userid = Integer.parseInt(request.getParameter("userid"));
        
        User user = new User();
        
       
        user.setUsername(username);
        user.setUseremail(useremail);
        user.setUserid(userid);
        
        UserDao userDao = new UserDao();
        
        userDao.update(user);
        
        HttpSession session = request.getSession();
        session.setAttribute("user", user);
        
        response.sendRedirect("UserPage.jsp");
    }
    
   
    private void signOut(HttpServletRequest req, HttpServletResponse resp) throws SQLException, ServletException, IOException {

        req.getSession().removeAttribute("user");
        
        resp.sendRedirect("index.jsp");
    }

}
 