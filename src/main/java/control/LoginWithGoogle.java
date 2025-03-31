/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package control;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import dao.AccountDAO;
import entity.Account;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.fluent.Form;
import org.apache.http.client.fluent.Request;
import utils.Constants;
import utils.MailService;

/**
 *
 * @author CE180220_Trần Minh Khánh
 */
@WebServlet(name = "LoginWithGoogle", urlPatterns = {"/login-gg"})
public class LoginWithGoogle extends HttpServlet {

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
        try {
            response.setContentType("text/html;charset=UTF-8");
            String code = request.getParameter("code");
            String accessToken = getToken(code);
            Account user = getUserInfo(accessToken);

            if (accessToken == null) {
                response.getWriter().write("Failed to get access token from Google.");
                return;
            }

            HttpSession session = request.getSession();
            AccountDAO dao = new AccountDAO();
            Account a = dao.checkExist(user.getEmail());
            if (a != null) {
                // Nếu tài khoản đã tồn tại, đăng nhập vào hệ thống
                session.setAttribute("acc", a);
                // Check user role and redirect accordingly
                if (a.getRole() == 2 || a.getRole() == 3) { // Admin role
                    response.sendRedirect("dashboard"); // Redirect to Dashboard
                } else {
                    response.sendRedirect("ShopControl"); // Redirect to ShopControl for other roles
                }
            } else {

                // Nếu tài khoản chưa tồn tại, tạo tài khoản mới và đăng ký
                dao.signUp(user.getUserName(), "Abc@123", user.getEmail());

                // Gửi mật khẩu đến email người dùng
                MailService.sendMail(user.getEmail(), "Password!", "Your password is: " + "Abc@1234");
                Account newAcc = dao.checkExist(user.getEmail());
                session.setAttribute("acc", newAcc);
                response.sendRedirect("ShopControl");
            }
        } catch (Exception e) {
            request.setAttribute("errorMessage", "Login fail");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }

    }

    public static String getToken(String code) throws ClientProtocolException, IOException {
        // Call API to get token
        String response = Request.Post(Constants.GOOGLE_LINK_GET_TOKEN)
                .bodyForm(Form.form()
                        .add("client_id", Constants.GOOGLE_CLIENT_ID)
                        .add("client_secret", Constants.GOOGLE_CLIENT_SECRET)
                        .add("redirect_uri", Constants.GOOGLE_REDIRECT_URI)
                        .add("code", code)
                        .add("grant_type", Constants.GOOGLE_GRANT_TYPE)
                        .build())
                .execute()
                .returnContent()
                .asString();

        System.out.println("Google token response: " + response);  // Log the full response for debugging

        JsonObject jobj = new Gson().fromJson(response, JsonObject.class);

        // Check if the response contains an error
        if (jobj.has("error")) {
            String errorDescription = jobj.get("error_description").getAsString();
            throw new IOException("Error retrieving token: " + errorDescription);
        }

        // Parse access token
        String accessToken = jobj.get("access_token").getAsString();
        return accessToken;
    }

    public static Account getUserInfo(final String accessToken) throws ClientProtocolException, IOException {
        String link = Constants.GOOGLE_LINK_GET_USER_INFO + accessToken;
        String response = Request.Get(link).execute().returnContent().asString();

        JsonObject jobj = new Gson().fromJson(response, JsonObject.class);
        Account user = new Account(jobj.get("name").getAsString(), jobj.get("email").getAsString());
        return user;
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
