<%-- 
    Document   : login
    Created on : Jan 5, 2017, 2:25:26 PM
    Author     : Khanh
--%>
<style>
    .border{
        border: 1px solid #d1d1d1;
        padding: 20px 10px;
    }
</style>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<br/>
<br/>
<div class="row">
    <div class="col-xs-3"></div>
    <div class="col-xs-6">
        <div class="border clearfix">
            <form action="AccountController" method="POST">
                <h4 style="text-align: center">Bạn đã có tài khoản</h4>
                <div class="input-group">
                    <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                    <input id="username" type="text" class="form-control" name="username" value="${username}">
                </div>
                <div class="input-group">
                    <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                    <input id="password" type="password" class="form-control" name="password" value="${password}">
                </div>
                <button type="submit" name="op" value="login" class="btn btn-success center-button"> Đăng nhập</button>
            </form> 
            Bạn chưa có tài khoản? <a href="UserController?page=register">Đăng ký ngay</a>
            <br/>
            <span style="color:red">${result}</span>
        </div>
    </div>
    <div class="col-xs-3"></div>
</div>