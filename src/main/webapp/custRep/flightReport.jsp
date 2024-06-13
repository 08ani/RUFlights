<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="../css/HTMLTable.css">

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Showing Sales Report</title>
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

			//Create a connection to your DB
			Connection con = DriverManager.getConnection(url, "root", "Dj@mysql29");

			//Create a SQL statement
			Statement stmt = con.createStatement();

			String airportID = request.getParameter("airport");
			//out.print(airportID);
			
			
			//System.out.println("Successfully parsed month and year");
			
			String str0 = "SELECT FD.depart_date, FD.arrive_date, F.depart_aid, F.arrive_aid, A.ap_name FROM FlightDate FD JOIN flights F ON FD.flight_id = F.flight_num JOIN Airport A ON A.Airport_id IN (F.depart_aid, F.arrive_aid) WHERE A.Airport_id ='" + airportID + "' GROUP BY A.Airport_id, FD.depart_date, FD.arrive_date, F.depart_aid, F.arrive_aid, A.ap_name;";
			//System.out.println("Works up to checkpoint:2 ");
			//System.out.println(str0);
			PreparedStatement stmt0 = con.prepareStatement(str0);
			ResultSet flights0 = stmt0.executeQuery();
			
			
			
			out.print("<table>");
				out.print("<tr>");
					out.print("<th>Airport Name</th>");
					out.print("<th>Arrival Airport</th>");
					out.print("<th>Departure Airport</th>");
					out.print("<th>Arrival Date</th>");
					out.print("<th>Departure Date</th>");
				out.print("</tr>");
			while (flights0.next()) {
				//parse out the results
				out.print("<tr>");
				out.print("<td>");
				out.print(flights0.getString("A.ap_name"));
				out.print("</td>");
				out.print("<td>");
				out.print(flights0.getString("F.arrive_aid"));
				out.print("</td>");
				out.print("<td>");
				out.print(flights0.getString("F.depart_aid"));
				out.print("</td>");
				out.print("<td>");
				out.print(flights0.getString("FD.arrive_date"));
				out.print("</td>");
				out.print("<td>");
				out.print(flights0.getString("FD.depart_date"));
				out.print("</td>");
				out.print("</tr>");
			}
				

			out.print("</table>");
				
	con.close();

	} catch (Exception e) {
		out.print("failed "+ e.getMessage());
	%>
	<script>
		alert("Sorry, unexcepted error happened.");
		window.location.href = "flightInfo.jsp";
	</script>
	<%
	}
	%>

	<button style="margin: 0 auto;"
		onclick="window.location.href = 'flightInfo.jsp'">GO BACK
	</button>





</body>
</html>