<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <link rel="stylesheet" type="text/css" href="../css/admin.css">
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Waiting List for a Flight</title>
</head>
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
<body>

    <div class="login-page">
        <div class="form">
            <form method="get">
                <label for="flight_id">Enter Flight ID:</label>
                <input type="text" id="flight_id" name="flight_id">
                <input type="submit" value="Search">
            </form>

            <h2>Waiting List</h2>
            <table>
                <tr>
                    <th>User ID</th>
                    <th>User Name</th>
                    <th>Flight ID</th>
                </tr>
                <% 
                String flightId = request.getParameter("flight_id");
                if (flightId != null && !flightId.isEmpty()) {
                    try {
                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cs336project", "root", "Dj@mysql29");
                        PreparedStatement stmt = con.prepareStatement("SELECT * FROM waiting WHERE flight_id = ?");
                        stmt.setString(1, flightId);
                        ResultSet rs = stmt.executeQuery();
                        while(rs.next()) {
                            %>
                            <tr>
                                <td><%= rs.getInt("u_id") %></td>
                                <td><%= rs.getString("user_name") %></td>
                                <td><%= rs.getInt("flight_id") %></td>
                                <td><%= rs.getInt("class") %></td>
                                <td><%= rs.getInt("num_passengers") %></td>
                                <td><%= rs.getInt("OWdate") %></td>
                            </tr>
                            <%
                        }
                        con.close();
                    } catch(Exception e) {
                        e.printStackTrace();
                    }
                }
                %>
            </table>
        </div>
        <input id="button" type="button" value ="GO BACK" onclick="window.location.href = 'custRepLandingPage.jsp'">
    </div>

</body>
</html>
