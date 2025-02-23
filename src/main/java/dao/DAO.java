/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import context.DBContext;
import entity.Account;
import entity.Category;
import entity.Product;
import entity.SubImage;
import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Admin
 */
public class DAO {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public Account login(String user, String pass) {
        String query = "select * from Account\n"
                + "where email = ? and passWord = ?";
        try {
            conn = new DBContext().getConnection(); //mo ket noi toi sql
            ps = conn.prepareStatement(query);//nem cau lenh query sang sql
            ps.setString(1, user);
            ps.setString(2, pass);
            rs = ps.executeQuery();//chay cau lenh query, nhan ket qua tra ve
            while (rs.next()) {
                return new Account(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getString(5));
            }
        } catch (Exception e) {
        }
        return null;
    }

    public Account checkExist(String user) {
        String query = "select * from Account\n"
                + "where email = ?";
        try {
            conn = new DBContext().getConnection(); //mo ket noi toi sql
            ps = conn.prepareStatement(query);//nem cau lenh query sang sql
            ps.setString(1, user);
            rs = ps.executeQuery();//chay cau lenh query, nhan ket qua tra ve
            while (rs.next()) {
                return new Account(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getString(5));
            }
        } catch (Exception e) {
        }
        return null;
    }

    public void signUp(String username, String password, String email) {
        String query = "insert into Account\n"
                + "values(?,?,1,?)";
        try {
            conn = new DBContext().getConnection(); //mo ket noi toi sql
            ps = conn.prepareStatement(query);//nem cau lenh query sang sql
            ps.setString(1, username);
            ps.setString(2, password);
            ps.setString(3, email);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void updatePassword(int accId, String newPassword) {
        String query = "update Account\n"
                + "set passWord = ? where uID = ?";
        try {
            conn = new DBContext().getConnection(); //mo ket noi toi sql
            ps = conn.prepareStatement(query);//nem cau lenh query sang sql
            ps.setString(1, newPassword);
            ps.setInt(2, accId);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void updateViewed() {//edit param
        //edit query (my_table), number of param
        String query = "update [View]\n"
                + "set viewed = viewed + 1";
        try {
            conn = new DBContext().getConnection(); //mo ket noi toi sql
            ps = conn.prepareStatement(query);//nem cau lenh query sang sql
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public Account getAccountById(int id) {
        String query = "select * from Account\n"
                + "where uID = ?";
        try {
            conn = new DBContext().getConnection(); //mo ket noi toi sql
            ps = conn.prepareStatement(query);//nem cau lenh query sang sql
            ps.setInt(1, id);
            rs = ps.executeQuery();//chay cau lenh query, nhan ket qua tra ve
            while (rs.next()) {
                return new Account(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getString(5));
            }
        } catch (Exception e) {
        }
        return null;
    }

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

    public List<Product> search(String txtSearch, String cID, String priceRange) {
        List<Product> list = new ArrayList<>();
        String query = "select * from Product where isDeleted != 1 ";
        if (cID != null && !cID.trim().equals("") && txtSearch != null && !txtSearch.trim().equals("")) {
            query += "and pName like ? and cID = ? ";
        } else if (txtSearch != null && !txtSearch.trim().equals("")) {
            query += "and pName like ? ";
        } else if (cID != null && !cID.trim().equals("")) {
            query += "and cID = ? ";
        }

        if (priceRange.equals("1")) {
            query += "and price between 0 and 300";
        } else if (priceRange.equals("2")) {
            query += "and price between 300 and 500";
        } else if (priceRange.equals("3")) {
            query += "and price between 500 and 1000";
        } else if (priceRange.equals("4")) {
            query += "and price > 1000";
        }

        try {
            DAO dao = new DAO();
            conn = new DBContext().getConnection(); //mo ket noi toi sql
            ps = conn.prepareStatement(query);//nem cau lenh query sang sql
            if (cID != null && !cID.trim().equals("") && txtSearch != null && !txtSearch.trim().equals("")) {
                ps.setString(1, "%" + txtSearch + "%");
                ps.setInt(2, Integer.parseInt(cID));
            } else if (txtSearch != null && !txtSearch.trim().equals("")) {
                ps.setString(1, "%" + txtSearch + "%");
            } else if (cID != null && !cID.trim().equals("")) {
                ps.setInt(1, Integer.parseInt(cID));
            }
            rs = ps.executeQuery();//chay cau lenh query, nhan ket qua tra ve
            while (rs.next()) {
                list.add(new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getInt(7), dao.getAllSubImageByPID(rs.getInt(1) + ""), rs.getInt(8), rs.getInt(9)));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<SubImage> getAllSubImageByPID(String cid) {
        List<SubImage> list = new ArrayList<>();
        String query = "select S.*\n"
                + "from Product P, SubImage S\n"
                + "where P.pID = S.pID and S.pID = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, cid);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new SubImage(rs.getInt(1), rs.getInt(2), rs.getString(3)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public Product getProductByID(String id) {
        String query = "select * from Product where pID = ?";
        DAO dao = new DAO();
        try {
            conn = new DBContext().getConnection(); //mo ket noi toi sql
            ps = conn.prepareStatement(query);//nem cau lenh query sang sql
            ps.setString(1, id);
            rs = ps.executeQuery();//chay cau lenh query, nhan ket qua tra ve
            while (rs.next()) {
                return new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getInt(7), dao.getAllSubImageByPID(rs.getInt(1) + ""), rs.getInt(8), rs.getInt(9));
            }

        } catch (Exception e) {
        }
        return null;
    }

    public List<Product> searchWithPaging(String txtSearch, int pageIndex, int pageSize, String cID, String sort, String priceRange) {
        List<Product> list = new ArrayList<>();
        String query = "select * from Product where isDeleted != 1 ";
        if (cID != null && !cID.trim().equals("") && txtSearch != null && !txtSearch.trim().equals("")) {
            query += "and pName like ? and cID = ? ";
        } else if (txtSearch != null && !txtSearch.trim().equals("")) {
            query += "and pName like ? ";
        } else if (cID != null && !cID.trim().equals("")) {
            query += "and cID = ? ";
        }

        if (priceRange.equals("1")) {
            query += "and price between 0 and 300";
        } else if (priceRange.equals("2")) {
            query += "and price between 300 and 500";
        } else if (priceRange.equals("3")) {
            query += "and price between 500 and 1000";
        } else if (priceRange.equals("4")) {
            query += "and price > 1000";
        }

        if (sort != null && sort.equals("asc")) {
            query += " ORDER BY price OFFSET\n"
                    + "                    (?*?-?) ROWS FETCH NEXT ? ROWS ONLY";
        } else if (sort != null && sort.equals("desc")) {
            query += " ORDER BY price desc OFFSET\n"
                    + "                    (?*?-?) ROWS FETCH NEXT ? ROWS ONLY";
        } else {
            query += " ORDER BY pID desc OFFSET\n"
                    + "                    (?*?-?) ROWS FETCH NEXT ? ROWS ONLY";
        }
        try {
            DAO dao = new DAO();
            conn = new DBContext().getConnection(); //mo ket noi toi sql
            ps = conn.prepareStatement(query);//nem cau lenh query sang sql
            if (cID != null && !cID.trim().equals("") && txtSearch != null && !txtSearch.trim().equals("")) {
                ps.setString(1, "%" + txtSearch + "%");
                ps.setInt(2, Integer.parseInt(cID));
                ps.setInt(3, pageIndex);
                ps.setInt(4, pageSize);
                ps.setInt(5, pageSize);
                ps.setInt(6, pageSize);
            } else if (txtSearch != null && !txtSearch.trim().equals("")) {
                ps.setString(1, "%" + txtSearch + "%");

                ps.setInt(2, pageIndex);
                ps.setInt(3, pageSize);
                ps.setInt(4, pageSize);
                ps.setInt(5, pageSize);
            } else if (cID != null && !cID.trim().equals("")) {
                ps.setInt(1, Integer.parseInt(cID));

                ps.setInt(2, pageIndex);
                ps.setInt(3, pageSize);
                ps.setInt(4, pageSize);
                ps.setInt(5, pageSize);
            } else {
                ps.setInt(1, pageIndex);
                ps.setInt(2, pageSize);
                ps.setInt(3, pageSize);
                ps.setInt(4, pageSize);

            }
            rs = ps.executeQuery();//chay cau lenh query, nhan ket qua tra ve
            while (rs.next()) {
                list.add(new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getInt(7), dao.getAllSubImageByPID(rs.getInt(1) + ""), rs.getInt(8), rs.getInt(9)));
            }

        } catch (Exception e) {
        }
        return list;
    }
}
