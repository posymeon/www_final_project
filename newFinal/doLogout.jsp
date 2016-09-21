<%-- 
    Document   : doLogout.jsp
    Created on : Feb 16, 2013, 11:14:18 PM
    Author     : Polixronis
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%

    request.getSession(false).removeAttribute("sUserID");
    request.getSession(false).invalidate();
    

    String redirectURL = "http://83.212.100.171:9090/newFinal/";
    response.sendRedirect(redirectURL);  


%>
