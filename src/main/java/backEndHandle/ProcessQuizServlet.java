package backEndHandle;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.util.ArrayList;
import java.util.Date;

@WebServlet("/ProcessQuizServlet")
public class ProcessQuizServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
		 
		PrintWriter out = response.getWriter();
		try {
			
//			load the driver
			Class.forName("com.mysql.cj.jdbc.Driver");
			
//			connection established 
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/quiz");
			
//			Statement created
			Statement stmt = con.createStatement();
			ResultSet rset = stmt.executeQuery("select * from answers");

			int i = 0;
			int score = 0;

			ArrayList<String> ansData = new ArrayList<>();
			while(rset.next()) {
				String ans = rset.getString("questAns");
				ansData.add(ans);
				if(request.getParameter("answer" + i) != null && request.getParameter("answer" + i).equals(ans)) 
				{
					score++;
				}
				i++;
			}
			
			Cookie cook1 = new Cookie("score", score+"");
			Cookie cook2 = new Cookie("totalScore", i+"");
			response.addCookie(cook1);
			response.addCookie(cook2);
			
			
			
			Date date = new Date();
			java.sql.Date sqlDate = new java.sql.Date(date.getTime());
			
			HttpSession session = request.getSession();
			
			String resultQuery = "insert into results(user_mail, submissionDate, marks) values(?, ?, ?)";
			String userMail = session.getAttribute("user").toString();
			
			PreparedStatement pstmt = con.prepareStatement(resultQuery);
			pstmt.setString(1, userMail);
			pstmt.setDate(2, sqlDate);
			pstmt.setInt(3, score);
			pstmt.executeUpdate();
			
			response.sendRedirect("result.jsp");
//			out.println("Total score is : " + score);
			
		}
		catch(Exception e) {
			out.println(e.getMessage());
		}
		
		
	}
}
