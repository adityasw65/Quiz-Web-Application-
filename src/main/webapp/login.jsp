<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@page import="java.sql.*"%>
        <%@page import="java.io.*"%>
        <%@page import="java.lang.*"%>
        <%@page import="java.sql.*" %>
        <%@page import="java.util.*"%>
        <%@page import="java.sql.*"%>



<!DOCTYPE html>
<html lang="en">

<head>
   <meta charset="UTF-8">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>Quiz Application</title>
   <link rel="icon" type="image/x-icon" href="images/illustration/logo.png">

   <!-- fontawesome cdn  -->
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.1/css/all.min.css"
      integrity="sha512-5Hs3dF2AEPkpNAR7UiOHba+lRSJNeM2ECkwxUIxC1Q/FLycGTbNapWXB4tP889k5T5Ju8fs4b1P5z/iB4nMfSQ=="
      crossorigin="anonymous" referrerpolicy="no-referrer" />
   <!-- bootstrap online cdn  -->
   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
      integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
   <!-- own css file  -->
   <link rel="stylesheet" href="css/style.css">
</head>

<body>

   <!-- #################################### website start #################################### -->

		<div class="container-fluid g-0" style="overflow: hidden;">
      <!-- ---------------------------- navbar start ---------------------------- -->
      <%@ include file="header.jsp" %>
      <!-- ---------------------------- navbar end ---------------------------- -->



      <!-- ---------------------------- login start ---------------------------- -->
      <div class="contianer" id="login">
         <div class="row justify-content-center">
            <div class="col-12 col-md-5">
               <form action="Login" method="post">
                  <div class="mb-3">
                     <label for="user" class="form-label">Enter Email</label>
                     <input type="email" name="mail" id="mail" placeholder="Email ID" class="form-control"
                        autocomplete="off" required>
                  </div>
                  <div class="mb-5">
                     <label for="pass" class="form-label">Enter Password</label>
                     <input type="password" name="pass" id="pass" placeholder="Password" class="form-control"
                        autocomplete="off" required>
                  </div>
                  <div class="mb-4 text-center" id="loginBtn">
                     <button type="submit">Login here</button>
                  </div>
                  <div class="mb-3 text-center" id="createAcc">
                     <p>Need an Account? <a href="register.jsp">Register</a></p>
                  </div>
               </form>
            </div>
         </div>
      </div>
      <!-- ---------------------------- login end ---------------------------- -->

<%-- 	
	<%
			
			try {
				
				String mail = request.getParameter("mail");
				String pass = request.getParameter("pass");
	
				/* load driver */ 
				Class.forName("com.mysql.cj.jdbc.Driver");
				/* connection established  */
				Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/quiz", "root", "root");
				/* statement creation  */
				String query = "select user_mail, user_pass from userregistration where user_mail=? and user_pass=?";
				PreparedStatement pstmt = con.prepareStatement(query);
				pstmt.setString(1, mail);
				pstmt.setString(2, pass);
				ResultSet rst = pstmt.executeQuery();
				while(rst.next()) {
					String u = rst.getString(1);
					String m = rst.getString(3);
					String p = rst.getString(5);
					if(mail.equals(m)) {
						if(pass.equals(p)) {
							Cookie cook = new Cookie("user", u+"");
							response.addCookie(cook);
							response.sendRedirect("question.jsp");
						}
						else {
							response.sendRedirect("login.jsp");
						}
					}
					else {
						response.sendRedirect("login.jsp");
					}
				}
				con.close();
	
			} catch (Exception e) {
				e.getMessage();
			}
		%>

 --%>
      <!-- ---------------------------- footer start ---------------------------- -->
      <%@ include file="footer.jsp" %>
      <!-- ---------------------------- footer end ---------------------------- -->
		</div>


      <!-- #################################### website end #################################### -->

      <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
         integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
         crossorigin="anonymous"></script>
      <script src="js/script.js"></script>
</body>

</html>