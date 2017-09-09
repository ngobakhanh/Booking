<%-- 
    Document   : home
    Created on : Dec 10, 2016, 10:53:35 AM
    Author     : Khanh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>${title}</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link rel="stylesheet" type="text/css" href="css/style.css">
        <link href="css/seat.css" rel="stylesheet" type="text/css"/>
        <script src="js/script.js"></script>
    </head>

    <body id="mysite" data-spy="scroll" data-target=".navbar" data-offset="60">
        <div class="container">
            <nav class="navbar navbar-default">
                <div>
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>                        
                        </button>
                        <a class="navbar-brand" href="UserController"><span class="glyphicon glyphicon-home"></span></a>
                    </div>
                    <div class="collapse navbar-collapse" id="myNavbar">
                        <ul class="nav navbar-nav navbar-right">
                            <li><a href="UserController?page=price">GIÁ VÉ</a></li>
                            <li><a href="#">TIN TỨC</a></li>
                            <li><a href="UserController?page=contact">LIÊN HỆ</a></li>
                            <li><a href="UserController?page=register">ĐĂNG KÝ</a></li>
                            <c:if test="${session == null}">
                                <li><a href="UserController?page=login">ĐĂNG NHẬP</a></li>
                            </c:if>
                        </ul>
                    </div>
                </div>
            </nav> 

            <c:if test="${session != null}">
                <div class="">
                    <ul class="dropdown pull-right">                
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="true">
                            <span>Chào ! </span>
                            <span>${user}</span>
                            <span class="caret"></span>
                        </a>
                        <ul class="dropdown-menu pull-right">
                            <li>
                                <a href="UserController?page=infouser">
                                    <i class="glyphicon glyphicon-user"></i>
                                    <span>Thông tin cá nhân</span>
                                </a>
                            </li>
                            <li>
                                <a href="UserController?page=changepassword">
                                    <i class="glyphicon glyphicon-lock"></i>
                                    <span>Đổi mật khẩu</span>
                                </a>
                            </li>
                            <li>
                                <a href="AccountController?op=logout">
                                    <i class="glyphicon glyphicon-log-out"></i>
                                    <span>Đăng xuất</span>
                                </a>
                            </li>
                        </ul>
                    </ul>
                </div>
            </c:if>
            <div style="min-height: 600px">
                <jsp:include page="${view}"/>
            </div>
            <br/>
            <div>
                <footer class="text-center">
                    <a href="#mysite" title="To Top">
                        <span class="glyphicon glyphicon-chevron-up"></span>
                    </a>
                    <p>&copy; 2016 Copyright  <a href="#" title="">Nhaxe.com</a></p>
                </footer>
            </div>
        </div>
    </body>
</html>
