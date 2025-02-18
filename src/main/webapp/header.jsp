<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.io.*"%>
<%@page import="java.lang.*"%>
<%@page import="java.util.*"%>


<div class="container-fluid" >
	<div class="row ">
		<div class="col-12">

			<nav class="navbar navbar-expand-lg fixed-top " id="navbar">
				<div class="container-fluid ">
					<a class="navbar-brand" href="index.html"> <img
						src="images/illustration/logo.png" class="img-fluid"
						alt="logo not displayed">
					</a>
					<button class="navbar-toggler" type="button"
						data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
						aria-controls="navbarSupportedContent" aria-expanded="false"
						aria-label="Toggle navigation">
						<span class="navbar-toggler-icon"></span>
					</button>
					<div class="collapse navbar-collapse" id="navbarSupportedContent">
						<ul
							class="navbar-nav text-center mx-auto mb-2 mb-lg-0 gap-0 gap-md-4 text-uppercase fw-bold">
							<li class="nav-item"><a class="nav-link" aria-current="page"
								href="index.jsp">Home</a></li>
							<li class="nav-item"><a class="nav-link" href="about.jsp">About
									Us</a></li>
							<!--  <li class="nav-item"><a class="nav-link"
										href="contact.jsp">Contact Us</a></li>-->
							<li class="nav-item"><a class="nav-link" href="login.jsp">Login</a>
							</li>
							<li class="nav-item"><a class="nav-link" href="register.jsp">Registration</a></li>
							<li class="nav-item"><a class="nav-link" href="admin.jsp">Admin</a>
							</li>

							<%
							int marks = 0;
							String user = "";
							HttpSession sess = request.getSession();
							if (sess.getAttribute("user") != null) {
							%>

							<!-- modal button -->
							<button type="button" class="btn btn-primary"
								data-bs-toggle="modal" data-bs-target="#exampleModal">
								Check Result !</button>

							<%
							/* load driver  */
							Class.forName("com.mysql.cj.jdbc.Driver");

							/* connection established  */
							Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/quiz", "root", "root");

							/* statement creation */
							Statement stmt = con.createStatement();

							if (sess.getAttribute("user") != null) {
								String mail = sess.getAttribute("user").toString();
								String query1 = "select * from results where user_mail = '" + mail + "'";
								ResultSet rst = stmt.executeQuery(query1);
								while (rst.next()) {
									user = rst.getString("user_mail");
									marks = rst.getInt("marks");
								}
							}

							}
							%>

							<%
							if (sess.getAttribute("user") != null) {
							%>

							<li class="nav-item"><a class="nav-link" href="Logout">Logout</a>
							</li>
							<%
							}
							if (sess.getAttribute("user") == user) {
								user = sess.getAttribute("user").toString();
							}
							%>
						</ul>
					</div>
				</div>
			</nav>


			<!-- Modal -->
			<div class="modal fade" id="exampleModal" tabindex="-1"
				aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h1 class="modal-title fs-5" id="exampleModalLabel">
								According To Latest Update...</h1>
							<button type="button" class="btn-close " data-bs-dismiss="modal"
								aria-label="Close"></button>
						</div>
						<div class="modal-body">
							<h4 class="text-center">
								<%=user != null ? "Username : " + user : "User not LoggedIn!" %></h4>
							<h4 class="text-center">
								<%=marks == 0 ? "Login Please :(" : "You got Marks : " + marks%></h4>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-bs-dismiss="modal">Done :>)</button>
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>
</div>