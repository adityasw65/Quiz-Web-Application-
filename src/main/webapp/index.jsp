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



      <!-- ---------------------------- startInfo start ---------------------------- -->
      <div class="container" id="startInfo">
         <div class="row">
            <div class="col-12 col-md-4 order-md-1 mx-auto">
               <img src="images/illustration/homeImage.png" class="img-fluid" alt="home image not displayed">
            </div>
            <div class="col-12 col-md-6 order-md-0">
               <p>
                  Welcome to <b>QuizQuest</b>, your ultimate destination for fun, learning, and challenges! Dive into a
                  world of
                  exciting
                  quizzes across diverse topics of programming languages such as Java, Python, Javascript and many more.
                  Whether you're here to test
                  your knowledge, compete with friends, or simply have a good time, we've got something for everyone.
                  With
                  exciting
                  challenges, engaging questions, and detailed feedback, you'll learn while having fun. So, get ready to
                  challenge
                  your
                  brain. Click Start Quiz and let the adventure begin!
               </p>
            </div>
         </div>
      </div>

   <!-- ---------------------------- startInfo end ---------------------------- -->



   <!-- ---------------------------- topics start ---------------------------- -->
   <div class="container" id="topics">
      <div class="row text-center">
         <div class="col-12">
            <h1>Start Quiz <i class="fa-solid fa-book-open-reader"></i>
            </h1>
         </div>
      </div>

		<%
			HttpSession ses = request.getSession();
            String direct = "";
            if(ses.getAttribute("user") == null) {
            	direct = "login.jsp";
            }
            else {
            	direct = "question.jsp";
            }
		%>

      <div class="row justify-content-center mt-4" id="listTopics">
         <a href="<%= direct %>" class="col-12 col-md-5 p-md-0 rounded">
            <div class="text-center py-3">
               <img src="https://img.freepik.com/premium-vector/job-exam-test-vector-illustration_138676-243.jpg"
                  class="img-fluid" alt="test image not displayed">
               <h3 class="mt-3">Continue&nbsp;&nbsp;<i class="fa-solid fa-arrow-right-from-bracket"></i></h3>
            </div>
         </a>
      </div>
   </div>
   <!-- ---------------------------- topics end ---------------------------- -->



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