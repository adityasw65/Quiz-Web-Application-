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

@WebServlet("/UpdateQuestion")
public class UpdateQuestion extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out = response.getWriter();
		try {

			int questNum = Integer.parseInt(request.getParameter("uquestNum"));
			String question = request.getParameter("uquest");
			String opt1 = request.getParameter("uopt1");
			String opt2 = request.getParameter("uopt2");
			String opt3 = request.getParameter("uopt3");
			String opt4 = request.getParameter("uopt4");

			String ansOpt = request.getParameter("uansOpt");

			/* load driver */
			Class.forName("com.mysql.cj.jdbc.Driver");
			/* connection established  */
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/quiz", "root", "root");

			/* print all data  */
			System.out.println(questNum + "\n" + question + "\n" + opt1 + "\n" + opt2 + "\n" + opt3 + "\n" + opt4 + "\n" + ansOpt);
			
			/* statement creation  */
			String query1 = "update questions set quest='" + question + "', opt1='" + opt1 + "', opt2='" + opt2 + "', opt3='"+ opt3 + "', opt4='" + opt4 + "' where questNum='" + questNum +"'";
			
			String query2 = "update answers set questAns='" + ansOpt + "' where questNum='" + questNum + "'";
			
			Statement stmt = con.createStatement();
			stmt.addBatch(query1);
			stmt.addBatch(query2);
			stmt.executeBatch();

			con.close();
			response.sendRedirect("addQuest.jsp");
		} 
		catch (Exception e) {
			out.println(e.getMessage());
		}
	}

}
