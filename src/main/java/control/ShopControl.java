    /*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package control;

import dao.DAO;
import entity.Category;
import entity.Product;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author Admin
 */
@WebServlet(name = "ShopControl", urlPatterns = {"/ShopControl"})
public class ShopControl extends HttpServlet {

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
        try ( PrintWriter out = response.getWriter()) {
            // Retrieve all categories from the database
            List<Category> lsNewsType = new DAO().getAllCategory();
            // Get search parameters from the request
            String txtSearch = request.getParameter("txtSearch");
            String cID = request.getParameter("cID");
            String sort = request.getParameter("sort");
            // Set default sorting order to ascending if not provided
            sort = (sort == null || sort.equals("")) ? "asc" : sort;
            // Set default price range to "0" if not provided
            String priceRange = request.getParameter("priceRange");
            priceRange = (priceRange == null || priceRange.equals("")) ? "0" : priceRange;
            // Set category ID to the first category if not provided
            cID = (cID == null || cID.equals("")) ? lsNewsType.get(0).getId() + "" : Integer.parseInt(cID) + "";
            // Calculate the total number of pages based on the total products found
            int pageSize = getPageSize(6, new DAO().search(txtSearch, cID, priceRange).size());
            // Get the requested page index from the request, defaulting to 1 if not provided
            String index = request.getParameter("pageIndex");
            int pageIndex = 0;
            if (index == null) {
                pageIndex = 1;
            } else {
                pageIndex = Integer.parseInt(index);
            }
            // Retrieve the list of products matching the search criteria with pagination
            List<Product> ls = new DAO().searchWithPaging(txtSearch, pageIndex, 6, cID, sort, priceRange);
            // Set various attributes for the request to be used in the JSP
            request.setAttribute("totalPage", pageSize);
            request.setAttribute("numberProduct", 6);
            request.setAttribute("pageIndex", pageIndex);
            request.setAttribute("searchValue", txtSearch);
            request.setAttribute("cID", cID);
            request.setAttribute("listP", ls);
            request.setAttribute("sort", sort);
            request.setAttribute("priceRange", priceRange);
            // Set the list of categories to the request
            request.setAttribute("listC", lsNewsType);
            // Set the selected category tag for the request
            request.setAttribute("tag", (cID == null || cID.equals("")) ? lsNewsType.get(0).getId() : Integer.parseInt(cID));
            // Forward the request to the Shop.jsp page
            request.getRequestDispatcher("Shop.jsp").forward(request, response);
        } catch (Exception e) {
            // In case of an exception, forward to the same Shop.jsp page
            request.getRequestDispatcher("Shop.jsp").forward(request, response);
        }

    }

    // Method to calculate the number of pages needed based on products
    public int getPageSize(int numberProduct, int allProduct) {
        int pageSize = allProduct / numberProduct;
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
