<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%
// Invalidate the entire session, removing all attributes (like "user")
session.invalidate();
// Redirect user back to the login page
response.sendRedirect("login.jsp");
%>