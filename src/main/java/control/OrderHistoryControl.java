/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package control;

import utils.Config;
import dao.OrderDAO;
import entity.Account;
import entity.Order;
import entity.OrderDetails;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.TimeZone;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.JsonObject;

/**
 *
 * @author Admin
 */
@WebServlet(name = "OrderHistoryControl", urlPatterns = {"/OrderHistoryControl"})
public class OrderHistoryControl extends HttpServlet {

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
        OrderDAO dao = new OrderDAO();
        // Retrieve the current session
        HttpSession session = request.getSession();
        // Get the logged-in user's account information from the session
        Account a = (Account) session.getAttribute("acc");
        // Fetch the order history associated with the user's account ID
        List<Order> lstOrder = dao.getOrderHistoryByAccountID(a.getId());
        // Set the list of orders as a request attribute for the JSP
        request.setAttribute("lstOrder", lstOrder);
        // Forward the request to the OrderHistory.jsp page for rendering the order history
        request.getRequestDispatcher("OrderHistory.jsp").forward(request, response);
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
        OrderDAO orderDao = new OrderDAO();
        String orderId = request.getParameter("orderId");
        String status = request.getParameter("status");
        String action = request.getParameter("action");
        String reason = request.getParameter("reason");

        if ("cancel".equals(action)) {
            // Lấy thông tin đơn hàng từ cơ sở dữ liệu
            Order order = orderDao.getOrderById(Integer.parseInt(orderId));
            boolean refundSuccess = true; // Mặc định TRUE cho đơn COD (không cần hoàn tiền)

            if ("VNPay".equals(order.getPaymentMethod()) && order.getTransactionNo() != null) {
                refundSuccess = false;
                long vnpAmount = (long) (order.getTotalPrice() * 100);
                String vnp_TxnRef = order.getVnp_TxnRef();
                String vnp_RequestId = Config.getRandomNumber(8);
                String vnp_Version = "2.1.0";
                String vnp_Command = "refund";
                String vnp_TmnCode = Config.vnp_TmnCode;
                String vnp_TransactionType = "02";
                String vnp_Amount = String.valueOf(vnpAmount);
                String vnp_OrderInfo = "Hoan tien GD";
                String vnp_TransactionNo = order.getTransactionNo();
                String vnp_TransactionDate = order.getVnp_TransactionDate();
                String vnp_CreateBy = "ADMIN";

                Calendar cld = Calendar.getInstance(TimeZone.getTimeZone("Etc/GMT+7"));
                SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
                String vnp_CreateDate = formatter.format(cld.getTime());

                String vnp_IpAddr = Config.getIpAddress(request);

                JsonObject vnp_Params = new JsonObject();
                vnp_Params.addProperty("vnp_RequestId", vnp_RequestId);
                vnp_Params.addProperty("vnp_Version", vnp_Version);
                vnp_Params.addProperty("vnp_Command", vnp_Command);
                vnp_Params.addProperty("vnp_TmnCode", vnp_TmnCode);
                vnp_Params.addProperty("vnp_TransactionType", vnp_TransactionType);
                vnp_Params.addProperty("vnp_TxnRef", vnp_TxnRef);
                vnp_Params.addProperty("vnp_Amount", vnp_Amount);
                vnp_Params.addProperty("vnp_TransactionNo", vnp_TransactionNo);
                vnp_Params.addProperty("vnp_OrderInfo", vnp_OrderInfo);
                vnp_Params.addProperty("vnp_TransactionDate", vnp_TransactionDate);
                vnp_Params.addProperty("vnp_CreateBy", vnp_CreateBy);
                vnp_Params.addProperty("vnp_CreateDate", vnp_CreateDate);
                vnp_Params.addProperty("vnp_IpAddr", vnp_IpAddr);
                // Tạo chữ ký bảo mật cho yêu cầu
                String hash_Data = vnp_RequestId + "|" + vnp_Version + "|" + vnp_Command + "|" + vnp_TmnCode + "|"
                        + vnp_TransactionType + "|" + vnp_TxnRef + "|" + vnp_Amount + "|" + vnp_TransactionNo + "|"
                        + vnp_TransactionDate + "|" + vnp_CreateBy + "|" + vnp_CreateDate + "|" + vnp_IpAddr + "|" + vnp_OrderInfo;

                String vnp_SecureHash = Config.hmacSHA512(Config.secretKey, hash_Data.toString());

                vnp_Params.addProperty("vnp_SecureHash", vnp_SecureHash);

                try {
                    URL url = new URL("https://sandbox.vnpayment.vn/merchant_webapi/api/transaction");
                    HttpURLConnection con = (HttpURLConnection) url.openConnection();
                    con.setRequestMethod("POST");
                    con.setRequestProperty("Content-Type", "application/json");
                    con.setDoOutput(true);

                    DataOutputStream wr = new DataOutputStream(con.getOutputStream());
                    wr.writeBytes(vnp_Params.toString());
                    wr.flush();
                    wr.close();
                    BufferedReader in = new BufferedReader(
                            new InputStreamReader(con.getInputStream()));
                    String output;
                    StringBuffer responseData = new StringBuffer();
                    while ((output = in.readLine()) != null) {
                        responseData.append(output);
                    }
                    ObjectMapper objectMapper = new ObjectMapper();
                    JsonNode jsonNode = objectMapper.readTree(responseData.toString());
                    String vnp_ResponseCode = jsonNode.get("vnp_ResponseCode").asText();
                    // Kiểm tra mã phản hồi từ VNPAY
                    if ("00".equals(vnp_ResponseCode)) {
                        refundSuccess = true; // Refund thành công
                    } else {
                        refundSuccess = false; // Refund thất bại
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }

            // Nếu hoàn tiền thành công, hủy đơn hàng
            if (refundSuccess) {
                // Cập nhật lại kho hàng nếu hoàn tiền thành công
                List<OrderDetails> orderDetailList = orderDao.getOrderDetailsByOrderID(Integer.parseInt(orderId));
                for (OrderDetails o : orderDetailList) {
                    orderDao.restockQuantityBySieId(o.getSizeId(), o.getQuantity(), o.getProductID());
                }
                orderDao.updateCancelReason(Integer.parseInt(orderId), reason);
                // Hủy đơn hàng
                boolean isCancelled = orderDao.cancelOrderById(Integer.parseInt(orderId));
                if (isCancelled) {
                    request.getSession().setAttribute("message", "Order has been successfully canceled!"); // Thông báo thành công
                } else {
                    request.getSession().setAttribute("errorMessage", "Error occurred while canceling the order."); // Thông báo lỗi
                }
            } else {
                request.getSession().setAttribute("errorMessage", "Error occurred while refunding money."); // Thông báo lỗi khi hoàn tiền thất bại
            }
        }

        // Chuyển hướng về trang lịch sử đơn hàng
        response.sendRedirect("OrderHistoryControl");
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
