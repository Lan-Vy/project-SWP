/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package control;

import dao.CartDAO;
import dao.OrderDAO;
import dao.OrderDetailDAO;
import dao.ProductDAO;
import entity.Account;
import entity.CartItem;
import entity.Product;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 *
 * @author Admin
 */
@WebServlet(name = "CheckOutVNPayControl", urlPatterns = {"/vnpay-checkout"})
public class CheckOutVNPayControl extends HttpServlet {

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
            // Create a new DAO instance for database operations
            OrderDAO odao = new OrderDAO();
            OrderDetailDAO oddao = new OrderDetailDAO();
            ProductDAO pdao = new ProductDAO();
            // Retrieve the current session
            HttpSession session = request.getSession();
            // Get the currently logged-in account from the session
            Account acc = (Account) session.getAttribute("acc");
            if (acc != null) {
                String responseCode = request.getParameter("vnp_ResponseCode");
                if ("00".equals(responseCode)) {
                    CartDAO cdao = new CartDAO();
                    List<CartItem> cartItems = cdao.getCartItemByUserId(acc.getId());

                    // Initialize the total variable to track the cart amount
                    double totalPrice = 0;
                    // Check if the cart is not null and calculate the total amount
                    if (cartItems.size() > 0) {
                        for (CartItem cartItem : cartItems) {
                            totalPrice += cartItem.getProduct().getPrice() * cartItem.getQuantity();
                        }
                    }
                    // If the cart is empty, redirect to the shop
                    if (totalPrice == 0.0) {
                        response.sendRedirect("ShopControl");
                        return;
                    } // Get the current date for the order
                    Date date = new Date();
                    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
                    java.sql.Date dateInsert = java.sql.Date.valueOf(dateFormat.format(date));
                    // Retrieve user information from the request parameters
                    String firstname = request.getParameter("firstname");
                    String lastname = request.getParameter("lastname");
                    String address = request.getParameter("address");
                    String phone = request.getParameter("phone");
                    // Insert the order into the database
                    odao.insertOrder(dateInsert + "", acc.getId(), address, phone, firstname + " " + lastname, totalPrice);
                    // Retrieve the order ID for the newly created order
                    int orderID = odao.getOrderID();
                    // Loop through each product in the cart and insert order details
                    for (CartItem cartItem : cartItems) {
                        oddao.insertOrderDetails(orderID, cartItem.getProduct().getId(), cartItem.getProduct().getPrice(), cartItem.getQuantity(), cartItem.getSize().getId());
                    }
                    // Update the product amounts in the inventory based on the order
//                    for (Product product : c.getItems()) {
//
//                        int reduceAmount = product.getAmount() - product.getNumberInCart();
//                        pdao.updateAmounProduct(reduceAmount, product.getId());
//                    }
                    // remove cart
                    cdao.removeAllFromCart(acc.getId());
                    // Set a success message to be displayed on the CheckOut.jsp page
                    request.setAttribute("message", "Order successfull!");
                    // Forward the request to CheckOut.jsp to display the success message
                    request.getRequestDispatcher("CheckOut.jsp").forward(request, response);
                } else {
                    // Set a success message to be displayed on the CheckOut.jsp page
                    request.setAttribute("errorMessage", "Order fail!");
                    // Forward the request to CheckOut.jsp to display the success message
                    request.getRequestDispatcher("CheckOut.jsp").forward(request, response);
                }
            } else {
                request.getRequestDispatcher("login").forward(request, response);
            }
        } catch (Exception e) {
            System.out.println("error");
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
