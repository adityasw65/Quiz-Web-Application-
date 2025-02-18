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



      <!-- ---------------------------- admin start ---------------------------- -->
      <div class="contianer" id="admin">
         <div class="row justify-content-center">
            <div class="col-12 col-md-5">
               <form id="form" method="post">
                  <div class="mb-3">
                     <label for="aduser" class="form-label">Admin Username</label>
                     <input type="text" name="aduser" id="aduser" placeholder="Username" class="form-control"
                        autocomplete="off" required>
                  </div>
                  <div class="mb-5">
                     <label for="adpass" class="form-label">Admin Password</label>
                     <input type="password" name="adpass" id="adpass" placeholder="Password" class="form-control"
                        autocomplete="off" required>
                  </div>
                  <div class="mb-4 text-center" id="adloginBtn">
                     <button type="submit">Login here</button>
                  </div>
                  <div class="mb-3 text-center" id="note">
                     <p class="text-danger fw-semibold">Note : Please make sure, this page is not for any User, Only for Admin
                     </p>
                  </div>
               </form>
               
               
               
            </div>
         </div>
      </div>
      <!-- ---------------------------- admin end ---------------------------- -->



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