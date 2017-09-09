<%-- 
    Document   : print
    Created on : Jan 16, 2017, 5:57:14 AM
    Author     : Khanh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <script src="js/bootstrap.min.js" type="text/javascript"></script>
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div class="table-responsive">
            <h3 style="text-align: center">List Booking <i>(${date}/${month}/${year})</i></h3>
            <table class="table">
                <thead>
                    <tr style="background: #5bc0de">
                        <th>#</th>
                        <th>Name</th>
                        <th>Phone</th>
                        <th>Seat</th>
                        <th>Route</th>
                        <th>Origin</th>
                        <th>Destination</th>
                    </tr>
                </thead>
                <tbody>
                <c:set var="stt" value="1"></c:set>
                <c:forEach var="b" items="${requestScope.listbook}">
                    <tr>
                        <td>${stt}</td>
                        <td>${b.idcustomer.name}</td>
                        <td>${b.idcustomer.phone}</td>
                        <td>${b.idseat.name}</td>
                        <td>${b.idroute.name}</td>
                        <td>${b.origin}</td>
                        <td>${b.destination}</td>       
                    </tr>
                    <c:set var="stt" value="${stt+1}"></c:set>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </body>
</html>
