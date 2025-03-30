/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import context.DBContext;
import entity.Category;
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
public class SizeDAO {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public List<Size> getAllSize() {
        List<Size> list = new ArrayList<>();
        String query = "select * from Size";
        try {
            conn = new DBContext().getConnection(); //mo ket noi toi sql
            ps = conn.prepareStatement(query);//nem cau lenh query sang sql
            rs = ps.executeQuery();//chay cau lenh query, nhan ket qua tra ve
            while (rs.next()) {
                list.add(new Size(rs.getInt(1), rs.getString(2)));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    
    public List<Size> getAllSizeByProductId(int productId) {
        List<Size> list = new ArrayList<>();
        String query = "select s.*, ps.quantity from Size s join Product_Size ps on s.id = ps.sizeId where ps.pID = ? and ps.isDeleted != 1";
        try {
            conn = new DBContext().getConnection(); //mo ket noi toi sql
            ps = conn.prepareStatement(query);//nem cau lenh query sang sql
            ps.setInt(1, productId);
            rs = ps.executeQuery();//chay cau lenh query, nhan ket qua tra ve
            while (rs.next()) {
                list.add(new Size(rs.getInt(1), rs.getString(2),rs.getInt(3)));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    
     public Size getSizeById(int sizeId) {
        String query = "select * from Size where id = ?";
        try {
            conn = new DBContext().getConnection(); //mo ket noi toi sql
            ps = conn.prepareStatement(query);//nem cau lenh query sang sql
            ps.setInt(1, sizeId);
            rs = ps.executeQuery();//chay cau lenh query, nhan ket qua tra ve
            while (rs.next()) {
                return new Size(rs.getInt(1), rs.getString(2));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}
