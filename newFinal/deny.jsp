<html>
    <head>
        <link rel="stylesheet" type="text/css" href="deny.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Log in</title>
        
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
              
            <div id="insert">              
                <div id="text">
                    <h2>You have to be logged in for this action.</h2>
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
                
             <div id="register">
                        <form name="account.jsp"  method="post" action="account.jsp">
                            <table cellspacing="0">
                                <tr>                                   
                                    <td>
                                        <p>Not register yet?</p>
                                        <input type="submit" name="Submit" value="Register Now!">
                                    </td>
                                </tr>
                            </table>
                         </form>
            </div>   
             
            </div>
            
            </body>
</html>
