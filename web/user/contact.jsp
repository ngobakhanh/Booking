<%-- 
    Document   : contact
    Created on : Jan 4, 2017, 10:42:33 PM
    Author     : Khanh
--%>
<style>
    #mapCanvas {
        width: 100%;
        height: 600px;
    }
    .bg-gray{
        background: #ddd;
        padding: 6px;
        border-radius: 4px;
        margin-top: 30px;
    }
</style>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="bg-gray">
    <p>Cám ơn bạn đã ghé thăm website của chúng tôi. Mọi thắc mắc xin hệ theo địa chỉ bên dưới</p>
</div>
<div class="">
    <h2>Bản Đồ</h2>
    <div class="map" id="mapCanvas"></div>
</div>
<div class="clearfix">
    <h3 class="text-uppercase text-primary">Nhà xe</h3>
    <p>Địa chỉ VP: 822 Cách mạng tháng tám, Q.Tân Bình, TP Hồ Chí Minh.</p>
    <p>
        Điện thoại VP: <strong>08 7878 8787</strong> - Fax: <strong>08 7878 8787</strong> | Email: <a href="https://mail.google.com">Khanh.ngoba@gmail.com</a> | Website: <a href="nhaxe.com">nhaxe.com</a>
    </p>
    <p>Tổng đài đặt vé: <span style="font-size: 20px;color:black">08 9852 9230</span></p>
    <p class="clearfix">
        <a href="https://www.google.com/maps/dir//822+C%C3%A1ch+M%E1%BA%A1ng+Th%C3%A1ng+T%C3%A1m,+Ph%C6%B0%E1%BB%9Dng+4,+Qu%E1%BA%ADn+11,+H%E1%BB%93+Ch%C3%AD+Minh,+Vi%E1%BB%87t+Nam/@10.7918067,106.6532362,17z/data=!4m16!1m7!3m6!1s0x317529352b00c8cf:0xb9c4df6d6d17681d!2zODIyIEPDoWNoIE3huqFuZyBUaMOhbmcgVMOhbSwgUGjGsOG7nW5nIDQsIFF14bqtbiAxMSwgSOG7kyBDaMOtIE1pbmgsIFZp4buHdCBOYW0!3b1!8m2!3d10.7918067!4d106.6554249!4m7!1m0!1m5!1m1!1s0x317529352b00c8cf:0xb9c4df6d6d17681d!2m2!1d106.6554249!2d10.7918067" class="btn btn-success pull-right">Tìm đường</a>
    </p>
</div>




<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDxOXFoTUTysuqfH7niStKxuL6NQds9q6s&callback=initMap"></script>
<script>
    function initMap() {
        var uluru = {lat: 10.792060, lng: 106.655436};
        var map = new google.maps.Map(document.getElementById('mapCanvas'), {
            zoom: 18,
            center: uluru
        });

        var contentString = '';

        var infowindow = new google.maps.InfoWindow({
            content: contentString
        });

        var marker = new google.maps.Marker({
            position: uluru,
            map: map,
            title: 'Địa chỉ'
        });
        marker.addListener('click', function () {
            infowindow.open(map, marker);
        });
    }
    google.maps.event.addDomListener(window, 'load', initMap);
</script>