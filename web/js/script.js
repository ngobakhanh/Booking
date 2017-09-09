// JavaScript Document
$(document).ready(function () {
    // Add smooth scrolling to all links in navbar + footer link
    $(".navbar a, footer a[href='#myPage']").on('click', function (event) {
        // Make sure this.hash has a value before overriding default behavior
        if (this.hash !== "") {
            // Prevent default anchor click behavior
            event.preventDefault();

            // Store hash
            var hash = this.hash;

            // Using jQuery's animate() method to add smooth page scroll
            // The optional number (900) specifies the number of milliseconds it takes to scroll to the specified area
            $('html, body').animate({
                scrollTop: $(hash).offset().top
            }, 900, function () {

                // Add hash (#) to URL when done scrolling (default click behavior)
                window.location.hash = hash;
            });
        } // End if
    });
    $(window).scroll(function () {
        $(".slideanim").each(function () {
            var pos = $(this).offset().top;

            var winTop = $(window).scrollTop();
            if (pos < winTop + 600) {
                $(this).addClass("slide");
            }
        });
    });


// Chèn ngày tháng năm
    chenngaythangnam();

    // Hiện form đặt vé
    $(".seat").on('click', function () {
        var idseat = $(this).data("id");
        var idroute = $('#route').val();
        var d = $('#date').val();
        var m = $('#month').val();
        var y = $('#year').val();
        $('#idseat').val(idseat);
        var departuredate = d + "-" + m + "-" + y;
        $('#idroute').val(idroute);
        $('#departuredate').val(departuredate);
        var seatName = $(this).data("seatname");
        $("#seatName").val(seatName);
        $('#formbooking').modal('show');
    });

    // Lưu thông tin vào csdl
    $("#btnSave").click(function () {
        sendDataBooking();
    });
});

//load lại  form ghế
function loadTicket() {
    window.location.href = 'http://localhost:8080/BookTicket/UserController?idroute=' + $('#route').val() + '&date=' + $('#date').val() + '&&month=' + $('#month').val() + '&year=' + $('#year').val() + '&page=find';
}

// gửi yêu cầu cho BookController xử lý
function sendDataBooking() {
    $.ajax({
        url: "ProcessorController", // Controller xu ly yeu cau
        method: "POST",
        asyn: true, //Xu ly yeu cau bat dong bo
        catch : false, // Khong cache du lieu
        dataType: "text",
        data: {// Du lieu gui le server
            name: $("#name").val(),
            phone: $("#phone").val(),
            route: $('#route').val(),
            seat: $('#idseat').val(),
            origin: $("#origin").val(),
            destination: $("#destination").val(),
            departuredate: $("#departuredate").val()
        },
        beforeSend: function () {// Chay truoc khi gui yeu cau  
        }
    }).done(function (result) {// Chay sau khi server xu ly xong yeu cau va lay ket qua server gui ve
        if (result === 'success') {
            alert('Đặt vé thành công ! Chúng tôi sẽ liên hệ với bạn trong thời gian sớm nhất');
            window.location.reload();
            $('#formbooking').modal('toggle');
        }else{
            alert('Đặt vé không thành công ! Bạn vui lòng điền đầy đủ thông tin hoặc liên hệ với nhà xe hotline: 0898529230');
        }
    }).fail(function (xhr, status) {// Xu ly loi  
        alert('Đặt vé không thành công ! Bạn vui lòng điền đầy đủ thông tin hoặc liên hệ với nhà xe hotline: 0898529230');
    }).always(function () {// Luon duoc thuc hien sau khi xu ly xong yeu cau         
    });
}



// chen ngay thang hien tai vao
function chenngaythangnam()
{
    var d = new Date();
    var date = d.getDate();
    var month = d.getMonth() + 1;
    var year = d.getFullYear();

    $('#date').prepend("<option value='" + date + "'>Ngày " + date + "</option>");
    for (var i = 31; i >= 1; i--)
    {
        $('#date').prepend("<option value='" + i + "'>Ngày " + i + "</option>");
    }



    $('#month').prepend("<option value='" + month + "'>Tháng " + month + "</option>");
    for (var i = 12; i >= 1; i--) {
        $('#month').prepend("<option value='" + i + "'>Tháng " + i + "</option>");
    }


    $('#year').prepend("<option value='" + year + "'>Năm " + year + "</option>");
    for (var i = year + 10; i >= year; i--) {
        $('#year').prepend("<option value='" + i + "'>Năm " + i + "</option>");
    }
}
