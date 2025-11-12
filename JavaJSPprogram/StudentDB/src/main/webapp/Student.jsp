<%@ page import="java.sql.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%
    // Read the register number from request
    String reg = request.getParameter("regno");

    String name = null;
    int m1 = 0, m2 = 0, m3 = 0;

    if (reg != null && !reg.trim().isEmpty()) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            String url = "jdbc:mysql://localhost:3306/Stud?useSSL=false&serverTimezone=UTC";
            String user = "root";        // 🔹 change if different
            String pass = "Cupu@dh1";        // 🔹 change if different

            String sql = "SELECT name, m1, m2, m3 FROM student WHERE regno = ?";

            try (Connection con = DriverManager.getConnection(url, user, pass);
                 PreparedStatement ps = con.prepareStatement(sql)) {

                ps.setString(1, reg);
                try (ResultSet rs = ps.executeQuery()) {
                    if (rs.next()) {
                        name = rs.getString("name");
                        m1 = rs.getInt("m1");
                        m2 = rs.getInt("m2");
                        m3 = rs.getInt("m3");
                    }
                }
            }
        } catch (Exception e) {
            out.println("<p style='color:red;'>Database Error: " + e.getMessage() + "</p>");
        }
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Mark List Result</title>
    <style>
        body { font-family: Arial; background: #eef6ff; text-align: center; padding: 50px; }
        table { margin: auto; border-collapse: collapse; width: 50%; background: white; box-shadow: 0 0 10px #ccc; }
        th, td { border: 1px solid #ccc; padding: 10px; }
        th { background: #007bff; color: white; }
        h2 { color: #007bff; }
    </style>
</head>
<body>
<% if (name == null) { %>
    <h2>No record found for Reg. No: <%= reg %></h2>
<% } else {
    int total = m1 + m2 + m3;
    double avg = total / 3.0;
    String result = (avg >= 50) ? "PASS" : "FAIL";
%>
    <h2>Mark List</h2>
    <table>
        <tr><th>Register No</th><td><%= reg %></td></tr>
        <tr><th>Name</th><td><%= name %></td></tr>
        <tr><th>Subject 1</th><td><%= m1 %></td></tr>
        <tr><th>Subject 2</th><td><%= m2 %></td></tr>
        <tr><th>Subject 3</th><td><%= m3 %></td></tr>
        <tr><th>Total</th><td><%= total %></td></tr>
        <tr><th>Average</th><td><%= String.format("%.2f", avg) %></td></tr>
        <tr><th>Result</th><td><%= result %></td></tr>
    </table>
    <br>
    <a href="stud.html">🔙 Search Again</a>
<% } %>
</body>
</html>
