<%-- 
    Document   : Register
    Created on : Aug 9, 2017, 10:52:08 AM
    Author     : danen
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register Page</title>
    </head>
    <body>
        <form action="Register" method="POST">
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
                        Department:
                    </td> 
                    <td>
                        <select name="department" required="true">
                            <option value="Manager">Manager</option>
                            <option value="Receptionist">Receptionist</option>
                            <option value="FrontDesk">FrontDesk</option>
                            <option value="CleaningStaff">CleaningStaff</option>
                            </option>
                        </select>
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
