<%-- 
    Document   : findRival
    Created on : Jan 13, 2013, 5:28:11 PM
    Author     : koynoypis
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
<%@page import="java.util.*"%>
<%@page import="java.text.*"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
	<link rel="stylesheet" type="text/css" href="findRival.css">
	<link rel="icon" href="http://83.212.100.171:9090/newFinal/images/favicon.ico" type="image/ico" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Find a rival team</title>
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
	<div id="reg">
        	<a href="http://83.212.100.171:9090/newFinal/registerMatch.jsp" class="koumpi">Register your match!</a>
	</div>
        <div id="rivals">
        <h1>See who else is looking for a rival:</h1>
       <%
        
            
            
            Connection con = null;  
            Statement stmt = null;
            ResultSet rs = null;
            
            try{
                
                Class.forName("com.mysql.jdbc.Driver");
                con =DriverManager.getConnection 
                ("jdbc:mysql://localhost:3306/FinalProject","root", "*******");
                stmt = con.createStatement();
             
                rs = stmt.executeQuery("SELECT * FROM FindRival");
                if(rs.next()){
                          %><table border="1"><tr><th>Πόλη</th><th>Γήπεδο</th><th>Ημέρα</th><th>'Ωρα</th><th>Χρήστης</th><th></th><th></th></tr><%
                          
                          
                            
                            
                            do{
                                
                                %><tr><td><%
                                out.println(rs.getObject(1).toString());
                                %></td><td><%
                                out.println(rs.getObject(2).toString());
                                %></td><td><%
                                out.println(rs.getObject(3).toString());
                                %></td><td><%
                                out.println(rs.getObject(4).toString());
                                %></td><td><%
                                out.println(rs.getObject(5).toString());
                                %></td><td><%
				if(!(session == null || session.getAttribute("sUserID")==null)){
					if(session.getAttribute("sUserID").toString().equals(rs.getObject(5).toString())){
                                out.println("<form name=\"input\" action=\"cancelMatch\" method=\"get\">");
                                out.println("<input type=\"hidden\", name=\"city\" value="+rs.getObject(1).toString() +">");
                                out.println("<input type=\"hidden\", name=\"bookingVenue\" value="+rs.getObject(2).toString() +">");
                                out.println("<input type=\"hidden\", name=\"day\" value="+rs.getObject(3).toString() +">");
                                out.println("<input type=\"hidden\", name=\"time\" value="+rs.getObject(4).toString() +">");
                                out.println("<input type=\"hidden\", name=\"user\" value="+rs.getObject(5).toString() +">");
                                out.println("<input type=\"submit\" value=\"Cancel\" name=\"cancel\" class=\"koumpi\">");
                                out.println("</form>");
					}
                                %></td><td><%
                                out.println("<form name=\"input\" action=\"acceptMatch\" method=\"get\">");
                                out.println("<input type=\"hidden\", name=\"user\" value="+rs.getObject(5).toString() +">");
                                out.println("<input type=\"hidden\", name=\"city\" value="+rs.getObject(1).toString() +">");
                                out.println("<input type=\"hidden\", name=\"bookingVenue\" value="+rs.getObject(2).toString() +">");
                                out.println("<input type=\"hidden\", name=\"day\" value="+rs.getObject(3).toString() +">");
                                out.println("<input type=\"hidden\", name=\"time\" value="+rs.getObject(4).toString() +">");

                                out.println("<input type=\"submit\" value=\"Accept\" name=\"accept\" class=\"koumpi\">");
                                out.println("</form>");
                                %></td></tr><%
                                }
                            }while (rs.next());
                            %></table></div>

<jsp:include page="footer.jsp"/>
    </body>
<footer>

</footer>
</html>
<%
                
                }
                else{
                    out.println("There is no one looking for a rival.sorry.");
                
                }
             
            
            }catch (SQLException e) {
                throw new ServletException("Servlet Could not display records.", e);
            } catch (ClassNotFoundException e) {
             throw new ServletException("JDBC Driver not found.", e);
            
            }finally {         
            try {
                if(rs != null) {
                    rs.close();
                    rs = null;
                }
                if(stmt != null) {
                    stmt.close();
                    stmt = null;
                }
                if(con != null) {
                    con.close();
                    con = null;
                }
            } catch (SQLException e) {}
  
                    out.close();
               } 
            
            
            
            





       %>
	

