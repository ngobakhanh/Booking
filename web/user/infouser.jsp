<%-- 
    Document   : infouser
    Created on : Jan 14, 2017, 5:10:47 PM
    Author     : Khanh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<br/>
<div class="pull-right hotline"><span class="glyphicon glyphicon-phone-alt"></span>  Tổng đài hỗ trợ: 0898529230</div>
<br/><br><br>
<div class="row">
    <div class="col-xs-3"></div>
    <div class="col-xs-6">
        <div class="border clearfix">
            <h3 class="text-primary text-uppercase" style="text-align: center">Thông tin cá nhân</h3>
            <div class="row">
                <div class="col-xs-6">Tên</div>
                <div class="col-xs-6">${infouser.username}</div>
            </div>
            <div class="row">
                <div class="col-xs-6">Email</div>
                <div class="col-xs-6">${infouser.email}</div>
            </div>
            <div class="row">
                <div class="col-xs-6">Số điện thoại</div>
                <div class="col-xs-6">${infouser.phone}</div>
                </di>
            </div>
                <div class="row">
                <div class="col-xs-6">Địa chỉ liên hệ</div>
                <div class="col-xs-6">${infouser.address}</div>
                </di>
            </div>
        </div>
        <div class="col-xs-3"></div>
    </div>