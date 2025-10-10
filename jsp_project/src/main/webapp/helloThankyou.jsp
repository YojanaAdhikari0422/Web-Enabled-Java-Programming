<%@ page import="java.time.*, java.time.format.*" %>
<%@ page session="true" %>
<%
    // Initialize variables
    String action = request.getParameter("action");
    String name = (String) session.getAttribute("name");
    LocalDateTime startTime = (LocalDateTime) session.getAttribute("startTime");

    // If user submitted name (login)
    if ("login".equals(action)) {
        name = request.getParameter("name");
        startTime = LocalDateTime.now();
        session.setAttribute("name", name);
        session.setAttribute("startTime", startTime);
    }

    // If user clicked logout
    if ("logout".equals(action)) {
        LocalDateTime endTime = LocalDateTime.now();
        Duration duration = Duration.between(startTime, endTime);
        long totalSeconds = duration.getSeconds();
        long minutes = totalSeconds / 60;
        long seconds = totalSeconds % 60;

        session.invalidate(); // clear session

%>
<!DOCTYPE html>
<html>
<head>
    <title>Logout</title>
</head>
<body>
    <h2>Thank You, <%= name %>!</h2>
    <p>You were logged in for <%= minutes %> minutes and <%= seconds %> seconds.</p>
</body>
</html>
<%
        return; // stop rest of page execution
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Single JSP Session Example</title>
    <style>
        .top-right {
            position: absolute;
            right: 20px;
            top: 20px;
            font-weight: bold;
        }
    </style>
</head>
<body>
<%
    if (name == null) {
%>
    <!-- Login Form -->
    <h2>Enter Your Name</h2>
    <form method="post">
        <input type="hidden" name="action" value="login">
        <input type="text" name="name" required>
        <input type="submit" value="Submit">
    </form>
<%
    } else {
        DateTimeFormatter fmt = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
%>
    <!-- Welcome Page -->
    <div class="top-right">Start Time: <%= startTime.format(fmt) %></div>
    <h2>Hello, <%= name %>!</h2>
    <form method="post">
        <input type="hidden" name="action" value="logout">
        <input type="submit" value="Logout">
    </form>
<%
    }
%>
</body>
</html>
