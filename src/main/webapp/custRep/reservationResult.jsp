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
		
			%>
			
			
			<h3>Add Reservation</h3>
				<div class="login-page">
				<div class="form">
						<form class="login-form" method="get" action="custRepInsertReservations.jsp">
			
							<label>Enter Customers user id:</label> 
							<input type="text" placeholder="id" name="user_id" />
							<label>Customers name:</label> 
							<input type="text" placeholder="name" name="new_name" /> 
							<label>Customers email:</label> 
							<input type="email" placeholder="email" name="new_email" /> 
							<form method="get" action="custRepInsertReservations.jsp" enctype=text/plain>	
		
								<table>
									<tr>
									<!-- textbox for flight search -->
										<tr>
										<td>Departing Airport</td>
									</tr>
									<tr><td>
										<select type="text" name="depport" placeholder="Enter 3 letter Airport ID">
										<option>--Select--</option>
										<option>EWR</option>
										<option>JFK</option>
										<option>MIA</option>
										<option>SFO</option>
										<option>MDW</option>
										<option>LAX</option>
										<option>ATL</option>
										<option>ORD</option>
										<option>DFW</option>
										<option>DEN</option>
										<option>SEA</option>
										<option>LAS</option>
										<option>MCO</option>
										<option>CLT</option>
										<option>PHX</option>
										<option>IAH</option>
										<option>BOS</option>
										<option>MSP</option>
										<option>FLL</option>
										<option>DTW</option>
										<option>PHL</option>
										<option>DTW</option>
										<option>LGA</option>
										<option>---INTERNATIONAL---</option>
										<option>LCY</option>
										<option>DUB</option>
										<option>PEK</option>
										<option>SYD</option>
										<option>YTZ</option>
										</select>
									</td>
								</tr>
								<tr>
									<td>Arriving Airport</td>
									</tr>
									<tr><td>
										<select type="text" name="arrivport" placeholder="Enter 3 letter Airport ID">
										<option>--Select--</option>
										<option>EWR</option>
										<option>JFK</option>
										<option>MIA</option>
										<option>SFO</option>
										<option>MDW</option>
										<option>LAX</option>
										<option>ATL</option>
										<option>ORD</option>
										<option>DFW</option>
										<option>DEN</option>
										<option>SEA</option>
										<option>LAS</option>
										<option>MCO</option>
										<option>CLT</option>
										<option>PHX</option>
										<option>IAH</option>
										<option>BOS</option>
										<option>MSP</option>
										<option>FLL</option>
										<option>DTW</option>
										<option>PHL</option>
										<option>DTW</option>
										<option>LGA</option>
										<option>---INTERNATIONAL---</option>
										<option>LCY</option>
										<option>DUB</option>
										<option>PEK</option>
										<option>SYD</option>
										<option>YTZ</option>
										
										</select>
									</td>
								</tr>
								<td>Take off date</td>
									</tr>
										<tr>
											
									<td>
											<input type="text" name="departure" placeholder="YEAR-MM-DD">
										</td> 
									</tr>
								<td>Flight Number</td>
									</tr>
										<tr>
											
									<td>
								 			<input type= "text" name= "flightnum" placeholder="Flight Number"> 
										</td> 
									</tr>
									<br>
								
									
								<label>Number of passengers:</label> 
								<input type="text" name="passengersNum" />

                        <tr>
                            <td>Flight Class</td>
                        </tr>
                        <tr>
                            <td>
                                <select name="flight_class">
                                    <option >Economy</option>
                                    <option >Business</option>
                                    <option >First Class</option>
                                </select>
                            </td>
                        </tr>
      
									
														
								
							</table>
							
					<input type = 'submit' name="submit" value = "submit"> 	
					<br>
					<br>
						
					</form>
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
			<button style="margin: 0 auto;" onclick="window.location.href = 'handleReservations.jsp'">GO BACK</button>

</body>
</html>