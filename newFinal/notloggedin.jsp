<%-- 
    Document   : notloggedin
    Created on : Feb 16, 2013, 11:48:04 PM
    Author     : Polixronis
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<link rel="stylesheet" type="text/css" href="notloggedin.css">
<div id="header">
            <div id="insert">
                
                <div id="register">
                        <form name="account.jsp"  method="post" action="account.jsp">
                            <table cellspacing="0">
                                <tr>                                   
                                    <td>
                                        <input type="submit" name="Submit" value="Register Now!">
                                    </td>
                                </tr>
                            </table>
                         </form>
            </div>
                
            <div id="login">
                        <form name="frmLogin"  onSubmit="return validate();" action="doLogin.jsp" method="post">
                            <table cellspacing="0">                                
                               <tr>
                                    <td>
                                        <input id="username" type="text" tabindex="1" name="sUserName" placeholder="username">
                                    </td>
                                    <td>
                                        <input id="password" type="password" name="sPwd" placeholder="password">
                                    </td>
                                    <td>
                                        <input type="submit" id="button" name="sSubmit" value="Log in" />
                                    </td> 
                               </tr>     
                            </table>
                       </form>
             </div>
             
            </div>
		<a href="http://83.212.100.171:9090/newFinal/"><img src="images/egipedo.png" id="egipedo"></a>           
</div>
