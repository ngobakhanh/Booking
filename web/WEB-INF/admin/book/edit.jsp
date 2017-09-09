<%-- 
    Document   : edit
    Created on : Jan 3, 2017, 1:45:50 PM
    Author     : Khanh
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<br/>
<form action="BookController" class="form-horizontal">
    <div class="form-group">
        <label class="control-label col-sm-2" for="id">ID:</label>
        <div class="col-sm-10">
            <input type="text" class="form-control" readonly="true" name="id" id="id" value="${book.id}">
        </div>
    </div>

    <div class="form-group">
        <label class="control-label col-sm-2" for="name">Name:</label>
        <div class="col-sm-10">
            <input type="text" class="form-control" name="name" id="name" value="${book.idcustomer.name}">
        </div>
    </div>

    <div class="form-group">
        <label class="control-label col-sm-2" for="phone">Phone:</label>
        <div class="col-sm-10">
            <input type="text" class="form-control" name="phone" id="phone" value="${book.idcustomer.phone}">
        </div>
    </div>

    <div class="form-group">
        <label class="control-label col-sm-2" for="route">Route:</label>
        <div class="col-sm-10">
            <input type="text" readonly="true" class="form-control" name="route" id="route" value="${book.idroute.name}">
        </div>
    </div>

    <div class="form-group">
        <label class="control-label col-sm-2" for="seat">Seat: </label>
        <div class="col-sm-10">
            <input type="text" readonly="true" class="form-control" name="seat" id="seat" value="${book.idseat.name}">
        </div>
    </div>

    <div class="form-group">
        <label class="control-label col-sm-2" for="origin">Origin: </label>
        <div class="col-sm-10">
            <input type="text" class="form-control" name="origin" id="origin" value="${book.origin}">
        </div>
    </div>

    <div class="form-group">
        <label class="control-label col-sm-2" for="destination">Destination:</label>
        <div class="col-sm-10">
            <input type="text" class="form-control" name="destination" id="destination" value="${book.destination}">
        </div>
    </div>

    <div class="form-group">
        <label class="control-label col-sm-2" for="status">Status</label>
        <div class="col-sm-10">
            <select class="form-control" id="status" name="status">
                <option selected="true">${book.status}</option>
                <option>empty</option>
                <option>book</option>
                <option>booked</option>
            </select>
        </div>
    </div>


    <input type="text" class="hidden" name="idroute"value="${book.idroute.id}">
    <input type="text" class="hidden" name="idseat" value="${book.idseat.id}">
    <input type="text" class="hidden" name="idcus" value="${book.idcustomer.id}">              
    <input type="text" class="hidden" name="date" value="${date}">  
    <input type="text" class="hidden" name="month" value="${month}">  
    <input type="text" class="hidden" name="year" value="${year}">
    <input type="text" class="hidden" name="idroute" value="${idroute}">
    <div class="form-group">        
        <div class="col-sm-offset-2 col-sm-10">
            <button type="submit" value="update" name="keyword" class="btn btn-default"> Save</button>
            <a href="BookController"><span class="btn btn-default"> Cancel</span></a>
        </div>
    </div>
</form>
