<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%> 

<sql:setDataSource 
    var="data" 
    driver="org.apache.derby.jdbc.ClientDriver"     
    url="jdbc:derby://localhost:1527/sample"
    user="app"  
    password="app"/> 

<sql:query 
    dataSource="${data}" 
    var="result">
    SELECT * from Room
    WHERE status = 'TO BE CLEANED'
</sql:query>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Room Status Page</title>
    </head>
    <body>

    <br><br>
        <form action="ChangeRoomStatus" method="POST">
            <table>
                <tr>
                    <td>
                        Room Number :
                    </td> 
                    <td>
                        <input type="text" name="roomnumber" value ="0" size="20">
                    </td>
                </tr>
                
            </table>
            <p>
                <input type="submit" value="Submit">
            </p>
            <br><br>
            The following rooms were found:<br><br>
                <table border="1" width="100%">
                    <tr>
                        <th>Room Number</th>
                        <th>Number Of Beds</th>
                        <th>Max Number Of People</th>
                        <th>Price Per Night</th>
                        <th>Status</th>
                    </tr>
                    <c:forEach items="${result.rows}" var="row">
                        <tr>
                            <td><c:out value="${row.roomNumber}"/></td>
                            <td><c:out value="${row.numberOfBeds}"/></td>
                            <td><c:out value="${row.maxNumOfPeople}"/></td>
                            <td><c:out value="${row.pricePerNight}"/></td>
                            <td><c:out value="${row.status}"/></td>
                        </tr>
                    </c:forEach>
                </table>
            
        </form>
    </body>
</html>
