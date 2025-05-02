/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import context.DBContext;
import entity.Feedback;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Admin
 */
public class FeedbackDAO {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public boolean deleteFeedback(int feedbackId) {
        Connection con = null;
        PreparedStatement ps = null;
        try {
            con = new DBContext().getConnection();
            String sql = "DELETE FROM Feedback WHERE Id = ?";
            ps = con.prepareStatement(sql);
            ps.setInt(1, feedbackId);
            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0;  // Return true if the deletion was successful
        } catch (Exception e) {
            e.printStackTrace();
            return false;  // Return false if an error occurred
        } finally {
            try {
                if (ps != null) {
                    ps.close();
                }
                if (con != null) {
                    con.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    public List<Feedback> searchFBWithPaging(String txtSearch, Integer pageIndex, Integer pageSize) {
        List<Feedback> list = new ArrayList<>();
        String query = "select f.*, a.userName, p.pName, p.image, s.size from Feedback f\n"
                + "left join Account a on f.UserId = a.uID\n"
                + "left join [Order] o on o.id = f.orderId\n"
                + "left join Product p on p.pID = f.productID\n"
                + "left join Size s on s.id = f.sizeID\n"
                + "where ( ? = '' or f.feedbackContent like ? ) ";
        if (pageIndex != null && pageSize != null) {
            query += " ORDER BY f.Id desc OFFSET\n"
                    + "                    (?*?-?) ROWS FETCH NEXT ? ROWS ONLY";
        }
        try {
            conn = new DBContext().getConnection(); //mo ket noi toi sql
            ps = conn.prepareStatement(query);//nem cau lenh query sang sql
            ps.setString(1, txtSearch);
            ps.setString(2, "%" + txtSearch + "%");
            if (pageIndex != null && pageSize != null) {
                ps.setInt(3, pageIndex);
                ps.setInt(4, pageSize);
                ps.setInt(5, pageSize);
                ps.setInt(6, pageSize);
            }
            rs = ps.executeQuery();//chay cau lenh query, nhan ket qua tra ve
            while (rs.next()) {
                Feedback f = new Feedback(rs.getInt(1),
                        rs.getInt(2),
                        rs.getInt(3),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getTimestamp(6));
                f.setReplyUserId(rs.getInt(7));
                f.setReplyFeedbackContent(rs.getString(8));
                f.setUserName(rs.getString(9));
                f.setProductName(rs.getString(10));
                f.setProductImage(rs.getString(11));
                f.setSizeName(rs.getString(12));
                f.setProductID(rs.getInt("productID"));
                f.setSizeId(rs.getInt("sizeID"));
                list.add(f);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public double getAverageRatingByProductId(int productId) {
        String query = "SELECT AVG(CAST(rating AS FLOAT)) FROM Feedback WHERE productID = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, productId);
            rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getDouble(1); // Giá trị AVG có thể là số thực (ví dụ: 4.3)
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    public void addFeedback(Feedback f) {
        String query = "INSERT into Feedback (userId, orderId, productID, sizeID, rating, feedbackContent, feedbackDate)\n"
                + "VALUES (?, ?, ?, ?, ?, ?, GETDATE())";
        try {
            // First, validate that the product and size exist and match
            String validateQuery = "SELECT COUNT(*) FROM OrderDetails WHERE OrderID = ? AND ProductID = ? AND SizeID = ?";
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(validateQuery);
            ps.setInt(1, f.getOrderId());
            ps.setInt(2, f.getProductID());
            ps.setInt(3, f.getSizeId());
            rs = ps.executeQuery();
            
            if (rs.next() && rs.getInt(1) > 0) {
                // Product and size combination exists, proceed with insertion
                ps = conn.prepareStatement(query);
                ps.setInt(1, f.getUserId());
                ps.setInt(2, f.getOrderId());
                ps.setInt(3, f.getProductID());
                ps.setInt(4, f.getSizeId());
                ps.setInt(5, f.getRating());
                ps.setString(6, f.getFeedbackContent());
                ps.executeUpdate();
            } else {
                System.out.println("Invalid product ID or size ID: " + f.getProductID() + ", " + f.getSizeId());
            }
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
    }

    public void updateFeedback(Feedback f) {
        String query = "update Feedback set rating = ?, feedbackContent = ?\n"
                + "where Id = ?";
        try {
            conn = new DBContext().getConnection(); //mo ket noi toi sql
            ps = conn.prepareStatement(query);//nem cau lenh query sang sql
            ps.setInt(1, f.getRating());
            ps.setString(2, f.getFeedbackContent());
            ps.setInt(3, f.getId());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public List<Feedback> getFeedbacksByProductId(int productId) {
        List<Feedback> list = new ArrayList<>();
        String query = "SELECT f.*, a.userName, p.pName, p.image, s.size FROM Feedback f\n"
                + "LEFT JOIN Account a ON f.UserId = a.uID\n"
                + "LEFT JOIN Product p ON p.pID = f.productID\n"
                + "LEFT JOIN Size s ON s.id = f.sizeID\n"
                + "WHERE f.productID = ? ORDER BY f.feedbackDate DESC";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, productId);
            rs = ps.executeQuery();
            while (rs.next()) {
                Feedback f = new Feedback(rs.getInt(1),
                        rs.getInt(2),
                        rs.getInt(3),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getTimestamp(6));
                f.setReplyUserId(rs.getInt(7));
                f.setReplyFeedbackContent(rs.getString(8));
                f.setUserName(rs.getString(9));
                f.setProductName(rs.getString(10));
                f.setProductImage(rs.getString(11));
                f.setSizeName(rs.getString(12));
                f.setProductID(rs.getInt("productID"));
                f.setSizeId(rs.getInt("sizeID"));
                list.add(f);
            }
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
        return list;
    }
    
    // Get product feedbacks by order ID
    public List<Feedback> getFeedbacksByOrderId(int orderId) {
        List<Feedback> list = new ArrayList<>();
        String query = "SELECT f.*, a.userName, p.pName, p.image, s.size FROM Feedback f\n"
                + "LEFT JOIN Account a ON f.UserId = a.uID\n"
                + "LEFT JOIN Product p ON p.pID = f.productID\n"
                + "LEFT JOIN Size s ON s.id = f.sizeID\n"
                + "WHERE f.orderId = ? ORDER BY f.feedbackDate DESC";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, orderId);
            rs = ps.executeQuery();
            while (rs.next()) {
                Feedback f = new Feedback(rs.getInt(1),
                        rs.getInt(2),
                        rs.getInt(3),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getTimestamp(6));
                f.setReplyUserId(rs.getInt(7));
                f.setReplyFeedbackContent(rs.getString(8));
                f.setUserName(rs.getString(9));
                f.setProductName(rs.getString(10));
                f.setProductImage(rs.getString(11));
                f.setSizeName(rs.getString(12));
                f.setProductID(rs.getInt("productID"));
                f.setSizeId(rs.getInt("sizeID"));
                list.add(f);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    // Check if a product in an order has been reviewed
    public boolean isProductReviewed(int orderId, int productId, int sizeId) {
        String query = "SELECT COUNT(*) FROM Feedback WHERE orderId = ? AND productID = ? AND sizeID = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, orderId);
            ps.setInt(2, productId);
            ps.setInt(3, sizeId);
            rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt(1) > 0;
            }
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
        return false;
    }

    public void addReplyFeedback(Feedback f) {
        String query = "update Feedback set replyUserId = ?, replyContent = ?\n"
                + "where Id = ?";
        try {
            conn = new DBContext().getConnection(); //mo ket noi toi sql
            ps = conn.prepareStatement(query);//nem cau lenh query sang sql
            ps.setInt(1, f.getReplyUserId());
            ps.setString(2, f.getReplyFeedbackContent());
            ps.setInt(3, f.getId());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
