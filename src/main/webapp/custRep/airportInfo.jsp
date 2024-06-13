  
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/admin.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Edit Information</title>
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


	<p class="app-name">Manage Information</p>
	<form method="post" action="">
	
	<div class="filter">
		
		<div class="dropdown-container" style= "display: flex" >
			<label>Airport:   </label>
			
    		
		    
		    <div class="dropdown" style="margin-right:10px">
		      <select type="text" name="a_manage" placeholder="Enter">
		      	<option>Select</option>
		        <option>Add</option>
		        <option>Edit</option>
		        <option>Delete</option>
		        
		      </select>
		    </div>
		    </div>
		    <br>
		    <br>
		   	<label>(TO DELETE JUST ENTER Airport ID)</label>
		   	<br>
		    <br>
		    <input type="text" name="airportid" placeholder="Airport ID">
		    <input type="text" id="ap_name" name="airportname" placeholder="Airport Name">
		   	<input type="text" id="city" name="city" placeholder="city">
		   	<input type="text" id="state" name="state" placeholder="state">
		   	<input type="text" id="country" name="country" placeholder="country">
		   	<br>
		   	
		   	<br>
		      <input type="submit" name="a_searchButton" value="Submit">
		      <br>
		      <br>
		
	</div>
	</form>
	<%
	try{
		String url = "jdbc:mysql://localhost:3306/cs336project";
		//Load JDBC driver - the interface standardizing the connection procedure. Look at WEB-INF\lib for a mysql connector jar file, otherwise it fails.
		Class.forName("com.mysql.jdbc.Driver");
		//Create a connection to your DB
		Connection con = DriverManager.getConnection(url, "root", "Dj@mysql29");
		//Create a SQL statement
		Statement stmt = con.createStatement();
	
	String stringy = "SELECT * FROM Airport";
    ResultSet flights0 = stmt.executeQuery(stringy);

                    out.print("<input style=\"margin:auto\" type=\"text\" id=\"myInput\" onkeyup=\"myFunction()\" placeholder=\"Search by Airport ID\">");
                    out.print("<table id=\"myTable\">");
                    out.print("<tr>");
                    out.print("<th>Airport ID</th>");
                    out.print("<th>Airport Name</th>");
                    out.print("<th>City</th>");
                    out.print("<th>State</th>");
                    out.print("<th>Country</th>");
                    out.print("<th>Profits</th>");
                    out.print("</tr>");

                    while (flights0.next()) {
                        //parse out the results
                        out.print("<tr>");
                        out.print("<td>");
                        out.print(flights0.getString("Airport_id"));
                        out.print("</td>");
                        out.print("<td>");
                        out.print(flights0.getString("ap_name"));
                        out.print("</td>");
                        out.print("<td>");
                        out.print(flights0.getString("city"));
                        out.print("</td>");
                        out.print("<td>");
                        out.print(flights0.getString("state"));
                        out.print("</td>");
                        out.print("<td>");
                        out.print(flights0.getString("country"));
                        out.print("</td>");
                        out.print("<td>");
                        out.print(flights0.getInt("profits"));
                        out.print("</td>");
                        out.print("</tr>");
                    }
                    out.print("</table>");
	} catch (Exception e){
		e.printStackTrace();
		out.print("failed");
	%>
	<script>
		alert("Sorry, unexcepted error happened.");
		window.location.href = "airportInfo.jsp";
	</script>
	<%
	}
    %>
    <br>
    <br>
	<form method="post" action="">
	
	<div class="filter">
		
		<div class="dropdown-container" style= "display: flex" >
			<label>Flight:   </label>
			
    		
		    
		    <div class="dropdown" style="margin-right:10px">
		      <select type="text" name="f_manage" placeholder="Enter">
		      	<option>Select</option>
		        <option>Add</option>
		        <option>Edit</option>
		        <option>Delete</option>
		        
		      </select>
		    </div>
		    </div>
		    <br>
		    <br>
		   	<label>(TO DELETE JUST ENTER Airline ID, Flight Number and Departure time)</label>
		   	<br>
		    <br>
		    <input type="text" name="airlineid" placeholder="Airline ID">
		    <input type="text" name="flightNum" placeholder="Flight Number">
		   	<input type="text" name="fare" placeholder="Fare">
		   	<input type="text" name="seats" placeholder="seats">
		   	<input type="text" name="dep_time" placeholder="departure time">
		   	<input type="text" name="dep_aid" placeholder="departure airport">
		   	<input type="text" name="arr_time" placeholder="arrival time">
		   	<input type="text" name="arr_aid" placeholder="arrival airport">
		   	<input type="text" name="fl_type" placeholder="flight type">
		   	<input type="text" name="num_res" placeholder="Reservations">
		   	<input type="text" name="status" placeholder="DELAYED/ON TIME">
		   	<br>
		   	
		   	<br>
		      <input type="submit" name="f_searchButton" value="Submit">
		      <br>
		      <br>
    		
  
		
		
	</div>
	</form>
	<%
	try{
		String url = "jdbc:mysql://localhost:3306/cs336project";
		//Load JDBC driver - the interface standardizing the connection procedure. Look at WEB-INF\lib for a mysql connector jar file, otherwise it fails.
		Class.forName("com.mysql.jdbc.Driver");
		//Create a connection to your DB
		Connection con = DriverManager.getConnection(url, "root", "Dj@mysql29");
		//Create a SQL statement
		Statement stmt = con.createStatement();
	
	String stringy = "SELECT * FROM flights";
    ResultSet flights0 = stmt.executeQuery(stringy);

                    
                    out.print("<table id=\"myTable\">");
                    out.print("<tr>");
                    out.print("<th>Airline ID</th>");
                    out.print("<th>Flight Number</th>");
                    out.print("<th>Fare</th>");
                    out.print("<th>Seats</th>");
                    out.print("<th>Departure Time</th>");
                    out.print("<th>Departure Airport</th>");
                    out.print("<th>Arrival Time</th>");
                    out.print("<th>Arrive Airport</th>");
                    out.print("<th>Days</th>");
                    out.print("<th>Type</th>");
                    out.print("<th>Profits</th>");
                    out.print("<th>Reservations</th>");
                    out.print("<th>Status</th>");
                    out.print("</tr>");

                    while (flights0.next()) {
                        //parse out the results
                        out.print("<tr>");
                        out.print("<td>");
                        out.print(flights0.getString("airline_id"));
                        out.print("</td>");
                        out.print("<td>");
                        out.print(flights0.getString("flight_num"));
                        out.print("</td>");
                        out.print("<td>");
                        out.print(flights0.getString("fare_first"));
                        out.print("</td>");
                        out.print("<td>");
                        out.print(flights0.getString("num_seats"));
                        out.print("</td>");
                        out.print("<td>");
                        out.print(flights0.getString("depart_time"));
                        out.print("</td>");
                        out.print("<td>");
                        out.print(flights0.getString("depart_aid"));
                        out.print("</td>");
                        out.print("<td>");
                        out.print(flights0.getString("arrive_time"));
                        out.print("</td>");
                        out.print("<td>");
                        out.print(flights0.getString("arrive_aid"));
                        out.print("</td>");
                        out.print("<td>");
                        out.print(flights0.getString("flight_days"));
                        out.print("</td>");
                        out.print("<td>");
                        out.print(flights0.getString("flight_type"));
                        out.print("</td>");
                        out.print("<td>");
                        out.print(flights0.getString("profits"));
                        out.print("</td>");
                        out.print("<td>");
                        out.print(flights0.getInt("num_reserves"));
                        out.print("</td>");
                        out.print("<td>");
                        out.print(flights0.getString("arr_dep_time"));
                        out.print("</td>");
                        out.print("</tr>");
                    }
                    out.print("</table>");
	} catch (Exception e){
		e.printStackTrace();
		out.print("failed");
	%>
	<script>
		alert("Sorry, unexcepted error happened.");
		window.location.href = "airportInfo.jsp";
	</script>
	<%
	}
    %>
	<%
try {
	
    String url = "jdbc:mysql://localhost:3306/cs336project";
	//Load JDBC driver - the interface standardizing the connection procedure. Look at WEB-INF\lib for a mysql connector jar file, otherwise it fails.
	Class.forName("com.mysql.jdbc.Driver");
	//Create a connection to your DB
	Connection con = DriverManager.getConnection(url, "root", "Dj@mysql29");
	//Create a SQL statement
	Statement stmt = con.createStatement();
    
	if (request.getParameter("a_searchButton") != null) {
		String manageOp = request.getParameter("a_manage");
	    String apId = request.getParameter("airportid");
	    String apName = request.getParameter("airportname");
	    String city = request.getParameter("city");
	    String state = request.getParameter("state");
	    String country = request.getParameter("country");
		
		if (manageOp.equals("Add")){
			String sqlQuery = "INSERT INTO Airport VALUES('"+apId+"', '"+apName+"', '"+city+"', '"+state+"', '"+country+"', 0)";
			PreparedStatement statement = con.prepareStatement(sqlQuery);
			statement.executeUpdate();
			%>
			<script> 
			    alert("Congratulations! Your added the Airport!");
			    
		    	window.location.href = "airportInfo.jsp";
			</script>
			<%
		}
		else if (manageOp.equals("Edit")){
			String UpdateQuery = "UPDATE Airport SET ap_name='"+apName+"', city='"+city+"', state='"+state+"', country='"+country+"' WHERE Airport_id='"+apId+"'";
			PreparedStatement statement = con.prepareStatement(UpdateQuery);
			statement.executeUpdate();
			%>
			<script> 
			    alert("Congratulations! Your edited the Airport!");
			    
		    	window.location.href = "airportInfo.jsp";
			</script>
			<%
		}
		else if (manageOp.equals("Delete")){
			String sqlQuery3 = "DELETE FROM Airport WHERE Airport_id = '"+apId+"'";
			PreparedStatement statement = con.prepareStatement(sqlQuery3);
			statement.executeUpdate();
			%>
			<script> 
			    alert("Congratulations! Your deleted the Airport!");
			    
		    	window.location.href = "airportInfo.jsp";
			</script>
			<%
		}
		
	
	} else if (request.getParameter("f_searchButton") != null) {
		String manageOp = request.getParameter("f_manage");
	    String airId = request.getParameter("airlineid");
	    String flightNum = request.getParameter("flightNum");
	    String fare = request.getParameter("fare");
	    String seats = request.getParameter("seats");
	    String dep_time = request.getParameter("dep_time");
	    String dep_aid = request.getParameter("dep_aid");
	    String arr_time = request.getParameter("arr_time");
	    String arr_aid = request.getParameter("arr_aid");
	    String fl_type = request.getParameter("fl_type");
	    String num_res = request.getParameter("num_res");
	    String status = request.getParameter("status");
		
		if (manageOp.equals("Add")){
			String sqlQuery = "INSERT INTO flights VALUES ('"+airId+"', '"+flightNum+"','"+fare+"','"+seats+"', '"+dep_time+"', '"+dep_aid+"','"+arr_time+"', '"+arr_aid+"', 'MTWRFSaSu', '"+fl_type+"', 0, 0, '"+status+"')";
			PreparedStatement statement = con.prepareStatement(sqlQuery);
			statement.executeUpdate();
			%>
			<script> 
			    alert("Congratulations! Your added the flight!");
			    
		    	window.location.href = "airportInfo.jsp";
			</script>
			<%
		}
		else if (manageOp.equals("Edit")){
			String sqlQuery = "UPDATE flights SET flight_num='"+flightNum+"',fare_first='"+fare+"', num_seats='"+seats+"', depart_time='"+dep_time+"', depart_aid='"+dep_aid+"', arrive_time='"+arr_time+"', arrive_aid='"+arr_aid+"', flight_type='"+fl_type+"', arr_dep_time='"+status+"' WHERE airline_id= '"+airId+"'";
			PreparedStatement statement = con.prepareStatement(sqlQuery);
			statement.executeUpdate();
			%>
			<script> 
			    alert("Congratulations! Your edited the flight!");
			    
		    	window.location.href = "airportInfo.jsp";
			</script>
			<%
		}
		else if (manageOp.equals("Delete")){
			String sqlQuery3 = "DELETE FROM flights WHERE airline_id='"+airId+"'AND flight_num='"+flightNum+"'AND depart_time='"+dep_time+"'";
			PreparedStatement statement = con.prepareStatement(sqlQuery3);
			statement.executeUpdate();
			%>
			<script> 
			    alert("Congratulations! Your deleted the flight!");
			    
		    	window.location.href = "airportInfo.jsp";
			</script>
			<%
		}
		
	
	}
	con.close();
	
	} catch (Exception e) {
		e.printStackTrace();
		out.print("failed");
	%>
	<script>
		alert("Sorry, unexcepted error happened.");
		window.location.href = "airportInfo.jsp";
	</script>
	<%
		}
	%>
	
	<input id="button" type="button" value ="GO BACK" onclick="window.location.href = 'custRepLandingPage.jsp'">
	<script>
    function hideInputField() {
        document.getElementById("ap_name").style.display = "none";
        document.getElementById("city").style.display = "none";
        document.getElementById("state").style.display = "none";
        document.getElementById("country").style.display = "none";
    }
</script>
<script>
		function myFunction() {
		  // Declare variables
		  var input, filter, table, tr, td, td2, i, txtValue, txtValue2;
		  input = document.getElementById("myInput");
		  filter = input.value.toUpperCase();
		  table = document.getElementById("myTable");
		  tr = table.getElementsByTagName("tr");
		
		  // Loop through all table rows, and hide those who don't match the search query
		  for (i = 0; i < tr.length; i++) {
		    td = tr[i].getElementsByTagName("td")[0];
		    td2 = tr[i].getElementsByTagName("td")[1];
		    if (td) {
		      txtValue = td.textContent || td.innerText;
		      txtValue2 = td2.textContent || td2.innerText;
		      if (txtValue.toUpperCase().indexOf(filter) > -1 || txtValue2.toUpperCase().indexOf(filter) > -1) {
		        tr[i].style.display = "";
		      } else {
		        tr[i].style.display = "none";
		      }
		    }
		  }
		}
	</script>
</body>
</html>