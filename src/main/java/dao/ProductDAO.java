/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import context.DBContext;
import entity.Feedback;
import entity.OrderDetails;
import entity.Product;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Admin
 */
public class ProductDAO {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

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
            SubImageDAO dao = new SubImageDAO();
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

    public Product getProductByID(String id) {
        String query = "select * from Product where pID = ?";
        SubImageDAO dao = new SubImageDAO();
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
            SubImageDAO dao = new SubImageDAO();
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

    public void addNewProduct(String name, String image, String price,
            String title, String description, String cid, int amount) {
        String query = "INSERT into Product (pName, [image], price, title, [description], cID, pAmount, isDeleted)\n"
                + "VALUES (?, ?, ?, ?, ?, ?, ?, 0)";
        try {
            conn = new DBContext().getConnection(); //mo ket noi toi sql
            ps = conn.prepareStatement(query);//nem cau lenh query sang sql
            ps.setString(1, name);
            ps.setString(2, image);
            ps.setString(3, price);
            ps.setString(4, title);
            ps.setString(5, description);
            ps.setString(6, cid);
            ps.setInt(7, amount);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public int getProductIDToAdd() {
        String query = "SELECT TOP(1) pID from Product order BY pID DESC";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
        }
        return 0;
    }

    public void deleteProduct(String pid) throws Exception {//edit param
        //edit query (my_table), number of param
        String query = "Update Product\n"
                + "set isDeleted = 1 WHERE pID = ?";
        try {
            conn = new DBContext().getConnection(); //mo ket noi toi sql
            ps = conn.prepareStatement(query);//nem cau lenh query sang sql
            ps.setString(1, pid);
            ps.executeUpdate();
        } catch (Exception e) {
            throw e;
        }
    }

    public void updateProduct(String name, String image, String price,
            String title, String description, String cid, int amount, int pID) {
        String query = "UPDATE Product set pName = ?, image = ?, price = ?, title = ?, description = ?, cID = ?, pAmount = ? where pID = ?";
        try {
            conn = new DBContext().getConnection(); //mo ket noi toi sql
            ps = conn.prepareStatement(query);//nem cau lenh query sang sql
            ps.setString(1, name);
            ps.setString(2, image);
            ps.setString(3, price);
            ps.setString(4, title);
            ps.setString(5, description);
            ps.setString(6, cid);
            ps.setInt(7, amount);
            ps.setInt(8, pID);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public List<Product> getProductByCid(String cid) {
        List<Product> list = new ArrayList<>();
        String query = "select * from Product where cID = ?";
        SubImageDAO dao = new SubImageDAO();
        try {
            conn = new DBContext().getConnection(); //mo ket noi toi sql
            ps = conn.prepareStatement(query);//nem cau lenh query sang sql
            ps.setString(1, cid);
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

    public List<Product> getProductByCids(String cids) {
        List<Product> list = new ArrayList<>();
        SubImageDAO dao = new SubImageDAO();
        String[] cidArray = cids.split(",");
        StringBuilder queryBuilder = new StringBuilder("SELECT * FROM Product WHERE cID IN (");

        // Append a '?' placeholder for each cid
        for (int i = 0; i < cidArray.length; i++) {
            queryBuilder.append("?");
            if (i < cidArray.length - 1) {
                queryBuilder.append(", ");
            }
        }
        queryBuilder.append(")");

        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(queryBuilder.toString());

            // Set each cid as a parameter in the query
            for (int i = 0; i < cidArray.length; i++) {
                ps.setInt(i + 1, Integer.parseInt(cidArray[i].trim()));
            }

            rs = ps.executeQuery();
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
            e.printStackTrace(); // Log the exception for debugging
        } finally {
            // Close resources here (conn, ps, rs) to prevent memory leaks
        }

        return list;
    }

    public void updateAmounProduct(int amount, int productID) {
        String query = "UPDATE Product SET pAmount = ? WHERE pID = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, amount);
            ps.setInt(2, productID);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public Product getNewestProduct() {
        String query = "select top 1 *\n"
                + "from Product where isDeleted != 1\n"
                + "order by pID desc";
        try {
            conn = new DBContext().getConnection(); //mo ket noi toi sql
            ps = conn.prepareStatement(query);//nem cau lenh query sang sql
            rs = ps.executeQuery();//chay cau lenh query, nhan ket qua tra ve
            while (rs.next()) {
                return new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getInt(7), new SubImageDAO().getAllSubImageByPID(rs.getInt(1) + ""), rs.getInt(8), rs.getInt(9));
            }
        } catch (Exception e) {
        }
        return null;
    }

    public int getBestSeller() {
        String query = "with R as(\n"
                + "select ProductID,SUM(Quantity) SL\n"
                + "from Product P, OrderDetails O\n"
                + "where P.pID = O.ProductID\n"
                + "group by ProductID\n"
                + ")\n"
                + "select top 1 R.ProductID from R where SL = (select MAX(SL) from R)\n"
                + "order by R.ProductID desc";
        try {
            conn = new DBContext().getConnection(); //mo ket noi toi sql
            ps = conn.prepareStatement(query);//nem cau lenh query sang sql
            rs = ps.executeQuery();//chay cau lenh query, nhan ket qua tra ve
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    public List<Integer> getTotalProductBoughtByYear(int year) {
        List<Integer> list = new ArrayList<>();
        String query = "WITH Months AS (\n"
                + "    SELECT 1 AS Month\n"
                + "    UNION ALL\n"
                + "    SELECT 2\n"
                + "    UNION ALL\n"
                + "    SELECT 3\n"
                + "    UNION ALL\n"
                + "    SELECT 4\n"
                + "    UNION ALL\n"
                + "    SELECT 5\n"
                + "    UNION ALL\n"
                + "    SELECT 6\n"
                + "    UNION ALL\n"
                + "    SELECT 7\n"
                + "    UNION ALL\n"
                + "    SELECT 8\n"
                + "    UNION ALL\n"
                + "    SELECT 9\n"
                + "    UNION ALL\n"
                + "    SELECT 10\n"
                + "    UNION ALL\n"
                + "    SELECT 11\n"
                + "    UNION ALL\n"
                + "    SELECT 12\n"
                + ")\n"
                + "SELECT \n"
                + "    M.Month,\n"
                + "    ISNULL(SUM(OD.Quantity), 0) AS TotalQuantitySold\n"
                + "FROM \n"
                + "    Months M\n"
                + "LEFT JOIN \n"
                + "    dbo.[Order] O ON MONTH(O.orderDate) = M.Month AND YEAR(O.orderDate) = ?\n"
                + "LEFT JOIN \n"
                + "    dbo.OrderDetails OD ON O.id = OD.OrderID\n"
                + "GROUP BY \n"
                + "    M.Month\n"
                + "ORDER BY \n"
                + "    M.Month;\n";
        try {
            conn = new DBContext().getConnection(); //mo ket noi toi sql
            ps = conn.prepareStatement(query);//nem cau lenh query sang sql
            ps.setInt(1, year);
            rs = ps.executeQuery();//chay cau lenh query, nhan ket qua tra ve
            while (rs.next()) {
                list.add(rs.getInt(2));
            }

        } catch (Exception e) {
        }
        return list;
    }

    public List<Integer> getTotalCategoryBoughtByYear(int year) {
        List<Integer> list = new ArrayList<>();
        String query = "WITH Months AS (\n"
                + "    SELECT 1 AS Month\n"
                + "    UNION ALL\n"
                + "    SELECT 2\n"
                + "    UNION ALL\n"
                + "    SELECT 3\n"
                + "    UNION ALL\n"
                + "    SELECT 4\n"
                + "    UNION ALL\n"
                + "    SELECT 5\n"
                + "    UNION ALL\n"
                + "    SELECT 6\n"
                + "    UNION ALL\n"
                + "    SELECT 7\n"
                + "    UNION ALL\n"
                + "    SELECT 8\n"
                + "    UNION ALL\n"
                + "    SELECT 9\n"
                + "    UNION ALL\n"
                + "    SELECT 10\n"
                + "    UNION ALL\n"
                + "    SELECT 11\n"
                + "    UNION ALL\n"
                + "    SELECT 12\n"
                + ")\n"
                + "SELECT \n"
                + "    M.Month,\n"
                + "    ISNULL(COUNT(DISTINCT P.cID), 0) AS TotalCategoriesSold\n"
                + "FROM \n"
                + "    Months M\n"
                + "LEFT JOIN \n"
                + "    dbo.[Order] O ON MONTH(O.orderDate) = M.Month AND YEAR(O.orderDate) = ?\n"
                + "LEFT JOIN \n"
                + "    dbo.OrderDetails OD ON O.id = OD.OrderID\n"
                + "LEFT JOIN \n"
                + "    dbo.Product P ON OD.ProductID = P.pID\n"
                + "GROUP BY \n"
                + "    M.Month\n"
                + "ORDER BY \n"
                + "    M.Month;";
        try {
            conn = new DBContext().getConnection(); //mo ket noi toi sql
            ps = conn.prepareStatement(query);//nem cau lenh query sang sql
            ps.setInt(1, year);
            rs = ps.executeQuery();//chay cau lenh query, nhan ket qua tra ve
            while (rs.next()) {
                list.add(rs.getInt(2));
            }

        } catch (Exception e) {
        }
        return list;
    }

    public List<Integer> getTotalCustomerBoughtByYear(int year) {
        List<Integer> list = new ArrayList<>();
        String query = "WITH Months AS (\n"
                + "    SELECT 1 AS Month\n"
                + "    UNION ALL\n"
                + "    SELECT 2\n"
                + "    UNION ALL\n"
                + "    SELECT 3\n"
                + "    UNION ALL\n"
                + "    SELECT 4\n"
                + "    UNION ALL\n"
                + "    SELECT 5\n"
                + "    UNION ALL\n"
                + "    SELECT 6\n"
                + "    UNION ALL\n"
                + "    SELECT 7\n"
                + "    UNION ALL\n"
                + "    SELECT 8\n"
                + "    UNION ALL\n"
                + "    SELECT 9\n"
                + "    UNION ALL\n"
                + "    SELECT 10\n"
                + "    UNION ALL\n"
                + "    SELECT 11\n"
                + "    UNION ALL\n"
                + "    SELECT 12\n"
                + ")\n"
                + "SELECT \n"
                + "    M.Month,\n"
                + "    ISNULL(COUNT(DISTINCT O.accountID), 0) AS TotalCustomers\n"
                + "FROM \n"
                + "    Months M\n"
                + "LEFT JOIN \n"
                + "    dbo.[Order] O ON MONTH(O.orderDate) = M.Month AND YEAR(O.orderDate) = ?\n"
                + "GROUP BY \n"
                + "    M.Month\n"
                + "ORDER BY \n"
                + "    M.Month;";
        try {
            conn = new DBContext().getConnection(); //mo ket noi toi sql
            ps = conn.prepareStatement(query);//nem cau lenh query sang sql
            ps.setInt(1, year);
            rs = ps.executeQuery();//chay cau lenh query, nhan ket qua tra ve
            while (rs.next()) {
                list.add(rs.getInt(2));
            }

        } catch (Exception e) {
        }
        return list;
    }

    public List<Product> getAllProduct() {
        List<Product> list = new ArrayList<>();
        String query = "select * from Product where isDeleted != 1";
        try {
            conn = new DBContext().getConnection(); //mo ket noi toi sql
            ps = conn.prepareStatement(query);//nem cau lenh query sang sql
            rs = ps.executeQuery();//chay cau lenh query, nhan ket qua tra ve
            while (rs.next()) {
                list.add(new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getInt(7), new SubImageDAO().getAllSubImageByPID(rs.getInt(1) + ""), rs.getInt(8), rs.getInt(9)));
            }

        } catch (Exception e) {
        }
        return list;
    }

    public int getNumberItemsSolid() {
        int n = 0;
        String query = "select SUM(Quantity) from OrderDetails";
        try {
            conn = new DBContext().getConnection(); //mo ket noi toi sql
            ps = conn.prepareStatement(query);//nem cau lenh query sang sql
            rs = ps.executeQuery();//chay cau lenh query, nhan ket qua tra ve
            if (rs.next()) {
                n = rs.getInt(1);
            }
        } catch (Exception e) {
        }
        return n;
    }

    public double getTotalEarnings() {
        double total = 0;
        List<OrderDetails> list = new ArrayList<>();
        String query = "select * from OrderDetails";
        try {
            conn = new DBContext().getConnection(); //mo ket noi toi sql
            ps = conn.prepareStatement(query);//nem cau lenh query sang sql
            rs = ps.executeQuery();//chay cau lenh query, nhan ket qua tra ve
            while (rs.next()) {
                list.add(new OrderDetails(rs.getInt(1), rs.getInt(2), rs.getDouble(3), rs.getInt(4)));
            }

        } catch (Exception e) {
        }
        for (OrderDetails o : list) {
            total += o.getPrice() * o.getQuantity();
        }
        return total;
    }

    public boolean isBought(int userId, int productId) {
        String query = "select * from OrderDetails OD\n"
                + "  left join [Order] O on O.id = OD.OrderID\n"
                + "  where O.accountID = ? and OD.ProductID = ? and O.status = 3";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, userId);
            ps.setInt(2, productId);

            rs = ps.executeQuery();
            while (rs.next()) {
                return true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
}
