<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="../css/admin.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Get Sales Report</title>
</head>
<body>


	<p class="app-name">Filter By...</p>
	<div class="login-page">
		<div class="form">
			<form method="get" action="flightReport.jsp" enctype=text/plain>
				<select type="text" name="airport">
					<option>ATL</option>
					<option>BOS</option>
					<option>CLT</option>
					<option>DEN</option>
					<option>DFW</option>
					<option>DTW</option>
					<option>DUB</option>
					<option>EWR</option>
					<option>FLL</option>
					<option>IAH</option>
					<option>JFK</option>
					<option>LAS</option>
					<option>LAX</option>
					<option>LCY</option>
					<option>LGA</option>
					<option>MGO</option>
					<option>MDW</option>
					<option>MIA</option>
					<option>MSP</option>
					<option>ORD</option>
					<option>PEK</option>
					<option>PHL</option>
					<option>PHX</option>
					<option>SEA</option>
					<option>SFO</option>
					<option>SYD</option>
					<option>YTZ</option>
					<input id= "submit" type='submit' name="submit" value="SUBMIT" buttonstyle="background-color: #008CBA;">
					<input id="button" type="button" value ="GO BACK" onclick="window.location.href = 'custRepLandingPage.jsp'">
				</select>
			</form>
		</div>
		
	</div>
	