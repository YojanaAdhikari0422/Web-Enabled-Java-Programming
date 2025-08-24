package loginPage;

import java.io.IOException;

import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class login extends HttpServlet
{
	public void service(HttpServletRequest req, HttpServletResponse res) throws IOException
	{
		String uname = "Yojana" , upassword = "1234";
		
		String name = req.getParameter("name");
		String password = req.getParameter("password");
		
		if(uname.equals(name) && upassword.equals(password))
		{
			res.getWriter().println("Hello " + uname);
		}
		else
		{
			res.getWriter().println("Login failed");
		}
	}
}
