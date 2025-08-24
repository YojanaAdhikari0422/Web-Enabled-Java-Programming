package UpDownLoad;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

@WebServlet("/upload")
@MultipartConfig
public class UpDown extends HttpServlet {

    private static final String UPLOAD_DIR = "D:/uploads";  

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        File uploadDir = new File(UPLOAD_DIR);
        if (!uploadDir.exists()) {
            uploadDir.mkdirs();
        }

        Part filePart = request.getPart("file");
        String fileName = filePart.getSubmittedFileName();

        if (fileName == null || fileName.isEmpty()) {
            response.getWriter().println("<h3>No file selected!</h3>");
            return;
        }

        File file = new File(uploadDir, fileName);
        try (InputStream input = filePart.getInputStream()) {
            Files.copy(input, file.toPath(), StandardCopyOption.REPLACE_EXISTING);
        }

        response.setContentType("text/html");
        response.getWriter().println("<h2>File uploaded successfully: " + fileName + "</h2>");
        response.getWriter().println("<a href='download?fileName=" + fileName + "'>Download File</a>");
    }
}