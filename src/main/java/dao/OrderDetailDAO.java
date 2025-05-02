/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import context.DBContext;
import entity.OrderDetails;
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
public class OrderDetailDAO {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public List<OrderDetails> getOrderDetailByOrderID(int orderId) {
        String query = "SELECT od.*, p.image, p.pName, c.cName, s.size from OrderDetails od\n"
                + "left join Product p on od.ProductID = p.pID\n"
                + "left join Size s on s.id = od.SizeID\n"
                + "left join Category c on p.cID = c.cID\n"
                + "where OrderID = ?";
        try {
            List<OrderDetails> ls = new ArrayList<>();
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, orderId);
            rs = ps.executeQuery();//chay cau lenh query, nhan ket qua tra ve
            while (rs.next()) {
                OrderDetails od = new OrderDetails(rs.getInt(1),
                        rs.getInt(2),
                        rs.getDouble(3),
                        rs.getInt(4),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8));
                int sizeId = rs.getInt(5);
                Size s = new Size(sizeId, rs.getString(9));
                od.setSizeId(sizeId); // Set the sizeId property
                od.setSize(s);
                ls.add(od);
            }
            return ls;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (ps != null) ps.close();
                if (conn != null) conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return null;
    }

    public void updateProductQuantity(int productId, int quantityPurchased) {
        String sql = "UPDATE Product SET quantity = quantity - ? WHERE pID = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, quantityPurchased);
            ps.setInt(2, productId);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void insertOrderDetails(int orderID, int productID, double price, int amount, int sizeId) {
        String query = "INSERT INTO OrderDetails VALUES (?, ?, ?, ?, ?)";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, orderID);
            ps.setInt(2, productID);
            ps.setDouble(3, price);
            ps.setInt(4, amount);
            ps.setInt(5, sizeId);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
