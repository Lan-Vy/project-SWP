/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package control;

import dao.CategoryDAO;
import entity.Category;
import entity.Product;
import entity.SubImage;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Admin
 */
@WebServlet(name = "AdminUpdateCategoryControl", urlPatterns = {"/updateCategory"})
public class AdminUpdateCategoryControl extends HttpServlet {

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
        response.setContentType("application/json"); 
    response.setCharacterEncoding("UTF-8");
        // Retrieve the 'id' parameter from the request
        try {
        int id = Integer.parseInt(request.getParameter("id"));
        CategoryDAO dao = new CategoryDAO();
        Category category = dao.getCategoryById(id);

        if (category != null) {
            String json = String.format("{\"id\": %d, \"name\": \"%s\"}", category.getId(), category.getName().replace("\"", "\\\""));
            response.getWriter().write(json);
        } else {
            response.setStatus(HttpServletResponse.SC_NOT_FOUND);
            response.getWriter().write("{\"error\": \"Category not found\"}");
        }
    } catch (Exception e) {
        response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
        response.getWriter().write("{\"error\": \"Invalid request\"}");
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
    request.setCharacterEncoding("UTF-8");

    String name = request.getParameter("name");
    String cId = request.getParameter("cid");
    try {
            int categoryId = Integer.parseInt(cId);
            Category category = new Category(categoryId, name.trim());
            CategoryDAO dao = new CategoryDAO();

            if (dao.isCategoryNameExistsExceptCurrent(category.getName(), category.getId())) {
                request.setAttribute("errorMessage", "Category name already exists!");
            } else {
                dao.updateCategory(category.getName(), category.getId());
                request.setAttribute("message", "Update success!");
            }

        } catch (NumberFormatException e) {
            request.setAttribute("errorMessage", "Invalid category ID!");
        }

        request.getRequestDispatcher("ManagerCategoryControl").forward(request, response);
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


