<%-- 
    Document   : edit
    Created on : Dec 28, 2016, 5:32:46 PM
    Author     : Khanh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<br/><br/>
<form action="RouteController" class="form-horizontal">
    <div class="form-group">
        <label class="control-label col-sm-2" for="id">ID:</label>
        <div class="col-sm-10">
            <input type="text" class="form-control" readonly="true" name="id" id="id" value="${route.id}">
        </div>
    </div>
    <div class="form-group">
        <label class="control-label col-sm-2" for="name">Route Name:</label>
        <div class="col-sm-10">          
            <input type="text" class="form-control" name="name" id="name" value="${route.name}">
        </div>
    </div>
    <div class="form-group">
        <label class="control-label col-sm-2" for="status">Status</label>
        <div class="col-sm-10">
            <select class="form-control" id="status" name="status">
                <option selected="true">${route.status}</option>
                <option>Enable</option>
                <option>Disable</option>
            </select>
        </div>
    </div>
    <div class="form-group">        
        <div class="col-sm-offset-2 col-sm-10">
            <button type="submit" value="edit" name="op" class="btn btn-default"> Save</button>
            <a href="RouteController"><span class="btn btn-default"> Cancel</span></a>
        </div>
    </div>
</form>