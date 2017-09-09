<%-- 
    Document   : index
    Created on : Dec 29, 2016, 10:32:56 PM
    Author     : Khanh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<br/>
<form action="">
    <div class="row">
        <div class="col-xs-3">
            <select name="date" class="form-control" id="d" style="width:100%" onchange="loadTicket1()">
                <c:if test="${date != null}">
                    <option selected value="${date}">Ngày ${date}</option>
                </c:if>
            </select>
        </div>
        <div class="col-xs-3">
            <select name="month" class="form-control" id="m" onchange="loadTicket1()">
                <c:if test="${month != null}">
                    <option selected value="${month}">Tháng ${month}</option>
                </c:if>
            </select>
        </div>
        <div class="col-xs-3">
            <select name="year" class="form-control" id="y" onchange="loadTicket1()">
                <c:if test="${year != null}">
                    <option selected value="${year}">Năm ${year}</option>
                </c:if>
            </select>
        </div>
        <div class="col-xs-3">
            <select class="form-control" name="idroute" id="route" onchange="loadTicket1()">
                <c:forEach var="route" items="${requestScope.listroute}">
                    <c:choose>
                        <c:when test="${route.id==idroute}">
                            <option selected value="${route.id}">
                                ${route.name}
                            </option>
                        </c:when>
                        <c:otherwise>
                            <option value="${route.id}">
                                ${route.name}
                            </option>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
            </select>
        </div>
    </div>
</form>
<br/>
<div class="pull-right">
    <a href="AdminController?idroute=${idroute}&date=${date}&month=${month}&year=${year}&keyword=print" target="_blank" class="btn btn-default btn-sm"><i class="glyphicon glyphicon-print"></i> Print</a>
</div>
<br/><br/>
<div class="table-responsive">
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
                <th>Status</th>
                <th></th>
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
                    <td>${b.status}</td>
                    <td style="text-align: right">
                        <a href="BookController?idroute=${idroute}&date=${date}&month=${month}&year=${year}&keyword=confirm&id=${b.id}" class="btn btn-default btn-md"><i class="glyphicon glyphicon-check"></i> Confirm</a>
                        <a href="AdminController?idroute=${idroute}&date=${date}&month=${month}&year=${year}&keyword=edit&id=${b.id}" class="btn btn-default btn-md"><i class="glyphicon glyphicon-edit"></i> Edit</a>
                        <a href="BookController?idroute=${idroute}&date=${date}&month=${month}&year=${year}&keyword=remove&id=${b.id}" class="btn btn-default btn-md"><i class="glyphicon glyphicon-remove"></i> Remove</a>
                    </td>
                </tr>
                <c:set var="stt" value="${stt+1}"></c:set>
            </c:forEach>
        </tbody>
    </table>
</div>