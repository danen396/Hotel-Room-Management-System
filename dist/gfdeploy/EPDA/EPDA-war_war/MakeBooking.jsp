<%-- 
    Document   : MakeBooking
    Created on : Sep 12, 2017, 1:04:05 PM
    Author     : danen
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@page import="model.BookingFacade"%>
<%@page import="javax.ejb.EJB"%>
<%@page import="model.Booking"%>
<%@page import="model.Room"%>
<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    response.setHeader("Cache-Control", "no-cache");
    response.setHeader("Cache-Control", "no-store");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", 0);
    if (session.getAttribute("staff") == null) {
        request.setAttribute("Error", "Session has ended.  Please login.");
        response.sendRedirect("/EPDA-war/ErrorPage.jsp");
    }
    String checkInDateString = (String) session.getAttribute("checkInDate");
    SimpleDateFormat parseCheckInDate = new SimpleDateFormat("MM/dd/yyyy");
    Date checkInDate = parseCheckInDate.parse(checkInDateString);
    int numberOfDays = (Integer)session.getAttribute("numberOfDays");
    //List<Room> allRoom = (List<Room>) session.getAttribute("allRoom");


%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Make Booking Page</title>
    </head>
    <body>
        <form action="MakeBooking" method="POST">
            <h1>Please Enter Customer Details </h1>
            <table>
                <tr>
                    <td> 
                        Check In Date: <%=checkInDateString%>
                    </td>
                </tr>
                <tr>
                    <td> 
                        Number Of Days: <%=numberOfDays%>
                    </td>
                </tr>
                <tr>
                    <td>
                        Customer username: 
                    </td> 
                    <td>
                        <input type="Text" name="customerUsername" size="20" required="true">
                    </td>
                </tr>
                <tr>
                    <td>
                        Room Number: 
                    </td> 
                    <td>
                        <select name = roomNumber required="true">
                            <c:forEach items="${allRoom}" var="RoomNo" varStatus="loop">
                                <option value="${allRoom.get(loop.index).getRoomNo()}">
                                    ${allRoom.get(loop.index).getRoomNo()}
                                </option>
                            </c:forEach>
                    </td>
                </tr>
            </table>
            <p>
                <input type="submit" value="MakeBooking">
            </p>
        </form>
    </body>
</html>
