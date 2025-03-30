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
                + "where ci.userId = ? and ps.isDeleted = 0 and ps.quantity > 0 and ps.quantity >= ci.quantity";
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

    public boolean addToCart(int userId, int productId, int size) {
        boolean addCart = false;

        String checkExistQuery = "SELECT distinct p.pID, ci.quantity, ps.quantity FROM Product p\n" +
"left join Product_Size ps on p.pID = ps.pID\n" +
"LEFT JOIN CartItems ci ON ci.userId = ? AND ci.productId = p.pID AND ci.sizeId = ?\n" +
"WHERE p.pID = ?";

        String updateQuery = "UPDATE CartItems SET quantity = quantity + 1 "
                + "WHERE userId = ? AND productId = ? AND sizeId = ?";

        String insertQuery = "INSERT INTO CartItems (userId, productId, sizeId, quantity) VALUES (?, ?, ?, 1)";

        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(checkExistQuery);
            ps.setInt(1, userId);
            ps.setInt(2, size);
            ps.setInt(3, productId);

            rs = ps.executeQuery();

            int currentQuantity = 0;
            int availableStock = 0;

            if (rs.next()) {
                currentQuantity = rs.getInt(2); // nếu không có thì sẽ là 0
                availableStock = rs.getInt(3);

                // Check nếu số lượng trong cart nhỏ hơn hàng tồn kho
                if (currentQuantity < availableStock) {
                    if (currentQuantity > 0) {
                        ps = conn.prepareStatement(updateQuery);
                        ps.setInt(1, userId);
                        ps.setInt(2, productId);
                        ps.setInt(3, size);
                    } else {
                        ps = conn.prepareStatement(insertQuery);
                        ps.setInt(1, userId);
                        ps.setInt(2, productId);
                        ps.setInt(3, size);
                    }
                    ps.executeUpdate();
                    addCart = true;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            addCart = false;
        }

        return addCart;
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
