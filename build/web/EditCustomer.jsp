<%-- 
    Document   : EditCustomer
    Created on : Sep 12, 2017, 11:17:33 AM
    Author     : danen
--%>

<%@page import="model.Customer"%>
<%@page import="model.Staff"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Page</title>
    </head>
    <% Staff staff = (Staff) session.getAttribute("staff");
        response.setHeader("Cache-Control", "no-cache");
        response.setHeader("Cache-Control", "no-store");
        response.setHeader("Pragma", "no-cache");
        response.setDateHeader("Expires", 0);
        if (staff.equals(null)) {
            request.setAttribute("Error", "Session has ended.  Please login.");
            response.sendRedirect("/EPDA-war/Login.jsp");
        }
        Customer customerToEdit = (Customer) session.getAttribute("customerToEdit");
    %>
    <form action="EditCustomer" method="POST">
        <table>
            <tr>
                <td>
                    Username:
                </td> 
                <td>
                    <input type="text" name="username" size="20" value="<%=customerToEdit.getUsername()%>" readonly="true" required="true">
                </td>
            </tr>
            <tr>
                <td>
                    Password:
                </td> 
                <td>
                    <input type="password" name="password" size="20" value="<%=customerToEdit.getPassword()%>" required="true">
                </td>
            </tr>
            <tr>
                <td>
                    IC or Passport:
                </td> 
                <td>
                    <input type="text" name="icOrPassport" size="20" value="<%=customerToEdit.getIcOrPassport()%>" required="true">
                </td>
            </tr>
            <tr>
                <td>
                    Phone Number:
                </td> 
                <td>
                    <input type="tel" name="phoneNumber" size="20" pattern="^\d{3}-\d{7}$" placeholder="xxx-xxxxxxx" value="<%=customerToEdit.getPhoneNumber()%>" required="true">
                </td>
            </tr>
            <tr>
                <td>
                    Email Address:
                </td> 
                <td>
                    <input type="email" name="email" size="50" value="<%=customerToEdit.getEmail()%>" required="true">
                </td>
            </tr>
            <tr>
                <td>
                    Address:
                </td> 
                <td>
                    <input type="text" name="address" size="100" value="<%=customerToEdit.getAddress()%>" required="true">
                </td>
            </tr>
        </table>
        <p>
            <input type="submit" value="Update">
        </p>
    </form>
</html>

