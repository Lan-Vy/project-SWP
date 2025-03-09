/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package control;

import dao.DAO;
import entity.Account;
import entity.Feedback;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author Admin
 */
@WebServlet(name = "AddFeedbackController", urlPatterns = {"/add-feedback"})
public class AddFeedbackController extends HttpServlet {

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
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AddFeedbackController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddFeedbackController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        // Set the content type of the response to HTML with UTF-8 encoding
        response.setContentType("text/html;charset=UTF-8");
        try {
            // Get the current session
            HttpSession session = request.getSession();
            // Retrieve the user account from the session
            Account user = (Account) session.getAttribute("acc");
            // Check if the user is logged in
            if (user != null) {
                //input fields
                String productId = request.getParameter("productId");
                String message = request.getParameter("message");
                String rating = request.getParameter("rating");
                //add feedback 
                DAO dao = new DAO();
                // Retrieve the user's ID
                int userId = user.getId();
                 // Create a Feedback object with the user's ID, product ID, rating, and message
                Feedback feedback = new Feedback(userId, Integer.parseInt(productId), Integer.parseInt(rating), message);
                // Add the feedback to the database
                dao.addFeedback(feedback);
                // Redirect the user back to the product detail page with the product ID
                response.sendRedirect("productDetail?productID=" + productId);
            } else {
                 // If the user is not logged in, redirect to the login page
                response.sendRedirect("login");
            }
        } catch (Exception e) {
            // Print the stack trace for any exceptions that occur
            e.printStackTrace();
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
