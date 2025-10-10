<%@ page import="javax.servlet.http.*" %>
<%@ page session="true" %>
<%
    // Check if button clicked
    String action = request.getParameter("action");
%>
<!DOCTYPE html>
<html>
<head>
    <title>List Browser Cookies</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 50px;
        }
        h2 {
            color: #333;
        }
        table {
            border-collapse: collapse;
            margin-top: 20px;
            width: 50%;
        }
        th, td {
            border: 1px solid #666;
            padding: 8px 12px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
        .button {
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <h2>Browser Cookies</h2>

    <form method="get">
        <input type="hidden" name="action" value="list">
        <input type="submit" value="List Cookies">
    </form>

<%
    if ("list".equals(action)) {
        Cookie[] cookies = request.getCookies();

        if (cookies != null && cookies.length > 0) {
%>
    <table>
        <tr>
            <th>Cookie Name</th>
            <th>Cookie Value</th>
        </tr>
<%
            for (Cookie c : cookies) {
%>
        <tr>
            <td><%= c.getName() %></td>
            <td><%= c.getValue() %></td>
        </tr>
<%
            }
%>
    </table>
<%
        } else {
%>
    <p>No cookies found in your browser.</p>
<%
        }
    }
%>
</body>
</html>
