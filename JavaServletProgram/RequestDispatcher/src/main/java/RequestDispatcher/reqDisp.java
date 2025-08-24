package RequestDispatcher;

import java.io.IOException;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/hello")
public class reqDisp extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res) 
            throws ServletException, IOException {

        String uname = req.getParameter("uname");
        String password = req.getParameter("password");

        if ("Servlet".equals(password)) {
            // Forward to WelcomeServlet
            RequestDispatcher rd = req.getRequestDispatcher("WelcomeServlet");
            rd.forward(req, res);
        } else {
            // Invalid password → reload login page with error
            res.setContentType("text/html");
            res.getWriter().println("<p style='color:red'>Invalid password! Try again.</p>");
            RequestDispatcher rd = req.getRequestDispatcher("reqDis.html");
            rd.include(req, res);
        }
    }
}