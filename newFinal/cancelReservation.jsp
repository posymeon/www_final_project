<%-- 
    Document   : cancelReservation
    Created on : Feb 18, 2013, 1:45:00 AM
    Author     : Polixronis
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.* " %>
<%@ page import="javax.servlet.*,java.text.*" %>
<!DOCTYPE html>

<%

Connection connection = null;
Statement statement = null;

int updateQuery = 0;
Class.forName("com.mysql.jdbc.Driver").newInstance();

String username = request.getParameter("username");
String date = request.getParameter("date");
String venue = request.getParameter("venue");
String time = request.getParameter("time"); 

connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/FinalProject","root", "*******");
statement = connection.createStatement();
String QueryString = "DELETE FROM booking WHERE venue='"+venue+"' AND date='"+date+"' AND time='"+time+"' AND user='"+username+"';"; 
statement.executeUpdate(QueryString);


statement.close();
connection.close();


response.sendRedirect(request.getHeader("Referer"));


%>

