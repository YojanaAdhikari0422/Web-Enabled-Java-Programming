package Registration;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.regex.Pattern;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/register")
public class registering extends HttpServlet {

    // Regex for alphabets only
    private static final String NAME_REGEX = "^[A-Za-z]+$";
    // Regex for password: at least 1 digit, 1 special char, min 6 chars
    private static final String PASSWORD_REGEX = "^(?=.*[0-9])(?=.*[!@#$%^&*]).{6,}$";

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        
        res.setContentType("text/html");
        PrintWriter out = res.getWriter();

        // Get parameters
        String fname = req.getParameter("fname");
        String mname = req.getParameter("mname");
        String lname = req.getParameter("lname");
        String login = req.getParameter("login");
        String password = req.getParameter("password");
        String cpassword = req.getParameter("cpassword");
        String location = req.getParameter("location");
        String education = req.getParameter("education");
        String phone = req.getParameter("phone");

        // Validation
        if (fname == null || fname.isEmpty() || lname == null || lname.isEmpty()
                || login == null || login.isEmpty()
                || password == null || password.isEmpty()
                || cpassword == null || cpassword.isEmpty()) {
            out.println("<h3 style='color:red'>Error: Please fill all compulsory fields (*)</h3>");
            return;
        }

        if (!Pattern.matches(NAME_REGEX, fname)) {
            out.println("<h3 style='color:red'>Error: First name must contain only alphabets</h3>");
            return;
        }

        if (mname != null && !mname.isEmpty() && !Pattern.matches(NAME_REGEX, mname)) {
            out.println("<h3 style='color:red'>Error: Middle name must contain only alphabets</h3>");
            return;
        }

        if (!Pattern.matches(NAME_REGEX, lname)) {
            out.println("<h3 style='color:red'>Error: Last name must contain only alphabets</h3>");
            return;
        }

        if (!password.equals(cpassword)) {
            out.println("<h3 style='color:red'>Error: Passwords do not match</h3>");
            return;
        }

        if (!Pattern.matches(PASSWORD_REGEX, password)) {
            out.println("<h3 style='color:red'>Error: Password must have at least 6 characters, "
                    + "1 number and 1 special character</h3>");
            return;
        }

        // If all checks passed
        out.println("<h2 style='color:green'>Registration Successful!</h2>");
        out.println("<p>Welcome, " + fname + " " + lname + "</p>");
        out.println("<p>Login ID: " + login + "</p>");
        if (location != null && !location.isEmpty())
            out.println("<p>Location: " + location + "</p>");
        if (education != null && !education.isEmpty())
            out.println("<p>Education: " + education + "</p>");
        if (phone != null && !phone.isEmpty())
            out.println("<p>Phone: " + phone + "</p>");
    }
}
