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
import java.sql.Statement;
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
        String query = "select p.[pID]\n"
                + "      ,p.[pName]\n"
                + "      ,p.[image],ps.price, p.[title]\n"
                + "      ,p.[description]\n"
                + "      ,p.[cID], ps.quantity,s.id, s.size from Product p\n"
                + "join Product_Size ps on p.pID = ps.pID left join Size s on ps.sizeId = s.id where ps.isDeleted != 1 ";
        if (cID != null && !cID.trim().equals("") && txtSearch != null && !txtSearch.trim().equals("")) {
            query += "and p.pName like ? and p.cID = ? ";
        } else if (txtSearch != null && !txtSearch.trim().equals("")) {
            query += "and p.pName like ? ";
        } else if (cID != null && !cID.trim().equals("")) {
            query += "and p.cID = ? ";
        }

        if (priceRange.equals("1")) {
            query += "and ps.price between 0 and 300";
        } else if (priceRange.equals("2")) {
            query += "and ps.price between 300 and 500";
        } else if (priceRange.equals("3")) {
            query += "and ps.price between 500 and 1000";
        } else if (priceRange.equals("4")) {
            query += "and ps.price > 1000";
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

    public List<Product> searchWithPaging(String txtSearch, int pageIndex, int pageSize, String cID, String sort, String priceRange) {
        List<Product> list = new ArrayList<>();
        String query = "select p.[pID]\n"
                + "      ,p.[pName]\n"
                + "      ,p.[image],ps.price, p.[title]\n"
                + "      ,p.[description]\n"
                + "      ,p.[cID], ps.quantity,s.id, s.size from Product p\n"
                + "join Product_Size ps on p.pID = ps.pID left join Size s on ps.sizeId = s.id where ps.isDeleted != 1 ";
        if (cID != null && !cID.trim().equals("") && txtSearch != null && !txtSearch.trim().equals("")) {
            query += "and p.pName like ? and p.cID = ? ";
        } else if (txtSearch != null && !txtSearch.trim().equals("")) {
            query += "and p.pName like ? ";
        } else if (cID != null && !cID.trim().equals("")) {
            query += "and p.cID = ? ";
        }

        if (priceRange.equals("1")) {
            query += "and ps.price between 0 and 300000";
        } else if (priceRange.equals("2")) {
            query += "and ps.price between 300000 and 500000";
        } else if (priceRange.equals("3")) {
            query += "and ps.price between 500000 and 1000000";
        } else if (priceRange.equals("4")) {
            query += "and ps.price > 1000000";
        }

        if (sort != null && sort.equals("asc")) {
            query += " ORDER BY ps.price OFFSET\n"
                    + "                    (?*?-?) ROWS FETCH NEXT ? ROWS ONLY";
        } else if (sort != null && sort.equals("desc")) {
            query += " ORDER BY ps.price desc OFFSET\n"
                    + "                    (?*?-?) ROWS FETCH NEXT ? ROWS ONLY";
        } else {
            query += " ORDER BY ps.pID desc OFFSET\n"
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

    public List<Product> searchWithPaging2(String txtSearch, int pageIndex, int pageSize, String cID, String sort, String priceRange) {
        List<Product> list = new ArrayList<>();
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
                + "SELECT \n"
                + "    p.pID, p.pName, p.image, rs.price AS ProductPrice, \n"
                + "    p.title, p.description, p.cID, rs.quantity, rs.sizeId, s.size\n"
                + "FROM dbo.Product p\n"
                + "LEFT JOIN RankedSizes rs ON p.pID = rs.pID AND rs.rn = 1\n"
                + "LEFT JOIN Size s ON rs.sizeId = s.id\n"
                + "WHERE 1=1 ";
        if (cID != null && !cID.trim().equals("") && txtSearch != null && !txtSearch.trim().equals("")) {
            query += "and p.pName like ? and p.cID = ? ";
        } else if (txtSearch != null && !txtSearch.trim().equals("")) {
            query += "and p.pName like ? ";
        } else if (cID != null && !cID.trim().equals("")) {
            query += "and p.cID = ? ";
        }

        if (priceRange.equals("1")) {
            query += "and rs.price between 0 and 300000";
        } else if (priceRange.equals("2")) {
            query += "and rs.price between 300000 and 500000";
        } else if (priceRange.equals("3")) {
            query += "and rs.price between 500000 and 1000000";
        } else if (priceRange.equals("4")) {
            query += "and rs.price > 1000000";
        }

        if (sort != null && sort.equals("asc")) {
            query += " ORDER BY rs.price OFFSET\n"
                    + "                    (?*?-?) ROWS FETCH NEXT ? ROWS ONLY";
        } else if (sort != null && sort.equals("desc")) {
            query += " ORDER BY rs.price desc OFFSET\n"
                    + "                    (?*?-?) ROWS FETCH NEXT ? ROWS ONLY";
        } else {
            query += " ORDER BY rs.pID desc OFFSET\n"
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

    public List<Product> search2(String txtSearch, String cID, String priceRange) {
        List<Product> list = new ArrayList<>();
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
                + "SELECT \n"
                + "    p.pID, p.pName, p.image, rs.price AS ProductPrice, \n"
                + "    p.title, p.description, p.cID, rs.quantity, rs.sizeId, s.size\n"
                + "FROM dbo.Product p\n"
                + "LEFT JOIN RankedSizes rs ON p.pID = rs.pID AND rs.rn = 1\n"
                + "LEFT JOIN Size s ON rs.sizeId = s.id\n"
                + "WHERE 1=1 ";
        if (cID != null && !cID.trim().equals("") && txtSearch != null && !txtSearch.trim().equals("")) {
            query += "and p.pName like ? and p.cID = ? ";
        } else if (txtSearch != null && !txtSearch.trim().equals("")) {
            query += "and p.pName like ? ";
        } else if (cID != null && !cID.trim().equals("")) {
            query += "and p.cID = ? ";
        }

        if (priceRange.equals("1")) {
            query += "and rs.price between 0 and 300";
        } else if (priceRange.equals("2")) {
            query += "and rs.price between 300 and 500";
        } else if (priceRange.equals("3")) {
            query += "and rs.price between 500 and 1000";
        } else if (priceRange.equals("4")) {
            query += "and rs.price > 1000";
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

    public void addNewProduct(String name, String image, String price,
            String title, String description, String cid, int amount, String[] sizes) {
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
            if (productId != -1 && sizes != null) {
                String sizeQuery = "INSERT INTO Product_Size (pID, sizeId, quantity, price, isDeleted) VALUES (?, ?, ?, ?, 0)";
                PreparedStatement psSize = conn.prepareStatement(sizeQuery);

                for (String size : sizes) {
                    psSize.setInt(1, productId);
                    psSize.setInt(2, Integer.parseInt(size));
                    psSize.setInt(3, amount);
                    psSize.setString(4, price);
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

    public void deleteProduct(String pid, String sizeId) throws Exception {//edit param
        //edit query (my_table), number of param
        String query = "Update Product_Size\n"
                + "set isDeleted = 1 WHERE pID = ? and sizeId = ?";
        try {
            conn = new DBContext().getConnection(); //mo ket noi toi sql
            ps = conn.prepareStatement(query);//nem cau lenh query sang sql
            ps.setString(1, pid);
            ps.setString(2, sizeId);
            ps.executeUpdate();
        } catch (Exception e) {
            throw e;
        }
    }

    public void updateProduct(String name, String image, String price,
            String title, String description, String cid, int amount, int pID, String sizeId) {
        String query = "UPDATE Product set pName = ?, image = ?, title = ?, description = ?, cID = ? where pID = ?";
        try {
            conn = new DBContext().getConnection(); //mo ket noi toi sql
            ps = conn.prepareStatement(query);//nem cau lenh query sang sql
            ps.setString(1, name);
            ps.setString(2, image);
            ps.setString(3, title);
            ps.setString(4, description);
            ps.setString(5, cid);
            ps.setInt(6, pID);
            ps.executeUpdate();

            query = "UPDATE Product_Size set quantity = ?, price = ? where pId = ? and sizeId = ?";
            PreparedStatement psInsert = conn.prepareStatement(query);
            psInsert.setInt(1, amount);
            psInsert.setString(2, price);
            psInsert.setInt(3, pID);
            psInsert.setInt(4, Integer.parseInt(sizeId));
            psInsert.executeUpdate();

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

}
