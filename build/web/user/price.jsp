<%-- 
    Document   : price
    Created on : Jan 5, 2017, 2:18:31 PM
    Author     : Khanh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="bg-gray">
    <form action="UserController">
        <div class="row">
            <div class="col-xs-4">
                <div class="form-group">
                    <label for="idroute">Tuyến đường</label>
                    <select class="form-control" id="route" name="idroute" id="idroute">
                        <c:forEach var="route" items="${requestScope.list_route}">
                            <option value="${route.id}">
                                ${route.name}
                            </option>
                        </c:forEach>
                    </select>
                </div>
            </div>
            <div class="col-xs-2">
                <div class="form-group">
                    <label for="date">Ngày</label>
                    <select name="date" id="date" class="form-control" style="width:100%">
                    </select>
                </div>
            </div>
            <div class="col-xs-2">
                <div class="form-group">
                    <label for="month">Tháng</label>
                    <select name="month" class="form-control" id="month">
                    </select>
                </div>
            </div>
            <div class="col-xs-2">
                <div class="form-group">
                    <label for="year">Năm</label>
                    <select name="year" class="form-control" id="year">
                    </select>
                </div>
            </div>
            <input class="hidden" type="text" name="page" value="find"/>
            <div class="col-xs-2">
                <button  class="btn btn-warning" type="submit"><span class="glyphicon glyphicon-list-alt"></span> Mua vé</button>
            </div>
        </div>
    </form>
</div>
<div >
    <img src="images/a.jpg" style="margin: auto" class="img img-responsive" alt=""/>
</div>
<h3 class="text-primary text-uppercase">Tuyến đường</h3>
<div class="table-responsive">
    <table class="table">
        <thead>
            <tr style="background: #5bc0de">
                <th>STT</th>
                <th>Bến đi</th>
                <th>Bến đến</th>
                <th>Loại xe</th>
                <th>Quãng đường</th>
                <th>Thời gian</th>
                <th>Số chuyến</th>
                <th>Giá vé</th>
                <th>Giờ khởi hành</th>
                <th></th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="p" items="${requestScope.listprice}">
                <tr>
                <td>${p.id}</td>
                <td>${p.origin}</td>
                <td>${p.destination}</td>
                <td>${p.type}</td>
                <td>${p.distance} km</td>
                <td>${p.duration}</td>
                <td style="text-align: center">${p.schedule}</td>
                <td style="color:#e38a0e">${p.price} <sup>đ/vé</sup></td>
                <td style="text-align: center">${p.time}</td>
            </tr>
            </c:forEach>
        </tbody>
    </table>
</div>