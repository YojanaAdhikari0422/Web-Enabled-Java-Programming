package Hyperlink;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/hello")
public class hyperlink extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        res.setContentType("text/html");

        // Get data from query string (after ? in hyperlink)
        String uname = req.getParameter("uname");

        if (uname == null || uname.isEmpty()) {
            uname = "Guest";
        }

        res.getWriter().println("<h2>Hello, " + uname + "! You just communicated via hyperlink.</h2>");
    }
}
