<%-- 
    Document   : CheckOutProcess
    Created on : Sep 24, 2017, 9:09:37 PM
    Author     : danen
--%>

<%@page import="model.Customer"%>
<%@page import="model.Booking"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
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
        }
        List<Booking> customerBookingFound = (List<Booking>) session.getAttribute("customerBookingFound");
        Customer customerForCheckIn = (Customer) session.getAttribute("customerForCheckIn");
        String tempDate = (String) session.getAttribute("tempDate");
        int tempNumberOfDays = (Integer) session.getAttribute("tempNumberOfDays");
        String paymentStatus = "";
        if(customerBookingFound.get(0).isPaymentStatus() == false){
            paymentStatus = "Payment not collected";
        }else{
            paymentStatus = "Payment done";
        }
    %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>CheckOut Process Page</title>
    </head>
    <body>
        <form action="CheckOutProcess" method="POST">
            <table>
                <tr>
                    <td> 
                        Check In Date: <%=tempDate%>
                    </td>
                </tr>
                <tr>
                    <td> 
                        Number Of Days: <%=tempNumberOfDays%>
                    </td>
                </tr>
                <tr>
                    <td>
                        Customer username: <%=customerForCheckIn.getUsername()%>
                    </td> 
                </tr>
                <tr>
                    <td>
                        Room Number: <%=customerBookingFound.get(0).getRoom().getRoomNo()%>
                    </td> 
                </tr>
                <tr>
                    <td>
                        Total payment: RM <%=tempNumberOfDays*100%>
                    </td> 
                </tr>
                <tr>
                    <td>
                        Payment Status: <%=paymentStatus%>
                    </td> 
                </tr>
            </table>
            <p>
                <input type="submit" value="Proceed with Check In">
            </p>
        </form>
    </body>
</html>
