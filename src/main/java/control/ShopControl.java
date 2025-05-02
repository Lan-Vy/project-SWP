package control;

import dao.CategoryDAO;
import dao.ProductDAO;
import entity.Category;
import entity.Product;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "ShopControl", urlPatterns = {"/ShopControl"})
public class ShopControl extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {
            // Retrieve all categories from the database
            List<Category> lsNewsType = new CategoryDAO().getAllCategory();

            // Get search parameters from the request
            String txtSearch = request.getParameter("txtSearch");
            String cID = request.getParameter("cID");
            String sort = request.getParameter("sort");
            String priceRange = request.getParameter("priceRange");

            // Set default values
            sort = (sort == null || sort.isEmpty()) ? "asc" : sort;
            priceRange = (priceRange == null || priceRange.isEmpty()) ? "0" : priceRange;
            cID = (cID == null || cID.isEmpty() || cID.equals("all")) ? "all" : cID;

            // Get page index, default to 1
            int pageIndex = 1;
            String index = request.getParameter("pageIndex");
            if (index != null && !index.isEmpty()) {
                try {
                    pageIndex = Integer.parseInt(index);
                    if (pageIndex < 1) pageIndex = 1;
                } catch (NumberFormatException e) {
                    pageIndex = 1;
                }
            }

            ProductDAO productDAO = new ProductDAO();
            // Retrieve products with pagination (6 products per page)
            List<Product> ls = productDAO.searchWithPaging2(txtSearch, pageIndex, 6, cID, sort, priceRange);

            // Calculate total number of pages (requires a new method in ProductDAO)
            int totalProducts = productDAO.getTotalProducts(txtSearch, cID, priceRange);
            int pageSize = getPageSize(6, totalProducts);

            // Get top 5 best sellers and newest products
            int categoryId = cID.equals("all") ? 0 : Integer.parseInt(cID);
            List<Product> top5 = productDAO.top5BestSellerCategory(categoryId);
            List<Product> top5Newest = productDAO.getTop5NewProduct(categoryId);

            // Set request attributes
            request.setAttribute("top5", top5);
            request.setAttribute("top5Newest", top5Newest);
            request.setAttribute("totalPage", pageSize);
            request.setAttribute("numberProduct", 6);
            request.setAttribute("pageIndex", pageIndex);
            request.setAttribute("searchValue", txtSearch);
            request.setAttribute("cID", cID);
            request.setAttribute("listP", ls);
            request.setAttribute("sort", sort);
            request.setAttribute("priceRange", priceRange);
            request.setAttribute("listC", lsNewsType);
            request.setAttribute("tag", cID.equals("all") ? 0 : categoryId);

            // Forward to Shop.jsp
            request.getRequestDispatcher("Shop.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            // Optionally set an error message
            request.setAttribute("errorMessage", "An error occurred while processing your request.");
            request.getRequestDispatcher("Shop.jsp").forward(request, response);
        }
    }

    // Method to calculate the number of pages needed based on products
    public int getPageSize(int numberProduct, int allProduct) {
        if (allProduct == 0) return 1;
        int pageSize = allProduct / numberProduct;
        if (allProduct % numberProduct != 0) {
            pageSize++;
        }
        return pageSize;
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "ShopControl Servlet";
    }
}