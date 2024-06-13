<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/admin.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Get Sales Report</title>
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


	<p class="app-name">Filter By...</p>
	<form method="post" action="">
	
	<div class="filter">
		<div style= "display: flex" >
			<label style="margin-right:25px">Price</label>
			<label style="margin-right:178px">Airline</label>
			<label style="margin-right:33px">Takeoff Time</label>
			<label>Landing Time</label>
		</div>
		<div class="dropdown-container" style= "display: flex" >
			
    		<div class="dropdown" style="margin-right:10px">
		      <select type="text" name="price" placeholder="Enter">
		        <option>160</option>
		        <option>250</option>
		        <option>900</option>
		        <option>940</option>
		        <option>950</option>
		      </select>
		    </div>
		    
		    <div class="dropdown" style="margin-right:10px">
		      <select type="text" name="airline" placeholder="Enter">
		        <option>Seaborne</option>
		        <option>Sevenair </option>
		        <option>Sun Country</option>
		        <option>Skywalk Airlines</option>
		        <option>Delta</option>
		        <option>American Airlines</option>
		        <option>Alaska Airlines</option>
		        <option>Allegiant Air</option>
		        <option>Frontier Airlines</option>
		        <option>Southwest</option>
		        <option>Spirit</option>
		        <option>United</option>
		        <option>Tap Portugal</option>
		        <option>Aer Lingus</option>
		        <option>Airfrance</option>
		         <option>British Airways</option>
		        <option>Virgin Australia Regional Airlines</option>
		      </select>
		    </div>
		    
		    <div class="dropdown" style="margin-right:60px">
		      <select type="text" name="takeoff" placeholder="Enter">
		        <option>11:02</option>
		        <option>09:02</option>
		      </select>
		    </div>
		    
		    <div class="dropdown" >
		      <select name="landing">
		        <option>14:10</option>
		      </select>
		      <br>
		      <br>
		      <input type="submit" name="searchButton" value="Search Flights">
		      <br>
		      <br>
    		</div>
  </div>
		
		
	</div>
	</form>
	<%
try {
	if (request.getParameter("searchButton") != null) {
		String selectedPrice = request.getParameter("price");
        String selectedAirline = request.getParameter("airline");
        String selectedTakeoff = request.getParameter("takeoff");
        String selectedLanding = request.getParameter("landing");
		String url = "jdbc:mysql://localhost:3306/cs336project";
		//Load JDBC driver - the interface standardizing the connection procedure. Look at WEB-INF\lib for a mysql connector jar file, otherwise it fails.
		Class.forName("com.mysql.jdbc.Driver");
		//Create a connection to your DB
		Connection con = DriverManager.getConnection(url, "root", "Dj@mysql29");
		//Create a SQL statement
		Statement stmt = con.createStatement();
		String sqlQuery = "SELECT flights.* FROM flights " +
	            "JOIN airlines ON flights.airline_id = airlines.Airline_id " +
	            "WHERE " +
	            "fare_first = '" + selectedPrice + "' AND " +
	            "a_name = '" + selectedAirline + "' AND " +
	            "depart_time = '" + selectedTakeoff + "' AND " +
	            "arrive_time = '" + selectedLanding + "'";
	
		// Execute the query
		PreparedStatement statement = con.prepareStatement(sqlQuery);
		ResultSet resultSet = statement.executeQuery();
		out.print("<table id=\"myTable2\">");
		out.print("<thead>");
			out.print("</tr>");
			out.print("<th>Flight Number</th>");
			out.print("<th>Departure Airport</th>");
			out.print("<th>Arrival Airport</th>");
			out.print("<th>Price</th>");
			
		out.print("</thead>");
	out.print("</tr>");
	
		out.print("<tbody>");
		while (resultSet.next()) {
			//parse out the results
			out.print("<tr>");
				out.print("<td>");
				out.print(resultSet.getString("flight_num"));
				out.print("</td>");
				out.print("<td>");
				out.print(resultSet.getString("depart_aid"));
				out.print("</td>");
				out.print("<td>");
				out.print(resultSet.getString("arrive_aid"));
				out.print("</td>");
				out.print("<td>");
				out.print(resultSet.getString("fare_first"));
				out.print("</td>");
				
			out.print("</tr>");
		}
		out.print("</tbody>");
	out.print("</table>");
	con.close();
	}
	} catch (Exception e) {
		out.print("failed");
	%>
	<script>
		alert("Sorry, unexcepted error happened.");
		window.location.href = "salesRepForm.jsp";
	</script>
	<%
		}
	%>
	
	<input id="button" type="button" value ="GO BACK" onclick="window.location.href = 'customerLandingPage.jsp'">
</body>
</html>