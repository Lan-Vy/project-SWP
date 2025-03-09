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
        String query = "select f.*, a.userName, p.pName from Feedback f\n"
                + "left join Account a on f.UserId = a.uID\n"
                + "left join Product p on p.pID = f.ProductId where ? = '' or p.pName like ?";
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
                f.setUserName(rs.getString(7));
                f.setProductName(rs.getString(8));
                list.add(f);
            }
        } catch (Exception e) {
        }
        return list;
    }

    public void addFeedback(Feedback f) {
        String query = "INSERT into Feedback (userId, productId,rating, feedbackContent,feedbackDate)\n"
                + "VALUES (?, ?, ?, ?, GETDATE())";
        try {
            conn = new DBContext().getConnection(); //mo ket noi toi sql
            ps = conn.prepareStatement(query);//nem cau lenh query sang sql
            ps.setInt(1, f.getUserId());
            ps.setInt(2, f.getProductId());
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
}
