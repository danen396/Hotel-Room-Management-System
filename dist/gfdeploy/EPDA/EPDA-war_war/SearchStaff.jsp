<%-- 
    Document   : SearchStaff
    Created on : Sep 10, 2017, 3:14:42 PM
    Author     : danen
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
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
    %>
    <body>  
        <form action="SearchStaff" method="POST">
            <h1>Enter the User's name to search </h1>
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