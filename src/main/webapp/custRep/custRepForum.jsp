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
	<button style="margin: 0 auto;"
			onclick="window.location.href = 'answer.jsp'">Answer a Question
	</button>
	<%
		try {
		//Create a connection string
		String url = "jdbc:mysql://localhost:3306/cs336project";
		//Load JDBC driver - the interface standardizing the connection procedure. Look at WEB-INF\lib for a mysql connector jar file, otherwise it fails.
		Class.forName("com.mysql.jdbc.Driver");
				
		String flightOption = request.getParameter("flight_option");
		//Create a connection to your DB
		Connection con = DriverManager.getConnection(url, "root", "Dj@mysql29");
		
		//Create a SQL statement
		Statement stmt = con.createStatement();
		//Get the combobox from the HelloWorld.jsp
		if (request.getMethod().equalsIgnoreCase("post")) {
                    String newAnswer = request.getParameter("answer");
                    String qid = request.getParameter("qid");
                    String insertQuery = "UPDATE forum SET answers = ? WHERE qid = ?";

                    PreparedStatement insertStmt = con.prepareStatement(insertQuery);
                    insertStmt.setString(1, newAnswer);
                    insertStmt.setString(2, qid);
                    insertStmt.executeUpdate();
         }
			    
		//System.out.println("Works up to checkpoint:1 ");
		
			
		//All flights
		String str0 = "SELECT * from FORUM";
			//System.out.println("Works up to checkpoint:2 ");
				
		PreparedStatement stmt0 = con.prepareStatement(str0);
				
		ResultSet flights0 = stmt0.executeQuery();
			
		//System.out.println("Works up to checkpoint:4 ");
		out.print("<input style=\"margin:auto\" type=\"text\" id=\"myInput\" onkeyup=\"myFunction()\" placeholder=\"Search Questions\">");
		out.print("<br>");
		out.print("<table id=\"myTable\">");
			out.print("</tr>");
				out.print("<th>Number</th>");
				out.print("<th>Questions</th>");
				out.print("<th>Answers</th>");
			out.print("</tr>");
			while (flights0.next()) {
				out.print("<tr>");
					out.print("<td>");
						out.print(flights0.getString("qid"));
					out.print("</td>");
					out.print("<td>");
						out.print(flights0.getString("questions"));
					out.print("</td>");
					out.print("<td>");
						out.print(flights0.getString("answers"));
					out.print("</td>");
					
				out.print("</tr>");
			}
			out.print("</table>");
				
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
	
	<%
	%>
			<button style="margin: 0 auto;"
				onclick="window.location.href = 'custRepLandingPage.jsp'">GO BACK
			</button>
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
	<%
	%>
</body>
</html>