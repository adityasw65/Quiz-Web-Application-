function enableFields() {
   let inputArr = document.getElementsByTagName("input");
   for (let i = 0; i < inputArr.length; i++) {
      inputArr[i].removeAttribute("disabled");
   }
}

function disableFields() {
   console.log("hello");
   let inputArr = document.getElementsByTagName("input");
   for (let i = 0; i < inputArr.length; i++) {
      inputArr[i].setAttribute("disabled", "true");
   }
}

let adminLogin = document.getElementById("adloginBtn");
adminLogin.addEventListener("click", (e) => {
   let aduser = document.getElementById("aduser").value;
   let adpass = document.getElementById("adpass").value;
   let form = document.getElementById("form");
   if (aduser == "maharaja") {
      if (adpass == "adminAditya3248") {
         alert("You logged in successfully....");
         form.setAttribute("action", "addQuest.jsp");
         //window.location.href = "addQuest.jsp";
      }
      else {
         alert("Wrong password");
         e.preventDefault();
      }
   }
   else {
      alert("Wrong username");
      e.preventDefault();
   }
});


