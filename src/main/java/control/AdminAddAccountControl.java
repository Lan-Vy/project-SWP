/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package control;

import dao.AccountDAO;
import entity.Account;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import utils.MailService;

/**
 *
 * @author Admin
 */
@WebServlet(name = "AdminAddAccountControl", urlPatterns = {"/addAccount"})
public class AdminAddAccountControl extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {
            // Lấy thông tin từ request
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String role = request.getParameter("role");
            String pass = "Abc@123"; // mật khẩu mặc định
            Account newAccount = new Account(name, pass, Integer.parseInt(role), email);

            // Tạo đối tượng DAO để tương tác với database
            AccountDAO dao = new AccountDAO();
            Account a = dao.checkExist(email);
            if (a == null) {
                dao.signUp(newAccount); // Đăng ký tài khoản mới
                // Gửi email thông báo mật khẩu
                MailService.sendMail(email, "PASSWORD", "Your password is: " + pass);
                
                // Nếu là shipper (role = 3), gửi email thông báo
                if (newAccount.getRole() == 3) {
                    String subject = "Chào mừng bạn đến với đội ngũ shipper!";
                    String message = "Chào " + name + ",\n\nBạn đã được thêm vào đội ngũ shipper của chúng tôi. Hãy kiểm tra các nhiệm vụ của bạn trong hệ thống.";
                    MailService.sendMail(email, subject, message);
                }

                request.setAttribute("message", "Register success!");
                request.getRequestDispatcher("ManagerAccount").forward(request, response);
            } else {
                request.setAttribute("errorMessage", "This email is already registered!");
                request.getRequestDispatcher("ManagerAccount").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace(); // Xử lý lỗi
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
        return "Short description";
    }
}
