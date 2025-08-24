package cookies;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/count")
public class cookies extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        handleRequest(req, res);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        handleRequest(req, res);
    }

    private void handleRequest(HttpServletRequest req, HttpServletResponse res)
            throws IOException {
        int visitCount = 0;

        // Read cookies sent by browser
        Cookie[] cookies = req.getCookies();
        if (cookies != null) {
            for (Cookie c : cookies) {
                if ("visitCount".equals(c.getName())) {
                    visitCount = Integer.parseInt(c.getValue());
                }
            }
        }

        visitCount++;

        // Create a new cookie with updated count
        Cookie visitCookie = new Cookie("visitCount", String.valueOf(visitCount));
        visitCookie.setMaxAge(60 * 60 * 24 * 7); // Cookie valid for 7 days
        res.addCookie(visitCookie);

        // Send response
        res.setContentType("text/html");
        res.getWriter().println("<h2>You have visited this servlet " + visitCount + " times.</h2>");
    }
}