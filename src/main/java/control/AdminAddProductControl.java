/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package control;

import dao.ProductDAO;
import dao.SubImageDAO;
import entity.Product;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author Admin
 */
@WebServlet(name = "AdminAddProductControl", urlPatterns = {"/addProduct"})
public class AdminAddProductControl extends HttpServlet {

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
        // Retrieve input parameters from the request
        String name = request.getParameter("name");
        String image = request.getParameter("image");
        String subImage1 = request.getParameter("subImage1");
        String subImage2 = request.getParameter("subImage2");
        String subImage3 = request.getParameter("subImage3");
        String subImage4 = request.getParameter("subImage4");
        String price = request.getParameter("price");
        String title = request.getParameter("title");
        String description = request.getParameter("description");
        String amount = request.getParameter("amount");
        String category = request.getParameter("category");
        String[] sizes = request.getParameterValues("size");
        
        // Create a DAO instance to interact with the database
        ProductDAO dao = new ProductDAO();
        SubImageDAO sdao = new SubImageDAO();

        dao.addNewProduct(name, image, price, title, description, category, Integer.parseInt(amount), sizes);
        // Retrieve the newly added product ID for adding sub-images
        int pID = dao.getProductIDToAdd();
        // Add each of the sub-images associated with the new product
        sdao.addNewSubImage(pID + "", subImage1);
        sdao.addNewSubImage(pID + "", subImage2);
        sdao.addNewSubImage(pID + "", subImage3);
        sdao.addNewSubImage(pID + "", subImage4);
        
        // Set a success message to be displayed
        request.setAttribute("message", "Create success!");
        // Forward the request to ManagerControl to display the success message
        request.getRequestDispatcher("ManagerControl").forward(request, response);

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
