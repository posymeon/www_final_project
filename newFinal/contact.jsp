<%-- 
    Document   : contact
    Created on : Feb 17, 2013, 1:18:30 PM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="contact.css">
	<link rel="icon" href="http://83.212.100.171:9090/newFinal/images/favicon.ico" type="image/ico" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Contact</title>
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
        <div id="contact">
            <h3 id="kef">CONTACT US</h3>
            <div id="meet">
                <p>Our team will answer all your questions </br>and find solutions for any issue.</p>
                <table border="0">
                    <tr>
                        <td>MEET US :</td>
                        <td> at Volos, 2421055555 </td>
                    </tr>
                    <tr>
                        <td>E-Mail us : </td>
                        <td>playgroundsvolos@gmail.com</td>
                    </tr>
                </table>
            </div>
        </div>
    </body>
<footer>
      <jsp:include page="footer.jsp"/>
</footer>
</html>
