/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import context.DBContext;
import entity.CartItem;
import entity.Category;
import entity.Product;
import entity.Size;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Admin
 */
public class CartDAO {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public List<CartItem> getCartItemByUserId(int userId) {
        List<CartItem> list = new ArrayList<>();
        String query = "select distinct p.pID, p.pName, p.image, ps.price, s.*, ci.quantity, ci.id \n"
                + "from CartItems ci\n"
                + "left join Product p on ci.productId = p.pID\n"
                + "left join Product_Size ps on p.pID = ps.pID\n"
                + "left join Size s on ci.sizeId = s.id\n"
                + "where ci.userId = ? ";
//                + "and ps.isDeleted = 0 and ps.quantity > 0 and ps.quantity >= ci.quantity";
        try {
            conn = new DBContext().getConnection(); //mo ket noi toi sql
            ps = conn.prepareStatement(query);//nem cau lenh query sang sql
            ps.setInt(1, userId);
            rs = ps.executeQuery();//chay cau lenh query, nhan ket qua tra ve
            while (rs.next()) {
                Product p = new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4));
                Size s = new Size(rs.getInt(5), rs.getString(6));
                CartItem ci = new CartItem(rs.getInt(8), rs.getInt(7), p, s);
                list.add(ci);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public boolean addToCart(int userId, int productId, int size, int quantity) {
        boolean addCart = false;

        String checkExistQuery = "SELECT quantity FROM CartItems WHERE userId = ? AND productId = ? AND sizeId = ?";
        String updateQuery = "UPDATE CartItems SET quantity = quantity + ? WHERE userId = ? AND productId = ? AND sizeId = ?";
        String insertQuery = "INSERT INTO CartItems (userId, productId, sizeId, quantity) VALUES (?, ?, ?, ?)";

        int stockCount = checkCurrentQuantity(productId, size); // Lấy số tồn kho thực tế

        try {
            if (stockCount < quantity) {
                return false; // Không đủ hàng
            }

            conn = new DBContext().getConnection();

            // Kiểm tra nếu sản phẩm đã có trong giỏ
            ps = conn.prepareStatement(checkExistQuery);
            ps.setInt(1, userId);
            ps.setInt(2, productId);
            ps.setInt(3, size);
            rs = ps.executeQuery();

            if (rs.next()) {
                int currentQuantity = rs.getInt("quantity");

                if (currentQuantity + quantity > stockCount) {
                    return false; // Vượt quá tồn kho
                }

                ps = conn.prepareStatement(updateQuery);
                ps.setInt(1, quantity);
                ps.setInt(2, userId);
                ps.setInt(3, productId);
                ps.setInt(4, size);
            } else {
                ps = conn.prepareStatement(insertQuery);
                ps.setInt(1, userId);
                ps.setInt(2, productId);
                ps.setInt(3, size);
                ps.setInt(4, quantity);
            }

            ps.executeUpdate();
            addCart = true;

        } catch (Exception e) {
            e.printStackTrace();
            addCart = false;
        }

        return addCart;
    }

    public int checkCurrentQuantity(int productId, int sizeId) {
        String query = "SELECT quantity FROM Product_Size WHERE pID = ? AND sizeId = ?";
        int quantity = 0; // Mặc định trả về 0 nếu không tìm thấy sản phẩm

        try {
            conn = new DBContext().getConnection(); // Kết nối với cơ sở dữ liệu
            ps = conn.prepareStatement(query); // Chuẩn bị câu lệnh SQL
            ps.setInt(1, productId); // Thiết lập tham số productId vào câu lệnh
            ps.setInt(2, sizeId); // Thiết lập tham số sizeId vào câu lệnh

            rs = ps.executeQuery(); // Thực thi câu lệnh SQL và lấy kết quả

            // Nếu có kết quả, lấy số lượng tồn kho
            if (rs.next()) {
                quantity = rs.getInt("quantity"); // Lấy giá trị quantity từ ResultSet
            }
        } catch (Exception e) {
            e.printStackTrace(); // In ra lỗi nếu có
        }

        return quantity; // Trả về số lượng tồn kho (hoặc 0 nếu không tìm thấy)
    }

    public boolean updateCartQuantity(int userId, int productId, int size) {
        boolean updateCart = false;
        String query = "UPDATE CartItems SET quantity = quantity - 1 "
                + "WHERE userId = ? AND productId = ? AND sizeId = ? AND quantity > 1;";
        String deleteQuery = "DELETE FROM CartItems WHERE userId = ? AND productId = ? AND sizeId = ? AND quantity = 1;";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, userId);
            ps.setInt(2, productId);
            ps.setInt(3, size);
            int rowsUpdated = ps.executeUpdate();

            if (rowsUpdated == 0) {
                ps = conn.prepareStatement(deleteQuery);
                ps.setInt(1, userId);
                ps.setInt(2, productId);
                ps.setInt(3, size);
                ps.executeUpdate();
            }
            updateCart = true;
        } catch (Exception e) {
            e.printStackTrace();
            return updateCart = false;
        }
        return updateCart = true;
    }

    public boolean removeFromCart(int userId, int productId, int size) {
        boolean removeCart = false;
        String query = "DELETE FROM CartItems WHERE userId = ? AND productId = ? AND sizeId = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, userId);
            ps.setInt(2, productId);
            ps.setInt(3, size);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
            return removeCart = false;
        }
        return removeCart = true;
    }

    public void removeAllFromCart(int userId) {
        String query = "DELETE FROM CartItems WHERE userId = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, userId);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
