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
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        // Retrieve the 'id' parameter from the request
        String id = request.getParameter("id");
        // Create an instance of the DAO to interact with the database
        CategoryDAO dao = new CategoryDAO();
        // Fetch the category object based on the provided ID
        Category c = dao.getCategoryById(Integer.parseInt(id));
        // Obtain a PrintWriter to send the response back to the client
        PrintWriter out = response.getWriter();
        // Begin generating the HTML for the modal dialog
        out.println("<div class=\"modal-dialog\">\n"
                + "                    <div class=\"modal-content\">\n"
                + "                        <form action=\"updateCategory\" method=\"post\">\n"
                + "                            <div class=\"modal-header\">\n"
                + "                                <h4 class=\"modal-title\">Edit Category</h4>\n"
                + "                                <button type=\"button\" class=\"close\" data-dismiss=\"modal\" aria-hidden=\"true\">&times;</button>\n"
                + "                            </div>\n"
                + "                            <div class=\"modal-body\">\n"
                + "\n"
                + "                                <div class=\"form-group\">\n"
                + "                                    <input name=\"cid\" type=\"hidden\" class=\"form-control\" value=\"" + c.getId() + "\">\n"
                + "                                    <label>Name</label>\n"
                + "                                    <input name=\"name\" type=\"text\" class=\"form-control\" required value=\"" + c.getName() + "\">\n"
                + "                                </div>\n"
                + "                                \n"
                + "\n"
                + "                            </div>\n"
                + "                            <div class=\"modal-footer\">\n"
                + "                                <input type=\"button\" class=\"btn btn-default\" data-dismiss=\"modal\" value=\"Cancel\">\n"
                + "                                <input type=\"submit\" class=\"btn btn-info\" value=\"Save\">\n"
                + "                            </div>\n"
                + "                        </form>\n"
                + "                    </div>\n"
                + "                </div>");
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
    CategoryDAO dao = new CategoryDAO();
    int categoryId = Integer.parseInt(cId);
 
    if (dao.isCategoryNameExistsExceptCurrent(name.trim(), categoryId)) {
        request.setAttribute("errorMessage", "Category name already exists!");
    } else {
        dao.updateCategory(name.trim(), categoryId);
        request.setAttribute("message", "Update success!");
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


