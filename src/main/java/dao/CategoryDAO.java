/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import context.DBContext;
import entity.Category;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Admin
 */
public class CategoryDAO {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public List<Category> getAllCategory() {
        List<Category> list = new ArrayList<>();
        String query = "select * from Category";
        try {
            conn = new DBContext().getConnection(); //mo ket noi toi sql
            ps = conn.prepareStatement(query);//nem cau lenh query sang sql
            rs = ps.executeQuery();//chay cau lenh query, nhan ket qua tra ve
            while (rs.next()) {
                list.add(new Category(rs.getInt(1), rs.getString(2)));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<Category> searchWithPaging(int pageIndex, int pageSize) {
        List<Category> list = new ArrayList<>();
        String query = "select * from Category";
        query += " ORDER BY cID desc OFFSET\n"
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
                list.add(new Category(rs.getInt(1),
                        rs.getString(2)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public void addNewCategory(String name) {
        String query = "INSERT into Category (cName)\n"
                + "VALUES (?)";
        try {
            conn = new DBContext().getConnection(); //mo ket noi toi sql
            ps = conn.prepareStatement(query);//nem cau lenh query sang sql
            ps.setString(1, name);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void deleteCategory(String pid) throws Exception {//edit param
        String query = "delete from Category\n"
                + " WHERE cID = ?";
        try {
            conn = new DBContext().getConnection(); //mo ket noi toi sql
            ps = conn.prepareStatement(query);//nem cau lenh query sang sql
            ps.setString(1, pid);
            ps.executeUpdate();
        } catch (Exception e) {
            throw e;
        }
    }

    public void updateCategory(String name, int cid) {
        String query = "UPDATE Category set cName = ? where cID = ?";
        try {
            conn = new DBContext().getConnection(); //mo ket noi toi sql
            ps = conn.prepareStatement(query);//nem cau lenh query sang sql
            ps.setString(1, name);
            ps.setInt(2, cid);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public Category getCategoryById(int cid) {
        String query = "select * from Category where cID = ?";
        try {
            conn = new DBContext().getConnection(); //mo ket noi toi sql
            ps = conn.prepareStatement(query);//nem cau lenh query sang sql
            ps.setInt(1, cid);
            rs = ps.executeQuery();//chay cau lenh query, nhan ket qua tra ve
            while (rs.next()) {
                return new Category(rs.getInt(1),
                        rs.getString(2));
            }

        } catch (Exception e) {
        }
        return null;
    }
}
