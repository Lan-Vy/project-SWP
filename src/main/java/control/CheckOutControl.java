package control;

import dao.CartDAO;
import dao.OrderDAO;
import dao.OrderDetailDAO;
import dao.ProductDAO;
import dao.VoucherDAO;
import entity.Account;
import entity.CartItem;
import entity.Product;
import entity.Voucher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import utils.Config;

import java.io.IOException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.text.SimpleDateFormat;
import java.util.*;

@WebServlet(name = "CheckOutControl", urlPatterns = {"/CheckOut"})
public class CheckOutControl extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            HttpSession session = request.getSession();
            Account acc = (Account) session.getAttribute("acc");
            if (acc != null) {
                CartDAO cdao = new CartDAO();
                List<CartItem> cartItems = cdao.getCartItemByUserId(acc.getId());
                double total = 0;
                for (CartItem item : cartItems) {
                    total += item.getProduct().getPrice() * item.getQuantity();
                }

                if (total == 0) {
                    response.sendRedirect("ShopControl");
                } else {
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

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");
        try {
            HttpSession session = request.getSession();
            Account a = (Account) session.getAttribute("acc");

            String firstname = request.getParameter("firstname");
            String lastname = request.getParameter("lastname");
            String address = request.getParameter("address");
            String phone = request.getParameter("phone");
            String payment = request.getParameter("payment");
            String voucherCode = request.getParameter("voucherCode");
            String action = request.getParameter("action");

            CartDAO cdao = new CartDAO();
            VoucherDAO vdao = new VoucherDAO();
            OrderDAO odao = new OrderDAO();
            OrderDetailDAO oddao = new OrderDetailDAO();
            ProductDAO pdao = new ProductDAO();

            List<CartItem> cartItems = cdao.getCartItemByUserId(a.getId());
            double totalPrice = cartItems.stream()
                    .mapToDouble(item -> item.getProduct().getPrice() * item.getQuantity())
                    .sum();

            double discountAmount = 0.0;

            if ("applyVoucher".equals(action)) {
                if (voucherCode != null && !voucherCode.trim().isEmpty()) {
                    Voucher voucher = vdao.getVoucherByCode(voucherCode);
                    if (voucher != null && voucher.isActive() && totalPrice >= voucher.getMinOrderValue()) {
                        discountAmount = (totalPrice * voucher.getDiscountPercent()) / 100;
                        request.setAttribute("discountAmount", discountAmount);
                        request.setAttribute("finalPrice", totalPrice - discountAmount);
                        request.setAttribute("voucherCode", voucherCode);
                        request.setAttribute("message", "Voucher applied successfully!");
                    } else {
                        request.setAttribute("errorMessage", "Invalid voucher or minimum order not met.");
                    }
                } else {
                    request.setAttribute("errorMessage", "Please enter a valid voucher code.");
                }
                request.setAttribute("cartItems", cartItems);
                request.getRequestDispatcher("CheckOut.jsp").forward(request, response);
                return;
            }

            if (voucherCode != null && !voucherCode.trim().isEmpty()) {
                Voucher voucher = vdao.getVoucherByCode(voucherCode);
                if (voucher != null && voucher.isActive() && totalPrice >= voucher.getMinOrderValue()) {
                    discountAmount = (totalPrice * voucher.getDiscountPercent()) / 100;
                } else {
                    request.setAttribute("errorMessage", "Voucher is invalid or minimum value not met.");
                    request.setAttribute("voucherCode", voucherCode);
                    request.setAttribute("firstname", firstname);
                    request.setAttribute("lastname", lastname);
                    request.setAttribute("address", address);
                    request.setAttribute("phone", phone);
                    request.setAttribute("cartItems", cartItems);
                    request.getRequestDispatcher("CheckOut.jsp").forward(request, response);
                    return;
                }
            }

            totalPrice -= discountAmount;
            totalPrice = Math.max(totalPrice, 0);

            if (totalPrice == 0.0) {
                response.sendRedirect("ShopControl");
                return;
            }

            boolean isError = false;
            for (CartItem item : cartItems) {
                int pid = item.getProduct().getId();
                int sid = item.getSize().getId();
                Product product = pdao.getProductByIDAndSize(String.valueOf(pid), String.valueOf(sid));
                if (item.getQuantity() > product.getAmount()) {
                    isError = true;
                    break;
                }
            }

            if (isError) {
                request.setAttribute("errorMessage", "Order failed: some products are out of stock.");
                request.setAttribute("cartItems", cartItems);
                request.getRequestDispatcher("CheckOut.jsp").forward(request, response);
                return;
            }

            if ("cod".equals(payment)) {
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                String orderDate = sdf.format(new Date());

                odao.insertOrder(orderDate, a.getId(), address, phone, firstname + " " + lastname, totalPrice, "COD", null, null, null);
                int orderID = odao.getOrderID();

                for (CartItem item : cartItems) {
                    int pid = item.getProduct().getId();
                    int sid = item.getSize().getId();
                    int qty = item.getQuantity();
                    double price = item.getProduct().getPrice();

                    oddao.insertOrderDetails(orderID, pid, price, qty, sid);
                    pdao.updateProductQuantity(pid, qty, sid);
                }

                if (voucherCode != null && !voucherCode.isEmpty()) {
                    vdao.reduceVoucherQuantity(voucherCode);
                }

                cdao.removeAllFromCart(a.getId());

                request.setAttribute("message", "Order successful!");
                request.setAttribute("discountAmount", discountAmount);
                request.setAttribute("finalPrice", totalPrice);
                request.setAttribute("voucherCode", voucherCode);
                request.getRequestDispatcher("CheckOut.jsp").forward(request, response);

            } else if ("vnpay".equals(payment)) {
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
                Calendar cld = Calendar.getInstance(TimeZone.getTimeZone("Etc/GMT+7"));
                SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
                String vnp_CreateDate = formatter.format(cld.getTime());

                String returnURL = Config.vnp_ReturnUrl + "?firstname=" + firstname + "&lastname=" + lastname + "&address=" + address + "&phone=" + phone + "&vnp_CreateDate=" + vnp_CreateDate;
                vnp_Params.put("vnp_ReturnUrl", returnURL);
                vnp_Params.put("vnp_IpAddr", vnp_IpAddr);

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
            e.printStackTrace();
            request.setAttribute("errorMessage", "Order failed due to system error.");
            request.getRequestDispatcher("CheckOut.jsp").forward(request, response);
        }
    }

    @Override
    public String getServletInfo() {
        return "Checkout controller servlet";
    }
}
