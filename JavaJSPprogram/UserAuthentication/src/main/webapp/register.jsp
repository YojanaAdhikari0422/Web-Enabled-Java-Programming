<%@ page import="java.sql.*" %>
<%@ include file="db.jsp" %>

<%
String msg = "";
boolean success = false;

// Only run logic if it's a POST request
if ("POST".equalsIgnoreCase(request.getMethod())) {
    String uname = request.getParameter("username");
    String pass = request.getParameter("password");

    // Simple validation
    if (uname == null || pass == null || uname.trim().isEmpty() || pass.trim().isEmpty()) {
        msg = "Please fill in all fields.";
    } else {
        Connection c = null;
        PreparedStatement ps = null;
        try {
            c = getCon();
            // Using PreparedStatement for secure insertion (to prevent SQL injection)
            ps = c.prepareStatement(
                "INSERT INTO users(username, password) VALUES(?, ?)"
            );
            // NOTE: In a real application, passwords should be securely hashed (e.g., using BCrypt).
            ps.setString(1, uname.trim());
            ps.setString(2, pass.trim());
            ps.executeUpdate();

            success = true; // mark successful registration

        } catch (SQLIntegrityConstraintViolationException e) {
            // Handle case where username already exists (due to UNIQUE constraint)
            msg = "Username already exists. Please choose another.";
        } catch (Exception e) {
            // General database or connection error
            msg = "Error: " + e.getMessage();
        } finally {
            // Close resources
            if (ps != null) try { ps.close(); } catch (SQLException ignore) {}
            if (c != null) try { c.close(); } catch (SQLException ignore) {}
        }
    }
}
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Register</title>
</head>
<body>
    <h2>Register</h2>

    <% if (success) { %>
        <p style="color:green;">Registration successful! </p>
        <p><a href="login.jsp">Click here to Login</a></p>
    <% } else { %>
        <% if (!msg.isEmpty()) { %>
            <p style="color:red;"><%= msg %></p>
        <% } %>

        <!-- Registration Form -->
        <form action="register.jsp" method="post">
            <label>Username:</label>
            <input type="text" name="username" required><br><br>

            <label>Password:</label>
            <input type="password" name="password" required><br><br>

            <input type="submit" value="Register">
        </form>

        <br>
        <p>Already have an account? <a href="login.jsp">Login here</a></p>
    <% } %>
</body>
</html>