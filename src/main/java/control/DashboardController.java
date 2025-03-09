/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package control;

import dao.ProductDAO;
import entity.Account;
import entity.Product;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.time.LocalDate;
import java.util.List;

/**
 *
 * @author anhhtk
 */
@WebServlet(name = "DashboardController", urlPatterns = {"/dashboard"})
public class DashboardController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        // Create a new instance of the DAO (Data Access Object) to interact with the database
        ProductDAO dao = new ProductDAO();

        // Retrieve the current session
        HttpSession session = request.getSession();
        // Get the currently logged-in account from the session
        Account a = (Account) session.getAttribute("acc");
        if (a.getRole() == 2) {

            // Get the total number of products and set it as a request attribute
            int numberProduct = dao.getAllProduct().size();
            // Get the number of sold items and set it as a request attribute
            int numberItemsSolid = dao.getNumberItemsSolid();
            // Get total earnings from sales and set it as a request attribute
            double totalEarnings = dao.getTotalEarnings();
            request.setAttribute("numberP", numberProduct);
            request.setAttribute("numberI", numberItemsSolid);
            request.setAttribute("totalE", totalEarnings);
            // Get the current year to filter data
            int currentYear = LocalDate.now().getYear();

            // Fetch the total number of products bought per month for the current year
            List<Integer> totalProductBoughtByMonth = dao.getTotalProductBoughtByYear(currentYear);
            request.setAttribute("totalProductBoughtByMonth", totalProductBoughtByMonth);
            // Fetch the total number of categories bought per month for the current year
            List<Integer> totalCategoryBoughtByMonth = dao.getTotalCategoryBoughtByYear(currentYear);
            request.setAttribute("totalCategoryBoughtByMonth", totalCategoryBoughtByMonth);
            // Fetch the total number of customers who bought products per month for the current year
            List<Integer> totalCustomerBoughtByMonth = dao.getTotalCustomerBoughtByYear(currentYear);
            request.setAttribute("totalCustomerBoughtByMonth", totalCustomerBoughtByMonth);
            // Forward the request to the Dashboard.jsp page to display the data
            request.getRequestDispatcher("Dashboard.jsp").forward(request, response);
        } else {
            request.getRequestDispatcher("ManagerOrder").forward(request, response);
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
        processRequest(request, response);
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
        processRequest(request, response);
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

}
