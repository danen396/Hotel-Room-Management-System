<%-- 
    Document   : RegisterCustomer
    Created on : Sep 12, 2017, 11:25:22 AM
    Author     : danen
--%>

<%@page import="model.Staff"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% Staff staff = (Staff) session.getAttribute("staff");
    response.setHeader("Cache-Control", "no-cache");
    response.setHeader("Cache-Control", "no-store");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", 0);
    if (staff.equals(null)) {
        request.setAttribute("Error", "Session has ended.  Please login.");
        response.sendRedirect("/EPDA-war/Login.jsp");
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register Customer Page</title>
    </head>
    <body>
        <form action="RegisterCustomer" method="POST">
            <table>
                <tr>
                    <td>
                        Username:
                    </td> 
                    <td>
                        <input type="text" name="username" size="20" required="true">
                    </td>
                </tr>
                <tr>
                    <td>
                        Password:
                    </td> 
                    <td>
                        <input type="password" name="password" size="20" required="true">
                    </td>
                </tr>
                <tr>
                    <td>
                        IC or Passport:
                    </td> 
                    <td>
                        <input type="text" name="icOrPassport" size="20" required="true">
                    </td>
                </tr>
                <tr>
                    <td>
                        Phone Number:
                    </td> 
                    <td>
                        <input type="tel" name="phoneNumber" size="20" pattern="^\d{3}-\d{7}$" placeholder="xxx-xxxxxxx" required="true">
                    </td>
                </tr>
                <tr>
                    <td>
                        Email Address:
                    </td> 
                    <td>
                        <input type="email" name="email" size="50" required="true">
                    </td>
                </tr>
                <tr>
                    <td>
                        Address:
                    </td> 
                    <td>
                        <input type="text" name="address" size="100" required="true">
                    </td>
                </tr>
            </table>
            <p>
                <input type="submit" value="Register">
            </p>
        </form>
    </body>
</html>

