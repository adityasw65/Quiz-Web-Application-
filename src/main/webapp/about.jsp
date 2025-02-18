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
      <!-- ---------------------------- navbar start ------------------------------>
      		<%@ include file="header.jsp" %>
      <!-- ---------------------------- navbar end ------------------------------>



      <!-- ---------------------------- about start ---------------------------- -->
      <div class="container" id="about">
         <div class="row">
            <div class="col-12 col-md-4">
               <img src="https://t4.ftcdn.net/jpg/01/08/34/53/360_F_108345358_mREIebrNXJM0iuAlxvEshj1j2QrhhzpK.jpg"
                  alt="about image not displayed" class="img-fluid">
            </div>
            <div class="col-12 col-md-7">
               <p>
                  Welcome to <b>QuizQuest</b> - a platform designed to ignite curiosity and expand your knowledge!
                  We are passionate about creating a space where learning becomes exciting and engaging. Our application
                  offers a
                  diverse range of thoughtfully curated questions that challenge your intellect and inspire critical
                  thinking.
               </p>
               <p>
                  Whether
                  you're looking to learn something new, test your knowledge, or simply have fun while exploring
                  thought-provoking
                  topics, our platform is here to make the experience enjoyable and rewarding. Driven by a commitment to
                  quality and
                  innovation, our goal is to make education accessible and interactive. Join us on this journey of
                  discovery,
                  where
                  every question is an opportunity to learn, grow, and think differently. Let's make learning an
                  adventure
                  together!
               </p>
            </div>
         </div>
      </div>
      <!-- ---------------------------- about end ---------------------------- -->



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