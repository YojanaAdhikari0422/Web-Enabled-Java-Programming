<%@ page import="java.sql.*" %>
<%!
/**
 * CRITICAL SETUP NOTES FOR TOMCAT 11:
 * 1. Database: Ensure you have a running MySQL/MariaDB instance.
 * 2. Schema: Create a database named 'validation' and a table 'users'
 * with columns (id INT PRIMARY KEY AUTO_INCREMENT, username VARCHAR(50) UNIQUE, password VARCHAR(255)).
 * 3. JDBC Driver: Download the 'mysql-connector-j' JAR file and place it
 * in your Tomcat's 'lib' directory.
 */
public Connection getCon() throws Exception {
    // Driver class for modern MySQL Connector/J
    Class.forName("com.mysql.cj.jdbc.Driver");
    return DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/validation",
        "root", // <-- Change to your DB user
        "Cupu@dh1"  // <-- Change to your DB password
    );
}
%>