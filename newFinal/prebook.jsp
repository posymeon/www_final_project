<%-- 
    Document   : index
    Created on : Jan 14, 2013, 2:23:31 AM
    Author     : Polixronis
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="java.io.*,java.util.*,java.sql.* " %>
<%@ page import="javax.servlet.*,java.text.*" %>
<%@ page import="java.util.Date,java.text.DateFormat,java.text.SimpleDateFormat,java.util.Calendar"%>

<%
    PrintWriter out1 = response.getWriter();
    String  bookingVenue = request.getParameter("bookingVenue");
    String user = "";
    String year="";
    String month="";
    String day="";
    String date="";
    String time="";
    String[][] datetime_array = new String[7][6];
    Date [] futureDates = new Date [7];
    futureDates[0] = new Date();
    DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
    
    //Date currentDate = new Date();
    //Date futureDate1 = new Date();
    //Date futureDate2 = new Date();
    //Date futureDate3 = new Date();
    //Date futureDate4 = new Date();
    //Date futureDate5 = new Date();
    //Date futureDate6 = new Date();
    Date iterateDate = new Date();
    Date compareDate = new Date();

    //futureDate1.setDate(currentDate.getDate()+1);
    //futureDate2.setDate(currentDate.getDate()+2);
    //futureDate3.setDate(currentDate.getDate()+3);
    //futureDate4.setDate(currentDate.getDate()+4);
    //futureDate5.setDate(currentDate.getDate()+5);
    //futureDate6.setDate(currentDate.getDate()+6);
    
    for(int i=1;i<7;i++){
        futureDates[i]=new Date();
        futureDates[i].setDate(futureDates[0].getDate()+i);
    }

   
    
    
    // declare a connection by using Connection interface 
    Connection connection = null;
          // declare object of Statement interface that uses for executing sql statements.
    Statement statement = null;
              // declare a resultset that uses as a table foroutput data from the table.
    ResultSet rs = null;
    int updateQuery = 0;
    // Load JBBC driver "com.mysql.jdbc.Driver".
    Class.forName("com.mysql.jdbc.Driver").newInstance();
    
    connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/FinalProject","root", " *******");

    statement = connection.createStatement();
    
    String QueryString = "SELECT * from booking WHERE venue='"+bookingVenue+"';";
   
    rs = statement.executeQuery(QueryString);
             for(int i=0;i<7;i++){
                 for(int j=0;j<6;j++)
                        datetime_array[i][j]="Available!";
                }
    
            while (rs.next()) {
                date=rs.getString(2);
                time =rs.getString(3);
                
                year=date.substring(0,4);
                month=date.substring(5,7);
                day=date.substring(8,10);
                iterateDate.setDate(Integer.parseInt(day));
                iterateDate.setMonth(Integer.parseInt(month)-1);
                iterateDate.setYear(Integer.parseInt(year)-1900);
                for(int i=0;i<7;i++){
                        if((iterateDate.equals(futureDates[0]))){
                            if(Integer.parseInt(time)==i+18){
                                datetime_array[0][i]="Booked!";
                            }
                        }
                        if((iterateDate.equals(futureDates[1]))){
                            if(Integer.parseInt(time)==i+18){
                                datetime_array[1][i]="Booked!";
                            }
                        }
                        if((iterateDate.equals(futureDates[2]))){
                            if(Integer.parseInt(time)==i+18){
                                datetime_array[2][i]="Booked!";
                            }
                        }
                        if((iterateDate.equals(futureDates[3]))){
                            if(Integer.parseInt(time)==i+18){
                                datetime_array[3][i]="Booked!";
                            }
                        }
                        if((iterateDate.equals(futureDates[4]))){
                            if(Integer.parseInt(time)==i+18){
                                datetime_array[4][i]="Booked!";
                            }
                        }
                        if((iterateDate.equals(futureDates[5]))){
                            if(Integer.parseInt(time)==i+18){
                                datetime_array[5][i]="Booked!";
                            }
                        }
                        if((iterateDate.equals(futureDates[6]))){
                            if(Integer.parseInt(time)==i+18){
                                datetime_array[6][i]="Booked!";
                            }
                        }
                }
                
            } 
       
       rs.close();
       statement.close();
       connection.close(); 
       

%>
<html>
    <head>
	 <link rel="stylesheet" type="text/css" href="prebook.css">
	<link rel="icon" href="http://83.212.100.171:9090/newFinal/images/favicon.ico" type="image/ico" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Booking the field</title>
        <script>
            function validate(objForm){
                var x =document.objForm.date.value;
                var time = document.objForm.time.value;
                var year=x[0]+ x[1]+ x[2]+ x[3];
                var month=x[5]+x[6];
                var day = x[8]+x[9];
                
                var today = new Date();
                var currTime =  today.getTime(); 
                var bookingDate = new Date();
                bookingDate.setDate(bookingDate.getDate()+6);
                
                var datex=new Date();
                datex.setFullYear(year,month-1,day);
                
                if(time>23 && time<0){
                    alert("You selected a time value that is not acceptable");
                    alert("Availabe times are from 00h to 23h");
                }
                
                if(currTime>= time){
                    alert("The booking time you selected is invalid!");
                    
                }
                
                if(datex<today)
                {
                    alert("You selected a date that has passed!");
                    return false;
                }
                
                if(datex>bookingDate){
                    alert("The date you selected is larger than the allowed booking date!");
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
		user = session.getAttribute("sUserID").toString();
	%>
		<jsp:include page="loggedin.jsp"/>
	<%
	}

	%>

<div id="booking">
	<h2><%=bookingVenue%> reservations table</h2>
        <form name="objForm" method="post" action="booking.jsp">
        <%
        %>
        <table width="658" border="1">
            <tr>
                <td width="63">Time/Date</td>
        <%
            for(int i=0;i<7;i++){
            %>
                <td width="85"><%=dateFormat.format(futureDates[i])%></td>
                <%
            
            }
        %>
            </tr>
            
                <%
            for(int j=18;j<24;j++){
                %>
                <tr>
                    <td><%=j%>:00</td>
            <%
                for(int i=0;i<7;i++){
                    if(compareDate.getHours()>=j && compareDate.getDate() == futureDates[i].getDate()){
                    %>
                    <td>Unavailable!</td>
                    <%
                    }
		      else if(datetime_array[i][j-18].equals("Booked!")){
                    %>
                    <td>Booked!</td>
                    <%
                    }
                    else{
				session = request.getSession(false);
                    		if(session == null || session.getAttribute("sUserID")==null){
				%>
				<td>
				<a href="http://83.212.100.171:9090/newFinal/errorLogin.jsp"><%=datetime_array[i][j-18]%></a>
				</td>
				<%
				}
				else{
                    		%>
                    		<td>
                        	<a href="http://83.212.100.171:9090/newFinal/booking.jsp?venue=<%=bookingVenue%>&date=<%=dateFormat.format(futureDates[i])%>&time=<%=j%>&user=<%=user%>"><%=datetime_array[i][j-18]%></a>
                    		</td>
                    		<%
				}
                        }
                }
                %>
                </tr>
                    <%
            }
       %>
                </form>    
</div>
                <%
    
    

%>
</body>
      <jsp:include page="footer.jsp"/>      
</html>
