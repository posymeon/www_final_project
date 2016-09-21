<%-- 
    Document   : acceptMatch
    Created on : Feb 16, 2013, 11:58:09 PM
    Author     : koynoypis
--%>
<%@ page import="java.io.*,java.util.*,javax.mail.*"%>
<%@ page import="javax.mail.internet.*,javax.activation.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Statement"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String result="result";
            String to ="to";
            String user = request.getParameter("user");
            String from = "playgroundsvolos@gmail.com";
            String pass = "volos2013";
            String host = "smtp.gmail.com";
            Properties props = System.getProperties();
            props.put("mail.smtp.starttls.enable", "true"); // added this line
            props.put("mail.smtp.host", host);
            props.put("mail.smtp.user", from);
            props.put("mail.smtp.password", pass);
            props.put("mail.smtp.port", "587");
            props.put("mail.smtp.auth", "true");
            
            Session mailSession = Session.getDefaultInstance(props,null);
            Connection con = null;  
            Statement stmt = null;
            ResultSet rs = null;
            try{
                Class.forName("com.mysql.jdbc.Driver");
                con =DriverManager.getConnection 
                ("jdbc:mysql://localhost:3306/FinalProject","root", "*******");
                stmt = con.createStatement();
             
                rs = stmt.executeQuery("SELECT * FROM userregister where username='"+user+"'");
                if(rs.next()){
                    to = rs.getObject(6).toString();
                    MimeMessage message = new MimeMessage(mailSession);
                    message.addRecipient(Message.RecipientType.TO,
                               new InternetAddress(to));
                    message.setSubject("Βρεθηκε αντιπαλος!!");
                    message.setText("Ο χρηστης ... θελει να παιξετε μπαλα.");
                    
                    Transport.send(message);
                     result = "Sent message successfully....";
                     
                }
            
            }catch (MessagingException mex) {
                    mex.printStackTrace();
                    result = "Error: unable to send message....";
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
        
        <p align="center">
<% 
   out.println("Result: " + result + "\n");
%>
</p>
    </body>
</html>
