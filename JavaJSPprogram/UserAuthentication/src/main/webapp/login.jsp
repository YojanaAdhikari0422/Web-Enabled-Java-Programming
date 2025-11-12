<%@ page import="java.sql.*" %>
<%@ include file="db.jsp" %>
<%
// If user is already logged in, redirect to the welcome page
if (session.getAttribute("user") != null) {
    response.sendRedirect("welcome.jsp");
    return;
}

String msg = "";

// Only run login logic if it's a POST request
if ("POST".equalsIgnoreCase(request.getMethod())) {
    String uname = request.getParameter("username");
    String pass = request.getParameter("password");

    if (uname == null || pass == null || uname.trim().isEmpty() || pass.trim().isEmpty()) {
        msg = "Please enter username and password.";
    } else {
        Connection c = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            c = getCon();
            // Using PreparedStatement for secure query
            ps = c.prepareStatement(
                "SELECT username FROM users WHERE username=? AND password=?"
            );

            ps.setString(1, uname.trim());
            ps.setString(2, pass.trim()); // Again, hash comparison needed for production
            rs = ps.executeQuery();

            if (rs.next()) {
                // SUCCESS: Set the session attribute 'user' (Standardizing on "user")
                session.setAttribute("user", uname.trim());
                response.sendRedirect("welcome.jsp");
                return;
            } else {
                msg = "Invalid Username or Password";
            }
        } catch (Exception e) {
            msg = "Database Error: " + e.getMessage();
        } finally {
            // Close resources
            if (rs != null) try { rs.close(); } catch (SQLException ignore) {}
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
    <title>Login</title>
</head>
<body>
    <h2>Login</h2>
    <% if (!msg.isEmpty()) { %>
        <p style="color:red;"><%= msg %></p>
    <% } %>

    <form action="login.jsp" method="post">
        <label>Username:</label>
        <input type="text" name="username" required><br><br>

        <label>Password:</label>
        <input type="password" name="password" required><br><br>

        <input type="submit" value="Login">
    </form>

    <p>Don't have an account? <a href="register.jsp">Register here</a></p>
</body>
</html>