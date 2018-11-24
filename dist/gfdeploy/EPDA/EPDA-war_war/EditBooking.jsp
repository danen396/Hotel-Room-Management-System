<%-- 
    Document   : EditBooking
    Created on : Sep 13, 2017, 12:09:38 AM
    Author     : danen
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% 
        response.setHeader("Cache-Control", "no-cache");
        response.setHeader("Cache-Control", "no-store");
        response.setHeader("Pragma", "no-cache");
        response.setDateHeader("Expires", 0);
        if (session.getAttribute("staff") == null) {
            request.setAttribute("Error", "Session has ended.  Please login.");
            response.sendRedirect("/EPDA-war/ErrorPage.jsp");
        }
        
    %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Booking Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
    </body>
</html>
