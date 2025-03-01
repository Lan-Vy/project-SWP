/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package control;

import dao.DAO;
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
@WebServlet(name = "AdminDeleteCategoryControl", urlPatterns = {"/deleteCategory"})
public class AdminDeleteCategoryControl extends HttpServlet {

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
        try {
            // Create a DAO instance to interact with the database
            DAO dao = new DAO();
            // Retrieve the category ID parameter from the request
            String cId = request.getParameter("cId");
            // Get a list of products associated with the specified category ID
            List<Product> lstP = dao.getProductByCid(cId);
            // Check if there are any products in the category
            if (lstP.size() > 0) {
                // If there are products, set an error message indicating deletion is not allowed
                request.setAttribute("errorMessage", "This category cannot be deleted because there are some products in this category!");
            } else {
                // If there are no products, proceed to delete the category
                request.setAttribute("message", "Delete success!");
                // Set a success message indicating the category was deleted
                dao.deleteCategory(cId);
            }

            request.getRequestDispatcher("ManagerCategoryControl").forward(request, response);

        } catch (Exception e) {
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
        response.setContentType("text/html;charset=UTF-8");
        try {
            // Create a DAO instance to interact with the database
            DAO dao = new DAO();
            // Retrieve the parameter containing selected category IDs
            String categoryIdsParam = request.getParameter("categoryIds");
            // Check if the parameter is not null and not empty
            if (categoryIdsParam != null && !categoryIdsParam.isEmpty()) {
                // Get the list of products associated with the selected category IDs
                List<Product> lstP = dao.getProductByCids(categoryIdsParam);
                // Check if there are any products in the selected categories
                if (lstP.size() > 0) {
                    // If products exist, set an error message indicating deletion is not allowed
                    request.setAttribute("errorMessage", "This category cannot be deleted because there are some products in categories was selected!");
                } else {
                    // Split the category IDs by comma to process each ID
                    String[] categoryIds = categoryIdsParam.split(",");
                    // Loop through each category ID and delete the corresponding category
                    for (String id : categoryIds) {
                        // Gọi hàm xóa từng category với id tương ứng
                        dao.deleteCategory(id);
                    }
                    // Set a success message indicating the categories were deleted
                    request.setAttribute("message", "Delete success!");
                }
            }
            // Forward the request to ManagerCategoryControl to display the result
            request.getRequestDispatcher("ManagerCategoryControl").forward(request, response);
        } catch (Exception e) {
            request.setAttribute("errorMessage", "Delete fail! " + e.getMessage());
            request.getRequestDispatcher("ManagerCategoryControl").forward(request, response);
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

}
