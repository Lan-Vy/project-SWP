/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package control;

import dao.CategoryDAO;
import entity.Category;
import entity.Product;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

/**
 *
 * @author Admin
 */
@WebServlet(name = "ManagerCategoryControl", urlPatterns = {"/ManagerCategoryControl"})
public class ManagerCategoryControl extends HttpServlet {

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

        // Create a new DAO instance to interact with the database
        CategoryDAO dao = new CategoryDAO();
        
        // Retrieve the page index from the request parameters
        String index = request.getParameter("pageIndex");
        int pageIndex = 1; // Default to first page if no pageIndex is provided
        
        // If pageIndex is provided, parse it
        if (index != null) {
            pageIndex = Integer.parseInt(index);
        }

        // Fetch the categories with pagination, with 6 categories per page
        List<Category> listP = dao.searchWithPaging(pageIndex, 6);
        
        // Set the list of categories as a request attribute for the JSP
        request.setAttribute("listP", listP);

        // Fetch total number of categories for pagination
        int totalCategories = dao.getAllCategory().size();  // Get the total number of categories from the database
        if(totalCategories<=0){
           request.setAttribute("errorMessage", "No categories available.");
             return;
        }
        // Calculate the total number of pages based on the total number of categories
        int pageSize = totalCategories / 6;  // Divide total categories by the number of items per page (6)

        // If there are leftover categories that don't fill a complete page, add an additional page
        if (totalCategories % 6 != 0) {
            pageSize++;  // Add an additional page if there are leftover categories
        }

        // Set the total pages and the current page index for the JSP
        request.setAttribute("totalPage", pageSize);
        request.setAttribute("pageIndex", pageIndex);
        request.setAttribute("totalItem", totalCategories);

        // Forward the request to the ManagerCategory.jsp page for rendering
        request.getRequestDispatcher("ManagerCategory.jsp").forward(request, response);
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
