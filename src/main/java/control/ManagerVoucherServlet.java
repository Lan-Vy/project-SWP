/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package control;

import dao.VoucherDAO;
import entity.Voucher;

import java.io.IOException;
import java.sql.Date;
import java.time.LocalDate;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "ManagerVoucherServlet", urlPatterns = {"/ManagerVoucher"})
public class ManagerVoucherServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        VoucherDAO voucherDAO = new VoucherDAO();
        List<Voucher> vouchers = voucherDAO.getAllVouchers();

        LocalDate today = LocalDate.now();

        // Cập nhật trạng thái của các voucher nếu đã hết hạn hoặc số lượng = 0
        for (Voucher v : vouchers) {
            boolean shouldDeactivate = false;

            if (v.getExpiryDate() != null && v.getExpiryDate().toLocalDate().isBefore(today) && v.isActive()) {
                shouldDeactivate = true;
            }

            if (v.getQuantity() == 0 && v.isActive()) {
                shouldDeactivate = true;
            }

            if (shouldDeactivate) {
                v.setActive(false);
                voucherDAO.updateVoucher(v);
            }
        }

        // Lấy lại danh sách sau khi cập nhật
        vouchers = voucherDAO.getAllVouchers();
        request.setAttribute("vouchers", vouchers);
        request.getRequestDispatcher("ManagerVoucher.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        VoucherDAO voucherDAO = new VoucherDAO();

        String action = request.getParameter("action");

        if (action == null || action.equals("add")) {
            // Xử lý thêm mới voucher
            try {
                String code = request.getParameter("code");
                if (voucherDAO.isCodeDuplicate(code, -1)) {
                    request.setAttribute("errorMessage", "Voucher code already exists. Please choose another code.");
                    doGet(request, response);
                    return;
                }
                double discountPercent = Double.parseDouble(request.getParameter("discountPercent"));
                double minOrderValue = Double.parseDouble(request.getParameter("minOrderValue"));
                int quantity = Integer.parseInt(request.getParameter("quantity"));

                String expiryDateStr = request.getParameter("expiryDate");
                String startDateStr = request.getParameter("startDate");

                boolean isActive = Boolean.parseBoolean(request.getParameter("active"));

                Date expiryDate = null;
                Date startDate = null;
                

                if (expiryDateStr != null && !expiryDateStr.isEmpty()) {
                    expiryDate = Date.valueOf(expiryDateStr);
                }

                if (startDateStr != null && !startDateStr.isEmpty()) {
                    startDate = Date.valueOf(startDateStr);
                    if (startDate.toLocalDate().isBefore(LocalDate.now())) {
                        request.setAttribute("errorMessage", "The start date cannot be in the past.");
                        doGet(request, response);
                        return;
                    }
                }

                Voucher newVoucher = new Voucher(0, code, discountPercent, expiryDate, minOrderValue, isActive, quantity, startDate);
                voucherDAO.addVoucher(newVoucher);

            } catch (Exception e) {
                e.printStackTrace();
                request.setAttribute("errorMessage", "Failed to add voucher. Please check input data.");
                doGet(request, response);
                return;
            }

        } else if (action.equals("delete")) {
            // Xử lý xóa voucher
            try {
                int id = Integer.parseInt(request.getParameter("id"));
                voucherDAO.deleteVoucher(id);
            } catch (NumberFormatException e) {
                e.printStackTrace();
            }

        } else if (action.equals("update")) {
            // Xử lý cập nhật voucher
            try {
                int id = Integer.parseInt(request.getParameter("id")); // Lấy ID voucher cần cập nhật
                String code = request.getParameter("code");
                if (voucherDAO.isCodeDuplicate(code, id)) {
                    request.setAttribute("errorMessage", "Voucher code already exists. Please choose another code.");
                    doGet(request, response);
                    return;
                }
                double discountPercent = Double.parseDouble(request.getParameter("discountPercent"));
                double minOrderValue = Double.parseDouble(request.getParameter("minOrderValue"));
                int quantity = Integer.parseInt(request.getParameter("quantity"));

                String expiryDateStr = request.getParameter("expiryDate");
                String startDateStr = request.getParameter("startDate");

                boolean isActive = Boolean.parseBoolean(request.getParameter("active"));

                Date expiryDate = null;
                Date startDate = null;
                

                if (expiryDateStr != null && !expiryDateStr.isEmpty()) {
                    expiryDate = Date.valueOf(expiryDateStr);
                }

                if (startDateStr != null && !startDateStr.isEmpty()) {
                    startDate = Date.valueOf(startDateStr);
                    if (startDate.toLocalDate().isBefore(LocalDate.now())) {
                        request.setAttribute("errorMessage", "Start date cannot be captured in the past.");
                        doGet(request, response);
                        return;
                    }
                }

                // Cập nhật thông tin voucher
                Voucher updatedVoucher = new Voucher(id, code, discountPercent, expiryDate, minOrderValue, isActive, quantity, startDate);
                voucherDAO.updateVoucher(updatedVoucher);

            } catch (Exception e) {
                e.printStackTrace();
                request.setAttribute("errorMessage", "Failed to update voucher. Please check input data.");
                doGet(request, response);
                return;
            }
        }

        // Redirect để tránh lỗi form re-submission
        response.sendRedirect(request.getContextPath() + "/ManagerVoucher");
    }
}
