<%-- 
    Document   : Update
    Created on : Sep 10, 2017, 3:15:15 AM
    Author     : danen
--%>

<%@page import="model.Staff"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Page</title>
    </head>
    <% 
        response.setHeader("Cache-Control", "no-cache");
        response.setHeader("Cache-Control", "no-store");
        response.setHeader("Pragma", "no-cache");
        response.setDateHeader("Expires", 0);
        if (session.getAttribute("staff") == null) {
            request.setAttribute("Error", "Session has ended.  Please login.");
            response.sendRedirect("/EPDA-war/ErrorPage.jsp");
        }
        Staff staff = (Staff) session.getAttribute("staff");
    %>
    <form action="Update" method="POST">
        <table>
            <tr>
                <td>
                    Username:
                </td> 
                <td>
                    <input type="text" name="username" size="20" value="<%=staff.getUsername()%>" readonly="true" required="true">
                </td>
            </tr>
            <tr>
                <td>
                    Password:
                </td> 
                <td>
                    <input type="text" name="password" size="20" value="<%=staff.getPassword()%>" required="true">
                </td>
            </tr>
            <tr>
                <td>
                    IC or Passport:
                </td> 
                <td>
                    <input type="text" name="icOrPassport" size="20" value="<%=staff.getIcOrPassport()%>" required="true">
                </td>
            </tr>
            <tr>
                <td>
                    Phone Number:
                </td> 
                <td>
                    <input type="tel" name="phoneNumber" size="20" pattern="^\d{3}-\d{7}$" placeholder="xxx-xxxxxxx" value="<%=staff.getPhoneNumber()%>" required="true">
                </td>
            </tr>
            <tr>
                <td>
                    Email Address:
                </td> 
                <td>
                    <input type="email" name="email" size="50" value="<%=staff.getEmail()%>" required="true">
                </td>
            </tr>
            <tr>
                <td>
                    Address:
                </td> 
                <td>
                    <input type="text" name="address" size="100" value="<%=staff.getAddress()%>" required="true">
                </td>
            </tr>
        </table>
        <p>
            <input type="submit" value="Update">
        </p>
    </form>
</html>
