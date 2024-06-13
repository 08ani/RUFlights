<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ page import=" java.util.Random"%>
<%@ page import=" java.util.Date"%>

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
		out.print(resNum);
		String u_id = request.getParameter("new_userid");
		String userName = request.getParameter("new_name");
		String email = request.getParameter("new_email");
		String flightNo = request.getParameter("new_flight_no");
		String numP = request.getParameter("new_num");
		int numPassengers = Integer.parseInt(numP);
		String resFare = request.getParameter("new_fare");
			
			
			// 4. check if fields needed for reservation are empty (from the form)
			if( flightNo.equals("")){
				out.print("empty detected!");
				%> 
				<!-- if error, show the alert and go back to login page --> 
				<script> 
			    	alert("Sorry, but all fields must be filled to create a new account.");
			    	window.location.href = "handleReservations.jsp";
				</script>
				<%
				return;
			}
			
			//5. find number of passengers to see if theres enough seats left
			//Might wanna change the logic up here
			String select = "SELECT num_seats FROM flights WHERE flights.flight_num = '" + flightNo + "';";
			ResultSet pass = stmt.executeQuery(select);
			if (pass.next()){
				 int passengers = pass.getInt(1);
				 //out.print("Passengers=" + passengers);
				 //out.print("Passengers Wanted =" + numPassengers);
			      
			      if (numPassengers > passengers){
			    	  //error
			    	  %> 
						<!-- if error, show the alert and go back to one way --> 
						<script> 
						    alert("Sorry, there are no more seats available, failed to create your reservation");
						    window.location.href = "handleReservations.jsp";
						</script>
						<%
			      }
			      
			      else {
			    	  //this is the value we will now update into the flight!
			    	  int passengersUpdate = passengers - numPassengers;
			    	
			    	  //now we have to update the flight to reflect how there are less passengers
			  		String update = "UPDATE flights SET num_seats ='" + passengersUpdate + "' WHERE flights.flight_num = '" + flightNo + "';";
			  		stmt.executeUpdate(update);
			      }
				
			}
			
			else{
				%> 
				<!-- if error, show the alert and go back to one way --> 
				<script> 
				    alert("Sorry, that flight does not exist!");
				    window.location.href = "handleReservations.jsp";
				</script>
				<%
			}
			
			
			
	        //get todays date!
	        java.util.Date utilDate = new Date();
	        java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());
	
	        //out.print(sqlDate);
			
			//Get the price of the flight
			String selectF = "SELECT fare_first FROM flights WHERE flight_num = '" + flightNo + "';";
			ResultSet passF = stmt.executeQuery(selectF);
			passF.next();
			double fare = passF.getDouble(1);
			
			double totalPrice = numPassengers*fare;
			
			//Make an insert statement for the Reservations table:
			//out.print(sqlDate);
			
			
			String update2 = "UPDATE Reservations SET res_tot = "+ totalPrice +", num_passengers = "+ numPassengers +", flight_no = "+ flightNo +" WHERE res_num = "+resNum+"";
		
			//Create a Prepared SQL statement allowing you to introduce the parameters of the query
			PreparedStatement ps = con.prepareStatement(update2);
			//out.print(insert);
			//Run the update against the DB
			ps.executeUpdate();
	
			//Now we insert into the trips table
			String insertTrip = "UPDATE Trips SET flights = "+flightNo+" WHERE res_num = "+resNum+"";
			stmt.executeUpdate(insertTrip);
			
			//Update profits
			String updateCus = "UPDATE users SET profits=profits+('" + totalPrice +"')"+ " WHERE user_id='" + u_id + "';";
			stmt.executeUpdate(updateCus);
			
			String updateFli = "UPDATE flights SET profits=profits+('" + totalPrice +"')"+ ", num_reserves=num_reserves+1 WHERE flight_num='" + flightNo + "';";
			stmt.executeUpdate(updateFli);
			
	// 		String findDepartAirport = "SELECT depart_aid FROM flights F WHERE F.flight_num='12345';";
	// 		ResultSet dep = stmt.executeQuery(findDepartAirport);
	// 		dep.next();
	// 		String depAirport = dep.getString("depart_aid");
			
			//out.print("Checkpoint 2");
			String updateAir = "UPDATE Airport SET profits=profits+'" + totalPrice + "' WHERE Airport.Airport_id=(SELECT arrive_aid FROM flights F WHERE F.flight_num='"+ flightNo + "');";
			stmt.executeUpdate(updateAir);
		
		//Close the connection.
		con.close();
		
		%>
		<script> 
		    alert("Congratulations! Customer's reservation is updated!");
		    
	    	window.location.href = "custRepLandingPage.jsp";
		</script>
		<%
				
			con.close();
			} catch (Exception e) {
				e.printStackTrace();
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