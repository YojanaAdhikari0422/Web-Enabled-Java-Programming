<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%
// Check if user is logged in using the standardized session attribute "user"
String user = (String)session.getAttribute("user");
if(user == null) {
    response.sendRedirect("login.jsp");
    return;
}
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <title>Dashboard</title>
</head>
<body>
    <h2>Welcome to the Dashboard, <%= user %>!</h2>
    <p>This is your dashboard. This page is protected and only logged-in users can see this content.</p>
    <a href="logout.jsp">Logout</a>
</body>
</html>