package calculator;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class cal extends HttpServlet {
    
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        double num1 = Double.parseDouble(req.getParameter("num1"));
        double num2 = Double.parseDouble(req.getParameter("num2"));
        String op = req.getParameter("op");

        double result = 0;
        String message;

        switch (op) {
            case "+":
                result = num1 + num2;
                message = "Result: " + result;
                break;
            case "-":
                result = num1 - num2;
                message = "Result: " + result;
                break;
            case "*":
                result = num1 * num2;
                message = "Result: " + result;
                break;
            case "/":
                if (num2 != 0) {
                    result = num1 / num2;
                    message = "Result: " + result;
                } else {
                    message = "Error: Division by zero!";
                }
                break;
            default:
                message = "Invalid operator! Use +, -, * or /";
        }

        res.setContentType("text/html");
        res.getWriter().println("<h2>" + message + "</h2>");
    }
}