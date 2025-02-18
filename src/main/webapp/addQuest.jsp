<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.io.*"%>
<%@page import="java.lang.*"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.PreparedStatement"%>




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

<!-- fontawesome link  -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css"
	integrity="sha512-Evv84Mr4kqVGRNSgIGL/F/aIDqQb7xQ2vcrdIwxfjThSH8CSR7PBEakCr51Ck+w+/U6swU2Im1vVX0SVk9ABhg=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />

<!-- own css file  -->
<link rel="stylesheet" href="css/style.css">
</head>

<body>

	<!-- #################################### website start #################################### -->
		<div class="container-fluid g-0" style="overflow: hidden;">

		<!-- ---------------------------- navbar start ---------------------------- -->
		
		<!-- ---------------------------- navbar end ---------------------------- -->

			<%@ include file="header.jsp" %>

		<!-- ---------------------------- addQuest start ---------------------------- -->
		<div class="container" id="addQuest">
			<div class="row">
				<div class="col-12">
					<h5 class="text-danger">Note : Don't write/add any question or answer in tag just write tag name</h5>
				</div><br><br>
				<div class="col-12 text-center">
					<button type="button" class="btn btn-outline-warning"
						data-bs-toggle="modal" href="#exampleModalToggle">
						Add Question <i class="fa-solid fa-plus"></i>
					</button>

					<button type="button" class="btn btn-outline-primary"
						data-bs-toggle="modal" href="#editQuestPopup">
						Edit Question <i class="fa-solid fa-pen-to-square"></i>
					</button>

					<button type="button" class="btn btn-outline-danger"
						data-bs-toggle="modal" href="#deleteQuestPopup">
						Delete Question <i class="fa-solid fa-trash"></i>
					</button>
				</div>

				<div class="col-12 mt-3">
					<div class="row">

						<%
						try {

							/* Load driver */
							Class.forName("com.mysql.cj.jdbc.Driver");

							/* Establish connection */
							Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/quiz", "root", "root");
							Statement stmt3 = con.createStatement();
							String query3 = "select * from questions";
							ResultSet res = stmt3.executeQuery(query3);

							while (res.next()) {
						%>


						<div class="col-12">
							<p>
								<span><%=res.getInt(1)%></span>. <span><%=res.getString(2)%></span>
							</p>
							<ul>
								<li><%=res.getString(3)%></li>
								<li><%=res.getString(4)%></li>
								<li><%=res.getString(5)%></li>
								<li><%=res.getString(6)%></li>
							</ul>
						</div>
						<%
							}
						con.close();
						} 
						catch (Exception e) {
							out.println("Error: " + e.getMessage());
						}
						%>


					</div>
				</div>

			</div>
		</div>


		<!-- ------------------------ add question start ------------------------ -->
		<div class="modal fade" id="exampleModalToggle" aria-hidden="true"
			aria-labelledby="exampleModalToggleLabel" tabindex="-1">
			<div class="modal-dialog modal-dialog-centered">
				<div class="modal-content">
					<div class="modal-header">
						<h1 class="modal-title fs-5" id="exampleModalToggleLabel">Add
							Your Question</h1>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div><br>
					<h6 class="text-danger text-center">Please fill all the rows</h6>
					<form action="AddQuestion" method="post">
						<div class="modal-body d-flex flex-column gap-3">
							<input type="number" name="questNum" id="questNum"
								placeholder="Question number" class="form-control" required>

							<input type="text" name="quest" id="quest"
								placeholder="Write Question ..." class="form-control" required>

							<input type="text" name="opt1" id="opt1" placeholder="Option 1"
								class="form-control"> 
								<input type="text" name="opt2"
								id="opt2" placeholder="Option 2" class="form-control" required>

							<input type="text" name="opt3" id="opt3" placeholder="Option 3"
								class="form-control" required> 
							
							<input type="text"
								name="opt4" id="opt4" placeholder="Option 4"
								class="form-control" required> 
								
							<input type="text"
								name="ansOpt" id="ansOpt"
								placeholder="Give correct option from above"
								class="form-control" required>
						</div>
						<div class="modal-footer">
							<button class="btn btn-primary"
								data-bs-target="#exampleModalToggle2" data-bs-toggle="modal"
								type="submit">Save</button>
						</div>
					</form>
				</div>
			</div>
		</div>

		<%
		
		%>


		<!-- ------------------------ add question end ------------------------ -->



		<!-- ------------------------ update question start ------------------------ -->
		
		<div class="modal fade" id="editQuestPopup" aria-hidden="true"
			aria-labelledby="exampleModalToggleLabel" tabindex="-1">
			<div class="modal-dialog modal-dialog-centered">
				<div class="modal-content">
					<div class="modal-header">
						<h1 class="modal-title fs-5" id="exampleModalToggleLabel">Update
							Question</h1>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div><br><br>
					<h6 class="text-danger text-center">Please fill all the rows</h6>

					<form action="UpdateQuestion" method="post">
						<div class="modal-body d-flex flex-column gap-3">
							<input type="number" name="uquestNum" id="uquestNum"
								placeholder="Question number" class="form-control" required>

							<input type="text" name="uquest" id="uquest"
								placeholder="Write Question ..." class="form-control" required>

							<input type="text" name="uopt1" id="uopt1" placeholder="Option 1"
								class="form-control" required> 
							<input type="text"
								name="uopt2" id="uopt2" placeholder="Option 2"
								class="form-control" required> 
							<input type="text"
								name="uopt3" id="uopt3" placeholder="Option 3"
								class="form-control" required> 
							<input type="text"
								name="uopt4" id="uopt4" placeholder="Option 4"
								class="form-control" required> 
							<input type="text"
								name="uansOpt" id="uansOpt"
								placeholder="Give correct option from above"
								class="form-control" required>
						</div>
						<div class="modal-footer">
							<button type="submit" class="btn btn-primary"
								data-bs-target="#exampleModalToggle2" data-bs-toggle="modal">Update</button>
						</div>
					</form>

				</div>
			</div>
		</div>

		<!-- ------------------------ update question end ------------------------ -->





		<!-- ------------------------ delete question start ------------------------ -->
		
		<div class="modal fade" id="deleteQuestPopup" aria-hidden="true"
			aria-labelledby="exampleModalToggleLabel" tabindex="-1">
			<div class="modal-dialog modal-dialog-centered">
				<div class="modal-content">
					<div class="modal-header">
						<h1 class="modal-title fs-5" id="exampleModalToggleLabel">Delete
							Question</h1>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>

					<form action="DeleteQuest" method="post">
						<div class="modal-body d-flex flex-column gap-3">
							<input type="number" name="dquest" id="dquest"
								placeholder="Enter Question number..." class="form-control">
						</div>
						<div class="modal-footer">
							<button class="btn btn-primary"
								data-bs-target="#exampleModalToggle2" data-bs-toggle="modal"
								type="submit">Delete</button>
						</div>
					</form>

				</div>
			</div>
		</div>

		<!-- ------------------------ delete question ends ------------------------ -->

		<!-- ---------------------------- addQuest end ---------------------------- -->



		<!-- ---------------------------- footer start ---------------------------- -->
			<%@ include file="footer.jsp" %>
		<!-- ---------------------------- footer end ---------------------------- -->


		</div>
		<!-- #################################### website end #################################### -->

		<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
			integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
			crossorigin="anonymous"></script>
		<script src="js/script.js"></script>
</body>

</html>