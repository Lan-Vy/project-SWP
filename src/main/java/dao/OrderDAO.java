/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import context.DBContext;
import entity.Account;
import entity.Order;
import entity.OrderDetails;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Admin
 */
public class OrderDAO {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public List<Order> getAllOrders(int pageIndex, int pageSize) {
        List<Order> list = new ArrayList<>();
        String query = "select * from [Order] o left join Account a on o.shipperID = a.uID";
        query += " ORDER BY o.id desc OFFSET\n"
                + "                    (?*?-?) ROWS FETCH NEXT ? ROWS ONLY";
        try {
            conn = new DBContext().getConnection(); //mo ket noi toi sql
            ps = conn.prepareStatement(query);//nem cau lenh query sang sql
            ps.setInt(1, pageIndex);
            ps.setInt(2, pageSize);
            ps.setInt(3, pageSize);
            ps.setInt(4, pageSize);
            rs = ps.executeQuery();//chay cau lenh query, nhan ket qua tra ve
            while (rs.next()) {
                Order o = new Order(rs.getInt(1),
                        rs.getDate(2),
                        rs.getInt(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getDouble(7));
                o.setStatus(rs.getInt("status"));
                o.setCancelReason(rs.getString("cancel_reason"));
                Account shipper = new Account(rs.getInt("uID"), rs.getString("userName"));
                o.setShipper(shipper);
                list.add(o);
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Order> getAllOrders() {
        List<Order> list = new ArrayList<>();
        String query = "select * from [Order] o left join Account a on o.shipperID = a.uID";
        try {
            conn = new DBContext().getConnection(); //mo ket noi toi sql
            ps = conn.prepareStatement(query);//nem cau lenh query sang sql
            rs = ps.executeQuery();//chay cau lenh query, nhan ket qua tra ve
            while (rs.next()) {
                Order o = new Order(rs.getInt(1),
                        rs.getDate(2),
                        rs.getInt(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getDouble(7));
                o.setStatus(rs.getInt("status"));
                o.setCancelReason(rs.getString("cancel_reason"));
                Account shipper = new Account(rs.getInt("uID"), rs.getString("userName"));
                o.setShipper(shipper);
                list.add(o);
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Order> getAllOrdersByShipper(int pageIndex, int pageSize, int shipperID) {
        List<Order> list = new ArrayList<>();
        String query = "select * from [Order] o left join Account a on o.shipperID = a.uID where o.shipperID = ?";
        query += " ORDER BY o.id desc OFFSET\n"
                + "                    (?*?-?) ROWS FETCH NEXT ? ROWS ONLY";
        try {
            conn = new DBContext().getConnection(); //mo ket noi toi sql
            ps = conn.prepareStatement(query);//nem cau lenh query sang sql
            ps.setInt(1, shipperID);
            ps.setInt(2, pageIndex);
            ps.setInt(3, pageSize);
            ps.setInt(4, pageSize);
            ps.setInt(5, pageSize);
            rs = ps.executeQuery();//chay cau lenh query, nhan ket qua tra ve
            while (rs.next()) {
                Order o = new Order(rs.getInt(1),
                        rs.getDate(2),
                        rs.getInt(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getDouble(7));
                o.setStatus(rs.getInt("status"));
                o.setCancelReason(rs.getString("cancel_reason"));
                Account shipper = new Account(rs.getInt("uID"), rs.getString("userName"));
                o.setShipper(shipper);
                list.add(o);
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Order> getAllOrdersByShipper(int shipperID) {
        List<Order> list = new ArrayList<>();
        String query = "select * from [Order] o left join Account a on o.shipperID = a.uID where o.shipperID = ?";
        try {
            conn = new DBContext().getConnection(); //mo ket noi toi sql
            ps = conn.prepareStatement(query);//nem cau lenh query sang sql
            ps.setInt(1, shipperID);
            rs = ps.executeQuery();//chay cau lenh query, nhan ket qua tra ve
            while (rs.next()) {
                Order o = new Order(rs.getInt(1),
                        rs.getDate(2),
                        rs.getInt(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getDouble(7));
                o.setStatus(rs.getInt("status"));
                o.setCancelReason(rs.getString("cancel_reason"));
                Account shipper = new Account(rs.getInt("uID"), rs.getString("userName"));
                o.setShipper(shipper);
                list.add(o);
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Order> getOrderHistoryByAccountID(int accID) {
        String query = "SELECT o.*, a.uID, a.userName, f.Id as FeedbackId FROM [Order] o "
                + "LEFT JOIN Account a ON o.shipperID = a.uID "
                + "LEFT JOIN Feedback f ON o.id = f.orderId "
                + "WHERE o.accountID = ? ORDER BY o.id DESC";
        try {
            List<Order> ls = new ArrayList<>();
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, accID);
            rs = ps.executeQuery();

            while (rs.next()) {
                Order o = new Order(rs.getInt("id"),
                        rs.getDate("orderDate"),
                        rs.getInt("accountID"),
                        rs.getString("addressReceive"),
                        rs.getString("sdt"),
                        rs.getString("name"),
                        rs.getDouble("totalPrice"));
                o.setStatus(rs.getInt("status"));
                o.setCancelReason(rs.getString("cancel_reason"));
                Account shipper = new Account(rs.getInt("uID"), rs.getString("userName"));
                o.setShipper(shipper);
                boolean isFeedbacked = rs.getInt("FeedbackId") != 0 || !rs.wasNull();
                o.setIsFeedbacked(isFeedbacked);
                ls.add(o);
            }
            return ls;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public void insertOrder(String date, int accountID, String address, String sdt, String name, double total, String paymentMethod, String transactionNo, String vnp_TxnRef, String vnp_TransactionDate) {
        String query = "INSERT INTO [Order](orderDate, accountID,addressReceive,sdt,name,totalPrice,status, paymentMethod, transactionNo, vnp_TxnRef, vnp_TransactionDate)\n"
                + "VALUES (?, ?, ?, ?, ?, ?, 0,?,?,?,?)";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, date);
            //ps.setDate(1, (java.sql.Date) date);
            ps.setInt(2, accountID);
            ps.setString(3, address);
            ps.setString(4, sdt);
            ps.setString(5, name);
            ps.setDouble(6, total);
            ps.setString(7, paymentMethod);
            ps.setString(8, transactionNo);
            ps.setString(9, vnp_TxnRef);
            ps.setString(10, vnp_TransactionDate);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    public int getOrderID() {
        String query = "SELECT TOP(1) id from [Order] order BY id DESC";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    public boolean cancelOrderById(int orderId) {
        String query = "UPDATE [Order] SET status = 4 WHERE id = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, orderId); // Thiết lập tham số orderId vào câu lệnh chuẩn bị
            int rowsAffected = ps.executeUpdate(); // Sử dụng executeUpdate thay vì executeQuery
            return rowsAffected > 0; // Nếu có dòng bị ảnh hưởng, trả về true, tức là cập nhật thành công
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false; // Trả về false nếu có lỗi xảy ra
    }

    public void updateCancelReason(int orderId, String reason) {
        String query = "UPDATE [Order] SET cancel_reason = ? WHERE id = ?";
        try {
            conn = new DBContext().getConnection(); //mo ket noi toi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, reason);
            ps.setInt(2, orderId);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public List<OrderDetails> getOrderDetailsByOrderID(int orderId) {
        List<OrderDetails> orderDetailsList = new ArrayList<>();
        String query = "SELECT od.OrderID, od.ProductID, od.Quantity, od.SizeID, od.UnitPrice "
                + "FROM OrderDetails od WHERE od.OrderID = ?";

        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, orderId); // Thiết lập tham số orderId vào câu lệnh chuẩn bị

            // Thực hiện truy vấn
            rs = ps.executeQuery(); // Dùng executeQuery() thay vì executeUpdate()

            while (rs.next()) {
                // Tạo đối tượng OrderDetails từ dữ liệu trong ResultSet
                OrderDetails orderDetail = new OrderDetails();
                orderDetail.setOrderID(rs.getInt("OrderID"));
                orderDetail.setProductID(rs.getInt("ProductID"));
                orderDetail.setQuantity(rs.getInt("Quantity"));
                orderDetail.setSizeId(rs.getInt("SizeID"));
                orderDetail.setPrice(rs.getDouble("UnitPrice"));

                // Thêm đối tượng vào danh sách
                orderDetailsList.add(orderDetail);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return orderDetailsList; // Trả về danh sách chi tiết đơn hàng
    }

    public boolean restockQuantityBySieId(int sizeId, int quantity, int productId) {

        String query = "UPDATE Product_Size\n"
                + "SET quantity = quantity + ?\n"
                + "WHERE sizeId = ? and pID = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, quantity); // Thiết lập tham số orderId vào câu lệnh chuẩn bị
            ps.setInt(2, sizeId);
            ps.setInt(3, productId);

            int rowsAffected = ps.executeUpdate(); // Sử dụng executeUpdate thay vì executeQuery
            return rowsAffected > 0; // Nếu có dòng bị ảnh hưởng, trả về true, tức là cập nhật thành công
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false; // Trả về false nếu có lỗi xảy ra
    }

    public void updateStatusOrder(Order o) {
        String query = "UPDATE [Order] set status = ? where id = ?";
        try {
            conn = new DBContext().getConnection(); //mo ket noi toi sql
            ps = conn.prepareStatement(query);//nem cau lenh query sang sql
            ps.setInt(1, o.getStatus());
            ps.setInt(2, o.getId());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void assignShipper(Order o) {
        String query = "UPDATE [Order] set shipperID = ?, status = 1 where id = ?";
        try {
            conn = new DBContext().getConnection(); //mo ket noi toi sql
            ps = conn.prepareStatement(query);//nem cau lenh query sang sql
            ps.setInt(1, o.getShipper().getId());
            ps.setInt(2, o.getId());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public Order getOrderById(int id) {
        String query = "select * from [Order] where id = ?";
        try {
            conn = new DBContext().getConnection(); //mo ket noi toi sql
            ps = conn.prepareStatement(query);//nem cau lenh query sang sql
            ps.setInt(1, id);
            rs = ps.executeQuery();//chay cau lenh query, nhan ket qua tra ve
            while (rs.next()) {
                Order o = new Order(rs.getInt(1),
                        rs.getDate(2),
                        rs.getInt(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getDouble(7));
                o.setStatus(rs.getInt("status"));
                o.setPaymentMethod(rs.getString("paymentMethod"));
                o.setTransactionNo(rs.getString("transactionNo"));
                o.setVnp_TxnRef(rs.getString("vnp_TxnRef"));
                o.setVnp_TransactionDate(rs.getString("vnp_TransactionDate"));
                return o;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}
