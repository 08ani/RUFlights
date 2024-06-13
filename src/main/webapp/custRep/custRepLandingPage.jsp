<!DOCTYPE html>
<html lang="en">
<head>
<title>Manager Dashboard</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Montserrat">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
body,h1,h2,h3,h4,h5,h6 {font-family: "Lato", sans-serif}
.w3-bar,h1,button {font-family: "Montserrat", sans-serif}
.fa-anchor,.fa-coffee {font-size:200px}
.w3-bar,.w3-button {background-color:#333;color:white}
</style>
</head>
<body>

<!-- Navbar -->
<div class="w3-top">
  <div class="w3-bar w3-card w3-left-align w3-large" style="background-color: #d3d4dd">
    <a class="w3-bar-item w3-button w3-hide-medium w3-hide-large w3-right w3-padding-large w3-hover-white w3-large w3-green" href="javascript:void(0);" onclick="myFunction()" title="Toggle Navigation Menu"><i class="fa fa-bars"></i></a>
    <a href="javascript:window.location.href=window.location.href" class="w3-bar-item w3-button w3-padding-large w3-white">Home</a>
    <a href="handleReservation2.jsp" class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white">Make Reservations</a>
    <a href="airportInfo.jsp" class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white">Edit Information</a>
    <a href="custRepForum.jsp" class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white">Forum</a>
    <a href="../logout.jsp" class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white">Logout</a>
  </div>

  <!-- Navbar on small screens -->
  <div id="navDemo" class="w3-bar-block w3-white w3-hide w3-hide-large w3-hide-medium w3-large">
    <a href="javascript:window.location.href=window.location.href" class="w3-bar-item w3-button w3-padding-large">Home</a>
    <a href="handleReservation2.jsp" class="w3-bar-item w3-button w3-padding-large">Make Reservations</a>
    <a href="airportInfo.jsp" class="w3-bar-item w3-button w3-padding-large">Edit Information</a>
    <a href="custRepForum.jsp" class="w3-bar-item w3-button w3-padding-large">Forum</a>
    <a href="../logout.jsp" class="w3-bar-item w3-button w3-padding-large">Logout</a>
  </div>
</div>

<!-- Header -->
<header class="w3-container w3-center" style="padding:128px 16px; background-color: #d3d4dd">
  <h1 class="w3-margin w3-jumbo">WELCOME <%= session.getAttribute("user_name") %>!</h1>
  <p class="w3-xlarge">Dedicated to Excellence in Service</p>
  <button onclick="window.location.href='waitlistInfo.jsp';" class="w3-button w3-green w3-padding-large w3-large w3-margin-top">Waiting List Information</button>
  <button onclick="window.location.href='flightInfo.jsp';" class="w3-button w3-green w3-padding-large w3-large w3-margin-top">Flight Information</button>
</header>

<!-- COVID-19 Grid -->
<div class="w3-row-padding w3-padding-64 w3-container" style="background-color: #f1f1f1">
  <div class="w3-content">
    <div class="w3-twothird">
      <h1>Covid-19 Travel Warning</h1>
      <h5 class="w3-padding-32">Our Customers' Safety is Our Priority</h5>
      <p class="w3-text-grey">
        It is critical to continue monitoring your health and practicing social distancing:
        <ul>
          <li>Check your temperature regularly and watch for symptoms.</li>
          <li>Stay home if you feel unwell or have been exposed to someone who is sick.</li>
          <li>Avoid public transportation if possible to limit exposure.</li>
          <li>Maintain a safe distance from others, especially in crowded areas.</li>
        </ul>
      </p>
    </div>
    <div class="w3-third w3-center">
      <i class="fa fa-shield w3-padding-64 w3-text-green" style="font-size: 200px"></i>
    </div>
  </div>
</div>

<!-- Travel Tips Grid -->
<div class="w3-row-padding w3-light-grey w3-padding-64 w3-container">
  <div class="w3-content">
    <div class="w3-third w3-center">
      <i class="fa fa-info-circle w3-padding-64 w3-text-green w3-margin-right" style="font-size: 200px"></i>
    </div>
    <div class="w3-twothird">
      <h1>Travel Tips for Managers</h1>
      <h5 class="w3-padding-32">Streamline Your Management Process</h5>
      <p class="w3-text-grey">
        Stay updated with the latest management strategies:
        <ul>
          <li>Adopt digital tools for efficient scheduling and resource allocation.</li>
          <li>Provide ongoing training for staff to ensure top-notch customer service.</li>
          <li>Implement feedback systems for continuous improvement.</li>
          <li>Regularly review operational data to identify trends and areas for growth.</li>
        </ul>
      </p>
    </div>
  </div>
</div>

<div class="w3-container w3-black w3-center w3-opacity w3-padding-64">
    <h1 class="w3-margin w3-xlarge">Empowerment through Knowledge and Innovation</h1>
</div>

<!-- Footer -->
<footer class="w3-container w3-padding-64 w3-center w3-opacity">  
  <div class="w3-xlarge w3-padding-32">
   <i class="fa fa-facebook-official w3-hover-opacity"></i>
   <i class="fa fa-instagram w3-hover-opacity"></i>
   <i class="fa fa-snapchat w3-hover-opacity"></i>
   <i class="fa fa-pinterest-p w3-hover-opacity"></i>
   <i class="fa fa-twitter w3-hover-opacity"></i>
   <i class="fa fa-linkedin w3-hover-opacity"></i>
 </div>
 <p>Powered by <a href="https://www.w3schools.com/w3css/default.asp" target="_blank">w3.css</a></p>
</footer>

<script>
// Toggle the menu on small screens
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
