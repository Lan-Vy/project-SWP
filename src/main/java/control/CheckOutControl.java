/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
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
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.TimeZone;
import utils.Config;

/**
 *
 * @author Admin
 */
@WebServlet(name = "CheckOutControl", urlPatterns = {"/CheckOut"})
public class CheckOutControl extends HttpServlet {

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
        try {
            HttpSession session = request.getSession();
            Account acc = (Account) session.getAttribute("acc");
            if (acc != null) {
                CartDAO cdao = new CartDAO();
                // Load lại giỏ hàng từ DB sau khi cập nhật
                List<CartItem> cartItems = cdao.getCartItemByUserId(acc.getId());

                // Initialize the total variable to track the cart amount
                double total = 0;
                // Check if the cart is not null and calculate the total amount
                if (cartItems.size() > 0) {
                    for (CartItem cartItem : cartItems) {
                        total += cartItem.getProduct().getPrice() * cartItem.getQuantity();
                    }
                }
                if (total == 0.0) {
                    // If the cart total is 0, redirect to the shop page
                    response.sendRedirect("ShopControl");
                } else {
                    // If there are items in the cart, redirect to the checkout page
                    request.setAttribute("cartItems", cartItems);
                    request.getRequestDispatcher("CheckOut.jsp").forward(request, response);
                }
            } else {
                request.getRequestDispatcher("Login.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
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
            // Create a new DAO instance for database operations
            OrderDAO odao = new OrderDAO();
            OrderDetailDAO oddao = new OrderDetailDAO();
            ProductDAO pdao = new ProductDAO();
            // Retrieve the current session
            HttpSession session = request.getSession();
            // Get the currently logged-in account from the session
            Account a = (Account) session.getAttribute("acc");
            // Retrieve user information from the request parameters
            String firstname = request.getParameter("firstname");
            String lastname = request.getParameter("lastname");
            String address = request.getParameter("address");
            String phone = request.getParameter("phone");
            String payment = request.getParameter("payment");

            CartDAO cdao = new CartDAO();
            List<CartItem> cartItems = cdao.getCartItemByUserId(a.getId());

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
            }

            if (payment.equals("cod")) {
                //payment cod
                // Get the current date for the order
                Date date = new Date();
                SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
                java.sql.Date dateInsert = java.sql.Date.valueOf(dateFormat.format(date));
                // Insert the order into the database
                odao.insertOrder(dateInsert + "", a.getId(), address, phone, firstname + " " + lastname, totalPrice);
                // Retrieve the order ID for the newly created order
                int orderID = odao.getOrderID();
                // Loop through each product in the cart and insert order details
                // Loop through each product in the cart, insert order details và cập nhật tồn kho
                for (CartItem cartItem : cartItems) {
                    int productId = cartItem.getProduct().getId();
                    int quantity = cartItem.getQuantity();
                    double price = cartItem.getProduct().getPrice();
                    int sizeId = cartItem.getSize().getId();

                    // Thêm chi tiết đơn hàng
                    oddao.insertOrderDetails(orderID, productId, price, quantity, sizeId);

                    // Trừ tồn kho sản phẩm
                    pdao.updateProductQuantity(productId, quantity, sizeId);
                }

                // Update the product amounts in the inventory based on the order
//                for (Product product : c.getItems()) {
//
//                    int reduceAmount = product.getAmount() - product.getNumberInCart();
//                    pdao.updateAmounProduct(reduceAmount, product.getId());
//                }
// remove cart
                cdao.removeAllFromCart(a.getId());
                // Set a success message to be displayed on the CheckOut.jsp page
                request.setAttribute("message", "Order successfull!");
                // Forward the request to CheckOut.jsp to display the success message
                request.getRequestDispatcher("CheckOut.jsp").forward(request, response);
            } else if (payment.equals("vnpay")) {
                //vnpay
                //vnpay
                String vnp_Version = "2.1.0";
                String vnp_Command = "pay";
                String orderType = "other";
                long amount = (long) (totalPrice * 100);
                String bankCode = "NCB";

                String vnp_TxnRef = Config.getRandomNumber(8);
                String vnp_IpAddr = Config.getIpAddress(request);

                String vnp_TmnCode = Config.vnp_TmnCode;

                Map<String, String> vnp_Params = new HashMap<>();
                vnp_Params.put("vnp_Version", vnp_Version);
                vnp_Params.put("vnp_Command", vnp_Command);
                vnp_Params.put("vnp_TmnCode", vnp_TmnCode);
                vnp_Params.put("vnp_Amount", String.valueOf(amount));
                vnp_Params.put("vnp_CurrCode", "VND");

                vnp_Params.put("vnp_BankCode", bankCode);
                vnp_Params.put("vnp_TxnRef", vnp_TxnRef);
                vnp_Params.put("vnp_OrderInfo", "Thanh toan don hang:" + vnp_TxnRef);
                vnp_Params.put("vnp_OrderType", orderType);

                String locate = request.getParameter("language");
                if (locate != null && !locate.isEmpty()) {
                    vnp_Params.put("vnp_Locale", locate);
                } else {
                    vnp_Params.put("vnp_Locale", "vn");
                }
                String returnURL = Config.vnp_ReturnUrl + "?firstname=" + firstname + "&lastname=" + lastname + "&address=" + address + "&phone=" + phone;
                vnp_Params.put("vnp_ReturnUrl", returnURL);
                vnp_Params.put("vnp_IpAddr", vnp_IpAddr);

                Calendar cld = Calendar.getInstance(TimeZone.getTimeZone("Etc/GMT+7"));
                SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
                String vnp_CreateDate = formatter.format(cld.getTime());
                vnp_Params.put("vnp_CreateDate", vnp_CreateDate);

                cld.add(Calendar.MINUTE, 15);
                String vnp_ExpireDate = formatter.format(cld.getTime());
                vnp_Params.put("vnp_ExpireDate", vnp_ExpireDate);

                List fieldNames = new ArrayList(vnp_Params.keySet());
                Collections.sort(fieldNames);
                StringBuilder hashData = new StringBuilder();
                StringBuilder query = new StringBuilder();
                Iterator itr = fieldNames.iterator();
                while (itr.hasNext()) {
                    String fieldName = (String) itr.next();
                    String fieldValue = (String) vnp_Params.get(fieldName);
                    if ((fieldValue != null) && (fieldValue.length() > 0)) {
                        //Build hash data
                        hashData.append(fieldName);
                        hashData.append('=');
                        hashData.append(URLEncoder.encode(fieldValue, StandardCharsets.US_ASCII.toString()));
                        //Build query
                        query.append(URLEncoder.encode(fieldName, StandardCharsets.US_ASCII.toString()));
                        query.append('=');
                        query.append(URLEncoder.encode(fieldValue, StandardCharsets.US_ASCII.toString()));
                        if (itr.hasNext()) {
                            query.append('&');
                            hashData.append('&');
                        }
                    }
                }
                String queryUrl = query.toString();

                String vnp_SecureHash = Config.hmacSHA512(Config.secretKey, hashData.toString());
                queryUrl += "&vnp_SecureHash=" + vnp_SecureHash;
                String paymentUrl = Config.vnp_PayUrl + "?" + queryUrl;

                response.sendRedirect(paymentUrl);
            }
        } catch (Exception e) {
            // In case of an error, set an error message
            request.setAttribute("message", "Order fail!");
            // Forward the request back to CheckOut.jsp to display the error message
            request.getRequestDispatcher("CheckOut.jsp").forward(request, response);
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
