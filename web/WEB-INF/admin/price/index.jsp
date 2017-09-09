<%-- 
    Document   : route
    Created on : Dec 28, 2016, 7:14:10 AM
    Author     : Khanh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="clearfix">
    <div class="pull-right" style="margin-top:20px">
        <a href="AdminController?keyword=createprice" class="btn btn-primary"><span class="glyphicon glyphicon-plus"></span> Add Price</a>
    </div>
</div>
<div class="table-responsive">
    <table class="table">
        <thead>
            <tr style="background: #5bc0de">
                <th>ID</th>
                <th>Origin</th>
                <th>Destination</th>
                <th>Type</th>
                <th>Distance</th>
                <th>Duration</th>
                <th>Schedule</th>
                <th>Price</th>
                <th>Time</th>
                <th></th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="p" items="${requestScope.listprice}">
                <tr>
                    <td>${p.id}</td>
                    <td>${p.origin}</td>
                    <td>${p.destination}</td>
                    <td>${p.type}</td>
                    <td>${p.distance}</td>
                    <td>${p.duration}</td>
                    <td>${p.schedule}</td>
                    <td>${p.price}</td>
                    <td>${p.time}</td>
                    <td style="text-align: right">
                        <a href="AdminController?keyword=editprice&id=${p.id}" class="btn btn-default btn-md"><i class="glyphicon glyphicon-edit"></i> Edit</a>
                        <a href="PriceController?op=remove&id=${p.id}" class="btn btn-default btn-md"><i class="glyphicon glyphicon-remove"></i> Remove</a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>