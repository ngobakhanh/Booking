<%-- 
    Document   : index
    Created on : Jan 15, 2017, 9:45:19 PM
    Author     : Khanh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<br/><br/>
<div class="table-responsive">
    <table class="table">
        <thead>
            <tr style="background: #5bc0de">
                <th>#</th>
                <th>Username</th>
                <th>Email</th>
                <th>Phone</th>
                <th>Address</th>
                <th></th>
            </tr>
        </thead>
        <tbody>
            <c:set var="stt" value="1"></c:set>
            <c:forEach var="u" items="${requestScope.listuser}">
                <tr>
                    <td>${stt}</td>
                    <td>${u.username}</td>
                    <td>${u.email}</td>
                    <td>${u.phone}</td>
                    <td>${u.address}</td>
                    <td style="text-align: right">
                        <a href="AdminController?keyword=updateuser&id=${u.id}" class="btn btn-default btn-md"><i class="glyphicon glyphicon-edit"></i> Edit</a>
                    </td>
                </tr>
                <c:set var="stt" value="${stt+1}"></c:set>
            </c:forEach>
        </tbody>
    </table>
</div>
