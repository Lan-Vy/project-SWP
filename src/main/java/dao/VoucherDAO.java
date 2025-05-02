/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import context.DBContext;
import entity.Voucher;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class VoucherDAO {

    private Connection connection;

    public VoucherDAO() {
        try {
            connection = new DBContext().getConnection();
        } catch (Exception e) {
            System.err.println("Error establishing database connection: " + e.getMessage());
        }
    }

    // Lấy danh sách tất cả các voucher
    public List<Voucher> getAllVouchers() {
        List<Voucher> vouchers = new ArrayList<>();
        String sql = "SELECT * FROM voucher";

        try ( PreparedStatement ps = connection.prepareStatement(sql);  ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                int id = rs.getInt("id");
                String code = rs.getString("code");
                double discountPercent = rs.getDouble("discount_percent");
                Date expiryDate = rs.getDate("expiry_date");
                double minOrderValue = rs.getDouble("min_order_value");
                boolean isActive = rs.getBoolean("is_active");
                int quantity = rs.getInt("quantity");
                Date startDate = rs.getDate("start_date");

                Voucher voucher = new Voucher(id, code, discountPercent, expiryDate, minOrderValue, isActive, quantity, startDate);
                vouchers.add(voucher);
            }
        } catch (SQLException e) {
            System.err.println("Error fetching vouchers: " + e.getMessage());
        }

        return vouchers;
    }

    // Lấy voucher theo mã code
    public Voucher getVoucherByCode(String code) {
        String sql = "SELECT * FROM voucher WHERE code = ?";
        try ( PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, code);
            try ( ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    int id = rs.getInt("id");
                    double discountPercent = rs.getDouble("discount_percent");
                    Date expiryDate = rs.getDate("expiry_date");
                    double minOrderValue = rs.getDouble("min_order_value");
                    boolean isActive = rs.getBoolean("is_active");
                    int quantity = rs.getInt("quantity");
                    Date startDate = rs.getDate("start_date");

                    return new Voucher(id, code, discountPercent, expiryDate, minOrderValue, isActive, quantity, startDate);
                }
            }
        } catch (SQLException e) {
            System.err.println("Error fetching voucher by code: " + e.getMessage());
        }
        return null;
    }

    // Thêm một voucher mới
    public void addVoucher(Voucher voucher) {
        String sql = "INSERT INTO voucher (code, discount_percent, expiry_date, min_order_value, is_active, quantity, start_date) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?)";

        try ( PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, voucher.getCode());
            ps.setDouble(2, voucher.getDiscountPercent());

            if (voucher.getExpiryDate() != null) {
                ps.setDate(3, new java.sql.Date(voucher.getExpiryDate().getTime()));
            } else {
                ps.setNull(3, java.sql.Types.DATE);
            }

            ps.setDouble(4, voucher.getMinOrderValue());
            ps.setBoolean(5, voucher.isActive());
            ps.setInt(6, voucher.getQuantity());

            if (voucher.getStartDate() != null) {
                ps.setDate(7, new java.sql.Date(voucher.getStartDate().getTime()));
            } else {
                ps.setNull(7, java.sql.Types.DATE);
            }

            ps.executeUpdate();
        } catch (SQLException e) {
            System.err.println("Error adding voucher: " + e.getMessage());
        }
    }

    // Xoá voucher theo ID
    public void deleteVoucher(int id) {
        String sql = "DELETE FROM voucher WHERE id = ?";

        try ( PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.err.println("Error deleting voucher: " + e.getMessage());
        }
    }

    // Cập nhật thông tin voucher
    public void updateVoucher(Voucher voucher) {
        String sql = "UPDATE voucher SET code = ?, discount_percent = ?, expiry_date = ?, "
                + "min_order_value = ?, is_active = ?, quantity = ?, start_date = ? WHERE id = ?";

        try ( PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, voucher.getCode());
            ps.setDouble(2, voucher.getDiscountPercent());

            if (voucher.getExpiryDate() != null) {
                ps.setDate(3, new java.sql.Date(voucher.getExpiryDate().getTime()));
            } else {
                ps.setNull(3, java.sql.Types.DATE);
            }

            ps.setDouble(4, voucher.getMinOrderValue());
            ps.setBoolean(5, voucher.isActive());
            ps.setInt(6, voucher.getQuantity());

            if (voucher.getStartDate() != null) {
                ps.setDate(7, new java.sql.Date(voucher.getStartDate().getTime()));
            } else {
                ps.setNull(7, java.sql.Types.DATE);
            }

            ps.setInt(8, voucher.getId());

            ps.executeUpdate();
        } catch (SQLException e) {
            System.err.println("Error updating voucher: " + e.getMessage());
        }
    }
    // Giảm số lượng voucher đi 1 sau khi sử dụng

    public void reduceVoucherQuantity(String code) {
        String sql = "UPDATE voucher SET quantity = quantity - 1 WHERE code = ? AND quantity > 0";
        try ( PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, code);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.err.println("Error reducing voucher quantity: " + e.getMessage());
        }
    }

    public boolean isCodeDuplicate(String code, int excludeId) throws Exception {
        String sql = "SELECT COUNT(*) FROM voucher WHERE code = ? AND id <> ?";
        try (
                 PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, code);
            ps.setInt(2, excludeId);
            try ( ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt(1) > 0;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

}
