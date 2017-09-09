<%-- 
    Document   : edit
    Created on : Jan 3, 2017, 1:45:50 PM
    Author     : Khanh
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<br/>
<form action="AccountController" class="form-horizontal">
    <div class="form-group">
        <label class="control-label col-sm-2" for="id">ID:</label>
        <div class="col-sm-10">
            <input type="text" class="form-control" readonly="true" name="id" id="id" value="${user.id}">
        </div>
    </div>

    <div class="form-group">
        <label class="control-label col-sm-2" for="name">Name:</label>
        <div class="col-sm-10">
            <input type="text" class="form-control" name="username" id="name" value="${user.username}">
        </div>
    </div>

    <div class="form-group">
        <label class="control-label col-sm-2" for="email">Email: </label>
        <div class="col-sm-10">
            <input type="text" class="form-control" name="email" id="email" value="${user.email}">
        </div>
    </div>

    <div class="form-group">
        <label class="control-label col-sm-2" for="phone">Phone: </label>
        <div class="col-sm-10">
            <input type="text" class="form-control" name="phone" id="phone" value="${user.phone}">
        </div>
    </div>

    <div class="form-group">
        <label class="control-label col-sm-2" for="seat">Address: </label>
        <div class="col-sm-10">
            <input type="text" class="form-control" name="address" id="address" value="${user.address}">
        </div>
    </div>
    <div class="form-group">        
        <div class="col-sm-offset-2 col-sm-10">
            <button type="submit" value="edit" name="op" class="btn btn-default"> Save</button>
            <a href="AdminController?keyword=indexuser"><span class="btn btn-default"> Cancel</span></a>
        </div>
    </div>
</form>
