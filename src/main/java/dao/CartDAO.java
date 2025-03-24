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
        String query = "select p.*, s.*, ci.quantity, ci.id from CartItems ci\n"
                + "left join Product p on ci.productId = p.pID\n"
                + "left join Size s on ci.sizeId = s.id\n"
                + "where ci.userId = ? and p.isDeleted = 0 and p.pAmount > 0";
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
                Size s = new Size(rs.getInt(10), rs.getString(11));
                CartItem ci = new CartItem(rs.getInt(13), rs.getInt(12), p, s);
                list.add(ci);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public void addToCart(int userId, int productId, int size) {
        String query = "MERGE INTO CartItems AS target "
                + "USING (SELECT ? AS userId, ? AS productId, ? AS sizeId) AS source "
                + "ON target.userId = source.userId AND target.productId = source.productId AND target.sizeId = source.sizeId "
                + "WHEN MATCHED THEN "
                + "    UPDATE SET quantity = target.quantity + 1 "
                + "WHEN NOT MATCHED THEN "
                + "    INSERT (userId, productId, sizeId, quantity) VALUES (source.userId, source.productId, source.sizeId, 1);";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, userId);
            ps.setInt(2, productId);
            ps.setInt(3, size);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void updateCartQuantity(int userId, int productId, int size) {
        String query = "UPDATE CartItems SET quantity = quantity - 1 "
                + "WHERE userId = ? AND productId = ? AND sizeId = ? AND quantity > 1;";
        String deleteQuery = "DELETE FROM CartItems WHERE userId = ? AND productId = ? AND sizeId = ? AND quantity = 1;";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, userId);
            ps.setInt(2, productId);
            ps.setInt(3, size);
            ps.executeUpdate();

            ps = conn.prepareStatement(deleteQuery);
            ps.setInt(1, userId);
            ps.setInt(2, productId);
            ps.setInt(3, size);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void removeFromCart(int userId, int productId, int size) {
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
        }
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
