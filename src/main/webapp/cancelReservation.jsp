<%@ page import="java.sql.*,javax.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
    <title>Cancel Reservation</title>
</head>
<body>
<%
    // Initialize necessary variables
    String resNum = request.getParameter("res_num");
	String resClass = request.getParameter("class");
	String restot = request.getParameter("res_tot");
	double totalPrice = Double.parseDouble(restot);
	String num_seats = request.getParameter("num_seats");
	String flight_no = request.getParameter("flight_no");
	String OWdate = request.getParameter("OWdate");
	String u_id = request.getParameter("customer");
	int num_res = Integer.parseInt(num_seats);
	String numPass = request.getParameter("numPass");
	int num_pass = Integer.parseInt(numPass);
    Connection con = null;
    PreparedStatement pstmt = null;

    if(resNum != null && !resNum.trim().isEmpty()) {
        try {
            // Database connection details
            String url = "jdbc:mysql://localhost:3306/cs336project"; // Update with your database URL
            String username = "root"; // Update with your database username
            String password = "Dj@mysql29"; // Update with your database password

            // Establish a connection to the database
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection(url, username, password);
            Statement stmt = con.createStatement();

            // SQL query to delete the reservation
            if (resClass.equals("Business") || resClass.equals("First Class")){
            	String deleteQuery = "DELETE FROM Reservations WHERE res_num = ?";
            	pstmt = con.prepareStatement(deleteQuery);
            	pstmt.setInt(1, Integer.parseInt(resNum));
            	
            	String updateCus = "UPDATE users SET profits=profits-('" + totalPrice +"')"+ " WHERE user_id='" + u_id + "';";
                stmt.executeUpdate(updateCus);
                
                String updateFli = "UPDATE flights SET profits=profits-('" + totalPrice +"')"+ ", num_reserves=num_reserves+1 WHERE flight_num='" + flight_no + "';";
                stmt.executeUpdate(updateFli);
                
                String updateAir = "UPDATE Airport SET profits=profits-'" + totalPrice + "' WHERE Airport.Airport_id=(SELECT arrive_aid FROM flights F WHERE F.flight_num='"+ flight_no + "');";
                stmt.executeUpdate(updateAir);
            
            	// Execute the update
            	int rowsAffected = pstmt.executeUpdate();

            	if (rowsAffected > 0) {
                	out.println("<p>Reservation cancelled successfully.</p>");
                	 num_res = num_res+num_pass;
                	 String updateQuery = "UPDATE flights SET num_seats = ? WHERE flight_num = ?";
                     PreparedStatement pstmt2 = con.prepareStatement(updateQuery);
                     pstmt2.setInt(1, num_res);
                     pstmt2.setString(2, flight_no);
                     pstmt2.executeUpdate();
                	// Check the waiting list for the same flight
                    String waitingListQuery = "SELECT F.fare_first, W.u_id, W.num_passengers, W.flight_id, W.class, W.OWdate FROM waiting W JOIN flights F ON W.flight_id = F.flight_num WHERE W.flight_id = ? and W.OWdate ='"+OWdate+"'";
                    PreparedStatement pstmt3 = con.prepareStatement(waitingListQuery);
                    
                	pstmt3.setString(1, flight_no);
                    //pstmt3.setString(2, OWdate);
                    ResultSet waitingResult = pstmt3.executeQuery();

                    while (waitingResult.next()) {
                        // Check if the number of passengers in the waiting list is less than or equal to num_reserves
                        int waitingPassengers = waitingResult.getInt("num_passengers");
                        //out.print(waitingPassengers);
                        //out.print(num_res);
                        if (waitingPassengers <= num_res) {
                        	//out.print("Here");
                            // Move the user from waiting list to reservations
                            String moveQuery = "INSERT INTO Reservations (res_date, res_fare, res_tot, customer, num_passengers, flight_no, class, OWdate) VALUES (CURDATE(), ?, ?, ?, ?, ?, ?, ?)";
                            PreparedStatement pstmt4 = con.prepareStatement(moveQuery);
                            pstmt4.setDouble(1, waitingResult.getDouble("fare_first"));
                            pstmt4.setDouble(2, waitingResult.getDouble("fare_first")*waitingPassengers);
                            pstmt4.setInt(3, waitingResult.getInt("u_id"));
                            pstmt4.setInt(4, waitingPassengers);
                            pstmt4.setString(5, flight_no);
                            pstmt4.setString(6, waitingResult.getString("class"));
                            pstmt4.setString(7, waitingResult.getString("OWdate"));
                            pstmt4.executeUpdate();
							//out.print("Done");
                            // Update num_reserves in flights table
                            num_res = num_res - waitingPassengers;
                            String updateQuery2 = "UPDATE flights SET num_reserves = num_reserves+1, num_seats=? WHERE flight_num = ?";
                            PreparedStatement pstmt5 = con.prepareStatement(updateQuery2);
                            pstmt5.setInt(1, num_res);
                            pstmt5.setString(2, flight_no);
                            pstmt5.executeUpdate();
							//out.print("Done 2");
							
                            // Remove the entry from the waiting list
                            String removeFromWaitingList = "DELETE FROM waiting WHERE u_id = ?";
                            PreparedStatement pstmt6 = con.prepareStatement(removeFromWaitingList);
                            pstmt6.setInt(1, waitingResult.getInt("u_id"));
                            pstmt6.executeUpdate();
                            
                            
                            //out.print("Done 4");
                            String notificationMessage = "You have been moved from the waiting list to a confirmed reservation for flight " + flight_no;
                            String insertNotificationQuery = "INSERT INTO notifications (user_id, message) VALUES (?, ?)";
                            PreparedStatement pstmtNotification = con.prepareStatement(insertNotificationQuery);
                            pstmtNotification.setInt(1, waitingResult.getInt("u_id"));
                            pstmtNotification.setString(2, notificationMessage);
                            pstmtNotification.executeUpdate();
                            
                            
		    	
		    	        //out.print("User "+waituser+"has been added to reservations and removed from waitlist");
		    	        	
		    	    	
                            
                        }
                    }
            	} else {
                out.println("<p>Error: Unable to cancel the reservation or reservation not found.</p>");
            	}
            } else {
            	out.println("<p>Error: Unable to cancel reservation since you have booked in economy class.</p>");
            }

        } catch (NumberFormatException e) {
            out.println("<p>Error: Invalid reservation number.</p>");
        } catch (SQLException e) {
            out.println("<p>Error during database access: " + e.getMessage() + "</p>");
        } catch (ClassNotFoundException e) {
            out.println("<p>Error: MySQL driver not found.</p>");
        } finally {
            try {
                if (pstmt != null) pstmt.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                out.println("<p>Error closing database resources: " + e.getMessage() + "</p>");
            }
        }
    } else {
        out.println("<p>Error: No reservation number provided.</p>");
    }
%>
    <button onclick="window.location.href='customerLandingPage.jsp'">Return to Dashboard</button>
</body>
</html>