package session;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/SessionVisit")
public class sessions extends HttpServlet {
	
	@Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        handleRequest(req, res);
    }


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        handleRequest(req, res);
    }

    private void handleRequest(HttpServletRequest req, HttpServletResponse res)
            throws IOException {
        res.setContentType("text/html");
        HttpSession session = req.getSession();

        // Session visit message
        if (session.isNew()) {
            res.getWriter().println("<h2>Welcome! This is your first visit.</h2>");
        } else {
            res.getWriter().println("<h2>Welcome back! You have visited before.</h2>");
        }

        // Count visits
        Integer visitCount = (Integer) session.getAttribute("visitCount");
        if (visitCount == null) {
            visitCount = 1;
        } else {
            visitCount++;
        }
        session.setAttribute("visitCount", visitCount);

        // Display session info
        res.getWriter().println("<p>Session ID: " + session.getId() + "</p>");
        res.getWriter().println("<p>Visit Count in this session: " + visitCount + "</p>");
        res.getWriter().println("<p><a href='SessionVisit'>Reload Page</a></p>");
        res.getWriter().println("<p><a href='invalidateSession'>Destroy Session</a></p>");
    }
}