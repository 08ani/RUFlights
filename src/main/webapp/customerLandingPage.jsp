<%@ page import="java.sql.*,javax.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Traveler's Dashboard</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
body,h1,h2,h3,h4,h5 {font-family: "Raleway", sans-serif}
.w3-bar,.w3-button {background-color:#4CAF50;color:#ffffff}
</style>
</head>
<body>

<!-- Navbar -->
<div class="w3-bar w3-card">
    <a href="#" class="w3-bar-item w3-button">Home</a>
    <a href="OneWayForm.jsp" class="w3-bar-item w3-button">One Way</a>
    <a href="roundTripForm.jsp" class="w3-bar-item w3-button">Round Trip</a>
    <a href="customerDetails.jsp" class="w3-bar-item w3-button">Browse</a>
    <a href="salesRepForm.jsp" class="w3-bar-item w3-button">Best Deals</a>
    <a href="forum.jsp" class="w3-bar-item w3-button">Forum</a>
    <a href="logout.jsp" class="w3-bar-item w3-button">Logout</a>
</div>

<!-- Header -->
<header class="w3-container" style="padding:128px 16px; background-color: #f1f1f1">
  <h1 class="w3-margin w3-jumbo">Welcome, <%= session.getAttribute("user_name") %>!</h1>
  <p class="w3-xlarge">Ready for your next adventure?</p>
  <button onclick="window.location.href='viewReservations.jsp';" class="w3-button w3-green w3-padding-large w3-large w3-margin-top">View My Reservations</button>
</header>
<!-- Notification Section -->
<div class="w3-container">
    <% 
    // Establish database connection
    String url = "jdbc:mysql://localhost:3306/cs336project"; // Database URL
    String username = "root"; // Database username
    String password = "Dj@mysql29"; // Database password
    Connection con = null;

    try {
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection(url, username, password);

        // Fetch the user id of the logged-in user
        Integer userId = (Integer) session.getAttribute("user_id");
        if (userId != null) {
            PreparedStatement pstmt = con.prepareStatement("SELECT * FROM notifications WHERE user_id = ? AND seen = FALSE");
            pstmt.setInt(1, userId);
            ResultSet rs = pstmt.executeQuery();

            while(rs.next()) {
                out.println("<div class='w3-panel w3-green'><p>" + rs.getString("message") + "</p></div>");
                // Update the notification as seen
                PreparedStatement updatePstmt = con.prepareStatement("UPDATE notifications SET seen = TRUE WHERE notification_id = ?");
                updatePstmt.setInt(1, rs.getInt("notification_id"));
                updatePstmt.executeUpdate();
            }
        } else {
            // User ID not found in session
            out.println("<p>User ID not found in session.</p>");
        }
    } catch(ClassNotFoundException e) {
        out.println("<p>Driver not found: " + e.getMessage() + "</p>");
    } catch(SQLException e) {
        out.println("<p>Database error: " + e.getMessage() + "</p>");
    } finally {
        if (con != null) {
            try { con.close(); } catch (SQLException e) { /* handle close exception */ }
        }
    }
    %>
</div>

<!-- Travel Tips Grid -->
<div class="w3-row-padding w3-padding-64 w3-container" style="background-color: #ffffff">
  <div class="w3-content">
    <div class="w3-twothird">
      <h1>Travel Tips & Guidelines</h1>
      <h5 class="w3-padding-32">Make the most out of your trip with these helpful tips.</h5>
      <ul class="w3-text-grey">
        <li>Check the weather forecast and pack accordingly.</li>
        <li>Keep copies of important documents in a secure place.</li>
        <li>Stay hydrated and adjust to time zone changes gradually.</li>
        <li>Learn a few phrases in the local language - it goes a long way!</li>
        <li>Use trusted apps to find local attractions and dining.</li>
      </ul>
    </div>
    <div class="w3-third w3-center">
      <i class="fa fa-globe w3-padding-64 w3-text-green w3-margin-right" style="font-size:200px;"></i>
    </div>
  </div>
</div>

<!-- Deals Grid -->
<div class="w3-row-padding w3-light-grey w3-padding-64 w3-container">
  <div class="w3-content">
    <div class="w3-third w3-center">
      <i class="fa fa-plane w3-padding-64 w3-text-green w3-margin-right" style="font-size:220px;"></i>
    </div>
    <div class="w3-twothird">
      <h1>Exclusive Travel Deals</h1>
      <h5 class="w3-padding-32">Fly higher with the best offers.</h5>
      <p class="w3-text-grey">Discover exciting destinations at unbeatable prices. Explore our curated selection of flight deals, special hotel rates, and more - personalized just for you. Safe travels and happy explorations!</p>
    </div>
  </div>
</div>

<!-- Inspirational Quote -->
<div class="w3-container w3-green w3-center w3-padding-64">
    <h1 class="w3-margin w3-xlarge">"Adventure is worthwhile in itself." - Amelia Earhart</h1>
</div>

<!-- Footer -->
<footer class="w3-container w3-padding-64 w3-center w3-opacity">  
  <div class="w3-xlarge w3-padding-32">
    <i class="fa fa-facebook-official w3-hover-opacity"></i>
    <i class="fa fa-instagram w3-hover-opacity"></i>
    <i class="fa fa-snapchat w3-hover-opacity"></i>
    <i class="fa fa-twitter w3-hover-opacity"></i>
    <i class="fa fa-linkedin w3-hover-opacity"></i>
 </div>
 <p>Powered by <a href="https://www.w3schools.com/w3css/default.asp" target="_blank">w3.css</a></p>
</footer>

<script>
function myFunction() {
  var x = document.getElementById("navDemo");
  if (x.className.indexOf("w3-show") == -1) {
    x.className += " w3-show";
  } else { 
    x.className = x.className.replace(" w3-show", "");
  }
}
</script>

</body>
</html>
