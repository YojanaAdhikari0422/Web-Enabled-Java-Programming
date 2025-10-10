<%@ page import="java.util.*,java.sql.*,javax.mail.*,javax.mail.internet.*,javax.activation.*" %>
<%@ page import="OTPMailer" %>
<%
String email = request.getParameter("email");
String otp = String.valueOf((int)(Math.random()*900000)+100000);  // 6-digit OTP

if (email != null) {
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","password");
    PreparedStatement ps = con.prepareStatement("SELECT * FROM users WHERE email=?");
    ps.setString(1, email);
    ResultSet rs = ps.executeQuery();

    if (rs.next()) {
        session.setAttribute("otp", otp);
        session.setAttribute("email", email);
        OTPMailer.send(email, otp);  // send email
        response.sendRedirect("reset.jsp");
        return;
    } else {
        out.println("<script>alert('Email not registered');</script>");
    }
    con.close();
}
%>

<html>
<body>
<h2>Forgot Password</h2>
<form method="post">
    Enter registered email: <input type="email" name="email" required />
    <input type="submit" value="Send OTP" />
</form>
</body>
</html>
