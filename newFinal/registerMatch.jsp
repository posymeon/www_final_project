<%-- 
    Document   : registerMatch
    Created on : Feb 17, 2013, 6:39:43 PM
    Author     : Polixronis
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
	session = request.getSession(false);
                    if(session == null || session.getAttribute("sUserID")==null){
	%>
        	<jsp:include page="errorLogin.jsp"/>
	<%

	}
	else{
	%>
		<jsp:include page="loggedin.jsp"/>
		<jsp:include page="matchRegister.html"/>		
		<jsp:include page="footer.jsp"/>

	<%
	}

	%>

