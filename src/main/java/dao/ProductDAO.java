/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import context.DBContext;
import entity.Feedback;
import entity.OrderDetails;
import entity.Product;
import entity.Size;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Admin
 */
public class ProductDAO {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public List<Product> getTop5NewProduct(int cID) {
        List<Product> list = new ArrayList<>();
        SubImageDAO dao = new SubImageDAO();
        String query = "WITH RankedSizes AS (\n"
                + "    SELECT \n"
                + "        ps.pID, ps.sizeId, ps.price, ps.quantity,\n"
                + "        ROW_NUMBER() OVER (PARTITION BY ps.pID ORDER BY ps.sizeId) AS rn\n"
                + "    FROM dbo.Product_Size ps \n"
                + "    WHERE ps.isDeleted != 1 AND ps.quantity > 0\n"
                + "\n"
                + "    UNION ALL\n"
                + "\n"
                + "    SELECT \n"
                + "        ps.pID, ps.sizeId, ps.price, ps.quantity,\n"
                + "        ROW_NUMBER() OVER (PARTITION BY ps.pID ORDER BY ps.sizeId) AS rn\n"
                + "    FROM dbo.Product_Size ps\n"
                + "    WHERE ps.isDeleted != 1 \n"
                + "    AND NOT EXISTS (\n"
                + "        SELECT 1 FROM dbo.Product_Size ps2 \n"
                + "        WHERE ps2.pID = ps.pID AND ps2.isDeleted != 1 AND ps2.quantity > 0\n"
                + "    )\n"
                + ")\n"
                + "\n"
                + "SELECT top 5\n"
                + "    p.pID,\n"
                + "    p.pName,\n"
                + "    p.image,\n"
                + "    rs.price AS ProductPrice,\n"
                + "    p.title,\n"
                + "    p.description,\n"
                + "    p.cID,\n"
                + "    rs.quantity,\n"
                + "    rs.sizeId,\n"
                + "    s.size\n"
                + "FROM dbo.Product p\n"
                + "LEFT JOIN RankedSizes rs ON p.pID = rs.pID AND rs.rn = 1\n"
                + "LEFT JOIN Size s ON rs.sizeId = s.id\n"
                + "WHERE EXISTS (\n"
                + "    SELECT 1 \n"
                + "    FROM Product_Size ps\n"
                + "    WHERE ps.pID = p.pID AND ps.isDeleted = 0\n"
                + ")\n"
                + "AND (? = -1 OR p.cID = ?)\n"
                + "ORDER BY p.pID DESC";
        try {
            conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(query);
            if (cID == 0) {
                ps.setInt(1, -1);
                ps.setInt(2, -1);
            } else {
                ps.setInt(1, cID);
                ps.setInt(2, cID);
            }
            rs = ps.executeQuery();

            while (rs.next()) {
                Product p = new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getInt(7), dao.getAllSubImageByPID(rs.getInt(1) + ""), rs.getInt(8),
                        new Size(rs.getInt(9), rs.getString(10)));
                list.add(p);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<Product> top5BestSellerCategory(int cID) {

        List<Product> list = new ArrayList<>();
        SubImageDAO dao = new SubImageDAO();
        String top5Cate = "SELECT TOP 5 \n"
                + "    SUM(od.Quantity) AS soluong, \n"
                + "    p.pID, \n"
                + "    p.pName, \n"
                + "    p.image, \n"
                + "    od.UnitPrice, \n"
                + "    p.title, \n"
                + "    p.description, \n"
                + "    p.cID,\n"
                + "    ps.sizeId\n"
                + "FROM [Order] o\n"
                + "JOIN OrderDetails od ON o.id = od.OrderID\n"
                + "JOIN Product p ON p.pID = od.ProductID\n"
                + "JOIN Category c ON c.cID = p.cID\n"
                + "JOIN Product_Size ps ON p.pID = ps.pID AND ps.sizeId = od.SizeID\n"
                + "WHERE p.cID = ? AND o.[status] = 3\n"
                + "GROUP BY \n"
                + "    p.pID, \n"
                + "    p.pName, \n"
                + "    p.image, \n"
                + "    od.UnitPrice, \n"
                + "    p.title, \n"
                + "    p.description, \n"
                + "    p.cID,\n"
                + "    ps.sizeId\n"
                + "ORDER BY soluong DESC";

        String top5New = "WITH RankedSizes AS (\n"
                + "    SELECT \n"
                + "        ps.pID, ps.sizeId, ps.price, ps.quantity,\n"
                + "        ROW_NUMBER() OVER (PARTITION BY ps.pID ORDER BY ps.sizeId) AS rn\n"
                + "    FROM dbo.Product_Size ps \n"
                + "    WHERE ps.isDeleted != 1 AND ps.quantity > 0\n"
                + "\n"
                + "    UNION ALL\n"
                + "\n"
                + "    SELECT \n"
                + "        ps.pID, ps.sizeId, ps.price, ps.quantity,\n"
                + "        ROW_NUMBER() OVER (PARTITION BY ps.pID ORDER BY ps.sizeId) AS rn\n"
                + "    FROM dbo.Product_Size ps\n"
                + "    WHERE ps.isDeleted != 1 \n"
                + "    AND NOT EXISTS (\n"
                + "        SELECT 1 FROM dbo.Product_Size ps2 \n"
                + "        WHERE ps2.pID = ps.pID AND ps2.isDeleted != 1 AND ps2.quantity > 0\n"
                + "    )\n"
                + ")\n"
                + "SELECT \n"
                + "    p.pID, p.pName, p.image, rs.price AS ProductPrice, \n"
                + "    p.title, p.description, p.cID, rs.quantity, rs.sizeId, s.size\n"
                + "FROM dbo.Product p\n"
                + "LEFT JOIN RankedSizes rs ON p.pID = rs.pID AND rs.rn = 1\n"
                + "LEFT JOIN Size s ON rs.sizeId = s.id\n"
                + "right join (SELECT TOP 5  \n"
                + "    SUM(od.Quantity) AS soluong,  \n"
                + "    p.pName,  \n"
                + "    p.image,  \n"
                + "    od.UnitPrice,  \n"
                + "    p.title,  \n"
                + "    p.description,  \n"
                + "    p.cID\n"
                + "FROM [Order] o  \n"
                + "JOIN OrderDetails od ON o.id = od.OrderID  \n"
                + "JOIN Product p ON p.pID = od.ProductID  \n"
                + "JOIN Category c ON c.cID = p.cID  \n"
                + "JOIN Product_Size ps ON p.pID = ps.pID AND ps.sizeId = od.SizeID  \n"
                + "WHERE (? = -1 OR p.cID = ?) AND o.[status] = 3  \n"
                + "GROUP BY  \n"
                + "    p.pName,  \n"
                + "    p.image,  \n"
                + "    od.UnitPrice,  \n"
                + "    p.title,  \n"
                + "    p.description,  \n"
                + "    p.cID\n"
                + "ORDER BY soluong DESC) od on od.pName = p.pName\n"
                + "WHERE 1=1 \n"
                + "AND EXISTS (\n"
                + "    SELECT 1 FROM Product_Size ps\n"
                + "    WHERE ps.pID = p.pID AND ps.isDeleted = 0\n"
                + ")\n"
                + "and (? = -1 OR p.cID = ?)\n"
                + "ORDER BY od.soluong DESC";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(top5New);
            if (cID == 0) {
                ps.setInt(1, -1);
                ps.setInt(2, -1);
                ps.setInt(3, -1);
                ps.setInt(4, -1);
            } else {
                ps.setInt(1, cID);
                ps.setInt(2, cID);
                ps.setInt(3, cID);
                ps.setInt(4, cID);
            }

            rs = ps.executeQuery();
            while (rs.next()) {
                Product p = new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getInt(7), dao.getAllSubImageByPID(rs.getInt(1) + ""), rs.getInt(8),
                        new Size(rs.getInt(9), rs.getString(10)));
                list.add(p);
            }
            return list;
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (Exception ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    //sửa lại SQL để lưu trữ gộp lại sp
    public List<Product> search(String txtSearch, String cID, String priceRange) {
        List<Product> list = new ArrayList<>();
        String query = "SELECT p.[pID],\n"
                + "       p.[pName],\n"
                + "       p.[image],\n"
                + "       ps.price,\n"
                + "       p.[title],\n"
                + "       p.[description],\n"
                + "       p.[cID],\n"
                + "       sum(ps.quantity) as TotalQuantity from Product p\n"
                + "join Product_Size ps on p.pID = ps.pID left join Size s on ps.sizeId = s.id where ps.isDeleted != 1 ";

        //        không cần sài
        if (cID != null && !cID.trim().equals("") && txtSearch != null && !txtSearch.trim().equals("")) {
            query += "and p.pName like ? and p.cID = ? ";
        } else if (txtSearch != null && !txtSearch.trim().equals("")) {
            query += "and p.pName like ? ";
        } else if (cID != null && !cID.trim().equals("")) {
            query += "and p.cID = ? ";
        }

        //        không cần sài
        if (priceRange.equals("1")) {
            query += "and ps.price between 0 and 300";
        } else if (priceRange.equals("2")) {
            query += "and ps.price between 300 and 500";
        } else if (priceRange.equals("3")) {
            query += "and ps.price between 500 and 1000";
        } else if (priceRange.equals("4")) {
            query += "and ps.price > 1000";
        }
        query += "group by p.[pID],\n"
                + "       p.[pName],\n"
                + "       p.[image],\n"
                + "       ps.price,\n"
                + "       p.[title],\n"
                + "       p.[description],\n"
                + "       p.[cID],\n"
                + "       ps.quantity";
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
                Product p = new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getInt(7), dao.getAllSubImageByPID(rs.getInt(1) + ""), rs.getInt(8));
                list.add(p);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public Product getProductByIDAndSize(String id, String sizeId) {
        String query = "select p.[pID]\n"
                + "      ,p.[pName]\n"
                + "      ,p.[image],ps.price, p.[title]\n"
                + "      ,p.[description]\n"
                + "      ,p.[cID], ps.quantity,s.id, s.size from Product p\n"
                + "join Product_Size ps on p.pID = ps.pID left join Size s on ps.sizeId = s.id where p.pID = ? and ps.sizeId = ?";
        SubImageDAO dao = new SubImageDAO();
        try {
            conn = new DBContext().getConnection(); //mo ket noi toi sql
            ps = conn.prepareStatement(query);//nem cau lenh query sang sql
            ps.setString(1, id);
            ps.setString(2, sizeId);
            rs = ps.executeQuery();//chay cau lenh query, nhan ket qua tra ve
            while (rs.next()) {
                Product p = new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getInt(7), dao.getAllSubImageByPID(rs.getInt(1) + ""), rs.getInt(8),
                        new Size(rs.getInt(9), rs.getString(10)));
                return p;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
 public String getQuantityAndPriceBySize(int productId) {
    StringBuilder result = new StringBuilder();
    String query = "SELECT s.size, ps.quantity, ps.price " +
                   "FROM Product_Size ps " +
                   "JOIN Size s ON ps.sizeId = s.id " +
                   "WHERE ps.pID = ? AND ps.isDeleted != 1";

    try {
        conn = new DBContext().getConnection();
        ps = conn.prepareStatement(query);
        ps.setInt(1, productId);
        rs = ps.executeQuery();

        while (rs.next()) {
            String size = rs.getString("size");
            int quantity = rs.getInt("quantity");
            double price = rs.getDouble("price");
            result.append(size).append(": ").append(quantity).append(" (").append(price).append(" VND), ");
        }

        // Xóa dấu phẩy và khoảng trắng cuối cùng nếu có
        if (result.length() > 0) {
            result.setLength(result.length() - 2);
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

    return result.toString();
}
    public Product getAmoutSizeOfEachSize(int idp, int idsize) {
        String query = "select * from Product_Size where pID = ? and sizeId = ?";
        try {
            conn = new DBContext().getConnection(); //mo ket noi toi sql
            ps = conn.prepareStatement(query);//nem cau lenh query sang sql
            ps.setInt(1, idp);
            ps.setInt(2, idsize);
            rs = ps.executeQuery();//chay cau lenh query, nhan ket qua tra ve
            while (rs.next()) {
                Product p = new Product(
                        rs.getInt(1),
                        rs.getDouble(2),
                        rs.getInt(3),
                        rs.getInt(4),
                        new Size(rs.getInt(5), rs.getString(6)));
                return p;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;

    }

    // dùng để mô tả sản phẩm đó có những size nào và quantity ra sao
    public String numberOfSize(int productID) {
        String query = "select  ps.quantity,s.size from [dbo].[Product_Size] ps\n"
                + "join Size s on s.id = ps.sizeId\n"
                + "where ps.pID = ?";
        String detailQuantity = "";
        try {
            conn = new DBContext().getConnection(); //mo ket noi toi sql
            ps = conn.prepareStatement(query);//nem cau lenh query sang sql
            ps.setInt(1, productID);
            rs = ps.executeQuery();
            while (rs.next()) {
                detailQuantity += (rs.getInt(1) + "(" + rs.getString(2) + ") + ");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return detailQuantity.substring(0, detailQuantity.length() - 3);
    }

//    NEWST để gộp sản phẩẩm thành 1 hàng cho admin
    public List<Product> searchWithPaging(String txtSearch, int pageIndex, int pageSize, String cID, String sort, String priceRange) {
        List<Product> list = new ArrayList<>();
        String query = "SELECT p.[pID],\n"
                + "       p.[pName],\n"
                + "       p.[image],\n"
                + "       p.[title],\n"
                + "       p.[description],\n"
                + "       p.[cID],\n"
                + "       sum(ps.quantity) as TotalQuantity from Product p\n"
                + "join Product_Size ps on p.pID = ps.pID left join Size s on ps.sizeId = s.id where ps.isDeleted != 1 ";

//          không cần sài
        if (cID != null && !cID.trim().equals("") && txtSearch != null && !txtSearch.trim().equals("")) {
            query += "and p.pName like ? and p.cID = ? ";
        } else if (txtSearch != null && !txtSearch.trim().equals("")) {
            query += "and p.pName like ? ";
        } else if (cID != null && !cID.trim().equals("")) {
            query += "and p.cID = ? ";
        }

//        không cần sài
        if (priceRange.equals("1")) {
            query += "and ps.price between 0 and 300000";
        } else if (priceRange.equals("2")) {
            query += "and ps.price between 300000 and 500000";
        } else if (priceRange.equals("3")) {
            query += "and ps.price between 500000 and 1000000";
        } else if (priceRange.equals("4")) {
            query += "and ps.price > 1000000";
        }
        query += "group by p.[pID],\n"
                + "       p.[pName],\n"
                + "       p.[image],\n"
                + "       p.[title],\n"
                + "       p.[description],\n"
                + "       p.[cID]";
        if (sort != null && sort.equals("asc")) {
            query += " ORDER BY p.price OFFSET\n"
                    + "                    (?*?-?) ROWS FETCH NEXT ? ROWS ONLY";
        } else if (sort != null && sort.equals("desc")) {
            query += " ORDER BY p.price desc OFFSET\n"
                    + "                    (?*?-?) ROWS FETCH NEXT ? ROWS ONLY";
        } else {
            query += " ORDER BY p.pID desc OFFSET\n"
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

                Product p = new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        //                        rs.getDouble(4),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getInt(6),
                        dao.getAllSubImageByPID(rs.getInt(1) + ""),
                        rs.getInt(7));
                list.add(p);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

//    OLD function
//    public List<Product> searchWithPaging(String txtSearch, int pageIndex, int pageSize, String cID, String sort, String priceRange) {
//        List<Product> list = new ArrayList<>();
//        String query = "select p.[pID]\n"
//                + "      ,p.[pName]\n"
//                + "      ,p.[image],ps.price, p.[title]\n"
//                + "      ,p.[description]\n"
//                + "      ,p.[cID], ps.quantity,s.id, s.size from Product p\n"
//                + "join Product_Size ps on p.pID = ps.pID left join Size s on ps.sizeId = s.id where ps.isDeleted != 1 ";
//        if (cID != null && !cID.trim().equals("") && txtSearch != null && !txtSearch.trim().equals("")) {
//            query += "and p.pName like ? and p.cID = ? ";
//        } else if (txtSearch != null && !txtSearch.trim().equals("")) {
//            query += "and p.pName like ? ";
//        } else if (cID != null && !cID.trim().equals("")) {
//            query += "and p.cID = ? ";
//        }
//
//        if (priceRange.equals("1")) {
//            query += "and ps.price between 0 and 300000";
//        } else if (priceRange.equals("2")) {
//            query += "and ps.price between 300000 and 500000";
//        } else if (priceRange.equals("3")) {
//            query += "and ps.price between 500000 and 1000000";
//        } else if (priceRange.equals("4")) {
//            query += "and ps.price > 1000000";
//        }
//
//        if (sort != null && sort.equals("asc")) {
//            query += " ORDER BY ps.price OFFSET\n"
//                    + "                    (?*?-?) ROWS FETCH NEXT ? ROWS ONLY";
//        } else if (sort != null && sort.equals("desc")) {
//            query += " ORDER BY ps.price desc OFFSET\n"
//                    + "                    (?*?-?) ROWS FETCH NEXT ? ROWS ONLY";
//        } else {
//            query += " ORDER BY ps.pID desc OFFSET\n"
//                    + "                    (?*?-?) ROWS FETCH NEXT ? ROWS ONLY";
//        }
//        try {
//            SubImageDAO dao = new SubImageDAO();
//            conn = new DBContext().getConnection(); //mo ket noi toi sql
//            ps = conn.prepareStatement(query);//nem cau lenh query sang sql
//            if (cID != null && !cID.trim().equals("") && txtSearch != null && !txtSearch.trim().equals("")) {
//                ps.setString(1, "%" + txtSearch + "%");
//                ps.setInt(2, Integer.parseInt(cID));
//                ps.setInt(3, pageIndex);
//                ps.setInt(4, pageSize);
//                ps.setInt(5, pageSize);
//                ps.setInt(6, pageSize);
//            } else if (txtSearch != null && !txtSearch.trim().equals("")) {
//                ps.setString(1, "%" + txtSearch + "%");
//
//                ps.setInt(2, pageIndex);
//                ps.setInt(3, pageSize);
//                ps.setInt(4, pageSize);
//                ps.setInt(5, pageSize);
//            } else if (cID != null && !cID.trim().equals("")) {
//                ps.setInt(1, Integer.parseInt(cID));
//
//                ps.setInt(2, pageIndex);
//                ps.setInt(3, pageSize);
//                ps.setInt(4, pageSize);
//                ps.setInt(5, pageSize);
//            } else {
//                ps.setInt(1, pageIndex);
//                ps.setInt(2, pageSize);
//                ps.setInt(3, pageSize);
//                ps.setInt(4, pageSize);
//
//            }
//            rs = ps.executeQuery();//chay cau lenh query, nhan ket qua tra ve
//            while (rs.next()) {
//
//                Product p = new Product(rs.getInt(1),
//                        rs.getString(2),
//                        rs.getString(3),
//                        rs.getDouble(4),
//                        rs.getString(5),
//                        rs.getString(6),
//                        rs.getInt(7), dao.getAllSubImageByPID(rs.getInt(1) + ""), rs.getInt(8),
//                        new Size(rs.getInt(9), rs.getString(10)));
//                list.add(p);
//            }
//
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//        return list;
//    }
  
    public List<Product> searchWithPaging2(String txtSearch, int pageIndex, int pageSize, String cID, String sort, String priceRange) {
    List<Product> list = new ArrayList<>();
    pageSize = 6; // Cố định 6 sản phẩm mỗi trang
    String query = "WITH RankedSizes AS (\n"
            + "    SELECT \n"
            + "        ps.pID, ps.sizeId, ps.price, ps.quantity,\n"
            + "        ROW_NUMBER() OVER (PARTITION BY ps.pID ORDER BY ps.sizeId) AS rn\n"
            + "    FROM dbo.Product_Size ps \n"
            + "    WHERE ps.isDeleted != 1 AND ps.quantity > 0\n"
            + "\n"
            + "    UNION ALL\n"
            + "\n"
            + "    SELECT \n"
            + "        ps.pID, ps.sizeId, ps.price, ps.quantity,\n"
            + "        ROW_NUMBER() OVER (PARTITION BY ps.pID ORDER BY ps.sizeId) AS rn\n"
            + "    FROM dbo.Product_Size ps\n"
            + "    WHERE ps.isDeleted != 1 \n"
            + "    AND NOT EXISTS (\n"
            + "        SELECT 1 FROM dbo.Product_Size ps2 \n"
            + "        WHERE ps2.pID = ps.pID AND ps2.isDeleted != 1 AND ps2.quantity > 0\n"
            + "    )\n"
            + ")\n"
            + "SELECT \n"
            + "    p.pID, p.pName, p.image, rs.price AS ProductPrice, \n"
            + "    p.title, p.description, p.cID, rs.quantity, rs.sizeId, s.size\n"
            + "FROM dbo.Product p\n"
            + "LEFT JOIN RankedSizes rs ON p.pID = rs.pID AND rs.rn = 1\n"
            + "LEFT JOIN Size s ON rs.sizeId = s.id\n"
            + "WHERE 1=1 \n"
            + "AND EXISTS (\n"
            + "    SELECT 1 FROM Product_Size ps\n"
            + "    WHERE ps.pID = p.pID AND ps.isDeleted = 0\n"
            + ") ";

    // Điều kiện tìm kiếm
    if (cID != null && !cID.trim().equals("") && !cID.trim().equals("all") && txtSearch != null && !txtSearch.trim().equals("")) {
        query += "AND p.pName LIKE ? AND p.cID = ? ";
    } else if (txtSearch != null && !txtSearch.trim().equals("")) {
        query += "AND p.pName LIKE ? ";
    } else if (cID != null && !cID.trim().equals("") && !cID.trim().equals("all")) {
        query += "AND p.cID = ? ";
    }

    // Điều kiện khoảng giá
    if (priceRange != null && !priceRange.isEmpty()) {
        switch (priceRange) {
            case "1":
                query += "AND rs.price BETWEEN 0 AND 300000 ";
                break;
            case "2":
                query += "AND rs.price BETWEEN 300000 AND 500000 ";
                break;
            case "3":
                query += "AND rs.price BETWEEN 500000 AND 1000000 ";
                break;
            case "4":
                query += "AND rs.price > 1000000 ";
                break;
        }
    }

    // Sắp xếp và phân trang
    query += "ORDER BY ";
    if (sort != null && sort.equals("asc")) {
        query += "rs.price ASC ";
    } else if (sort != null && sort.equals("desc")) {
        query += "rs.price DESC ";
    } else {
        query += "p.pID DESC ";
    }
    query += "OFFSET (? - 1) * ? ROWS FETCH NEXT ? ROWS ONLY";

    try {
        SubImageDAO dao = new SubImageDAO();
        conn = new DBContext().getConnection();
        ps = conn.prepareStatement(query);

        // Đặt tham số cho PreparedStatement
        int paramIndex = 1;
        if (cID != null && !cID.trim().equals("") && !cID.trim().equals("all") && txtSearch != null && !txtSearch.trim().equals("")) {
            ps.setString(paramIndex++, "%" + txtSearch + "%");
            ps.setInt(paramIndex++, Integer.parseInt(cID));
        } else if (txtSearch != null && !txtSearch.trim().equals("")) {
            ps.setString(paramIndex++, "%" + txtSearch + "%");
        } else if (cID != null && !cID.trim().equals("") && !cID.trim().equals("all")) {
            ps.setInt(paramIndex++, Integer.parseInt(cID));
        }

        // Đặt tham số phân trang
        ps.setInt(paramIndex++, pageIndex);
        ps.setInt(paramIndex++, pageSize);
        ps.setInt(paramIndex, pageSize);

        rs = ps.executeQuery();
        while (rs.next()) {
            Product p = new Product(
                    rs.getInt(1),
                    rs.getString(2),
                    rs.getString(3),
                    rs.getDouble(4),
                    rs.getString(5),
                    rs.getString(6),
                    rs.getInt(7),
                    dao.getAllSubImageByPID(rs.getInt(1) + ""),
                    rs.getInt(8),
                    new Size(rs.getInt(9), rs.getString(10))
            );
            list.add(p);
        }
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        // Đóng kết nối
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

//    GỬI CÁI NÀY CHO NGÀY 26/4
   public List<Product> search2(String txtSearch, int pageIndex, String cID, String priceRange) {
    List<Product> list = new ArrayList<>();
    int pageSize = 6; // Cố định 6 sản phẩm mỗi trang
    String query = "WITH RankedSizes AS (\n"
            + "    SELECT \n"
            + "        ps.pID, ps.sizeId, ps.price, ps.quantity,\n"
            + "        ROW_NUMBER() OVER (PARTITION BY ps.pID ORDER BY ps.sizeId) AS rn\n"
            + "    FROM dbo.Product_Size ps \n"
            + "    WHERE ps.isDeleted != 1 AND ps.quantity > 0\n"
            + "\n"
            + "    UNION ALL\n"
            + "\n"
            + "    SELECT \n"
            + "        ps.pID, ps.sizeId, ps.price, ps.quantity,\n"
            + "        ROW_NUMBER() OVER (PARTITION BY ps.pID ORDER BY ps.sizeId) AS rn\n"
            + "    FROM dbo.Product_Size ps\n"
            + "    WHERE ps.isDeleted != 1 \n"
            + "    AND NOT EXISTS (\n"
            + "        SELECT 1 FROM dbo.Product_Size ps2 \n"
            + "        WHERE ps2.pID = ps.pID AND ps2.isDeleted != 1 AND ps2.quantity > 0\n"
            + "    )\n"
            + ")\n"
            + "SELECT \n"
            + "    p.pID, p.pName, p.image, rs.price AS ProductPrice, \n"
            + "    p.title, p.description, p.cID, rs.quantity, rs.sizeId, s.size\n"
            + "FROM dbo.Product p\n"
            + "LEFT JOIN RankedSizes rs ON p.pID = rs.pID AND rs.rn = 1\n"
            + "LEFT JOIN Size s ON rs.sizeId = s.id\n"
            + "WHERE 1=1 ";

    // Điều kiện tìm kiếm
    if (cID != null && !cID.trim().equals("") && !cID.trim().equals("all") && txtSearch != null && !txtSearch.trim().equals("")) {
        query += "AND p.pName LIKE ? AND p.cID = ? ";
    } else if (txtSearch != null && !txtSearch.trim().equals("")) {
        query += "AND p.pName LIKE ? ";
    } else if (cID != null && !cID.trim().equals("") && !cID.trim().equals("all")) {
        query += "AND p.cID = ? ";
    }

    // Điều kiện khoảng giá
    if (priceRange != null && !priceRange.isEmpty()) {
        switch (priceRange) {
            case "1":
                query += "AND rs.price BETWEEN 0 AND 300000 ";
                break;
            case "2":
                query += "AND rs.price BETWEEN 300000 AND 500000 ";
                break;
            case "3":
                query += "AND rs.price BETWEEN 500000 AND 1000000 ";
                break;
            case "4":
                query += "AND rs.price > 1000000 ";
                break;
        }
    }

    // Thêm phân trang
    query += "ORDER BY p.pID DESC OFFSET (? - 1) * ? ROWS FETCH NEXT ? ROWS ONLY";

    try {
        SubImageDAO dao = new SubImageDAO();
        conn = new DBContext().getConnection();
        ps = conn.prepareStatement(query);

        // Đặt tham số cho PreparedStatement
        int paramIndex = 1;
        if (cID != null && !cID.trim().equals("") && !cID.trim().equals("all") && txtSearch != null && !txtSearch.trim().equals("")) {
            ps.setString(paramIndex++, "%" + txtSearch + "%");
            ps.setInt(paramIndex++, Integer.parseInt(cID));
        } else if (txtSearch != null && !txtSearch.trim().equals("")) {
            ps.setString(paramIndex++, "%" + txtSearch + "%");
        } else if (cID != null && !cID.trim().equals("") && !cID.trim().equals("all")) {
            ps.setInt(paramIndex++, Integer.parseInt(cID));
        }

        // Đặt tham số phân trang
        ps.setInt(paramIndex++, pageIndex);
        ps.setInt(paramIndex++, pageSize);
        ps.setInt(paramIndex, pageSize);

        rs = ps.executeQuery();
        while (rs.next()) {
            Product p = new Product(
                    rs.getInt(1),
                    rs.getString(2),
                    rs.getString(3),
                    rs.getDouble(4),
                    rs.getString(5),
                    rs.getString(6),
                    rs.getInt(7),
                    dao.getAllSubImageByPID(rs.getInt(1) + ""),
                    rs.getInt(8),
                    new Size(rs.getInt(9), rs.getString(10))
            );
            list.add(p);
        }
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        // Đóng kết nối
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
public int getTotalProducts(String txtSearch, String cID, String priceRange) {
    int total = 0;
    String query = "WITH RankedSizes AS (\n"
            + "    SELECT ps.pID, ps.sizeId, ps.price, ps.quantity,\n"
            + "           ROW_NUMBER() OVER (PARTITION BY ps.pID ORDER BY ps.sizeId) AS rn\n"
            + "    FROM dbo.Product_Size ps \n"
            + "    WHERE ps.isDeleted != 1 AND ps.quantity > 0\n"
            + "    UNION ALL\n"
            + "    SELECT ps.pID, ps.sizeId, ps.price, ps.quantity,\n"
            + "           ROW_NUMBER() OVER (PARTITION BY ps.pID ORDER BY ps.sizeId) AS rn\n"
            + "    FROM dbo.Product_Size ps\n"
            + "    WHERE ps.isDeleted != 1 \n"
            + "    AND NOT EXISTS (\n"
            + "        SELECT 1 FROM dbo.Product_Size ps2 \n"
            + "        WHERE ps2.pID = ps.pID AND ps2.isDeleted != 1 AND ps2.quantity > 0\n"
            + "    )\n"
            + ")\n"
            + "SELECT COUNT(DISTINCT p.pID)\n"
            + "FROM dbo.Product p\n"
            + "LEFT JOIN RankedSizes rs ON p.pID = rs.pID AND rs.rn = 1\n"
            + "WHERE 1=1\n"
            + "AND EXISTS (\n"
            + "    SELECT 1 FROM Product_Size ps\n"
            + "    WHERE ps.pID = p.pID AND ps.isDeleted = 0\n"
            + ")";

    if (cID != null && !cID.trim().isEmpty() && !cID.trim().equals("all") && txtSearch != null && !txtSearch.trim().isEmpty()) {
        query += "AND p.pName LIKE ? AND p.cID = ? ";
    } else if (txtSearch != null && !txtSearch.trim().isEmpty()) {
        query += "AND p.pName LIKE ? ";
    } else if (cID != null && !cID.trim().isEmpty() && !cID.trim().equals("all")) {
        query += "AND p.cID = ? ";
    }

    if (priceRange != null && !priceRange.isEmpty() && !priceRange.equals("0")) {
        switch (priceRange) {
            case "1":
                query += "AND rs.price BETWEEN 0 AND 300000 ";
                break;
            case "2":
                query += "AND rs.price BETWEEN 300000 AND 500000 ";
                break;
            case "3":
                query += "AND rs.price BETWEEN 500000 AND 1000000 ";
                break;
            case "4":
                query += "AND rs.price > 1000000 ";
                break;
        }
    }

    try {
        conn = new DBContext().getConnection();
        ps = conn.prepareStatement(query);
        int paramIndex = 1;
        if (cID != null && !cID.trim().isEmpty() && !cID.trim().equals("all") && txtSearch != null && !txtSearch.trim().isEmpty()) {
            ps.setString(paramIndex++, "%" + txtSearch + "%");
            ps.setInt(paramIndex, Integer.parseInt(cID));
        } else if (txtSearch != null && !txtSearch.trim().isEmpty()) {
            ps.setString(paramIndex, "%" + txtSearch + "%");
        } else if (cID != null && !cID.trim().isEmpty() && !cID.trim().equals("all")) {
            ps.setInt(paramIndex, Integer.parseInt(cID));
        }

        rs = ps.executeQuery();
        if (rs.next()) {
            total = rs.getInt(1);
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
    return total;
}
public int getTotalViewByMonth(int month, int year) {
        List<Integer> list = new ArrayList<>();
        String query = "select count(*) from [View] where MONTH(viewDate) = ? and  YEAR(viewDate) = ?";
        try {
            conn = new DBContext().getConnection(); //mo ket noi toi sql
            ps = conn.prepareStatement(query);//nem cau lenh query sang sql
            ps.setInt(1, month);
            ps.setInt(2, year);
            rs = ps.executeQuery();//chay cau lenh query, nhan ket qua tra ve
            while (rs.next()) {
               return rs.getInt(1);
            }

        } catch (Exception e) {
        }
        return 0;
    }

    public void addNewProduct(String name, String image,
            String title, String description, String cid, Map<Integer, Size> sizeMap) {
        int productId = -1;
        String query = "INSERT into Product (pName, [image], title, [description], cID)\n"
                + "VALUES (?, ?, ?, ?, ?)";
        try {
            conn = new DBContext().getConnection(); //mo ket noi toi sql
            ps = conn.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);//nem cau lenh query sang sql
            ps.setString(1, name);
            ps.setString(2, image);
            ps.setString(3, title);
            ps.setString(4, description);
            ps.setString(5, cid);
            ps.executeUpdate();
            // Lấy ID của sản phẩm vừa chèn vào
            ResultSet rs = ps.getGeneratedKeys();
            if (rs.next()) {
                productId = rs.getInt(1);  // Lấy ID của sản phẩm vừa chèn
            }
            // Nếu lấy được productId, chèn size vào bảng product_size
            if (productId != -1 && sizeMap.size() > 0) {
                String sizeQuery = "INSERT INTO Product_Size (pID, sizeId, quantity, price, isDeleted) VALUES (?, ?, ?, ?, 0)";
                PreparedStatement psSize = conn.prepareStatement(sizeQuery);

                for (Size size : sizeMap.values()) {
                    psSize.setInt(1, productId);
                    psSize.setInt(2, size.getId());
                    psSize.setInt(3, size.getQuantity());
                    psSize.setDouble(4, size.getPrice());
                    psSize.executeUpdate();
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
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
        String query = "Update Product_Size\n"
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

//    public void updateProduct(String name, String image,
//            String title, String description, String cid, int pID, List<Size> sizeDetails) {
//        String query = "UPDATE Product set pName = ?, image = ?, title = ?, description = ?, cID = ? where pID = ?";
//        try {
//            conn = new DBContext().getConnection(); //mo ket noi toi sql
//            ps = conn.prepareStatement(query);//nem cau lenh query sang sql
//            ps.setString(1, name);
//            ps.setString(2, image);
//            ps.setString(3, title);
//            ps.setString(4, description);
//            ps.setString(5, cid);
//            ps.setInt(6, pID);
//            ps.executeUpdate();
//
//            query = "UPDATE Product_Size set quantity = ?, price = ? where pId = ? and sizeId = ?";
//            PreparedStatement psInsert = conn.prepareStatement(query);
//            for (Size sizeDetail : sizeDetails) {
//                
//            
//            psInsert.setInt(1, 0);//sua
//            psInsert.setString(2, "hihi");
//            psInsert.setInt(3, pID);
//            psInsert.setInt(4, Integer.parseInt(sizeId));
//            psInsert.executeUpdate();
//            }
//
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//    }
    public void updateProduct(String name, String image, String title,
            String description, String cid, int pID, List<Size> sizeDetails) {
        String query = "UPDATE Product set pName = ?, image = ?, title = ?, description = ?, cID = ? where pID = ?";
        try {
            conn = new DBContext().getConnection(); // Mở kết nối SQL
            ps = conn.prepareStatement(query); // Sử dụng câu lệnh SQL
            ps.setString(1, name);
            ps.setString(2, image);
            ps.setString(3, title);
            ps.setString(4, description);
            ps.setString(5, cid);
            ps.setInt(6, pID);
            ps.executeUpdate();

            // Lấy danh sách size hiện tại trong bảng Product_Size
            query = "SELECT sizeId FROM Product_Size WHERE pID = ?";
            PreparedStatement psSelect = conn.prepareStatement(query);
            psSelect.setInt(1, pID);
            ResultSet rs = psSelect.executeQuery();

            Set<Integer> existingSizeIds = new HashSet<>();
            while (rs.next()) {
                existingSizeIds.add(rs.getInt("sizeId"));
            }

            // Cập nhật Product_Size
            query = "UPDATE Product_Size SET quantity = ?, price = ? WHERE pID = ? AND sizeId = ?";
            PreparedStatement psUpdate = conn.prepareStatement(query);

            // Thêm mới size hoặc cập nhật size đã có
            for (Size sizeDetail : sizeDetails) {
                if (existingSizeIds.contains(sizeDetail.getId())) {
                    // Cập nhật size đã tồn tại
                    psUpdate.setInt(1, sizeDetail.getQuantity());
                    psUpdate.setDouble(2, sizeDetail.getPrice());
                    psUpdate.setInt(3, pID);
                    psUpdate.setInt(4, sizeDetail.getId());
                    psUpdate.executeUpdate();
                    existingSizeIds.remove(sizeDetail.getId()); // Xóa size đã xử lý khỏi danh sách
                } else {
                    // Thêm mới size nếu size chưa tồn tại
                    query = "INSERT INTO Product_Size (pID, sizeId, quantity, price, isDeleted) VALUES (?, ?, ?, ?, 0)";
                    PreparedStatement psInsert = conn.prepareStatement(query);
                    psInsert.setInt(1, pID);
                    psInsert.setInt(2, sizeDetail.getId());
                    psInsert.setInt(3, sizeDetail.getQuantity());
                    psInsert.setDouble(4, sizeDetail.getPrice());
                    psInsert.executeUpdate();
                }
            }

            // Xóa size không còn được chọn nữa
            query = "UPDATE Product_Size SET isDeleted = 1 WHERE pID = ? AND sizeId = ?";
            PreparedStatement psDelete = conn.prepareStatement(query);
            for (int sizeId : existingSizeIds) {
                psDelete.setInt(1, pID);
                psDelete.setInt(2, sizeId);
                psDelete.executeUpdate();
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void updateProductQuantity(int productId, int quantityPurchased, int sizeId) {
        String sql = "UPDATE Product_Size SET quantity = quantity - ? WHERE pID = ? and sizeId = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, quantityPurchased);
            ps.setInt(2, productId);
            ps.setInt(3, sizeId);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (ps != null) {
                    ps.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    public List<Product> getProductByCidForCheck(String cid) {
        List<Product> list = new ArrayList<>();
        String query = "SELECT pID, pName FROM Product WHERE cid = ?";
        try {
            // Open connection to the database
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query); // Prepare the SQL query
            ps.setString(1, cid);  // Set the parameter for the query

            rs = ps.executeQuery(); // Execute the query and get the result

            // Process the result set
            while (rs.next()) {
                list.add(new Product(rs.getInt(1), rs.getString(2)));
            }

        } catch (Exception e) {
            e.printStackTrace(); // Print the exception if any
        } finally {
            try {
                // Close resources
                if (rs != null) {
                    rs.close();
                }
                if (ps != null) {
                    ps.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        return list;
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

    public Product getNewestProduct() {
        String query = "select top 1 p.[pID]\n"
                + "      ,p.[pName]\n"
                + "      ,p.[image],ps.price, p.[title]\n"
                + "      ,p.[description]\n"
                + "      ,p.[cID], ps.quantity,s.id, s.size\n"
                + "from Product p \n"
                + "left join Product_Size ps on p.pID = ps.pID left join Size s on ps.sizeId = s.id \n"
                + "where ps.isDeleted != 1\n"
                + "order by p.pID desc";
        try {
            SubImageDAO dao = new SubImageDAO();
            conn = new DBContext().getConnection(); //mo ket noi toi sql
            ps = conn.prepareStatement(query);//nem cau lenh query sang sql
            rs = ps.executeQuery();//chay cau lenh query, nhan ket qua tra ve
            while (rs.next()) {
                Product p = new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getInt(7), dao.getAllSubImageByPID(rs.getInt(1) + ""), rs.getInt(8),
                        new Size(rs.getInt(9), rs.getString(10)));
                return p;
            }
        } catch (Exception e) {
        }
        return null;
    }

    public Product getBestSeller() {
        String query = "WITH R AS ( "
                + "    SELECT O.ProductID, SUM(O.Quantity) AS SL "
                + "    FROM OrderDetails O "
                + "    GROUP BY O.ProductID "
                + ") "
                + "SELECT TOP 1 p.pID, p.pName, p.image, ps.price, p.title, p.description, p.cID, ps.quantity, s.id, s.size "
                + "FROM Product p "
                + "JOIN R ON p.pID = R.ProductID "
                + "LEFT JOIN Product_Size ps ON p.pID = ps.pID "
                + "LEFT JOIN Size s ON ps.sizeId = s.id "
                + "WHERE ps.isDeleted != 1 AND R.SL = (SELECT MAX(SL) FROM R) "
                + "ORDER BY p.pID DESC";

        try {
            SubImageDAO dao = new SubImageDAO();
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();

            if (rs.next()) {
                return new Product(
                        rs.getInt(1), // pID
                        rs.getString(2), // pName
                        rs.getString(3), // image
                        rs.getDouble(4), // price
                        rs.getString(5), // title
                        rs.getString(6), // description
                        rs.getInt(7), // cID
                        dao.getAllSubImageByPID(rs.getInt(1) + ""), // List ảnh phụ
                        rs.getInt(8), // quantity
                        new Size(rs.getInt(9), rs.getString(10)) // Size
                );
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
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
            conn = new DBContext().getConnection(); // Mở kết nối tới cơ sở dữ liệu
            ps = conn.prepareStatement(query); // Tạo câu lệnh SQL
            ps.setInt(1, year); // Gán giá trị cho tham số năm
            rs = ps.executeQuery(); // Thực thi câu lệnh SQL và lấy kết quả trả về

            while (rs.next()) {
                list.add(rs.getInt("TotalQuantitySold")); // Lấy tổng số sản phẩm đã bán trong từng tháng
            }
        } catch (Exception e) {
            e.printStackTrace(); // Log lỗi nếu có
        } finally {
            // Đảm bảo đóng kết nối và các đối tượng sử dụng tài nguyên (resultSet, preparedStatement)
            try {
                if (rs != null) {
                    rs.close();
                }
                if (ps != null) {
                    ps.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException ex) {
                ex.printStackTrace(); // Log lỗi khi đóng tài nguyên
            }
        }
        return list; // Trả về danh sách kết quả
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

    public List<Integer> getTotalViewByYear(int year) {
        List<Integer> list = new ArrayList<>();
        String query = "WITH Months AS (\n"
                + "    SELECT 1 AS Month\n"
                + "    UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4\n"
                + "    UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7\n"
                + "    UNION ALL SELECT 8 UNION ALL SELECT 9 UNION ALL SELECT 10\n"
                + "    UNION ALL SELECT 11 UNION ALL SELECT 12\n"
                + ")\n"
                + "SELECT \n"
                + "    M.Month,\n"
                + "    ISNULL(COUNT(V.id), 0) AS TotalViews\n"
                + "FROM \n"
                + "    Months M\n"
                + "LEFT JOIN \n"
                + "    dbo.[View] V ON MONTH(V.viewDate) = M.Month AND YEAR(V.viewDate) = ?\n"
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

    public Map<Integer, String> getSoldCategoriesByMonth(int year) {
        Map<Integer, String> result = new LinkedHashMap<>();
        String query = "WITH Months AS (\n"
                + "    SELECT 1 AS Month UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9 UNION ALL SELECT 10 UNION ALL SELECT 11 UNION ALL SELECT 12\n"
                + ")\n"
                + "SELECT M.Month, ISNULL(STUFF((\n"
                + "    SELECT DISTINCT '<br/>' + C.cName\n"
                + "    FROM [Order] O\n"
                + "    JOIN OrderDetails OD ON O.id = OD.OrderID\n"
                + "    JOIN Product P ON OD.ProductID = P.pID\n"
                + "    JOIN Category C ON P.cID = C.cID\n"
                + "    WHERE MONTH(O.orderDate) = M.Month AND YEAR(O.orderDate) = ?\n"
                + "    FOR XML PATH(''), TYPE).value('.', 'NVARCHAR(MAX)'), 1, 5, ''), 'None') AS SoldCategories\n"
                + "FROM Months M\n"
                + "ORDER BY M.Month;";

        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, year);
            rs = ps.executeQuery();
            while (rs.next()) {
                int month = rs.getInt("Month");
                String categories = rs.getString("SoldCategories");
                result.put(month, categories);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
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

    public Product getProductByID(String id) {
        String query = "select p.[pID]\n"
                + "      ,p.[pName]\n"
                + "      ,p.[image], p.[title]\n"
                + "      ,p.[description]\n"
                + "      ,p.[cID] from Product p\n"
                + "where p.pID = ?";
        SubImageDAO dao = new SubImageDAO();
        try {
            conn = new DBContext().getConnection(); //mo ket noi toi sql
            ps = conn.prepareStatement(query);//nem cau lenh query sang sql
            ps.setString(1, id);
            rs = ps.executeQuery();//chay cau lenh query, nhan ket qua tra ve
            while (rs.next()) {
                Product p = new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        0,
                        rs.getString(4),
                        rs.getString(5),
                        rs.getInt(6), dao.getAllSubImageByPID(rs.getInt(1) + ""), 0,
                        new Size());
                List<Size> sizesByProductId = new SizeDAO().getAllSizeByProductId(rs.getInt(1));
                p.setSizes(sizesByProductId);
                return p;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
   
      public Map<Integer, List<String>> getSoldProductsByMonth(int year) {
        Map<Integer, List<String>> result = new LinkedHashMap<>();
        String query = "WITH Months AS ( "
                + "    SELECT 1 AS Month UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 "
                + "    UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 "
                + "    UNION ALL SELECT 9 UNION ALL SELECT 10 UNION ALL SELECT 11 UNION ALL SELECT 12 "
                + ") "
                + "SELECT M.Month, P.pName, S.size, SUM(OD.Quantity) AS TotalSold, C.cName "
                + "FROM Months M "
                + "LEFT JOIN [Order] O ON MONTH(O.orderDate) = M.Month AND YEAR(O.orderDate) = ? "
                + "LEFT JOIN OrderDetails OD ON O.id = OD.OrderID "
                + "LEFT JOIN Product P ON OD.ProductID = P.pID "
                + "LEFT JOIN Size S ON OD.SizeID = S.id "
                + "LEFT JOIN Category C ON P.cID = C.cID "
                + "WHERE P.pName IS NOT NULL "
                + "GROUP BY M.Month, P.pName, S.size, C.cName "
                + "ORDER BY M.Month, P.pName, S.size";

        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, year);
            rs = ps.executeQuery();

            while (rs.next()) {
                int month = rs.getInt("Month");
                String productName = rs.getString("pName");
                String size = rs.getString("size");
                int totalSold = rs.getInt("TotalSold");
                String category = rs.getString("cName");
                String entry = productName + " - Size " + size + " - " + totalSold + " cái - Thể loại: " + category;

                result.computeIfAbsent(month, k -> new ArrayList<>()).add(entry);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (ps != null) {
                    ps.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return result;
    }

    public static void main(String[] args) {
        System.out.println("main nè");
        ProductDAO dao = new ProductDAO();
        List<Product> list = dao.top5BestSellerCategory(1);
        for (Product product : list) {
            System.out.println("huhu");
            System.out.println(product.getId());
        }
    }

}
