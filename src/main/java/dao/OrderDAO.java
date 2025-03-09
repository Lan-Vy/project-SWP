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
                Account shipper = new Account(rs.getInt("uID"), rs.getString("userName"));
                o.setShipper(shipper);
                list.add(o);
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Order> getOrderHistoryByAccountID(int accID) {
        String query = "SELECT o.*,a.uID,a.userName from [Order] o left join Account a on o.shipperID = a.uID where o.accountID = ?";
        try {
            List<Order> ls = new ArrayList<>();
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, accID);
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
                Account shipper = new Account(rs.getInt("uID"), rs.getString("userName"));
                o.setShipper(shipper);
                ls.add(o);
            }
            return ls;
        } catch (Exception e) {
        }
        return null;
    }

    public void insertOrder(String date, int accountID, String address, String sdt, String name, double total) {
        String query = "INSERT INTO [Order](orderDate, accountID,addressReceive,sdt,name,totalPrice,status)\n"
                + "VALUES (?, ?, ?, ?, ?, ?, 0)";
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
}
