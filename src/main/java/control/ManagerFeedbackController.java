/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package control;

import dao.FeedbackDAO;
import entity.Category;
import entity.Feedback;
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
 * @author anhhtk
 */
@WebServlet(name = "ManagerFeedbackController", urlPatterns = {"/ManagerFeedbackController"})
public class ManagerFeedbackController extends HttpServlet {

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
        // Create a new DAO instance for database interactions
        FeedbackDAO dao = new FeedbackDAO();
        // Retrieve the search query from the request parameters, defaulting to an empty string if null
        String txtSearch = request.getParameter("txtSearch") == null ? "" : request.getParameter("txtSearch");
        // Retrieve the current page index from the request parameters
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
        // Fetch feedback items with pagination based on the search query and current page index
        List<Feedback> listP = dao.searchFBWithPaging(txtSearch, pageIndex, 6);
        // Set the list of feedback as a request attribute for the JSP
        request.setAttribute("listP", listP);
        // Calculate the total number of pages needed based on the total number of feedback entries
        int pageSize = getPageSize(6, dao.searchFBWithPaging(txtSearch, null, null).size());
        request.setAttribute("totalPage", pageSize);
        // Set the current page index and search query as request attributes
        request.setAttribute("pageIndex", pageIndex);
        request.setAttribute("txtSearch", txtSearch);
        // Forward the request to the ManagerFeedback.jsp page for rendering
        request.getRequestDispatcher("ManagerFeedback.jsp").forward(request, response);
    }

    // Method to calculate the total number of pages based on products per page and total products
    public int getPageSize(int numberProduct, int allProduct) {
        // Calculate the number of pages needed
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
