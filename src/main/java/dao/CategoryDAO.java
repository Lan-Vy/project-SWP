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
public boolean isCategoryNameExists(String name) {
    String query = "SELECT COUNT(*) FROM Category WHERE cName = ?";
    try {
        conn = new DBContext().getConnection();
        ps = conn.prepareStatement(query);
        ps.setString(1, name);
        rs = ps.executeQuery();
        if (rs.next()) {
            return rs.getInt(1) > 0;
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
    return false;
}
public boolean isCategoryNameExistsExceptCurrent(String name, int currentId) {
    String query = "SELECT COUNT(*) FROM Category WHERE cName = ? AND cID != ?";
    try {
        conn = new DBContext().getConnection();
        ps = conn.prepareStatement(query);
        ps.setString(1, name);
        ps.setInt(2, currentId);
        rs = ps.executeQuery();
        if (rs.next()) {
            return rs.getInt(1) > 0;
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
    return false;
}

    public boolean addNewCategory(String name) {
        boolean addCategory = false;
        String query = "INSERT into Category (cName)\n"
                + "VALUES (?)";
        try {
            conn = new DBContext().getConnection(); //mo ket noi toi sql
            ps = conn.prepareStatement(query);//nem cau lenh query sang sql
            ps.setString(1, name);
            ps.executeUpdate();
        } catch (Exception e) {
            return addCategory = false;
        }
        return addCategory = true;
    }

    public boolean deleteCategory(String pid) throws Exception {//edit param
        boolean deleteCategory = false;
        String query = "delete from Category\n"
                + " WHERE cID = ?";
        try {
            conn = new DBContext().getConnection(); //mo ket noi toi sql
            ps = conn.prepareStatement(query);//nem cau lenh query sang sql
            ps.setString(1, pid);
            ps.executeUpdate();
        } catch (Exception e) {
            return deleteCategory = false;
        }
        return deleteCategory = true;
    }

    public boolean updateCategory(String name, int cid) {
        boolean updateCategory = false;
        String query = "UPDATE Category set cName = ? where cID = ?";
        try {
            conn = new DBContext().getConnection(); //mo ket noi toi sql
            ps = conn.prepareStatement(query);//nem cau lenh query sang sql
            ps.setString(1, name);
            ps.setInt(2, cid);
            ps.executeUpdate();
        } catch (Exception e) {
            return updateCategory = false;
        }
        return updateCategory = true;
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

    public String getCnameByCID(String cid) {
        String query = "select distinct cName from Product P, Category C\n"
                + "where P.cID = C.cID and P.cID = ?";
        try {
            conn = new DBContext().getConnection(); //mo ket noi toi sql
            ps = conn.prepareStatement(query);//nem cau lenh query sang sql
            ps.setString(1, cid);
            rs = ps.executeQuery();//chay cau lenh query, nhan ket qua tra ve
            while (rs.next()) {
                return rs.getString(1);
            }
        } catch (Exception e) {
        }
        return null;
    }
}


