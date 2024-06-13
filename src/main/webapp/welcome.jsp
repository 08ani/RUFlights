<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome</title>
</head>
<body style="background-color: #cc0033">
	<h2>Welcome, <%= session.getAttribute("username") %>!</h2>
    <a href="logout.jsp" style="font-color: black">Logout</a>
</body>
</html>