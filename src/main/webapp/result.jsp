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
    <title>Result Page</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5 text-center">
        <div class="card shadow-lg p-4">
            <h2 class="text-success">Quiz Result</h2>
            <hr>
            <%
            	String score = "";
            	String totalScore = "";
            	Cookie cooks[] = request.getCookies();
            	for(Cookie cook : cooks) {
            		if((cook.getName()).equals("score")) {
            			score = cook.getValue();
            		}
            		if((cook.getName()).equals("totalScore")) {
            			totalScore = cook.getValue();
            		}
            	}	
            %>
            
            <h4 class="text-danger">Note : If you want to give test again then just click on "Go to Home" otherwise click on "Logout!". If you didn't logout and just closed the tab then anyone can give direct test through your ID</h4>
            
            <p class="fs-4">Congratulations! You have completed the quiz.</p>
            <p class="fs-5">Your Score: <strong id="score"><%= score %></strong>/<%= totalScore %></p>
            <a href="index.jsp" class="btn btn-primary mt-3">Go to Home</a>            
            <a href="SessionClear" class="btn btn-danger mt-3">Logout!</a>
            
        </div>
    </div>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
