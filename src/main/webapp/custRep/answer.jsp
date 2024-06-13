<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="../css/admin.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Customer Details</title>
</head>
<body>


	<p class="app-name">Answer the Question</p>
	<form action="custRepForum.jsp" method="post">
	    <input type="text" id="qid" name="qid" placeholder="Question Number">
        <textarea id="answer" name="answer" rows="5" cols="60"></textarea>
        <br>
        <br>
        <input type="submit" value="Submit Answer">
    </form>


	
</body>
</html>