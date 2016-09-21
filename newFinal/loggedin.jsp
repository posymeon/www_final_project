<%-- 
    Document   : loggedin
    Created on : Feb 16, 2013, 11:47:33 PM
    Author     : Polixronis
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<link rel="stylesheet" type="text/css" href="loggedin.css">
<div id="header">
			<div id="insert">
                            <div id="logout">
                            <form name="logout" action="doLogout.jsp" method="post">
					<input type="submit" id="button" name="sSubmit" value="Log out" />
			    </form>                                                       
                            </div>
                            <a href="http://83.212.100.171:9090/newFinal/profile.jsp" id="link"><p>Welcome <%=session.getAttribute("sUserID")%></p></a>      
                            
			</div>
		<a href="http://83.212.100.171:9090/newFinal/"><img src="images/egipedo.png" id="egipedo"></a>            
</div>
