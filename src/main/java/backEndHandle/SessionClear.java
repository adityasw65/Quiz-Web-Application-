package backEndHandle;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/SessionClear")
public class SessionClear extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		PrintWriter out = response.getWriter();
		try {
			HttpSession ses = request.getSession(); 
      	ses.removeAttribute("user");
			response.sendRedirect("index.jsp");
		}
		catch(Exception e) {
			out.println(e.getMessage());
		}

	}

}
