<%-- 
    Document   : Cleaning Staff Link
    Created on : Sep 9, 2017, 9:59:51 PM
    Author     : danen
--%>

<%@page import="model.Staff"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% Staff staff = (Staff) session.getAttribute("staff");%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Receptionist Page</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="">
    </head>
    <body>
     <header class="w3-display-container w3-content w3-center" style="max-width:1500px">
        
        <div class="w3-display-middle w3-padding-large w3-border w3-wide w3-text-light-grey w3-center">
            <h1 class="w3-hide-medium w3-hide-small w3-xxxlarge"><%= staff.getUsername()%></h1>
            <h3 class="w3-hide-medium w3-hide-small">Cleaning Staff</h3>
        </div>

        <div class="w3-bar w3-light-grey w3-round w3-display-bottommiddle w3-hide-small" style="bottom:-16px">
            <a href="Home.jsp" class="w3-bar-item w3-button">Home |</font></a>
            <a href="Update.jsp" class="w3-bar-item w3-button">Edit information |</font></a>
            <a href="changeroomstatus.jsp" class="w3-bar-item w3-button">Change room status |</font></a>
            <a href="Logout" class="w3-bar-item w3-button">Logout</font></a>
        </div>



    </body>
</html>
