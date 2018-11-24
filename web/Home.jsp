<%-- 
    Document   : Home
    Created on : Sep 10, 2017, 3:48:58 PM
    Author     : danen
--%>

<%@page import="model.Staff"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
    response.setHeader("Cache-Control", "no-cache");
    response.setHeader("Cache-Control", "no-store");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", 0);
    if (session.getAttribute("staff") == null) {
        request.setAttribute("Error", "Session has ended.  Please login.");
        response.sendRedirect("/EPDA-war/ErrorPage.jsp");
    } else {
        Staff staff = (Staff) session.getAttribute("staff");
        if (staff.getDepartment().equalsIgnoreCase("Manager")) {
            request.getRequestDispatcher("ManagerLink.jsp").include(request, response);
        } else if (staff.getDepartment().equalsIgnoreCase("Receptionist")) {
            request.getRequestDispatcher("ReceptionistLink.jsp").include(request, response);
        } else if (staff.getDepartment().equalsIgnoreCase("FrontDesk")) {
            request.getRequestDispatcher("FrontDeskLink.jsp").include(request, response);
        } else if (staff.getDepartment().equalsIgnoreCase("CleaningStaff")) {
            request.getRequestDispatcher("Cleaning Staff Link.jsp").include(request, response);
        }
    }
    
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home Page</title>
    </head>
    <body>
    </body>
</html>
