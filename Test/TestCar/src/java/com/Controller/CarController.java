/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.Controller;

import com.Dao.BookDao;
import com.Dao.CarDao;
import com.Model.Book;
import com.Model.Car;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author fauzanzairimi
 */
public class CarController extends HttpServlet {

   protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, IllegalStateException, SQLException, ClassNotFoundException {

        String action = request.getParameter("action");

        if (action != null) {
            switch (action) {
                case "filter":
                    filter(request, response);
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
        } catch (IllegalStateException | SQLException | ClassNotFoundException ex) {
            Logger.getLogger(CarController.class.getName()).log(Level.SEVERE, null, ex);
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
        } catch (IllegalStateException | SQLException | ClassNotFoundException ex) {
            Logger.getLogger(CarController.class.getName()).log(Level.SEVERE, null, ex);
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

    private void filter(HttpServletRequest req, HttpServletResponse resp) throws IOException, IllegalStateException, ServletException, SQLException, ClassNotFoundException {
    String cartypefiltered = req.getParameter("cartypefiltered");

    CarDao carDao = new CarDao();
    List<Car> filteredCarList = carDao.getAllCarbyType(cartypefiltered);

    req.setAttribute("filteredCarList", filteredCarList);
    req.getRequestDispatcher("index.jsp").forward(req, resp);
}

}
