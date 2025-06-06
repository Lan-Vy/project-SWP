/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package control;

import dao.ProductDAO;
import dao.SubImageDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author Admin
 */
@WebServlet(name = "AdminDeleteProductControl", urlPatterns = {"/delete"})
public class AdminDeleteProductControl extends HttpServlet {

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
            throws ServletException, IOException, Exception {
        try {
            response.setContentType("text/html;charset=UTF-8");
            // Create a DAO instance to interact with the database
            ProductDAO dao = new ProductDAO();
            SubImageDAO sdao = new SubImageDAO();
            // Retrieve the product ID parameter from the request for the product to be deleted
            String pid = request.getParameter("deletePID");
            String sizeId = request.getParameter("sizeId");
            // Call the DAO method to delete associated sub-images of the product
            sdao.deleteSubImage(pid);
            // Call the DAO method to delete the product itself
            dao.deleteProduct(pid, sizeId);
            // Set a success message indicating the deletion was successful
            request.setAttribute("message", "Delete success!");
            // Forward the request to ManagerControl to display the result
            request.getRequestDispatcher("ManagerControl").forward(request, response);

        } catch (Exception e) {
            // Rethrow the exception to be handled by a higher-level error handler
             // Set a success message indicating the deletion was successful
            request.setAttribute("errorMessage", "Delete fail!" + e.getMessage());
            // Forward the request to ManagerControl to display the result
            request.getRequestDispatcher("ManagerControl").forward(request, response);
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
        } catch (Exception ex) {
            // Log the exception if an error occurs during processing
            Logger.getLogger(AdminDeleteProductControl.class.getName()).log(Level.SEVERE, null, ex);
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
        } catch (Exception ex) {
            // Log the exception if an error occurs during processing
            Logger.getLogger(AdminDeleteProductControl.class.getName()).log(Level.SEVERE, null, ex);
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
