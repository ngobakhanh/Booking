<%-- 
    Document   : route
    Created on : Dec 28, 2016, 7:14:10 AM
    Author     : Khanh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="clearfix">
    <div class="pull-right" style="margin-top:20px">
        <a href="AdminController?keyword=createroute" class="btn btn-primary"><span class="glyphicon glyphicon-plus"></span> Add Route</a>
    </div>
</div>
<div class="table-responsive">
    <table class="table">
        <thead>
            <tr style="background: #5bc0de">
                <th>ID</th>
                <th>Name</th>
                <th>Status</th>
                <th></th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="r" items="${requestScope.listroute}">
                <tr>
                    <td>${r.id}</td>
                    <td>${r.name}</td>
                    <td>${r.status}</td>
                    <td style="text-align: right">
                        <a href="AdminController?keyword=editroute&id=${r.id}" class="btn btn-default btn-md"><i class="glyphicon glyphicon-edit"></i> Edit</a>
                        <a href="RouteController?op=remove&id=${r.id}" class="btn btn-default btn-md"><i class="glyphicon glyphicon-remove"></i> Remove</a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>