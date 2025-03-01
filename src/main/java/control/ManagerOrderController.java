/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package control;

import dao.DAO;
import entity.Account;
import entity.Order;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;

/**
 *
 * @author
 */
@WebServlet(name = "ManagerOrderController", urlPatterns = {"/ManagerOrder"})
public class ManagerOrderController extends HttpServlet {

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
            // Retrieve the current session
            HttpSession session = request.getSession();
            // Get the currently logged-in account from the session
            Account a = (Account) session.getAttribute("acc");

            DAO dao = new DAO();
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
            List<Order> orders = new ArrayList<>();
            int pageSize = 0;
            if (a.getRole() == 2) {
                orders = dao.getAllOrders(pageIndex, 6);
                List<Account> shippers = dao.getAccountsByRole(3);
                request.setAttribute("shippers", shippers);
                pageSize = getPageSize(6, dao.getAllOrders().size());
            } else if (a.getRole() == 3) {
                orders = dao.getAllOrdersByShipper(pageIndex, 6, a.getId());
                pageSize = getPageSize(6, dao.getAllOrdersByShipper(a.getId()).size());
            }
            request.setAttribute("orders", orders);

            request.setAttribute("totalPage", pageSize);
            // Set the current page index as a request attribute
            request.setAttribute("pageIndex", pageIndex);

            request.getRequestDispatcher("ManagerOrder.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public int getPageSize(int numberProduct, int allProduct) {
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
