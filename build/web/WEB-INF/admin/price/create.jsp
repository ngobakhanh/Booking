<%-- 
    Document   : edit
    Created on : Dec 28, 2016, 5:32:46 PM
    Author     : Khanh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<br/><br/>
<form action="PriceController" class="form-horizontal">
    <div class="form-group">
        <label class="control-label col-sm-2" for="id">ID:</label>
        <div class="col-sm-10">
            <input type="text" class="form-control" readonly="true" name="id" id="id" value="${price.id}">
        </div>
    </div>
    <div class="form-group">
        <label class="control-label col-sm-2" for="origin">Origin:</label>
        <div class="col-sm-10">          
            <input type="text" class="form-control" name="origin" id="origin" value="${price.origin}">
        </div>
    </div>
    <div class="form-group">
        <label class="control-label col-sm-2" for="destination">Destination: </label>
        <div class="col-sm-10">          
            <input type="text" class="form-control" name="destination" id="destination" value="${price.destination}">
        </div>
    </div>
    <div class="form-group">
        <label class="control-label col-sm-2" for="type">Type: </label>
        <div class="col-sm-10">          
            <input type="text" class="form-control" name="type" id="type" value="${price.type}">
        </div>
    </div>
    <div class="form-group">
        <label class="control-label col-sm-2" for="distance">Distance: </label>
        <div class="col-sm-10">          
            <input type="text" class="form-control" name="distance" id="destination" value="${price.distance}">
        </div>
    </div>
    <div class="form-group">
        <label class="control-label col-sm-2" for="duration">Duration: </label>
        <div class="col-sm-10">          
            <input type="text" class="form-control" name="destination" id="destination" value="${price.diration}">
        </div>
    </div>
    <div class="form-group">
        <label class="control-label col-sm-2" for="schedule">Schedule:</label>
        <div class="col-sm-10">          
            <input type="text" class="form-control" name="schedule" id="schedule" value="${price.schedule}">
        </div>
    </div>
    <div class="form-group">
        <label class="control-label col-sm-2" for="price">Price</label>
        <div class="col-sm-10">          
            <input type="text" class="form-control" name="price" id="price" value="${price.price}">
        </div>
    </div>
    <div class="form-group">
        <label class="control-label col-sm-2" for="destination">Time:</label>
        <div class="col-sm-10">          
            <input type="text" class="form-control" name="time" id="time" value="${price.time}">
        </div>
    </div>
    <div class="form-group">        
        <div class="col-sm-offset-2 col-sm-10">
            <button type="submit" value="create" name="op" class="btn btn-default"> Save</button>
            <a href="AdminController?keyword=price"><span class="btn btn-default"> Cancel</span></a>
        </div>
    </div>
</form>