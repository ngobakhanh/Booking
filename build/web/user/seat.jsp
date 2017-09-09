<%-- 
    Document   : seat
    Created on : Dec 24, 2016, 12:40:02 PM
    Author     : Khanh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<br/><br/>
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
<br/>
<h2 style="text-align: center;color:#d58512">Sơ Đồ Xe</h2>
<br/>
<div class="row">
    <div class="col-sm-6 col-xs-12">
        <div class="row">
            <div class="col-xs-4">
                <div class="seat-header">
                    TÀI XẾ
                </div>
            </div>
            <div class="col-xs-8">
                <div class="seat-header">
                    TẦNG DƯỚI
                </div>              
            </div>           
            <!-- Tang duoi-->
            <c:forEach var="s" items="${requestScope.list_seatd}">
                <c:set var="flag" value="true" scope="page"/>
                <c:if test="${s.name == 'C6-D'}">
                    <div class="col-xs-4"></div>
                </c:if>
                <c:forEach var="sb" items="${requestScope.list_book}">
                    <c:if test="${sb.idseat.id == s.id && flag eq 'true' && sb.status == 'book'}">
                        <div class="col-xs-4">
                            <div class="seat1" data-id="${s.id}" data-seatname="${s.name}">
                                ${s.name}<br/>
                                ${sb.idcustomer.name}
                            </div>
                        </div>
                        <c:set var="flag" value="false" scope="page"/>
                    </c:if>
                    <c:if test="${sb.idseat.id == s.id && flag eq 'true' && sb.status == 'booked'}">
                        <div class="col-xs-4">
                            <div class="seat2" data-id="${s.id}" data-seatname="${s.name}">
                                ${s.name}<br/>
                                ${sb.idcustomer.name}
                            </div>
                        </div>
                        <c:set var="flag" value="false" scope="page"/>
                    </c:if>  
                </c:forEach>
                <c:if test="${flag eq 'true'}">
                    <div class="col-xs-4">
                        <div class="seat" data-id="${s.id}" data-seatname="${s.name}">
                            ${s.name}
                        </div>
                    </div>
                </c:if>
            </c:forEach>
            <!--Tang duoi end -->
        </div>
    </div>  
    <div class="col-sm-6 col-xs-12">
        <div class="row">
            <div class="col-xs-4">
                <div class="seat-header">
                    TÀI XẾ
                </div>
            </div>
            <div class="col-xs-8">
                <div class="seat-header">
                    TẦNG TRÊN
                </div>              
            </div>           
            <!-- Tang duoi-->
            <c:forEach var="s" items="${requestScope.list_seatt}">
                <c:set var="flag" value="true" scope="page"/>
                <c:if test="${s.name == 'C6-T'}">
                    <div class="col-xs-4"></div>
                </c:if>
                <c:forEach var="sb" items="${requestScope.list_book}">
                    <c:if test="${sb.idseat.id == s.id && flag eq 'true' && sb.status == 'book'}">
                        <div class="col-xs-4">
                            <div class="seat1" data-id="${s.id}" data-seatname="${s.name}">
                                ${s.name} <br/>
                                ${sb.idcustomer.name}
                            </div>
                        </div>
                        <c:set var="flag" value="false" scope="page"/>
                    </c:if>
                    <c:if test="${sb.idseat.id == s.id && flag eq 'true' && sb.status == 'booked'}">
                        <div class="col-xs-4">
                            <div class="seat2" data-id="${s.id}" data-seatname="${s.name}">
                                ${s.name}<br/>
                                ${sb.idcustomer.name}
                            </div>
                        </div>
                        <c:set var="flag" value="false" scope="page"/>
                    </c:if> 
                </c:forEach>
                <c:if test="${flag eq 'true'}">
                    <div class="col-xs-4">
                        <div class="seat" data-id="${s.id}" data-seatname="${s.name}">
                            ${s.name}
                        </div>
                    </div>
                </c:if>
            </c:forEach>
        </div>
    </div>   
</div>
<!--form register-->
<!-- Modal -->
<div class="modal fade" id="formbooking" role="dialog">
    <div class="modal-dialog modal-md">
        <div class="modal-content">
            <form action="">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Đặt vé online</h4>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label for="name">Tên khách hàng:</label>
                        <input type="text" class="form-control" name="name" id="name" value="${inforuser.username}" placeholder="Nhập tên của bạn"/>
                    </div>
                    <div class="form-group">
                        <label for="phone">Số điện thoại:</label>
                        <input type="text" class="form-control" name="phone" id="phone" value="${inforuser.phone}" placeholder="Nhập số điện thoại của bạn"/>
                    </div>
                    <div class="form-group">
                        <label for="origin">Điểm đón:</label>
                        <input type="text" class="form-control" name="origin" id="origin" placeholder="Nhập điểm đón của bạn"/>
                    </div>
                    <div class="form-group">
                        <label for="destination">Điểm đến:</label>
                        <input type="text" class="form-control" name="destination" id="destination" placeholder="Nhập điểm đến của bạn"/>
                    </div>
                    <div class="form-group">
                        <label for="seatName">Vị trí ghế:</label>
                        <input type="text" class="form-control" readonly="true" id="seatName"/>
                    </div>
                    <div class="form-group hidden">
                        <input type="text" class="form-control" name="idroute" id="idroute"/>
                    </div>
                    <div class="form-group hidden">
                        <input type="text" class="form-control" name="departuredate" id="departuredate"/>
                    </div>
                    <div class="form-group hidden">
                        <input type="text" class="form-control" name="idseat" id="idseat"/>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span> Đóng</button>
                    <button type="button" id="btnSave" class="btn btn-success"><span class="glyphicon glyphicon-ok"></span> Lưu</button>
                </div>
            </form>
        </div>
    </div>
</div>
