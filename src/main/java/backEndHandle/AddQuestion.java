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

@WebServlet("/AddQuestion")
public class AddQuestion extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out = response.getWriter();
		int questNum = Integer.parseInt(request.getParameter("questNum"));
		String question = request.getParameter("quest");
		String opt1 = request.getParameter("opt1");
		String opt2 = request.getParameter("opt2");
		String opt3 = request.getParameter("opt3");
		String opt4 = request.getParameter("opt4");
		String ansOpt = request.getParameter("ansOpt");
		try {

			/* load driver */
			Class.forName("com.mysql.cj.jdbc.Driver");
			/* connection established  */
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/quiz", "root", "root");

			/* statement creation  */
			Statement stmt = con.createStatement();
			String query = "insert into questions(questnum, quest, opt1, opt2, opt3, opt4) values('" + questNum + "','"
			+ question + "', '" + opt1 + "', '" + opt2 + "', '" + opt3 + "', '" + opt4 + "')";
			stmt.executeUpdate(query);

			Statement stmt1 = con.createStatement();
			String query1 = "insert into answers(questAns, questNum) values('" + ansOpt + "', '" + questNum + "')";
			stmt1.executeUpdate(query1);
			System.out.println("inserted success.");
			con.close();
			
			response.sendRedirect("addQuest.jsp");

		} catch (Exception e) {
			out.println(e.getMessage());
		}
		
	}

}
