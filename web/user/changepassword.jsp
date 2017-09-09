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
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<br/>
<br/>
<div class="row">
    <div class="col-xs-3"></div>
    <div class="col-xs-6">
        <div class="border clearfix">
            <form action="AccountController" method="POST">
                <h4 style="text-align: center">Dổi mật khẩu</h4>
                <div class="hidden input-group">
                    <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                    <input id="username" type="text" class="form-control" name="id" value="${infouser.id}">
                </div>
                <div class="input-group">
                    <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                    <input id="password" type="password" class="form-control" name="password" value="${password}" placeholder="nhập mật khẩu hiện tại">
                </div>
                <div class="input-group">
                    <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                    <input id="password" type="password" class="form-control" name="newpassword" placeholder="nhập mật khẩu mới">
                </div>
                <div class="input-group">
                    <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                    <input id="password" type="password" class="form-control" name="confirmnewpassword" placeholder="nhập lại mật khẩu">
                </div>
                <button type="submit" name="op" value="changepassword" class="btn btn-success center-button"> Lưu</button>
            </form> 
            <br/>
            <c:if test="${result != 'success'}">
                <span style="color:red">${result}</span>
            </c:if>
            <c:if test="${result == 'success'}">
                <script>
                    $(document).ready(function(){
                        alert('Đổi mật khẩu thành công');
                        window.location.href = 'http://localhost:8080/BookTicket/AccountController?op=logout';
                        //$('#alertmodal').modal('show'); 
                    });
                </script>
                <div class="modal fade" id="alertmodal" role="dialog">
                    <div class="modal-dialog modal-sm">
                        <div class="modal-content">
                            <div class="modal-body">
                                <p>Đổi mật khẩu thành công<br/> Bạn có muốn đăng xuất không?</p>
                                <button type="button" class="btn btn-default" data-dismiss="modal">Không</button>
                                <a href="AccountController?op=logout" class="btn btn-default">Có</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </c:if>
    </div>
</div>
<div class="col-xs-3"></div>
</div>