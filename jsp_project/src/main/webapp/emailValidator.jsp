<%@ page session="true" %>
<%
    String action = request.getParameter("action");
    String email = "";
    String message = "";

    if ("check".equals(action)) {
        email = request.getParameter("email");

        if (email == null || email.isEmpty()) {
            message = "Please enter an email ID!";
        } else {
            int atPos = email.indexOf("@");
            int lastAtPos = email.lastIndexOf("@");
            int dotPos = email.lastIndexOf(".");

            // Conditions:
            // 1. Exactly one "@"
            // 2. At least one "." after "@"
            // 3. At least two characters between "@" and "."
            // 4. At least two characters after last "."
            if (atPos == -1 || atPos != lastAtPos) {
                message = "Invalid Email: must contain exactly one '@' symbol.";
            } else if (dotPos == -1 || dotPos < atPos + 3) {
                message = "Invalid Email: must contain '.' at least two characters after '@'.";
            } else if (email.length() - dotPos - 1 < 2) {
                message = "Invalid Email: must have at least two characters after last '.'.";
            } else {
                message = "Valid Email ID: " + email;
            }
        }
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Email Validator</title>
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
        input[type=text] {
            padding: 8px;
            width: 300px;
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
    <h2>Check Email Validity</h2>
    <form method="post">
        <input type="hidden" name="action" value="check">
        <label>Enter Email:</label><br>
        <input type="text" name="email" required><br><br>
        <input type="submit" value="Check">
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
