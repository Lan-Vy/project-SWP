/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package control;

import dao.CategoryDAO;
import dao.ProductDAO;
import dao.SizeDAO;
import dao.SubImageDAO;
import entity.Category;
import entity.Product;
import entity.Size;
import entity.SubImage;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.util.ArrayList;
import java.util.Map;
import java.util.Set;
import java.util.stream.Collectors;
import utils.ImageService;

/**
 *
 * @author Admin
 */
@WebServlet(name = "UpdateProductControl", urlPatterns = {"/UpdateProductControl"})
@MultipartConfig(fileSizeThreshold = 1024 * 1024, maxFileSize = 5 * 1024 * 1024, maxRequestSize = 10 * 1024 * 1024)
public class UpdateProductControl extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        String id = request.getParameter("id");

        ProductDAO dao = new ProductDAO();
        Product product = dao.getProductByID(id);
        // Lấy các size hiện có của product
        List<Size> productSizes = product.getSizes();

        String sizeOptions = "";
        String selectedSizeIds = ""; // dùng để truyền vào JS sau
        List<Size> listSize = new SizeDAO().getAllSize();
        for (Size s : listSize) {
            boolean selected = productSizes.stream().anyMatch(ps -> ps.getId() == s.getId());
            if (selected) {
                selectedSizeIds += s.getId() + ",";
            }
            sizeOptions += "<option value=\"" + s.getId() + "\"" + (selected ? " selected" : "") + ">" + s.getSize() + "</option>\n";
        }

        List<Category> listC = new CategoryDAO().getAllCategory();

        String select = "";

        for (Category category : listC) {
            if (product.getCateID() != category.getId()) {
                select += "<option value=\"" + category.getId() + "\">" + category.getName() + "</option>\n";
            } else {
                select += "<option value=\"" + category.getId() + "\"selected>" + category.getName() + "</option>\n";
            }
        }

        PrintWriter out = response.getWriter();
        out.println("<div class=\"modal-dialog\">\n"
                + "  <div class=\"modal-content\">\n"
                + "    <form action=\"UpdateProductControl\" method=\"post\" enctype=\"multipart/form-data\">\n"
                + "      <div class=\"modal-header\">\n"
                + "        <h4 class=\"modal-title\">Edit Product</h4>\n"
                + "        <button type=\"button\" class=\"close\" data-dismiss=\"modal\">&times;</button>\n"
                + "      </div>\n"
                + "      <div class=\"modal-body\">\n"
                + "        <input type=\"hidden\" name=\"pID\" value=\"" + product.getId() + "\">\n"
                // Name
                + "        <div class=\"form-group\">\n"
                + "          <label>Name</label>\n"
                + "          <input type=\"text\" name=\"name\" class=\"form-control\" value=\"" + product.getName() + "\" required>\n"
                + "        </div>\n"
                // Main image
                + "        <div class=\"form-group\">\n"
                + "          <label>Main Image</label>\n"
                + "          <input type=\"file\" name=\"image\" class=\"form-control\" accept=\"image/*\"  onchange=\"var file = this.files[0]; if (file) { var reader = new FileReader(); reader.onload = function(e) { document.getElementById('previewImage').src = e.target.result; }; reader.readAsDataURL(file); }\">\n"
                + "          <img id=\"previewImage\" src=\"" + product.getImage() + "\" height=\"80\">\n"
                + "<input type=\"hidden\" name=\"currentImage\" value=\"" + product.getImage() + "\">"
                + "        </div>\n");

        // Sub Images
        for (int i = 0; i < 4; i++) {
            out.println("        <div class=\"form-group\">\n"
                    + "          <label>SubImage" + (i + 1) + "</label>\n"
                    + "          <input type=\"file\" name=\"subImage" + (i + 1) + "\" class=\"form-control\" accept=\"image/*\" onchange=\"var file = this.files[0]; if (file) { var reader = new FileReader(); reader.onload = function(e) { document.getElementById('previewSub"+(i + 1)+"').src = e.target.result; }; reader.readAsDataURL(file); }\">\n"
                    + "          <img id=\"previewSub" + (i + 1) + "\" src=\"" + product.getSubImage().get(i).getImage() + "\" height=\"80\">\n"
                    + "<input type=\"hidden\" name=\"currentSubImage" + (i + 1) + "\" value=\"" + product.getSubImage().get(i).getImage() + "\">"
                    + "        </div>\n");
        }

        out.println("        <div class=\"form-group\">\n"
                + "          <label>Title</label>\n"
                + "          <textarea name=\"title\" class=\"form-control\" required>" + (product.getTitle() == null ? "" : product.getTitle()) + "</textarea>\n"
                + "        </div>\n"
                + "        <div class=\"form-group\">\n"
                + "          <label>Description</label>\n"
                + "          <textarea name=\"description\" class=\"form-control\" required>" + (product.getDescription() == null ? "" : product.getDescription()) + "</textarea>\n"
                + "        </div>\n"
                // Category
                + "        <div class=\"form-group\">\n"
                + "          <label>Category</label>\n"
                + "          <select name=\"category\" class=\"form-control\">\n"
                + select
                + "          </select>\n"
                + "        </div>\n"
                // Size chọn nhiều
                + "        <div class=\"form-group\">\n"
                + "          <label>Size</label>\n"
                + "          <select name=\"size\" class=\"form-control\" multiple id=\"sizeSelectEdit\">\n");
        out.println(sizeOptions);
        out.println("          </select>\n"
                + "        </div>\n");
        // Hiển thị các input price & amount tương ứng
        out.println("<div id=\"sizeDetailsContainerEdit\">");
        for (Size s : product.getSizes()) {
            out.println("<div class=\"form-group size-detail-group-edit\" data-size-id=\"" + s.getId() + "\">\n"
                    + "  <label>" + s.getSize() + " - Price & Amount</label>\n"
                    + "  <div class=\"row\">\n"
                    + "    <div class=\"col\">\n"
                    + "      <input type=\"number\" name=\"sizePrice_" + s.getId() + "\" class=\"form-control\""
                    + " placeholder=\"Price for size " + s.getSize() + "\" required min=\"0\" value=\"" + s.getPrice() + "\">\n"
                    + "    </div>\n"
                    + "    <div class=\"col\">\n"
                    + "      <input type=\"number\" name=\"sizeAmount_" + s.getId() + "\" class=\"form-control\""
                    + " placeholder=\"Amount for size " + s.getSize() + "\" required min=\"0\" value=\"" + s.getQuantity() + "\">\n"
                    + "    </div>\n"
                    + "  </div>\n"
                    + "</div>");
        }
        out.println("</div></div>");

        // footer
        out.println("      <div class=\"modal-footer\">\n"
                + "        <input type=\"button\" class=\"btn btn-default\" data-dismiss=\"modal\" value=\"Cancel\">\n"
                + "        <input type=\"submit\" class=\"btn btn-info\" value=\"Save\">\n"
                + "      </div>\n"
                + "    </form>\n"
                + "  </div>\n"
                + "</div>\n"
        );
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        //processRequest(request, response);
        String name = request.getParameter("name");
        String pID = request.getParameter("pID");
        Part imagePart = request.getPart("image");
        Part subImage1Part = request.getPart("subImage1");
        Part subImage2Part = request.getPart("subImage2");
        Part subImage3Part = request.getPart("subImage3");
        Part subImage4Part = request.getPart("subImage4");
        String title = request.getParameter("title");
        String description = request.getParameter("description");
        String category = request.getParameter("category");
//        String sizeId = request.getParameter("size");
// Lấy danh sách các size được chọn
        String[] sizeIds = request.getParameterValues("size");
        // Lấy giá trị price và quantity của từng size
        List<Size> sizeDetails = new ArrayList<>();
        for (String sizeId : sizeIds) {
            String sizePrice = request.getParameter("sizePrice_" + sizeId);
            String sizeAmount = request.getParameter("sizeAmount_" + sizeId);

            // Thêm size vào danh sách sizeDetails
            sizeDetails.add(new Size(Integer.parseInt(sizeId), Integer.parseInt(sizeAmount),
                    Double.parseDouble(sizePrice)
            ));
        }

        ProductDAO dao = new ProductDAO();
        SubImageDAO sdao = new SubImageDAO();

        // Lấy hình ảnh hiện tại nếu không có ảnh mới được tải lên
        String image = null;
        String subImage1 = null, subImage2 = null, subImage3 = null, subImage4 = null;

        // Kiểm tra nếu có ảnh mới tải lên, nếu không thì giữ nguyên ảnh cũ
        if (imagePart != null && imagePart.getSize() > 0) {
            image = ImageService.saveImage(imagePart, request);
        } else {
            image = request.getParameter("currentImage"); // Lấy ảnh cũ từ request (dữ liệu đã có sẵn trong form)
        }

        // Xử lý hình ảnh phụ (sub images)
        if (subImage1Part != null && subImage1Part.getSize() > 0) {
            subImage1 = ImageService.saveImage(subImage1Part, request);
        } else {
            subImage1 = request.getParameter("currentSubImage1");
        }

        if (subImage2Part != null && subImage2Part.getSize() > 0) {
            subImage2 = ImageService.saveImage(subImage2Part, request);
        } else {
            subImage2 = request.getParameter("currentSubImage2");
        }

        if (subImage3Part != null && subImage3Part.getSize() > 0) {
            subImage3 = ImageService.saveImage(subImage3Part, request);
        } else {
            subImage3 = request.getParameter("currentSubImage3");
        }

        if (subImage4Part != null && subImage4Part.getSize() > 0) {
            subImage4 = ImageService.saveImage(subImage4Part, request);
        } else {
            subImage4 = request.getParameter("currentSubImage4");
        }
        List<SubImage> listSubImg = sdao.getAllSubImageByPID(pID);
        SubImage s = listSubImg.get(0);
        SubImage s1 = listSubImg.get(1);
        SubImage s2 = listSubImg.get(2);
        SubImage s3 = listSubImg.get(3);
        s.setImage(subImage1);
        s1.setImage(subImage2);
        s2.setImage(subImage3);
        s3.setImage(subImage4);

        sdao.updateSubImage(s.getpID() + "", s.getImage() + "", s.getSubImageID() + "");
        sdao.updateSubImage(s1.getpID() + "", s1.getImage() + "", s1.getSubImageID() + "");
        sdao.updateSubImage(s2.getpID() + "", s2.getImage() + "", s2.getSubImageID() + "");
        sdao.updateSubImage(s3.getpID() + "", s3.getImage() + "", s3.getSubImageID() + "");
        dao.updateProduct(name, image, title, description, category, Integer.parseInt(pID), sizeDetails);
        request.setAttribute("message", "Update success!");
        request.getRequestDispatcher("ManagerControl").forward(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
