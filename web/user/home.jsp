<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<style>
    .caption{
        position: absolute;
        right: 11px;
        bottom: 20px;
        text-shadow: 2px 2px 10px #000000;
        border: 1px white solid;
        border-radius: 10px;
        background: #6acce4;
        filter: alpha(opacity=50)
    }
    .caption-line{
        width: 450px;
        padding: 5px 15px 10px 15px;
        color: #fff;
    }
</style>
<div class="row">
    <div class="col-xs-3">
        <img style="margin-top: 50px" src="images/hotro.png" class="img img-responsive" alt=""/>
    </div>
    <div class="col-xs-9">
        <div class="caption">
            <div class="caption-line">
                <h3>Nhaxe.com</h3>
                <p>Đồng hành cùng bạn trên mọi nẻo đường</p>
            </div>
        </div>
        <img src="images/xe.jpg" class="img img-responsive" width="800px" alt=""/>
    </div>
</div>

<!--form register-->
<div id="form_register" class="form-booking">
    <div class="row">
        <div class="col-sm-6">
            <form action="UserController" method="POST">
                <h3>
                    <span class="glyphicon glyphicon-check"></span>
                    ĐĂNG KÝ VÉ XE ONLINE
                </h3>
                <div class="col-sm-12">
                    CHỌN TUYẾN XE
                    <br/>
                    <select class="form-control" id="route" name="idroute" id="idroute">
                        <c:forEach var="route" items="${requestScope.list_route}">
                            <c:choose>
                                <c:when test="${route.id==idroute}">
                                    <option selected value="${route.id}">
                                        ${route.name}
                                    </option>
                                </c:when>
                                <c:otherwise>
                                    <option value="${route.id}">
                                        ${route.name}
                                    </option>
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>
                    </select>
                </div>
                <div class="col-sm-12">NGÀY ĐI</div>

                <div class="col-xs-4">
                    <select name="date" id="date" class="form-control" style="width:100%" onchange="loadTicket()">
                        <c:if test="${date != null}">
                            <option selected value="${date}">Ngày ${date}</option>
                        </c:if>
                    </select>
                </div>
                <div class="col-xs-4">
                    <select name="month" class="form-control" id="month">
                        <c:if test="${month != null}">
                            <option selected value="${month}">Tháng ${month}</option>
                        </c:if>
                    </select>
                </div>
                <div class="col-xs-4">
                    <select name="year" class="form-control" id="year">
                        <c:if test="${year != null}">
                            <option selected value="${year}">Năm ${year}</option>
                        </c:if>
                    </select>
                </div>
                <input class="hidden" type="text" name="page" value="find"/>

                <center>
                    <button type="submit" id="btn_find" class="btn btn-warning glyphicon glyphicon-search">
                        <span style="font-family:Arial, Helvetica, sans-serif">
                            Nhấn vào để đặt vé
                        </span>
                    </button>
                </center> 
            </form>
        </div>

        <div class="col-sm-6">
            <h3>
                <span class="glyphicon glyphicon-question-sign"></span>
                HƯỚNG DẪN ĐẶT VÉ XE</h3>
            B1: Chọn tuyến đi &gt; chọn ngày đi &gt; chọn vị trí ghế<br>
            B2: Nhập thông tin cá nhân &gt; Lưu lại <br>
            B3: Chờ nhân viên của chúng tôi liên hệ xác nhận thông tin đặt vé
            <br><br>
            <div class="col-xs-4 text-center">
                <span style="display:block;width:40px;height:30px;background-color:#fff;margin:0px auto;">
                </span> Ghế trống					                 
            </div>

            <div class="col-xs-4 text-center">
                <span style="display:block;width:40px;height:30px;background-color:#eea236;margin:0px auto;">
                </span> Ghế đã đặt, chưa xác nhận thông tin đặt vé

            </div>
            <div class="col-xs-4 text-center">
                <span style="display:block;width:40px;height:30px;background-color:red;margin:0px auto;">
                </span> Ghế đã đặt, đã xác nhận thông tin đặt vé
            </div>
        </div>
    </div>
    <!--End form register-->
</div>    
<h2 style="text-align: center;color:#d58512">Hình Ảnh</h2>
<br/>
<div class="row">
    <div class="col-md-4">
        <div class="thumbnail">
            <img src="images/daclac.jpg" alt="" style="width:100%"/>
            <div class="">
                <p style="text-align: center">Đắc Lắc</p>
            </div>
        </div>
    </div>

    <div class="col-md-4">
        <div class="thumbnail">
            <img src="images/dalat1.jpg" alt="" style="width:100%"/>
            <div class="">
                <p style="text-align: center">Đà Lạt</p>
            </div>
        </div>
    </div>
    <div class="col-md-4">
        <div class="thumbnail">
            <img src="images/dalat.jpg" alt="" style="width:100%"/>
            <div class="">
                <p style="text-align: center">Nha Trang</p>
            </div>
        </div>
    </div>
</div>