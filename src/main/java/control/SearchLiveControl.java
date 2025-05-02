package control;

import com.google.gson.JsonObject;
import dao.CategoryDAO;
import dao.ProductDAO;
import entity.Category;
import entity.Product;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.NumberFormat;
import java.util.List;
import java.util.Locale;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "SearchLiveControl", urlPatterns = {"/search"})
public class SearchLiveControl extends HttpServlet {

    public int getPageSize(int numberProduct, int allProduct) {
        if (allProduct == 0) return 1;
        int pageSize = allProduct / numberProduct;
        if (allProduct % numberProduct != 0) {
            pageSize++;
        }
        return pageSize;
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("utf-8");
        PrintWriter out = response.getWriter();
        try {
            // Retrieve search parameters from the request
            String txtSearch = request.getParameter("txt");
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

            // Create DAO instances
            ProductDAO productDAO = new ProductDAO();
            CategoryDAO categoryDAO = new CategoryDAO();

            // Calculate the total number of pages
            int totalProducts = productDAO.getTotalProducts(txtSearch, cID, priceRange);
            int pageSize = getPageSize(6, totalProducts);

            // Retrieve the list of products with pagination
            List<Product> list = productDAO.searchWithPaging2(txtSearch, pageIndex, 6, cID, sort, priceRange);

            // Prepare product HTML
            String product = "";
            NumberFormat formatter = NumberFormat.getInstance(new Locale("vi", "VN"));
            for (Product o : list) {
                product += "<div class=\"col-12 col-sm-6 col-md-12 col-xl-6\">\n"
                        + "    <div class=\"single-product-wrapper\">\n"
                        + "        <!-- Product Image -->\n"
                        + "        <div class=\"product-img\">\n"
                        + "            <img src=\"" + o.getImage() + "\" alt=\"\">\n";
                if (o.getAmount() == 0) {
                    product += "<div class=\"sold-out-overlay\">SOLD OUT</div>\n";
                }
                product += "        </div>\n"
                        + "        <!-- Product Description -->\n"
                        + "        <div class=\"product-description d-flex align-items-center justify-content-between\">\n"
                        + "            <!-- Product Meta Data -->\n"
                        + "            <div class=\"product-meta-data\">\n"
                        + "                <div class=\"line\"></div>\n"
                        + "                <p class=\"product-price\">" + formatter.format(o.getPrice()) + " VND</p>\n"
                        + "                <a href=\"productDetail?productID=" + o.getId() + "&sizeId=" + o.getSize().getId() + "\">\n"
                        + "                    <h6>" + o.getName() + "</h6>\n"
                        + "                </a>\n"
                        + "            </div>\n"
                        + "            <!-- Ratings & Cart -->\n"
                        + "            <div class=\"ratings-cart text-right\">\n"
                        + "                <div class=\"cart\">\n";
                if (o.getAmount() != 0) {
                    product += "                    <a href=\"productDetail?productID=" + o.getId() + "&sizeId=" + o.getSize().getId() + "\" data-toggle=\"tooltip\" data-placement=\"left\" title=\"Add to Cart\"><img src=\"img/core-img/cart.png\" alt=\"\"></a>\n";
                } else {
                    product += "                    <a href=\"ShopControl\" data-toggle=\"tooltip\" data-placement=\"left\">Sold out</a>\n";
                }
                product += "                </div>\n"
                        + "            </div>\n"
                        + "        </div>\n"
                        + "    </div>\n"
                        + "</div>";
            }

            // Prepare pagination HTML
            String strPaging = "";
            String active;
            for (int i = 1; i <= pageSize; i++) {
                active = (pageIndex == i) ? "active" : "";
                strPaging += "<li class=\"page-item " + active + "\"><a class=\"page-link\" "
                        + "href=\"ShopControl?pageIndex=" + i + "&txtSearch=" + (txtSearch != null ? txtSearch : "") 
                        + "&cID=" + cID + "&sort=" + sort + "&priceRange=" + priceRange + "\">" + i + "</a></li>";
            }

            // Prepare category menu HTML
            String categoryMenu = "<ul>";
            List<Category> lsNewsType = categoryDAO.getAllCategory();
            int id = (cID.equals("all")) ? 0 : Integer.parseInt(cID);
            categoryMenu += "<li class=\"" + (cID.equals("all") ? "active" : "") + "\">"
                    + "<a href=\"ShopControl?pageIndex=1&txtSearch=" + (txtSearch != null ? txtSearch : "") 
                    + "&cID=all&priceRange=" + priceRange + "\">All</a></li>";
            for (Category newsType : lsNewsType) {
                active = (newsType.getId() == id) ? "active" : "";
                categoryMenu += "<li class=\"" + active + "\">"
                        + "<a href=\"ShopControl?pageIndex=1&txtSearch=" + (txtSearch != null ? txtSearch : "") 
                        + "&cID=" + newsType.getId() + "&priceRange=" + priceRange + "\">" + newsType.getName() + "</a></li>";
            }
            categoryMenu += "</ul>";

            // Prepare sort options HTML
            String sortJson = "";
            String seletedAsc = sort.equals("asc") ? "selected" : "";
            String seletedDes = sort.equals("desc") ? "selected" : "";
            sortJson += "<p>Price</p>\n"
                    + "<form action=\"#\" method=\"get\">"
                    + "    <select name=\"select\" id=\"sortByPrice\" onchange=\"searchByName()\">\n"
                    + "        <option value=\"asc\" " + seletedAsc + ">Asc</option>\n"
                    + "        <option value=\"desc\" " + seletedDes + ">Desc</option>\n"
                    + "    </select></form>";

            // Construct JSON response
            JsonObject jsonResponse = new JsonObject();
            jsonResponse.addProperty("product", product);
            jsonResponse.addProperty("paging", strPaging);
            jsonResponse.addProperty("categoryMenu", categoryMenu);
            jsonResponse.addProperty("sortJson", sortJson);

            // Send JSON response
            out.write(jsonResponse.toString());
        } catch (Exception e) {
            e.printStackTrace();
            // Send error response
            JsonObject errorResponse = new JsonObject();
            errorResponse.addProperty("error", "An error occurred while processing your request.");
            out.write(errorResponse.toString());
        } finally {
            out.close();
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
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "SearchLiveControl Servlet";
    }
}