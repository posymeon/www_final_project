<%-- 
    Document   : errorLogin
    Created on : Feb 17, 2013, 6:41:01 PM
    Author     : Polixronis
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
	<link rel="stylesheet" type="text/css" href="errorLogin.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login page</title>
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

        <h1>You have to be logged in!</h1>
                  
    </body>
	<footer>
	<jsp:include page="footer.jsp"/>
	</footer>
</html>
