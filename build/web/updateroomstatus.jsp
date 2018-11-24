
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
    WHERE roomnumber = ${param.roomnumber}
</sql:query>
<!DOCTYPE html>
<html>
    <title>Update Room Status Page</title>
    </head>
    <body>
        <form action="UpdateRoomStatus" method="POST">
            <div><h1>Update Room Status</h1></div>
            <table>
                <tr>
                    <td>
                        New Room Status:
                    </td> 
                    <td>
                    <select name="status" placeholder="Select The Status" id="status">
    <option  value = "TO BE CLEANED">TO BE CLEANED</option>
    <option  value = "CLEANED">CLEANED</option>

</select>
                        </td>
                </tr>
            </table>
            
            <p>
                <input type="submit" value="Update">
            </p>
            </form>
            <br><br>
            The entered room was found:<br><br>
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
    </body>
</html>
