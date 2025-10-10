<%@ page import="java.util.*" %>
<%@ page session="true" %>
<%
    // Example: Setting some session and application attributes
    session.setAttribute("sessionMessage", "This is a session attribute.");
    application.setAttribute("appMessage", "This is an application attribute.");
%>

<!DOCTYPE html>
<html>
<head>
    <title>JSP Intrinsic Objects Demo</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 40px; }
        h2 { color: #333; }
        table { border-collapse: collapse; width: 80%; margin-top: 20px; }
        th, td { border: 1px solid #666; padding: 8px 12px; text-align: left; }
        th { background-color: #f2f2f2; }
    </style>
</head>
<body>
    <h2>Demo of JSP Intrinsic Objects</h2>
    <table>
        <tr><th>Intrinsic Object</th><th>Description / Value</th></tr>
        <tr>
            <td>request</td>
            <td>Request URI: <%= request.getRequestURI() %></td>
        </tr>
        <tr>
            <td>response</td>
            <td>Content Type: <%= response.getContentType() %></td>
        </tr>
        <tr>
            <td>out</td>
            <td>Output object used to display this page.</td>
        </tr>
        <tr>
            <td>session</td>
            <td>Session ID: <%= session.getId() %><br>
                Session Attribute: <%= session.getAttribute("sessionMessage") %>
            </td>
        </tr>
        <tr>
            <td>application</td>
            <td>Application Attribute: <%= application.getAttribute("appMessage") %></td>
        </tr>
        <tr>
            <td>config</td>
            <td>Servlet Name: <%= config.getServletName() %></td>
        </tr>
        <tr>
            <td>pageContext</td>
            <td>Page Scope attribute example: Setting attribute "pageMsg"</td>
        </tr>
        <tr>
            <td>page</td>
            <td>Refers to this JSP page itself (current object).</td>
        </tr>
        <tr>
            <td>exception</td>
            <td>Used in error pages (not shown here).</td>
        </tr>
    </table>

<%
    // Example using pageContext
    pageContext.setAttribute("pageMsg", "This is a page-scoped attribute.");
%>

<p>Page-scoped Attribute: <%= pageContext.getAttribute("pageMsg") %></p>

</body>
</html>
