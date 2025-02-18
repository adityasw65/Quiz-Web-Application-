<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.io.*"%>
<%@page import="java.lang.*"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


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



      <!-- ---------------------------- question starts ---------------------------- -->
      <div class="container" id="question">
         <div class="row">

            <div class="col-12">
               
               	<%@ page import="java.sql.*, java.util.ArrayList" %>
<%
    try {
        /* Load Driver */
        Class.forName("com.mysql.cj.jdbc.Driver");

        /* Establish Connection */
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/quiz", "root", "root"); 

        /* Execute Query */
        Statement stmt = con.createStatement();
        String query = "SELECT * FROM questions";
        ResultSet set = stmt.executeQuery(query);

        /* Store Questions in List */
        ArrayList<ArrayList<String>> questlist = new ArrayList<>();

        while(set.next()) {
            ArrayList<String> quest = new ArrayList<>();
            quest.add(String.valueOf(set.getInt(1))); // Question ID
            quest.add(set.getString(2)); // Question Text
            quest.add(set.getString(3)); // Option 1
            quest.add(set.getString(4)); // Option 2
            quest.add(set.getString(5)); // Option 3
            quest.add(set.getString(6)); // Option 4
            questlist.add(quest);
        }

        /* Close Resources */
        set.close();
        stmt.close();
        con.close();
%>

					<!-- Quiz Form -->
					<form action="ProcessQuizServlet" method="post">
					    <% for(int i = 0; i < questlist.size(); i++) { %>
					        <div class="col-12">
					            <p><span><%= questlist.get(i).get(0) %></span>. <%= questlist.get(i).get(1) %></p>
					        </div>
					        <div class="col-12 options">
					            <div class="row">
					                <div class="col-12 mt-1">
					                    <input type="radio" name="answer<%= i %>" value="<%= questlist.get(i).get(2) %>">
					                    <label><%= questlist.get(i).get(2) %></label>
					                </div>
					                <div class="col-12 mt-1">
					                    <input type="radio" name="answer<%= i %>" value="<%= questlist.get(i).get(3) %>">
					                    <label><%= questlist.get(i).get(3) %></label>
					                </div>
					                <div class="col-12 mt-1">
					                    <input type="radio" name="answer<%= i %>" value="<%= questlist.get(i).get(4) %>">
					                    <label><%= questlist.get(i).get(4) %></label>
					                </div>
					                <div class="col-12 mt-1">
					                    <input type="radio" name="answer<%= i %>" value="<%= questlist.get(i).get(5) %>">
					                    <label><%= questlist.get(i).get(5) %></label>
					                </div>
					            </div>
					        </div><br>
					    <% } %>
					
					    <!-- Submit Button -->
					    <div class="col-12 text-center mt-5">
	               			<button type="submit" class="btn btn-outline-success">Submit Test !</button>
	            		</div>
					</form>
					
					<%
					    } 
						catch(Exception e) {
					        out.println("<p>Error: " + e.getMessage() + "</p>");
					    }
					%>

               </div>
        
	            
         </div>
      </div>
      
      
     
      
      <!-- ---------------------------- question end ---------------------------- -->



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