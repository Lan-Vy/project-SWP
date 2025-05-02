/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package utils;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.IOException;

/**
 *
 * @author Admin
 */
public class ImageService {

    private static final String IMAGE_UPLOAD_DIR = "images";
    // Lưu ảnh vào thư mục trên server

    public static String saveImage(Part imagePart, HttpServletRequest request) throws IOException {
        String fileName = extractFileName(imagePart);
        String uploadPath = request.getServletContext().getRealPath("") + File.separator + IMAGE_UPLOAD_DIR;

        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdir();
        }

        String filePath = uploadPath + File.separator + fileName;
        imagePart.write(filePath);

        return IMAGE_UPLOAD_DIR + "/" + fileName;
    }

    public static String extractFileName(Part part) {
        for (String content : part.getHeader("content-disposition").split(";")) {
            if (content.trim().startsWith("filename")) {
                return content.substring(content.indexOf("=") + 2, content.length() - 1);
            }
        }
        return "default.png";
    }
}
