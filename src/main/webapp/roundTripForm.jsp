<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Search for Flights!</title>
        <link rel="stylesheet" type="text/css" href="css/login.css">
    </head>
    <body style="background-color: #cc0033; color:white">
        <div class="login-page">
            <div class="form">
                <h3>ROUND TRIP</h3>
                <form method="get" action="roundTripFlightResults.jsp" enctype="text/plain">
                    <table>
                        <tr>
                            <td>Departing Airport</td>
                        </tr>
                        <tr>
                            <td>
                                <select name="depport">
                                    <option>--Select--</option>
                                    <option>EWR</option>
                                    <option>JFK</option>
                                    <option>MIA</option>
                                    <option>SFO</option>
                                    <option>MDW</option>
                                    <option>LAX</option>
                                    <option>ATL</option>
                                    <option>ORD</option>
                                    <option>DFW</option>
                                    <option>DEN</option>
                                    <option>SEA</option>
                                    <option>LAS</option>
                                    <option>MCO</option>
                                    <option>CLT</option>
                                    <option>PHX</option>
                                    <option>IAH</option>
                                    <option>BOS</option>
                                    <option>MSP</option>
                                    <option>FLL</option>
                                    <option>DTW</option>
                                    <option>PHL</option>
                                    <option>LGA</option>
                                    <option>---INTERNATIONAL---</option>
                                    <option>LCY</option>
                                    <option>DUB</option>
                                    <option>PEK</option>
                                    <option>SYD</option>
                                    <option>YTZ</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>Arriving Airport</td>
                        </tr>
                        <tr>
                            <td>
                                <select name="arrivport">
                                    <option>--Select--</option>
                                    <option>EWR</option>
                                    <option>JFK</option>
                                    <option>MIA</option>
                                    <option>SFO</option>
                                    <option>MDW</option>
                                    <option>LAX</option>
                                    <option>ATL</option>
                                    <option>ORD</option>
                                    <option>DFW</option>
                                    <option>DEN</option>
                                    <option>SEA</option>
                                    <option>LAS</option>
                                    <option>MCO</option>
                                    <option>CLT</option>
                                    <option>PHX</option>
                                    <option>IAH</option>
                                    <option>BOS</option>
                                    <option>MSP</option>
                                    <option>FLL</option>
                                    <option>DTW</option>
                                    <option>PHL</option>
                                    <option>LGA</option>
                                    <option>---INTERNATIONAL---</option>
                                    <option>LCY</option>
                                    <option>DUB</option>
                                    <option>PEK</option>
                                    <option>SYD</option>
                                    <option>YTZ</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>Take off date</td>
                        </tr>
                        <tr>
                            <td>
                                <input type="text" name="take_off_date" placeholder="YEAR-MM-DD">
                            </td>
                        </tr>
                        <tr>
                            <td>Return Back Flight Date</td>
                        </tr>
                        <tr>
                            <td>
                                <input type="text" name="arrive_date" placeholder="YEAR-MM-DD"> Or Search By FlightID:
                                <input type="text" name="flightID" placeholder="Flight ID">
                            </td>
                        </tr>
                        
                    </table>
                    <input type='submit' name="submit" value='Submit'>   
                </form>
                <br>
                <input id="button" type="button" value="GO BACK" onclick="window.location.href = 'customerLandingPage.jsp'">
            </div>
        </div>
    </body>
</html>
