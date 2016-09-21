
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="index.css">
	 <link rel="icon" href="http://83.212.100.171:9090/newFinal/images/favicon.ico" type="image/ico" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>e-Gipedo</title>
        
        <script>
            function trim(s) 
            {
                return s.replace( /^\s*/, "" ).replace( /\s*$/, "" );
            }

            function validate()
            {
                if(trim(document.frmLogin.sUserName.value)=="")
                {
                  alert("Login empty");
                  document.frmLogin.sUserName.focus();
                  return false;
                }
                else if(trim(document.frmLogin.sPwd.value)=="")
                {
                  alert("password empty");
                  document.frmLogin.sPwd.focus();
                  return false;
                }
            }
        </script>

        
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
            
            
        
        <div id="foto">
            <img id="image" src="images/foto2.jpg">
        </div>
        <div id="options">
            
            <div id="tableContainer">
                <div id="tableRow">
            
                    <div id="part1">
                        <div id="atoma">
                            <div id="p1">
                                <h3>PLAYERS</h3>
                                <p>Find opponents. </p>
                            </div>
                            <div id="players">
                                <a href="http://83.212.100.171:9090/newFinal/findRival.jsp"><img id="con" src="images/people.png"></a>
                            </div>
                        </div>    

                        <div id="ghpeda">
                            <div id="p2">
                                <h3>FIELDS</h3>
                                <p>Find and book a Field</p>                                
                            </div>
                            <div id="fields">
                                <a href="http://83.212.100.171:9090/newFinal/findField.jsp"><img id="con" src="images/terma.png"></a>
                            </div> 
                       </div>

                    </div>

                    <div id="part2">
                        <div id="diagwnismos">
                            <div id="p3">
                                <h3>ABOUT</h3>
                                <p>What we do? </p>
                            </div>
                            <div id="compete">
                                <a href="http://83.212.100.171:9090/newFinal/about.jsp"><img id="con" src="images/about.png"></a>
                            </div>
                        </div>    

                        <div id="epikoinwnia">
                            <div id="p4">
                                <h3>CONTACT</h3>
                                <p>Contact us. </p>                        
                            </div>
                            <div id="fields">
                                <a href="http://83.212.100.171:9090/newFinal/contact.jsp"><img id="con" src="images/contact.png"></a>
                            </div> 
                       </div>
                
                    </div>
                 </div>
             </div>
            
        </div>
    </body>
<footer>
      <jsp:include page="footer.jsp"/>
</footer>
</html>
