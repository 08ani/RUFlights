<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
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

<form method="post" action="">
    <div class="filter">
        <div >
            <label>Sort By:</label>
        </div>
        <div class="dropdown-container" style="display: flex">
            <div class="dropdown" style="margin-right:10px">
                <select name="sortCriteria">
                    <option value="fare_first">Price</option>
                    <option value="depart_time">Take-off Time</option>
                    <option value="arrive_time">Landing Time</option>
                </select>
            </div>
            <input type="submit" name="searchButton" value="Sort Flights">
        </div>
    </div>
</form>

<%
	try {
	if (request.getParameter("searchButton") != null) {
		String sortCriteria = request.getParameter("sortCriteria");
		String url = "jdbc:mysql://localhost:3306/cs336project";
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection(url, "root", "Dj@mysql29");
		Statement stmt = con.createStatement();
		String sqlQuery = "SELECT * FROM flights ORDER BY " + sortCriteria;
	
		ResultSet resultSet = stmt.executeQuery(sqlQuery);
		out.print("<table id=\"myTable\">");
			out.print("<tr>");
				out.print("<th>Flight Number</th>");
				out.print("<th>Departure Airport</th>");
				out.print("<th>Arrival Airport</th>");
				out.print("<th>Price</th>");
			out.print("</tr>");
		while (resultSet.next()) {
			out.print("<tr>");
				out.print("<td>" + resultSet.getString("flight_num") + "</td>");
				out.print("<td>" + resultSet.getString("depart_aid") + "</td>");
				out.print("<td>" + resultSet.getString("arrive_aid") + "</td>");
				out.print("<td>" + resultSet.getString("fare_first") + "</td>");
			out.print("</tr>");
		}	
		out.print("</table>");
		con.close();
		}
	} catch (Exception e) {
		out.print("An error occurred: " + e.getMessage());
		// Handle exception
	}
%>

<input id="button" type="button" value ="GO BACK" onclick="window.location.href = 'customerLandingPage.jsp'">
</body>
</html>