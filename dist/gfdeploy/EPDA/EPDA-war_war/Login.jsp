<%-- 
    Document   : Login
    Created on : Aug 2, 2017, 10:15:55 AM
    Author     : danen
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
    </head>
    <body>
        <a href="Register.jsp">Register New User</a>
        
        <form action="Login" method="POST">
            <table>
                <tr>
                    <td>
                        Username:
                    </td> 
                    <td>
                        <input type="text" name="username" size="20" value="">
                    </td>
                </tr>
                <tr>
                    <td>
                        Password:
                    </td> 
                    <td>
                        <input type="password" name="password" size="20" value="">
                    </td>
                </tr>
            </table>
            <p>
                <input type="submit" value="Proceed to login">
            </p>
        </form>
    </body>
</html>
