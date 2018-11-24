<%-- 
    Document   : CheckOut
    Created on : Sep 24, 2017, 9:06:16 PM
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
        <title>Check Out Page</title>
    </head>
    <body>
        <form action="CheckIn" method="POST">
            <h1>Enter the username of the customer </h1>
            <table>
                <tr>
                    <td>
                        Username:
                    </td> 
                    <td>
                        <input type="text" name="username" size="20" required="true">
                    </td>
                </tr>
            </table>
            <p>
                <input type="submit" value="Search">
            </p>
        </form>
    </body>
</html>
