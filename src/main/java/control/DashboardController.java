package control;

import dao.ProductDAO;
import entity.Account;
import entity.Product;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.time.LocalDate;
import java.util.List;
import java.util.Map;

@WebServlet(name = "DashboardController", urlPatterns = {"/dashboard"})
public class DashboardController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {
            // Retrieve the current session
            HttpSession session = request.getSession();
            // Get the currently logged-in account from the session
            Account a = (Account) session.getAttribute("acc");

            // Check if user is logged in and has the correct role
            if (a == null || a.getRole() != 2) {
                request.getRequestDispatcher("ManagerOrder").forward(request, response);
                return;
            }

            // Create a new instance of the DAO
            ProductDAO dao = new ProductDAO();

            // Get the total number of products using getTotalProducts
            int numberProduct = dao.getTotalProducts(null, null, "0");
            // Get the number of sold items
            int numberItemsSolid = dao.getNumberItemsSolid();
            // Get total earnings from sales
            double totalEarnings = dao.getTotalEarnings();

            // Set request attributes
            request.setAttribute("numberP", numberProduct);
            request.setAttribute("numberI", numberItemsSolid);
            request.setAttribute("totalE", totalEarnings);

            // Get the current year (default year is 2025)
            int currentYear = LocalDate.now().getYear();
            int selectedYear = 2025; // Default year
            String yearStr = request.getParameter("year");
            if (yearStr != null) {
                selectedYear = Integer.parseInt(yearStr);
            }

            // Fetch data for the dashboard
            List<Integer> totalProductBoughtByMonth = dao.getTotalProductBoughtByYear(selectedYear);
            request.setAttribute("totalProductBoughtByMonth", totalProductBoughtByMonth);
            List<Integer> totalCategoryBoughtByMonth = dao.getTotalCategoryBoughtByYear(selectedYear);
            request.setAttribute("totalCategoryBoughtByMonth", totalCategoryBoughtByMonth);
            List<Integer> totalCustomerBoughtByMonth = dao.getTotalCustomerBoughtByYear(selectedYear);
            request.setAttribute("totalCustomerBoughtByMonth", totalCustomerBoughtByMonth);

            // Get selected month (default is current month)
            String monthStr = request.getParameter("month");
            int selectedMonth = LocalDate.now().getMonthValue();  // Default to current month
            if (monthStr != null) {
                selectedMonth = Integer.parseInt(monthStr);
            }

            int totalViewByMonth = dao.getTotalViewByMonth(selectedMonth, selectedYear);
            request.setAttribute("totalViewByMonth", totalViewByMonth);
            request.setAttribute("selectedMonth", selectedMonth);
            request.setAttribute("selectedYear", selectedYear);

            Map<Integer, String> soldCategories = dao.getSoldCategoriesByMonth(selectedYear);
            request.setAttribute("soldCategories", soldCategories);
            Map<Integer, List<String>> soldProducts = dao.getSoldProductsByMonth(selectedYear);
            request.setAttribute("soldProducts", soldProducts);

            // Forward the request to the Dashboard.jsp page
            request.getRequestDispatcher("Dashboard.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            // Set error message and forward to an error page or Dashboard.jsp
            request.setAttribute("errorMessage", "An error occurred while loading the dashboard.");
            request.getRequestDispatcher("Dashboard.jsp").forward(request, response);
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
        return "DashboardController Servlet";
    }
}
