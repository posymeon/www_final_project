<%-- 
    Document   : about
    Created on : Feb 17, 2013, 11:55:10 PM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
	<link rel="stylesheet" type="text/css" href="about.css">
	<link rel="icon" href="http://83.212.100.171:9090/newFinal/images/favicon.ico" type="image/ico" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>About us!</title>
    </head>
    <body>
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
	<div id="about">
        	<h1>Welcome at e-Gipedo!</h1>
		<p>e-Gipedo is an online platform for the athletic community and it's facilities.
		e-Gipedo offers the opportunity to find an opponent team, check the available 
		fields and reserve a field.    
		</p>

		<h2>Players</h2>
		<p>This option offers a unique way to find rivals.  You can place your challenge or
		accept an already placed one. 
		</p>
	
		<h2>Fields</h2>
		<p>This option offers the capability to check the availability of every field in your area
		and see the exact location on the map.  Also, registered members can reserve a field.
		</p>
	</div>
    </body>
	<footer>
		<jsp:include page="footer.jsp"/>
	</footer>
</html>
