/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package control;

import dao.FeedbackDAO;
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
@WebServlet(name = "AddReplyFeedbackController", urlPatterns = {"/add-reply"})
public class AddReplyFeedbackController extends HttpServlet {

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
            String feedbackId = request.getParameter("feedbackId");
            String replyMessage = request.getParameter("replyMessage");
            // Get the current session
            HttpSession session = request.getSession();
            // Retrieve the user account from the session
            Account user = (Account) session.getAttribute("acc");
            // Check if the user is logged in
            if (user != null) {
                FeedbackDAO fdao = new FeedbackDAO();
                Feedback f = new Feedback(Integer.parseInt(feedbackId), user.getId(), replyMessage);
                fdao.addReplyFeedback(f);
                request.setAttribute("message", "Reply success!");
                request.getRequestDispatcher("ManagerFeedbackController").forward(request, response);
            } else {
                // If the user is not logged in, redirect to the login page
                response.sendRedirect("login");
            }
        } catch (Exception e) {
            request.setAttribute("message", "Reply fail! " + e.getMessage());
            request.getRequestDispatcher("ManagerFeedbackController").forward(request, response);
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
