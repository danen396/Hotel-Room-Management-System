<%-- 
    Document   : SearchAvailableRoom
    Created on : Sep 21, 2017, 2:47:07 AM
    Author     : danen
--%>

<%@page import="model.Staff"%>
<%@page import="java.util.Arrays"%>
<%@page import="org.json.JSONObject"%>
<%@page import="atg.taglib.json.util.JSONArray"%>
<%@page import="java.util.List"%>
<%@page import="model.Room"%>

<%
    Staff staff = (Staff) session.getAttribute("staff");
    response.setHeader("Cache-Control", "no-cache");
    response.setHeader("Cache-Control", "no-store");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", 0);
    if (staff.equals(null)) {
        request.setAttribute("Error", "Session has ended.  Please login.");
        response.sendRedirect("/EPDA-war/Login.jsp");
    }

    List<String> fullRoomDates = (List<String>) session.getAttribute("roomFullDates");
    String disabledDates = "";
    for (int i = 0; i < fullRoomDates.size(); i++) {
        if ((fullRoomDates.size() - 1) != i) {
            disabledDates += fullRoomDates.get(i) + "\", \"";
        } else {
            disabledDates += fullRoomDates.get(i);
        }

    }


%>


<script>


    //var disableddates = ["09/30/2017", "09/29/2017"];
    var disableddates = ["<%=disabledDates%>"];


    function DisableSpecificDates(date) {
        var string = jQuery.datepicker.formatDate('mm/dd/yy', date);
        return [disableddates.indexOf(string) == -1];
    }



    $(function () {
        $("#datepicker").datepicker({
            //
            observer: true,
            dateFormat: 'mm/dd/yy',
            minDate: 1,
            beforeShowDay: DisableSpecificDates
        });
    });
</script>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search Available Room</title>

    </head>
    <body>
        <form action="SearchAvailableRoom" method="POST">
            <table>
                <tr>
                    <td>
                        Number Of Days: 
                    </td> 
                    <td>
                        <input type="Number" name="numberOfDays" size="50" required="true">
                    </td>
                </tr>
                <tr><td>
                        Check In Date: 
                    </td> 
                    <td>
                        <input type="Date" name="checkInDate" size="20" placeholder="Check In Date">
                    </td>
                </tr>
            </table>
            <p>
                <input type ="submit" value="SearchAvailableCustomer">
            </p>
        </form>
    </body>
</html>

