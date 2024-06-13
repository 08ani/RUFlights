<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="../css/HTMLTable.css">

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Showing Flight Information</title>
<style>
        table {
            border-collapse: collapse;
            width: 100%;
            border: 2px solid #ddd; /* Add border to the table */
        }

        th, td {
            padding: 8px;
            text-align: left;
            border: 1px solid #ddd; /* Add border to cells */
        }
        
        th {
            background-color: #f2f2f2; /* Add a background color for header cells */
        }
    </style>
</head>
<body>
	<%
		try {
		//Create a connection string
		String url = "jdbc:mysql://localhost:3306/cs336project";
		//Load JDBC driver - the interface standardizing the connection procedure. Look at WEB-INF\lib for a mysql connector jar file, otherwise it fails.
		Class.forName("com.mysql.jdbc.Driver");
				
		//String resOption = request.getParameter("resOption");
		//Create a connection to your DB
		Connection con = DriverManager.getConnection(url, "root", "Dj@mysql29");
		
		//Create a SQL statement
		Statement stmt = con.createStatement();
		//Get the combobox from the HelloWorld.jsp
		
			    
			//System.out.println("Works up to checkpoint:1 ");
		String resNum = request.getParameter("resNum");
		String userId = request.getParameter("userId");
		String userName = request.getParameter("userName");
		String email = request.getParameter("email");
		String flightNo = request.getParameter("flightNo");
		String resDate = request.getParameter("resDate");
		String numPassengers = request.getParameter("numPassengers");
		String resFare = request.getParameter("resFare");
			%>
			
			<h3>Edit Reservation</h3>
				<div class="login-page">
				<div class="form">
						<form class="login-form" method="get" action="editConfirmation.jsp">
							<label>Reservation Number:</label> 
							<input type="text" placeholder="" name="resNum" value=<%= resNum %> readonly/> 
							<label>Customer ID:</label> 
							<input type="text" placeholder="Id" name="new_userid" value=<%= userId %> /> 
							<label>Customer name:</label> 
							<input type="text" placeholder="name" name="new_name" value=<%= userName %> /> 
							<label>Customer email:</label> 
							<input type="email" placeholder="email" name="new_email" value=<%= email %>/> 
							<label>Flight Number:</label> 
							<input type="text" placeholder="number" name="new_flight_no" value=<%= flightNo %>/> 
							<br>
							<label>Reservation Date:</label> 
							<input type="text" placeholder="Date" name="new_res_date" value=<%= resDate %>/> 
							<label>Number of Passengers:</label> 
							<input type="text" placeholder="" name="new_num" value=<%= numPassengers %>/> 
							<label>Reservation Fare:</label> 
							<input type="text" placeholder="" name="new_fare" value=<%= resFare %> readonly/> 
									<br>
							
					<input id="button" type="submit" value="Edit" onclick="window.location.href = 'editConfirmation.jsp'">	
					<input type = 'submit' name="submit" value = "Edit">
						
					</form>
					</div>
				</div>
				<%
				
			con.close();
			} catch (Exception e) {
				out.print("failed");
	%>
	<script> 
		    	alert("Sorry, unexcepted error happened.");
		    	window.location.href = "custRepLandingPage.jsp";
			</script>
	<%			
		}

	%>
			<button style="margin: 0 auto;"
				onclick="window.location.href = 'handleReservation2.jsp'">GO BACK
			</button>

</body>
</html>