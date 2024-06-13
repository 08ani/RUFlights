<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="java.util.regex.Pattern"%>
<%@ page import="java.util.Random"%>
<%@ page import="java.util.Date"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <link rel="stylesheet" type="text/css" href="css/login.css">
    <title>Creating Reservation...</title>
</head>
<body>
    <%
        String flightnum = request.getParameter("flightnum");
        String passengersNum = request.getParameter("passengersNum");
        String depDate = request.getParameter("departure");
        String flightClass = request.getParameter("flight_class"); // Get the flight class
        int passengersNumber = Integer.parseInt(passengersNum);
        int u_id = (Integer) session.getAttribute("user_id");
         
        if (u_id == 0){
            %> 
            <script> 
                alert("Sorry, session Invalidated! Please log in Again.");
                window.location.href = "logout.jsp";
            </script>
            <%
        }

        try {
            String url = "jdbc:mysql://localhost:3306/cs336project";
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection(url, "root", "Dj@mysql29");
            Statement stmt = con.createStatement();
            
            if( flightnum.equals("") || passengersNum.equals("")){
                out.print("empty detected!");
                %> 
                <script> 
                    alert("Sorry, but all fields must be filled to create a new account.");
                    window.location.href = "OneWayForm.jsp";
                </script>
                <%
                return;
            }
            String dateCheckQuery = "SELECT * FROM FlightDate WHERE flight_id = '" + flightnum + "' AND depart_date = '" + depDate + "';";
            ResultSet dateCheckResult = stmt.executeQuery(dateCheckQuery);
            if (!dateCheckResult.next()) {
                %> 
                <script> 
                    alert("Sorry, no flights are available on the selected date.");
                    window.location.href = "OneWayForm.jsp";
                </script>
                <%
                return;
            }
            
            String select = "SELECT num_seats FROM flights WHERE flights.flight_num = '" + flightnum + "';";
            ResultSet pass = stmt.executeQuery(select);
            if (pass.next()){
                int passengers = pass.getInt(1);
                if (passengersNumber > passengers){
                    String insertWaitList = "INSERT INTO waiting (u_id, user_name, flight_id, num_passengers, class, OWdate) VALUES ('" + u_id + "', (SELECT user_name FROM users WHERE user_id='" + u_id + "'), '" + flightnum + "', '" + passengersNum + "', '"+ flightClass + "', '"+ depDate + "');";
                    stmt.executeUpdate(insertWaitList);

                    %> 
                    <script> 
                        alert("All seats are booked. You have been added to the waiting list.");
                        window.location.href = "customerLandingPage.jsp";
                    </script>
                    <%
                } else {
                    int passengersUpdate = passengers - passengersNumber;
                    String update = "UPDATE flights SET num_seats ='" + passengersUpdate + "' WHERE flights.flight_num = '" + flightnum + "';";
                    stmt.executeUpdate(update);
                }
            } else {
                %> 
                <script> 
                    alert("Sorry, that flight does not exist!");
                    window.location.href = "OneWayForm.jsp";
                </script>
                <%
            }

            java.util.Date utilDate = new Date();
            java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());
            
            String selectFare = "SELECT fare_first FROM flights WHERE flight_num = '" + flightnum + "';";
            ResultSet fareResult = stmt.executeQuery(selectFare);
            fareResult.next();
            double baseFare = fareResult.getDouble(1);

            double fare;
            if(flightClass.equals("Business")) {
                fare = baseFare + 30;
            } else if(flightClass.equals("First Class")) {
                fare = baseFare + 60;
            } else {
                fare = baseFare;
            }

            double totalPrice = passengersNumber * fare;

            String insert = "INSERT INTO Reservations (res_date, res_fare, res_tot, customer, num_passengers, flight_no, class, OWdate) VALUES ('" + sqlDate + "','" + fare + "','" + (totalPrice) + "','" + u_id +  "','" + passengersNumber + "','" + flightnum + "','" + flightClass + "','" + depDate + "');";
            PreparedStatement ps = con.prepareStatement(insert);
            ps.executeUpdate();

            String insertTrip = "INSERT INTO Trips (res_num, flights) VALUES (@@identity,'" + flightnum + "');";
            stmt.executeUpdate(insertTrip);
            
            String updateCus = "UPDATE users SET profits=profits+('" + totalPrice +"')"+ " WHERE user_id='" + u_id + "';";
            stmt.executeUpdate(updateCus);
            
            String updateFli = "UPDATE flights SET profits=profits+('" + totalPrice +"')"+ ", num_reserves=num_reserves+1 WHERE flight_num='" + flightnum + "';";
            stmt.executeUpdate(updateFli);
            
            String updateAir = "UPDATE Airport SET profits=profits+'" + totalPrice + "' WHERE Airport.Airport_id=(SELECT arrive_aid FROM flights F WHERE F.flight_num='"+ flightnum + "');";
            stmt.executeUpdate(updateAir);
            
            con.close();
            
            %> 
            <script> 
                alert("Congratulations! Your new reservation is created!");
                window.location.href = "customerLandingPage.jsp";
            </script>
            <%
        } catch (Exception ex) {
        	ex.printStackTrace();
            out.print("insert error");
            %> 
            <script> 
                alert("Sorry, something went wrong on our server, failed to create your reservation");
                window.location.href = "OneWayForm.jsp";
            </script>
            <%
            return;
        }
    %>
</body>
</html>
