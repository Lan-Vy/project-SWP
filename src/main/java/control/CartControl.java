/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package control;

import dao.CartDAO;
import dao.ProductDAO;
import dao.SizeDAO;
import entity.Account;
import entity.CartItem;
import entity.Product;
import entity.Size;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
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
@WebServlet(name = "CartControl", urlPatterns = {"/cart"})
public class CartControl extends HttpServlet {

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
//        HttpSession session = request.getSession(true);
//        // Get the product ID and action from the request parameters
//        String id = request.getParameter("id");
//        String action = request.getParameter("action");
//
//        String selectedSizes = request.getParameter("selectedSizes"); // Danh sách size (chuỗi)
//        List<Integer> sizes = new ArrayList<>();
//        if (!(id == null && action == null && selectedSizes == null)) {
//            // Chuyển chuỗi size "1,2,3" thành danh sách số nguyên
//            String[] sizeArray = selectedSizes.split(",");
//
//            for (String size : sizeArray) {
//                sizes.add(Integer.parseInt(size));
//            }
//        }
//
//        // Check if both id and action are not null
//        if (!(id == null && action == null)) {
//            // If the action is to add a product to the cart
//            if (action != null && action.equalsIgnoreCase("add")) {
//                // Check if the cart does not exist in the session
//                if (session.getAttribute("cart") == null) {
//                    // Initialize a new cart with an empty product list
//                    List<Product> lst = new ArrayList<>();
//                    session.setAttribute("cart", new Cart(lst));
//                }
//                // Retrieve the product from the database using its ID
//                Product p = new ProductDAO().getProductByID(id);
//                // Get the cart from the session
//                Cart c = (Cart) session.getAttribute("cart");
//                // Add the product to the cart
//                c.add(new Product(p.getId(), p.getName(), p.getImage(), p.getPrice(),
//                        p.getTitle(), p.getDescription(), p.getCateID(), p.getSubImage(),
//                        p.getAmount(), 1, p.getIsDeleted()));
//                // Update the cart in the session
//                session.setAttribute("cart", c);
//            }
//        }
//        // If the action is to decrease the quantity of a product
//        if (action != null && action.equalsIgnoreCase("minus")) {
//            // Retrieve the product from the database
//            Product p = new ProductDAO().getProductByID(id);
//            // Get the cart from the session
//            Cart c = (Cart) session.getAttribute("cart");
//            // Decrease the quantity of the product in the cart
//            c.minus(new Product(p.getId(), p.getName(), p.getImage(), p.getPrice(),
//                    p.getTitle(), p.getDescription(), p.getCateID(), p.getSubImage(),
//                    p.getAmount(), p.getIsDeleted()));
//            // Update the cart in the session
//            session.setAttribute("cart", c);
//            // If the action is to delete a product from the cart
//        } else if (action != null && action.equalsIgnoreCase("delete")) {
//            // Get the cart from the session
//            Cart c = (Cart) session.getAttribute("cart");
//            // Remove the product with the specified ID from the cart
//            c.remove(Integer.parseInt(id));
//            // Update the cart in the session
//            session.setAttribute("cart", c);
//        }
//        // Forward the request to the Cart.jsp page
//        request.getRequestDispatcher("Cart.jsp").forward(request, response);

//        HttpSession session = request.getSession(true);
//
//        String id = request.getParameter("id");
//        String action = request.getParameter("action");
//        String selectedSizes = request.getParameter("selectedSizes"); // Danh sách size (chuỗi "1,2,3")
//
//        if (id != null && action != null && selectedSizes != null) {
//            // Tách chuỗi selectedSizes thành danh sách số nguyên
//            String[] sizeArray = selectedSizes.split(",");
//            List<Integer> sizes = new ArrayList<>();
//            for (String size : sizeArray) {
//                sizes.add(Integer.parseInt(size.trim()));
//            }
//
//            // Nếu session chưa có giỏ hàng, tạo mới
//            if (session.getAttribute("cart") == null) {
//                session.setAttribute("cart", new Cart());
//            }
//            Cart cart = (Cart) session.getAttribute("cart");
//            ProductDAO productDAO = new ProductDAO();
//            SizeDAO sdao = new SizeDAO();
//
//            // Lặp qua từng size và thêm vào giỏ hàng
//            for (int size : sizes) {
//                Product product = productDAO.getProductByID(id);
//                Size s = sdao.getSizeById(size);
//                product.setSizeInCart(s); // Đặt size cho sản phẩm
//                
//                if (action.equalsIgnoreCase("add")) {
//                    cart.add(product);
//                } else if (action.equalsIgnoreCase("minus")) {
//                    cart.minus(product);
//                } else if (action.equalsIgnoreCase("delete")) {
//                    cart.remove(Integer.parseInt(id), size);
//                }
//            }
//            session.setAttribute("cart", cart);
//        }
//        request.getRequestDispatcher("Cart.jsp").forward(request, response);
        HttpSession session = request.getSession();
        Account acc = (Account) session.getAttribute("acc");
        if (acc != null) {
            CartDAO cdao = new CartDAO();
            String id = request.getParameter("id");
            String action = request.getParameter("action");
            String selectedSizes = request.getParameter("selectedSizes"); // Danh sách size (chuỗi "1,2,3")

            if (id != null && action != null && selectedSizes != null) {
                // Tách chuỗi selectedSizes thành danh sách
                String[] sizeArray = selectedSizes.split(",");
                // Lặp qua từng size và thêm vào giỏ hàng
                for (String sizeStr : sizeArray) {
                    int size = Integer.parseInt(sizeStr.trim());
                    int productId = Integer.parseInt(id);

                    if (action.equalsIgnoreCase("add")) {
                        cdao.addToCart(acc.getId(), productId, size);
                    } else if (action.equalsIgnoreCase("minus")) {
                        cdao.updateCartQuantity(acc.getId(), productId, size);
                    } else if (action.equalsIgnoreCase("delete")) {
                        cdao.removeFromCart(acc.getId(), productId, size);
                    }
                }

            }
            // Load lại giỏ hàng từ DB sau khi cập nhật
            List<CartItem> cartItems = cdao.getCartItemByUserId(acc.getId());
            request.setAttribute("cartItems", cartItems);
            request.getRequestDispatcher("Cart.jsp").forward(request, response);
        } else {
            request.getRequestDispatcher("Login.jsp").forward(request, response);
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
