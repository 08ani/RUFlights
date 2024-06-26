<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="../css/admin.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Account Details</title>
</head>
<body>


	<p class="app-name">Update Customer Details</p>


	<div class="login-page">
		<div class="form">
				<form class="login-form" method="post" action="managerInsertionsCustomer.jsp">
	
					<label>Enter Customers user id:</label> 
					<input type="password" placeholder="id" name="userid" />
					<h3>Leave all the following fields empty to delete the customer</h3>
					<label>Update Customers name:</label> 
					<input type="text" placeholder="name" name="new_name" /> 
					<label>Update Customers email:</label> 
					<input type="email" placeholder="email" name="new_email" /> 
					<label>Update Customers number: </label>
					<input type="phone" placeholder="+" name="new_phone" />
					<label>Update Customers credit-card number</label>
					<input type="password" name="new_credit_card" />
					<label>Input Customer CVV</label> 
					<input type="password"name="new_cvv" /> 
					<input id="submit" type='submit' name="submit" value="SUBMIT">
					<input id="extend" type='button' name="Customer List" value="Customer List" onclick="window.location.href = 'customers.jsp'">
					<input id="button" type="button" value ="GO BACK" onclick="window.location.href = 'managerLandingPage.jsp'">
				</form>
			</div>
		</div>
		<p class="app-name">Update Customer Representative Details</p>


	<div class="login-page">
		<div class="form">
				<form class="login-form" method="post" action="managerInsertionsCustomer.jsp">
	
					
					<h3>Leave all the following fields empty to delete the customer</h3>
					<label>Update Customer Representative name:</label> 
					<input type="text" placeholder="name" name="new_name" /> 
					<label>Update Customer Representative email:</label> 
					<input type="email" placeholder="email" name="new_email" /> 
					
					<input id="submit" type='submit' name="submit" value="SUBMIT">
					<input id="extend" type='button' name="Customer Rep List" value="Customer Rep List" onclick="window.location.href = 'customerRep.jsp'">
					<input id="button" type="button" value ="GO BACK" onclick="window.location.href = 'managerLandingPage.jsp'">
				</form>
			</div>
		</div>

		<script
			src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
		<script type="text/javascript">
			$(document).ready(function() {
				if (window.location.href.indexOf('signup') != -1) {
					$('.login-form').hide();
					$('.register-form').show();
				}
			});

			$('.message a').click(function() {
				$('form').animate({
					height : "toggle",
					opacity : "toggle"
				}, "slow");
			});
		</script>
</body>
</html>