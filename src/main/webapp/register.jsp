<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@page import="java.sql.*"%>
        <%@page import="java.io.*"%>
        <%@page import="java.lang.*"%>
        <%@page import="java.sql.DriverManager" %>
        <%@page import="java.util.*"%>
        <%@page import="java.sql.Connection"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Quiz Application</title>
<link rel="icon" type="image/x-icon" href="images/illustration/logo.png">

<!-- fontawesome cdn  -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.1/css/all.min.css"
	integrity="sha512-5Hs3dF2AEPkpNAR7UiOHba+lRSJNeM2ECkwxUIxC1Q/FLycGTbNapWXB4tP889k5T5Ju8fs4b1P5z/iB4nMfSQ=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<!-- bootstrap online cdn  -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<!-- own css file  -->
<link rel="stylesheet" href="css/style.css">
</head>

<body>

	<!-- #################################### website start #################################### -->
		<div class="container-fluid g-0" style="overflow: hidden;">
		<!-- ---------------------------- navbar start ---------------------------- -->
		<%@ include file="header.jsp" %>
		<!-- ---------------------------- navbar end ---------------------------- -->



		<!-- ---------------------------- register start ---------------------------- -->
		<div class="contianer" id="register">
			<div class="row justify-content-center">
				<div class="col-12 col-md-5">
					<form action="Registration" method="post">
						<div class="mb-3">
							<label for="user" class="form-label">Enter Username</label> <input
								type="text" name="user" id="user" placeholder="John Doe"
								class="form-control" autocomplete="off" required>
						</div>
						<div class="mb-3">
							<label for="mail" class="form-label">Enter Email ID</label> <input
								type="email" name="mail" id="mail" placeholder="abc@gmail.com"
								class="form-control" autocomplete="off" required>
						</div>
						<div class="mb-3">
							<label for="num" class="form-label">Enter Phone Number</label> <input
								type="number" name="num" id="num" placeholder="1111111111"
								class="form-control" autocomplete="off" required>
						</div>
						<div class="mb-5">
							<label for="pass" class="form-label">Set Password</label> <input
								type="password" name="pass" id="pass" placeholder="johndoe@421"
								class="form-control" autocomplete="off" required>
						</div>
						<div class="mb-4 text-center" id="registerBtn">
							<button type="submit">Register here</button>
						</div>
						<div class="mb-3 text-center" id="inAcc">
							<p>
								Already have an Account? <a href="login.jsp">Login</a>
							</p>
						</div>
					</form>
				</div>
			</div>
		</div>
		<!-- ---------------------------- register end ---------------------------- -->



		<!-- ---------------------------- footer start ---------------------------- -->
		<%@ include file="footer.jsp" %>
		<!-- ---------------------------- footer end ---------------------------- -->

<%-- 
		<%
			
			try {
				String user = request.getParameter("user");
				String mail = request.getParameter("mail");
				long phone = Long.parseLong(request.getParameter("num"));
				String pass = request.getParameter("pass");
	
				/* load driver */ 
				Class.forName("com.mysql.cj.jdbc.Driver");
				/* connection established  */
				Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/quiz", "root", "root");
				/* statement creation  */
				Statement stmt = con.createStatement();
				String query = "insert into userregistration(user_name, user_mail, user_num, user_passw) values('" + user + "', '"
				+ mail + "', '" + phone + "', '" + pass + "')";
				stmt.executeUpdate(query);
	
				con.close();

	
			} catch (Exception e) {
				e.getMessage();
			}
		%>
 --%>
		</div>
		<!-- #################################### website end #################################### -->

		<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
			integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
			crossorigin="anonymous"></script>
		<script src="js/script.js"></script>
</body>

</html>