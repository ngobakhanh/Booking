<%-- 
    Document   : register
    Created on : Jan 5, 2017, 11:17:59 AM
    Author     : Khanh
--%>
<%-- 
<style>
    .form-register{
        margin:auto; width: 60%
    }
    .hotline{
        color:white;
        background:#f4511e;
        border-radius: 10px;
        padding: 10px;
        margin-top: 10px;
    }
</style>
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="pull-right hotline"><span class="glyphicon glyphicon-phone-alt"></span>  Tổng đài hỗ trợ: 0898529230</div>
<br/><br/>
<div class="form-register">
    <form id="form-register" action="AccountController">
        <div class="form-group">
            <label for="name">Tên*</label>
            <input type="text" class="form-control" name="username" id="name" required="true" value="${username}" placeholder="Nhập tên của bạn">
        </div>
        <div class="form-group">
            <label for="phone">Số điện thoại*</label>
            <input type="text" class="form-control" name="phone" id="phone" required="true" value="${phone}" placeholder="0987654258">
        </div>
        <div class="form-group">
            <label for="email">Email*</label>
            <input type="email" class="form-control" name="email" id="email" required="true" value="${email}" placeholder="abc@gmail.com">
        </div>
        <div class="form-group">
            <label for="pwd">Mật khẩu*</label>
            <input type="password" class="form-control" name="password" required="true" id="pwd" value="${password}" placeholder="Nhập mật khẩu">
        </div>
        <div class="form-group">
            <label for="pwd1">Nhập lại mật khẩu*</label>
            <input type="password" class="form-control" name="confirmpassword" required="true" id="pwd1" placeholder="Nhập lại mật khẩu">
            <span style="color:red">${result}</span>
        </div>
        <div class="form-group">
            <label for="address">Địa chỉ</label>
            <input type="text" class="form-control" name="address" id="address" value="${address}" placeholder="Địa chỉ liên hệ">
        </div>
        <button class="btn btn-success center-button" name="op" value="register" type="submit">Đăng ký</button>
    </form>
    Bạn đã có tài khoản? <a href="UserController?page=login">Đăng nhập ngay</a>
    <br/>
    <span style="color:red">${rs}</span>
</div>