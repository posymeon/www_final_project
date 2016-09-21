<%-- 
    Document   : profile
    Created on : Feb 17, 2013, 8:24:52 PM
    Author     : Polixronis
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.* " %>
<%@ page import="javax.servlet.*,java.text.*" %>
<!DOCTYPE html>

<%
PrintWriter out1 = response.getWriter();
Connection connection = null;
Statement statement = null;
ResultSet rs = null;
int updateQuery = 0;
Class.forName("com.mysql.jdbc.Driver").newInstance();
String firstname = "" ;
String lastname = "";
String phone = "";
String  email = "";
String  city = "";
String venue="";
String date = "";
String time = "";
int i=0;

session = request.getSession(false); 





       
%>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="profile.css">
	<link rel="icon" href="http://83.212.100.171:9090/newFinal/images/favicon.ico" type="image/ico" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>My profile</title>
    </head>

	

    <body>
        <%
        
        if(session == null || session.getAttribute("sUserID")==null){
%>
        <jsp:include page="errorLogin.jsp"/>
                <%
        }
        else{

	
	String username = session.getAttribute("sUserID").toString();
	connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/FinalProject","root", "*******");
	statement = connection.createStatement();
	String QueryString = "SELECT * from userregister WHERE sUserID='"+username+"';"; 
	rs = statement.executeQuery(QueryString);

	if (rs.next()) {

 	firstname = rs.getString("sFirstName");
 	lastname = rs.getString("sLastName");
 	phone = rs.getString("sContact");
  	email = rs.getString("sEmail");
  	city = rs.getString("iCityID");

	}

	QueryString ="SELECT * from booking WHERE user='"+username+"';";
	rs = statement.executeQuery(QueryString);

%>
	<jsp:include page="loggedin.jsp"/>
        <div id="profile">
		<div id="picture">
		<img src="images/man2.jpg" id="avatar">
		</div>            
                <div id="person">
                    <p>Username: <%=username%> </p>
                    <p>First name: <%=firstname%></p>
                    <p>Last name: <%=lastname%></p>
                    <p>e-mail: <%=email%></p>
                    <p>Telephone: <%=phone%></p>
                    <p>City: <%=city%></p>
                </div>
                <div id="bookings"">
                    <p>Your reservations:</p>
                    <%
                    while(rs.next())
                    {
                       venue =  rs.getString("venue");
                       date = rs.getString("date");
                       time = rs.getString("time");
			i++;

%>
                    <form name="cancel" action="cancelReservation.jsp">
                    <p><%=i%>) Date: <%=date%> Field: <%=venue%> Time: <%=time%>:00</p><input type="submit" value="Cancel Reservation">
                    <input name="username"type="hidden" id="username" value="<%=username%>">
                    <input name="date"type="hidden" id="date" value="<%=date%>">
                    <input name="venue"type="hidden" id="venue" value="<%=venue%>">
                    <input name="time"type="hidden" id="time" value="<%=time%>">
                    </form>
                    <%
                    }                    
%>

			<form name="reserve" action="findField.jsp">
			<input type="submit" value="Reserve field!">
			</form>
                </div>
       </div> 
        <%
	 rs.close();
        statement.close();
        connection.close(); 
       }
%>
    </body>
    <jsp:include page="footer.jsp"/>
</html>


