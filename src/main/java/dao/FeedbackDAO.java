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

    public List<Feedback> searchFBWithPaging(String txtSearch, Integer pageIndex, Integer pageSize) {
        List<Feedback> list = new ArrayList<>();
        String query = "select f.*, a.userName from Feedback f\n"
                + "left join Account a on f.UserId = a.uID\n"
                + "left join  [Order] o on o.id = f.orderId where ( ? = '' or f.feedbackContent like ? ) ";
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
                list.add(f);
            }
        } catch (Exception e) {
        }
        return list;
    }

    public double getAverageRatingByProductId(int productId) {
        String query = "select distinct AVG(CAST(rating AS FLOAT)) from Feedback f\n"
                + "left join Account a on f.UserId = a.uID\n"
                + "left join [Order] o on o.id = f.orderId\n"
                + "left join OrderDetails od on od.OrderID = o.id\n"
                + "where od.ProductID = ?\n";
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
        String query = "INSERT into Feedback (userId, orderId,rating, feedbackContent,feedbackDate)\n"
                + "VALUES (?, ?, ?, ?, GETDATE())";
        try {
            conn = new DBContext().getConnection(); //mo ket noi toi sql
            ps = conn.prepareStatement(query);//nem cau lenh query sang sql
            ps.setInt(1, f.getUserId());
            ps.setInt(2, f.getOrderId());
            ps.setInt(3, f.getRating());
            ps.setString(4, f.getFeedbackContent());
            ps.executeUpdate();
        } catch (Exception e) {
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
        }
    }

    public List<Feedback> getFeedbacksByProductId(int productId) {
        List<Feedback> list = new ArrayList<>();
        String query = "select distinct f.*, a.userName from Feedback f\n"
                + "left join Account a on f.UserId = a.uID\n"
                + "left join [Order] o on o.id = f.orderId\n"
                + "left join OrderDetails od on od.OrderID = o.id\n"
                + "where od.ProductID = ? order by f.feedbackDate";
        try {
            conn = new DBContext().getConnection(); //mo ket noi toi sql
            ps = conn.prepareStatement(query);//nem cau lenh query sang sql
            ps.setInt(1, productId);
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
                list.add(f);
            }
        } catch (Exception e) {
        }
        return list;
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
