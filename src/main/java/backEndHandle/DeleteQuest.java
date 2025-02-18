package backEndHandle;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/DeleteQuest")
public class DeleteQuest extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			int delQuest = Integer.parseInt(request.getParameter("dquest"));

			/* load driver */
			Class.forName("com.mysql.cj.jdbc.Driver");
			/* connection established  */
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/quiz", "root", "root");

			/* statement creation  */
			String query1 = "delete from questions where questNum=?";
			PreparedStatement pstmt1 = con.prepareStatement(query1);
			pstmt1.setInt(1, delQuest);
			pstmt1.executeUpdate();

			String query2 = "delete from answers where questNum=?";
			PreparedStatement pstmt2 = con.prepareStatement(query2);
			pstmt2.setInt(1, delQuest);
			pstmt2.executeUpdate();

			con.close();
			response.sendRedirect("addQuest.jsp");
		} 
		catch (Exception e) {
			e.getMessage();
		}
	}

}
