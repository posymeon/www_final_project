<%-- 
    Document   : findField
    Created on : Jan 11, 2013, 4:32:00 PM
    Author     : user
--%>

<%@page import="java.io.IOException" %>
<%@page import="java.io.PrintWriter"%>
<%@page import="javax.servlet.ServletException"%>
<%@ page import="javax.servlet.http.HttpServlet"%>
<%@ page import="javax.servlet.http.HttpServletRequest"%>
<%@page import="javax.servlet.http.HttpServletResponse"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Statement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
	 <link rel="stylesheet" type="text/css" href="findField.css">
	<link rel="icon" href="http://83.212.100.171:9090/newFinal/images/favicon.ico" type="image/ico" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Find a field!</title>
    </head>
	<%
	session = request.getSession(false);
                    if(session == null || session.getAttribute("sUserID")==null){
	%>
        	<jsp:include page="notloggedin.jsp"/>
	<%

	}
	else{
	%>
		<jsp:include page="loggedin.jsp"/>
	<%
	}

	%>
      	<div id="select">
        						
        		<form action="finder" method="get">
            			<input list="locations" name="location" id="space" placeholder="Select your town">
            		  	  	<datalist id="locations">
              		  		<option value="Volos">
              		   		<option value="Larisa">
              		   		<option value="Trikala">
              		  		<option value="Karditsa">
            		       	  </datalist>
				<input type="submit" id="button2" value="search">
			
        	</form>
	</div>         
        
    </body>
<footer>
      <jsp:include page="footer.jsp"/>
</footer>
</html>