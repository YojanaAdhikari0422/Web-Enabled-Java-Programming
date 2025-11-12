<%@ page import="java.sql.*" %>
<%
String resultMsg = "";
int rows = 0;

// 1. Get parameters from the form
String empid = request.getParameter("empid");
String name = request.getParameter("name");
String desg = request.getParameter("desg");

// 2. Parse numeric parameters, handling potential errors if fields are empty/invalid
int age = 0;
double sal = 0.0;
try {
    age = Integer.parseInt(request.getParameter("age"));
    sal = Double.parseDouble(request.getParameter("salary"));
} catch (NumberFormatException e) {
    // Set an error message if parsing fails
    resultMsg = "Error: Age or Salary input is invalid (must be a number).";
}


// --- Database Configuration ---
// !!! IMPORTANT: CHANGE dbPass if your MySQL root password is not 1083.
// If you used our previous steps, it might be 'Cupu'.
String jdbcUrl = "jdbc:mysql://localhost:3306/Emp?allowPublicKeyRetrieval=true&useSSL=false";
String dbUser = "root";
String dbPass = "Cupu@dh1"; 

// Using a more standard query structure: UPDATE [table] SET ...
String sql = "UPDATE employee SET name=?, age=?, desg=?, salary=? WHERE empid=?";

Connection con = null;
PreparedStatement ps = null;

if (resultMsg.isEmpty()) { // Only proceed if number parsing was successful
    try {
        // Load the MySQL JDBC Driver
        Class.forName("com.mysql.cj.jdbc.Driver");
        
        // Establish connection
        con = DriverManager.getConnection(jdbcUrl, dbUser, dbPass);
        ps = con.prepareStatement(sql);

        // Set parameters for the PreparedStatement
        ps.setString(1, name);
        ps.setInt(2, age);
        ps.setString(3, desg);
        ps.setDouble(4, sal);
        ps.setString(5, empid); // WHERE clause criteria

        // Execute the update
        rows = ps.executeUpdate();
        
    } catch (SQLException e) {
        // Handle database-specific errors (connection failed, table doesn't exist, etc.)
        resultMsg = "Database Error: " + e.getMessage();
    } catch (ClassNotFoundException e) {
        resultMsg = "Driver Error: MySQL JDBC driver not found.";
    } catch (Exception e) {
        resultMsg = "Unknown Error: " + e.getMessage();
    } finally {
        // Close resources to prevent leaks
        if (ps != null) { try { ps.close(); } catch (SQLException ignore) {} }
        if (con != null) { try { con.close(); } catch (SQLException ignore) {} }
    }
}

// Set final message if no errors occurred
if (resultMsg.isEmpty()) {
    if (rows > 0) {
        resultMsg = "Employee Record Updated Successfully!";
    } else {
        resultMsg = "Update Failed. No employee found with ID: " + empid;
    }
}

// Determine style based on success/failure
String style = (rows > 0 && resultMsg.equals("Employee Record Updated Successfully!")) ? "color: green; border: 1px solid green;" : "color: red; border: 1px solid red;";
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Update Result</title>
    <style>
        body { font-family: 'Inter', sans-serif; display: flex; justify-content: center; align-items: center; min-height: 100vh; background-color: #f0f4f8; flex-direction: column; }
        .message-box { padding: 30px; border-radius: 8px; font-weight: bold; font-size: 1.2em; text-align: center; background: white; box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1); width: 350px; }
        a { color: #3b82f6; text-decoration: none; margin-top: 20px; display: inline-block; padding: 10px 15px; border: 1px solid #3b82f6; border-radius: 6px; transition: background-color 0.3s; }
        a:hover { background-color: #eff6ff; }
    </style>
</head>
<body>
    <div class="message-box" style="<%= style %>">
        <%= resultMsg %>
    </div>
    <a href="emp.jsp">Go Back to Update Form</a>
</body>
</html>