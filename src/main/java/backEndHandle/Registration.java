package backEndHandle;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Registration")
public class Registration extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		PrintWriter out = response.getWriter();
		String user = request.getParameter("user");
		String mail = request.getParameter("mail");
		long phone = Long.parseLong(request.getParameter("num"));
		String pass = request.getParameter("pass");
		try {

//			load driver 
			Class.forName("com.mysql.cj.jdbc.Driver");
//			connection established 
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/quiz", "root", "root");
//			statement creation 
			Statement stmt = con.createStatement();
			String query = "insert into userregistration(user_name, user_mail, user_num, user_passw) values('" + user + "', '" + mail + "', '" + phone + "', '" + pass + "')";
			stmt.executeUpdate(query);
			
			con.close();
			response.sendRedirect("login.jsp");
			
		}
		catch(Exception e) {
			out.println(e.getMessage());
		}
		
		
	}

}
