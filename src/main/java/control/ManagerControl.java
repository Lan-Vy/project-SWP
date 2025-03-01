/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package control;

import dao.ProductDAO;
import entity.Product;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author Admin
 */
public class ManagerControl extends HttpServlet {

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
        ProductDAO dao = new ProductDAO();
        // Retrieve the page index from the request parameters
        String index = request.getParameter("pageIndex");
        int pageIndex = 0;
        // Determine the current page index
        if (index == null) {
            // If no page index is provided, default to the first page
            pageIndex = 1;
        } else {
            // Parse the page index from the request parameter
            pageIndex = Integer.parseInt(index);
        }
        // Fetch the products with pagination, 6 products per page
        // Parameters: search query (empty string for no search), current page index, number of items per page, and additional filters
        List<Product> listP = dao.searchWithPaging("", pageIndex, 6, "", "", "0");
        // Set the list of products as a request attribute for the JSP
        request.setAttribute("listP", listP);
        // Calculate the total number of pages needed based on the total number of products
        int pageSize = getPageSize(6, dao.search("", "", "0").size());
        request.setAttribute("totalPage", pageSize);
        // Set the current page index as a request attribute
        request.setAttribute("pageIndex", pageIndex);
        // Forward the request to the ManagerProduct.jsp page for rendering
        request.getRequestDispatcher("ManagerProduct.jsp").forward(request, response);

    }

    public int getPageSize(int numberProduct, int allProduct) {
        // Calculate the total number of pages needed based on the number of products per page
        int pageSize = allProduct / numberProduct;
        // If there are leftover products that don't fill a complete page, add an additional page
        if (allProduct % numberProduct != 0) {
            pageSize = (allProduct / numberProduct) + 1;
        }
        return pageSize;

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
