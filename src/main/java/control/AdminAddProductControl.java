/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package control;

import dao.ProductDAO;
import dao.SubImageDAO;
import entity.Product;
import entity.Size;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.util.HashMap;
import java.util.Map;
import utils.ImageService;

/**
 *
 * @author Admin
 */
@WebServlet(name = "AdminAddProductControl", urlPatterns = {"/addProduct"})
@MultipartConfig(fileSizeThreshold = 1024 * 1024, maxFileSize = 5 * 1024 * 1024, maxRequestSize = 10 * 1024 * 1024)
public class AdminAddProductControl extends HttpServlet {

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
        // Retrieve input parameters from the request
        String name = request.getParameter("name");
        Part imagePart = request.getPart("image");
        Part subImage1Part = request.getPart("subImage1");
        Part subImage2Part = request.getPart("subImage2");
        Part subImage3Part = request.getPart("subImage3");
        Part subImage4Part = request.getPart("subImage4");
        String title = request.getParameter("title");
        String description = request.getParameter("description");
        String category = request.getParameter("category");
        String[] sizes = request.getParameterValues("size");

        // Map để lưu thông tin từng size
        Map<Integer, Size> sizeMap = new HashMap<>();
        if (sizes != null) {
            for (String sizeIdStr : sizes) {
                try {
                    int sizeId = Integer.parseInt(sizeIdStr);

                    String priceStr = request.getParameter("sizePrice_" + sizeId);
                    String amountStr = request.getParameter("sizeAmount_" + sizeId);

                    double priceSize = Double.parseDouble(priceStr);
                    int amountSize = Integer.parseInt(amountStr);

                    Size sizeDetail = new Size(sizeId,amountSize, priceSize);
                    sizeMap.put(sizeId, sizeDetail);
                } catch (NumberFormatException e) {
                    e.printStackTrace(); // Log lỗi nếu dữ liệu không hợp lệ
                }
            }
        }

        String image = ImageService.saveImage(imagePart, request);
        String subImage1 = ImageService.saveImage(subImage1Part, request);
        String subImage2 = ImageService.saveImage(subImage2Part, request);
        String subImage3 = ImageService.saveImage(subImage3Part, request);
        String subImage4 = ImageService.saveImage(subImage4Part, request);

        // Create a DAO instance to interact with the database
        ProductDAO dao = new ProductDAO();
        SubImageDAO sdao = new SubImageDAO();

        dao.addNewProduct(name, image, title, description, category, sizeMap);
        // Retrieve the newly added product ID for adding sub-images
        int pID = dao.getProductIDToAdd();
        // Add each of the sub-images associated with the new product
        sdao.addNewSubImage(pID + "", subImage1);
        sdao.addNewSubImage(pID + "", subImage2);
        sdao.addNewSubImage(pID + "", subImage3);
        sdao.addNewSubImage(pID + "", subImage4);

        // Set a success message to be displayed
        request.setAttribute("message", "Create success!");
        // Forward the request to ManagerControl to display the success message
        request.getRequestDispatcher("ManagerControl").forward(request, response);

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
