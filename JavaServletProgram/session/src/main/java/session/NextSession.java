package session;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/invalidateSession")
public class NextSession extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        res.setContentType("text/html");
        HttpSession session = req.getSession(false); // don't create a new session

        if (session != null) {
            session.invalidate(); // destroy session
            res.getWriter().println("<h2>Session destroyed successfully!</h2>");
        } else {
            res.getWriter().println("<h2>No active session to destroy.</h2>");
        }

        res.getWriter().println("<p><a href='SessionVisit'>Go to Session Demo</a></p>");
    }
}