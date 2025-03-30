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
        HttpSession session = request.getSession();
        Account acc = (Account) session.getAttribute("acc");
        if (acc != null) {
            CartDAO cdao = new CartDAO();
            String id = request.getParameter("id");
            String action = request.getParameter("action");
            String sizeId = request.getParameter("sizeId"); // Danh sách size (chuỗi "1,2,3")

            if (id != null && action != null) {
                // Tách chuỗi selectedSizes thành danh sách
//                String[] sizeArray = selectedSizes.split(",");
                // Lặp qua từng size và thêm vào giỏ hàng
//                for (String sizeStr : sizeArray) {
                    int size = Integer.parseInt(sizeId);
                    int productId = Integer.parseInt(id);

                    if (action.equalsIgnoreCase("add")) {
                        boolean ok ;
                       ok = cdao.addToCart(acc.getId(), productId, size);
                       if(!ok){
                            System.out.print("add to cart failed");}
                    } else if (action.equalsIgnoreCase("minus")) {
                        boolean ok ;
                        ok=cdao.updateCartQuantity(acc.getId(), productId, size);
                        if(!ok){
                            System.out.print("update to cart failed");}
                    } else if (action.equalsIgnoreCase("delete")) {
                        boolean ok ;
                        ok =cdao.removeFromCart(acc.getId(), productId, size);
                        if(!ok){
                            System.out.print("delete to cart failed");}
                    }
//                }

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
