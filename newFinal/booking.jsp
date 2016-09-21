<%@ page import="java.sql.*" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.util.Date,java.text.DateFormat,java.text.SimpleDateFormat,java.util.Calendar"%>
        <%
        PrintWriter out1 = response.getWriter();
        String  bookingVenue = request.getParameter("venue");
        String  bookingDate = request.getParameter("date");
        String bookingTime = request.getParameter("time");
        String user=request.getParameter("user");
        boolean flag=false;
        out1.println(bookingDate + bookingTime);
        
        Statement statement = null;//test
        ResultSet rs = null;//test
        Date iterateDate = new Date();//test
        Date bookDate = new Date();//test
        String iyear="";//test
        String imonth="";//test
        String iday="";//test
        String idate="";//test
        String itime="";//test
        
        String bookyear=bookingDate.substring(0,4);//test
        String bookmonth=bookingDate.substring(5,7);//test
        String bookday=bookingDate.substring(8,10);//test 

        bookDate.setDate(Integer.parseInt(bookday));//test
        bookDate.setMonth(Integer.parseInt(bookmonth)-1);//test
        bookDate.setYear(Integer.parseInt(bookyear)-1900);//test
        
        Class.forName("com.mysql.jdbc.Driver");
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/FinalProject","root", "*******");
        
        statement = con.createStatement();//test
        String QueryString = "SELECT * from booking WHERE venue='"+bookingVenue+"';";//test
        rs = statement.executeQuery(QueryString);//test
        while (rs.next()) {//test
            idate=rs.getString(2); //test
            itime =rs.getString(3); //test
            
            iyear=idate.substring(0,4);//test
            imonth=idate.substring(5,7);//test
            iday=idate.substring(8,10);//test
            iterateDate.setDate(Integer.parseInt(iday));//test
            iterateDate.setMonth(Integer.parseInt(imonth)-1);//test
            iterateDate.setYear(Integer.parseInt(iyear)-1900);//test
            
            if(bookDate.equals(iterateDate) && (Integer.parseInt(bookingTime)==Integer.parseInt(itime))){//test
                flag=true;//test
            
            }//test
            
        }//test
        if(flag){
        
            rs.close();
            statement.close();
        }
        else{
        PreparedStatement pstmt=con.prepareStatement("insert into booking(venue,date,time,user,flag) values(?,?,?,?,?)");
        pstmt.setString(1,bookingVenue);
        pstmt.setString(2,bookingDate);
        pstmt.setString(3,bookingTime);
        pstmt.setString(4,user);
        pstmt.setString(5,"1");
        
        pstmt.executeUpdate();
        }
        con.close();
        //response.sendRedirect("http://83.212.100.171:9090/Calendar/index.jsp");
%>

<jsp:forward page="/prebook.jsp">
<jsp:param name="bookingVenue" value="<%= bookingVenue %>" />
</jsp:forward>
