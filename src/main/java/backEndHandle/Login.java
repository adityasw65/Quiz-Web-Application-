package backEndHandle;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		try {
			
			String mail = request.getParameter("mail");
			String pass = request.getParameter("pass");

			/* load driver */ 
			Class.forName("com.mysql.cj.jdbc.Driver");
			/* connection established  */
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/quiz", "root", "root");
			/* statement creation  */
			String query = "select user_mail, user_passw from userregistration where user_mail=? and user_passw=?";
			PreparedStatement pstmt = con.prepareStatement(query);
			pstmt.setString(1, mail);
			pstmt.setString(2, pass);
			ResultSet rst = pstmt.executeQuery();
			if(rst.next()) {
				HttpSession session = request.getSession();
				session.setAttribute("user", mail);
				response.sendRedirect("index.jsp");
			}
			else {
				response.sendRedirect("login.jsp");
			}
			con.close();

		} catch (Exception e) {
			out.println(e.getMessage());
		}
	}

}
