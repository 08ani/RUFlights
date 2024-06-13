<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <link rel="stylesheet" type="text/css" href="../css/admin.css">
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Customer Details</title>
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

    <p class="app-name">Add or Edit Reservations for Customers</p>

    <div class="login-page">
        <div class="form">
            <form method="get" action="reservationResult.jsp" enctype="text/plain">
                <input id="button" type="button" value="Add Reservation" onclick="window.location.href = 'reservationResult.jsp'">
                <br>
                <br>
                <%
                    String url = "jdbc:mysql://localhost:3306/cs336project";
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection con = DriverManager.getConnection(url, "root", "Dj@mysql29");
                    Statement stmt = con.createStatement();
                    String stringy = "SELECT R.res_num, U.user_name, R.customer, R.flight_no, R.res_date, R.num_passengers, R.res_fare, R.res_tot, U.email FROM Reservations R JOIN users U ON R.customer=U.user_id ORDER BY U.user_name";
                    ResultSet flights0 = stmt.executeQuery(stringy);

                    out.print("<input style=\"margin:auto\" type=\"text\" id=\"myInput\" onkeyup=\"myFunction()\" placeholder=\"Search by Customer Name\">");
                    out.print("<table id=\"myTable\">");
                    out.print("<tr>");
                    out.print("<th>Customer ID</th>");
                    out.print("<th>Customer Name</th>");
                    out.print("<th>Customer Email</th>");
                    out.print("<th>Flight Number</th>");
                    out.print("<th>Reservation Date</th>");
                    out.print("<th>Number of Passengers</th>");
                    out.print("<th>Ticket Price (per passenger)</th>");
                    out.print("<th>Total Reservation Price</th>");
                    out.print("<th>Edit</th>");
                    out.print("</tr>");

                    while (flights0.next()) {
                        //parse out the results
                        out.print("<tr>");
                        out.print("<td>");
                        out.print(flights0.getString("R.customer"));
                        out.print("</td>");
                        out.print("<td>");
                        out.print(flights0.getString("U.user_name"));
                        out.print("</td>");
                        out.print("<td>");
                        out.print(flights0.getString("U.email"));
                        out.print("</td>");
                        out.print("<td>");
                        out.print(flights0.getString("R.flight_no"));
                        out.print("</td>");
                        out.print("<td>");
                        out.print(flights0.getString("R.res_date"));
                        out.print("</td>");
                        out.print("<td>");
                        out.print(flights0.getInt("R.num_passengers"));
                        out.print("</td>");
                        out.print("<td>");
                        out.print(flights0.getString("R.res_fare"));
                        out.print("</td>");
                        out.print("<td>");
                        out.print(flights0.getString("R.res_tot"));
                        out.print("</td>");
                        out.print("<td>");
                        // Use a form for each row with hidden input fields to store data
                        out.print("<form action='editReservation.jsp' method='get'>");
                        out.print("<input type='hidden' name='resNum' value='" + flights0.getString("R.res_num") + "'>");
                        out.print("<input type='hidden' name='userId' value='" + flights0.getString("R.customer") + "'>");
                        out.print("<input type='hidden' name='userName' value='" + flights0.getString("U.user_name") + "'>");
                        out.print("<input type='hidden' name='email' value='" + flights0.getString("U.email") + "'>");
                        out.print("<input type='hidden' name='flightNo' value='" + flights0.getString("R.flight_no") + "'>");
                        out.print("<input type='hidden' name='resDate' value='" + flights0.getString("R.res_date") + "'>");
                        out.print("<input type='hidden' name='numPassengers' value='" + flights0.getInt("R.num_passengers") + "'>");
                        out.print("<input type='hidden' name='resFare' value='" + flights0.getString("R.res_fare") + "'>");
                        out.print("<input type='hidden' name='resTot' value='" + flights0.getString("R.res_tot") + "'>");
                        out.print("<input id='button' type='submit' value='Edit'>");
                        out.print("</form>");
                        out.print("</td>");
                        out.print("</tr>");
                    }
                    out.print("</table>");
                %>
                <input id="button" type="button" value="GO BACK" onclick="window.location.href = 'custRepLandingPage.jsp'">
            </form>
        </div>
    </div>

</body>
</html>
