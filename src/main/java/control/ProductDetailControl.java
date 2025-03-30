/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package control;

import dao.CategoryDAO;
import dao.FeedbackDAO;
import dao.ProductDAO;
import dao.SizeDAO;
import dao.SubImageDAO;
import entity.Account;
import entity.Feedback;
import entity.*;
import entity.SubImage;
import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet(name = "ProductDetailControl", urlPatterns = {"/productDetail"})
public class ProductDetailControl extends HttpServlet {

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
        // Retrieve the product ID from the request parameters
        String pID = request.getParameter("productID");
        String sizeId = request.getParameter("sizeId");
        // Create a new DAO instance to interact with the database
        FeedbackDAO fdao = new FeedbackDAO();
        ProductDAO dao = new ProductDAO();
        CategoryDAO cdao = new CategoryDAO();
        SubImageDAO sidao = new SubImageDAO();
        // Fetch the product details based on the product ID
        Product p = dao.getProductByIDAndSize(pID, sizeId);
        // Get the category ID of the product
        int cid = p.getCateID();
        // Retrieve the category name using the category ID
        String cname = cdao.getCnameByCID(cid + "");
        // Get all sub-images associated with the product
        List<SubImage> listImage = sidao.getAllSubImageByPID(pID);
        // Initialize variables for sub-images
        String image0 = "", image1 = "", image2 = "", image3 = "";
        // Check the size of the list of sub-images and assign images accordingly
        if (listImage.size() > 0) {
            if (listImage.size() >= 1) {
                image0 = listImage.get(0).getImage();
            }
            if (listImage.size() >= 2) {
                image1 = listImage.get(1).getImage();
            }
            if (listImage.size() >= 3) {
                image2 = listImage.get(2).getImage();
            }
            if (listImage.size() >= 4) {
                image3 = listImage.get(3).getImage();
            }
        }

        SizeDAO sizeDAO = new SizeDAO();
        List<Size> listSize = sizeDAO.getAllSizeByProductId(Integer.parseInt(pID));

        // Set the product detail, category name, category ID, and images as request attributes
        request.setAttribute("detail", p);
        request.setAttribute("cateName", cname);
        request.setAttribute("cid", cid);
        request.setAttribute("image0", image0);
        request.setAttribute("image1", image1);
        request.setAttribute("image2", image2);
        request.setAttribute("image3", image3);
        request.setAttribute("listSize", listSize);
        // Fetch feedback associated with the product and set it as a request attribute
        List<Feedback> feedbacks = fdao.getFeedbacksByProductId(Integer.parseInt(pID));
        request.setAttribute("feedbacks", feedbacks);
        double avgRating = fdao.getAverageRatingByProductId(Integer.parseInt(pID));
        request.setAttribute("avgRating", avgRating);
//        // Retrieve the current session and check if the user is logged in
//        HttpSession session = request.getSession();
//        Account customer = (Account) session.getAttribute("acc");
//        Integer userId = customer == null ? null : customer.getId();
//        // Initialize a boolean to check if the user can leave feedback
//        boolean canFeedback = false;
//        // If the user is logged in, check if they have purchased the product
//        if (userId != null) {
//            canFeedback = dao.isBought(userId, Integer.parseInt(pID)) && !fdao.isFeedbacked(userId, Integer.parseInt(pID));
//            request.setAttribute("canFeedback", canFeedback);
//        }
        // Forward the request to ProductDetail.jsp for rendering
        request.getRequestDispatcher("ProductDetail.jsp").forward(request, response);
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
