<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%
// Check for the standardized session attribute "user"
String user = (String) session.getAttribute("user");
if (user == null) {
    response.sendRedirect("login.jsp");
    return;
}
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Welcome</title>
</head>
<body>
    <h2>Welcome, <%= user %>!</h2>
    <p>You have successfully logged in.</p>
    <p>You can now visit your <a href="dashboard.jsp">Dashboard</a>.</p>
    <a href="logout.jsp">Logout</a>
</body>
</html>