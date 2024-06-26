<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script>
	history.forward();
</script>

<link rel="stylesheet" type="text/css" href="css/HTMLTable.css">

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Viewing Results</title>
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
<!-- Add buttons for Past Flights and Upcoming Flights -->
<input type="button" value="Past Flights" onclick="showFlights('past')">
<input type="button" value="Upcoming Flights" onclick="showFlights('upcoming')">

<script>
    function showFlights(type) {
        // Redirect to the same page with a parameter indicating the type of flights to show
        window.location.href = '?flightType=' + type;
    }
</script>
	<%

		try {
			//Create a connection string
			String url = "jdbc:mysql://localhost:3306/cs336project";
			//Load JDBC driver - the interface standardizing the connection procedure. Look at WEB-INF\lib for a mysql connector jar file, otherwise it fails.
			Class.forName("com.mysql.jdbc.Driver");

			//Create a connection to your DB
			Connection con = DriverManager.getConnection(url, "root", "Dj@mysql29");
			
			//Create a SQL statement
			Statement stmt = con.createStatement();
			
			//parameters
			Integer u_id = (Integer) session.getAttribute("user_id");
			 if (u_id == 0){
				 %>
				<!-- if error, show the alert and go back -->
					<script>
						alert("Sorry, session Invalidated!, Please log in Again.");
						window.location.href = "logout.jsp";
					</script>
				<%
			}
			 
			 
			String string = "SELECT COUNT(*) FROM Reservations WHERE customer='" + u_id + "';";
			ResultSet resCount = stmt.executeQuery(string);
			resCount.next();
			if(resCount.getInt(1) == 0){
				%>
	<h2 style="text-align: center;" style="font-family:arial,sans-serif;">
		OH NO! Looks like you don't have any reservations, please come back
		when you make some!</h2>
	<%
			}else{
				%>
	<h2>Please find your detailed itineraries below!</h2>
	<br>
	<%
			}
			
			// Get today's date
			java.util.Date utilDate = new java.util.Date();
			java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());

			String pastFlightsQuery = "SELECT Trips.flights, Trips.flights2, Trips.flights3, R.res_num, R.res_date, R.res_fare, R.flight_no,R.num_passengers, R.OWdate, F.airline_id, F.depart_aid, F.depart_time,F.arrive_aid,F.arrive_time FROM Reservations R, flights F, trips WHERE Trips.res_num = R.res_num AND F.flight_num = R.flight_no AND R.customer='" + u_id + "' AND R.OWdate < '" + sqlDate + "' ORDER BY R.res_date;";
			String upcomingFlightsQuery = "SELECT Trips.flights, Trips.flights2, Trips.flights3, R.res_num, R.res_date, R.res_fare, R.flight_no,R.num_passengers, R.OWdate, F.airline_id, F.depart_aid, F.depart_time,F.arrive_aid,F.arrive_time FROM Reservations R, flights F, trips WHERE Trips.res_num = R.res_num AND F.flight_num = R.flight_no AND R.customer='" + u_id + "' AND R.OWdate >= '" + sqlDate + "' ORDER BY R.res_date;";
			
			String flightType = request.getParameter("flightType");
		if(flightType!=null)	{
			String stringy;
			if ("past".equals(flightType)) {
			    stringy = pastFlightsQuery; // If 'past' is selected, use the past flights query
			} else {
			    stringy = upcomingFlightsQuery; // Default to upcoming flights
			}

			ResultSet reservations = stmt.executeQuery(stringy);

		    
			out.print("<table>");
			out.print("</tr>");
				out.print("<th>Reservation number</th>");
				out.print("<th>Date Reserved</th>");
				out.print("<th>Number of Passengers</th>");
				out.print("<th>Flight No.</th>");
				out.print("<th>Cost of Fare</th>");
				out.print("<th>Airline ID</th>");
				out.print("<th>Departing Airport</th>");
				out.print("<th>Departing Date</th>");
				out.print("<th>Time</th>");
				out.print("<th>Arriving Airport</th>");
				out.print("<th>Time</th>");
				//out.print("<th>Depart Time</th>");
				//out.print("<thArrive Time</th>");
			out.print("</tr>");
			while (reservations.next()) {
				
				//parse out the results
					out.print("<tr>");
						out.print("<td>");
							out.print(reservations.getString("R.res_num"));
						out.print("</td>");	
						out.print("<td>");
							out.print(reservations.getString("R.res_date"));
						out.print("</td>");	
						out.print("<td>");
							out.print(reservations.getString("R.num_passengers"));
						out.print("</td>");	
						out.print("<td>");
							out.print(reservations.getString("trips.flights") + "\n");
							out.println(reservations.getString("Trips.flights2") + "\n");
							out.println(reservations.getString("Trips.flights3"));
						out.print("</td>");	
						out.print("<td>");	
							out.print(reservations.getString("R.res_fare"));
						out.print("</td>");
						out.print("<td>");	
						out.print(reservations.getString("F.airline_id"));
						out.print("</td>");
						out.print("<td>");	
							out.print(reservations.getString("F.depart_aid"));
						out.print("</td>");
						out.print("<td>");	
							out.print(reservations.getString("R.OWdate"));
						out.print("</td>");
						out.print("<td>");	
							out.print(reservations.getString("F.depart_time"));
						out.print("</td>");
						out.print("<td>");	
							out.print(reservations.getString("F.arrive_aid"));
						out.print("</td>"); 
						out.print("<td>");	
							out.print(reservations.getString("F.arrive_time"));
						out.print("</td>");
						out.print("</tr>");
			}
			out.print("</form>");
		}
		else {
            // Display a message or leave this block empty to show nothing
            out.print("<p>Select 'Past Flights' or 'Upcoming Flights' to view your itineraries.</p>");
        }
			con.close();
		}catch (Exception e) {
			out.print("failed");
			%>
	<script>
		alert("Sorry, unexpected error happened.");
		window.location.href = "customerLandingPage.jsp";
	</script>
	<%	
		}
	
		%>
	<input id="button" type="button" value ="GO BACK" onclick="window.location.href = 'customerLandingPage.jsp'">



</body>
</html>
