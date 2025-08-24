package AutoRefresh;

import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/refresh")
public class Arefresh extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        res.setContentType("text/html");

        // Set Refresh header: refresh page every 5 seconds
        res.setHeader("Refresh", "5");

        // Get current date & time
        LocalDateTime now = LocalDateTime.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd-MM-yyyy HH:mm:ss");
        String formattedDateTime = now.format(formatter);

        res.getWriter().println("<h2>Auto Refresh Example</h2>");
        res.getWriter().println("<p>Current Time: " + formattedDateTime + "</p>");
        res.getWriter().println("<p>(This page refreshes every 5 seconds)</p>");
    }
}
