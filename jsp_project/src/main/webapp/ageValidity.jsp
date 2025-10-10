<%@ page session="true" %>
<%
    // Get parameters from form submission
    String action = request.getParameter("action");
    String name = "";
    String ageStr = "";
    int age = 0;
    String message = "";

    if ("check".equals(action)) {
        name = request.getParameter("name");
        ageStr = request.getParameter("age");

        try {
            age = Integer.parseInt(ageStr);
        } catch (NumberFormatException e) {
            message = "Please enter a valid age!";
        }

        if (message.isEmpty()) {
            if (age < 18) {
                message = "Hello " + name + ", you are not authorized to visit the site.";
            } else {
                message = "Welcome " + name + " to this site!";
            }
        }
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Age Check</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 50px;
        }
        h2 {
            color: #333;
        }
        form {
            margin-bottom: 20px;
        }
        input[type=text], input[type=number] {
            padding: 8px;
            margin: 5px 0;
            width: 200px;
        }
        input[type=submit] {
            padding: 8px 16px;
        }
        .message {
            margin-top: 20px;
            font-weight: bold;
            color: #00529B;
        }
    </style>
</head>
<body>
    <h2>Enter Your Details</h2>

    <form method="post">
        <input type="hidden" name="action" value="check">
        <label>Name:</label><br>
        <input type="text" name="name" required><br>
        <label>Age:</label><br>
        <input type="number" name="age" required><br><br>
        <input type="submit" value="Submit">
    </form>

<%
    if (!message.isEmpty()) {
%>
    <div class="message"><%= message %></div>
<%
    }
%>
</body>
</html>
