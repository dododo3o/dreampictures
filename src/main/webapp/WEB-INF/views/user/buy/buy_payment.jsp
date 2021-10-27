<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% String conPath = request.getContextPath(); %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>그림드림 | 구매</title>
    <link rel="stylesheet" href="/resources/css/dreampicturesytle.css">
    <!--고운돋움 글씨체 -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.2.13/semantic.min.css">
    <script src="https://kit.fontawesome.com/b14e6f064f.js" crossorigin="anonymous"></script>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e3b7b3147ef30d454b9901f4af5c27b4&libraries=services"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script src="https://code.jquery.com/jquery-3.1.1.min.js" integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8=" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.2.13/semantic.js"></script>
    <script>
        var mapContainer = document.getElementById('map'), // 지도를 표시할 div
            mapOption = {
                center: new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
                level: 5 // 지도의 확대 레벨
            };
        var map = new daum.maps.Map(mapContainer, mapOption);
        var geocoder = new daum.maps.services.Geocoder();
        var marker = new daum.maps.Marker({
            position: new daum.maps.LatLng(37.537187, 127.005476),
            map: map
        });
        function sample5_execDaumPostcode() {
            new daum.Postcode({
                oncomplete: function (data) {
                    var addr = data.address; // 최종 주소 변수
                    document.getElementById("address_input").value = addr;
                    geocoder.addressSearch(data.address, function (results, status) {
                        if (status === daum.maps.services.Status.OK) {
                            var result = results[0]; //첫번째 결과의 값을 활용
                            var coords = new daum.maps.LatLng(result.y, result.x);
                            mapContainer.style.display = "block";
                            map.relayout();
                            map.setCenter(coords);
                            marker.setPosition(coords)
                        }
                    });
                }
            }).open();
        }
    </script>
    <script>
        showCommentModal = function (msg) {
                if(msg=="포인트가 부족합니다."){$("#point").css("display","block");}
                else{$('.ui.tiny.modal').modal('show');}
        };
        pay = function (point,buyer,seller,paint) {
            $(() => {
                $.ajax({
                    url: "/ajax_pay",
                    data: "point=" + point + "&buyer=" + buyer + "&seller=" + seller + "&paint=" + paint ,
                    success: function (result) {
                        if(result=="success")
                            document.location.href = "/buylist";
                    }
                });
            });
        };
    </script>
</head>
<body oncontextmenu="return false" onselectstart="return false">
<% if (session.getAttribute("logStatus") == "Y") { %>
<jsp:include page="../header_footer/header_login.jsp">
    <jsp:param name="user" value="${user}"/>
</jsp:include>
<% } %>
<main class="has_bg_harp">
    <div class="ui tiny modal">
        <i class="close icon"></i>
        <div class="header" style="font-family: 'Gowun Dodum';">구매하시겠습니까?</div>
        <div class="image content">
            <div class="description">
                <div class="ui header" style="font-family: 'Gowun Dodum';">구매제품명: <c:out value="${paymentVO.pname}"/> </div>
                <p>가격: <c:out value="${paymentVO.price}"/></p>
                <p>차액포인트: <c:out value="${paymentVO.sum}"/></p>
            </div>
        </div>
        <div class="actions">
            <div class="ui black deny button">
                <span>아니요</span>
            </div>
            <div class="ui positive right labeled icon button" onclick="pay(<c:out value="${paymentVO.price}"/>,<c:out value="${paymentVO.buyer_no_member}"/>,<c:out value="${paymentVO.seller_no_member}"/>,<c:out value="${paymentVO.no_painting}"/>)">
                <span>네 구매할게요!</span>
                <i class="checkmark icon"></i>
            </div>
        </div>
    </div>
    <div class="container">
        <div style="background-color:var( --color-white);display:flex;grid-column: 1/13">
            <div style="border-right: 1px solid #ddd;width:50%;padding-left: 130px;padding-right: 100px;">
                <div class="has_flex_column has_evenly" style="height: 100%;">
                    <h2 class="ui header" style="margin: 0 auto;">
                        <i class="money bill alternate outline icon"></i>
                        <div class="content">결제 페이지</div>
                    </h2>
                    <div class="ui horizontal divider">Buyer Infomation</div>
                    <div class="ui list has_flex_column has_font-base" style="display: flex; gap: 20px;">
                        <div style="user-select: auto; display: flex;">
                            <i class="users icon" style="user-select: auto;"></i>
                            <div class="content" style="user-select: auto;">닉네임 : <c:out value="${paymentVO.nickname}"/></div>
                        </div>
                        <div style="user-select: auto; display: flex;">
                            <i class="mail icon" style="user-select: auto;"></i>
                            <div class="content" style="user-select: auto;">이메일 : <c:out value="${paymentVO.email}"/></div>
                        </div>
                        <div style="user-select: auto; display: flex;">
                            <i class="phone icon" style="user-select: auto;"></i>
                            <div class="content" style="user-select: auto;">연락처 : <c:out value="${paymentVO.tel}"/></div>
                        </div>
                    </div>
                    <div class="ui horizontal divider">Shipping Address</div>
                    <div class="has_flex_column" >
                        <input type="text" id="address_input" name="addr" onclick="sample5_execDaumPostcode()" style="font-family: 'Gowun Dodum'" value="<c:out value="${paymentVO.addr}"/>">
                    </div>
                    <div class="ui horizontal divider">Point</div>
                    <div class="ui list has_flex_column has_font-base" style="display: flex; gap: 20px;">
                        <div style="user-select: auto; display: flex;">
                            <i class="hourglass half icon" style="user-select: auto;"></i>
                            <div class="content" style="user-select: auto;">현재 포인트 : <c:out value="${paymentVO.dreampay}"/></div>
                        </div>
                        <div style="user-select: auto; display: flex;">
                            <i class="hourglass outline icon" style="user-select: auto;"></i>
                            <div class="content" style="user-select: auto;">결제 후 포인트 : <c:out value="${paymentVO.sum}"/></div>
                        </div>
                    </div>
                    <a href="/charge" style="width: 100%"><button class="fluid ui secondary button" style="font-family: 'Gowun Dodum'"> 드림페이 충전 </button></a>
                    <div class="ui horizontal divider">Payment</div>
                    <a class="ui red tag label" style="display: none" id="point"><span>포인트가 부족해요😥</span></a>
                    <div style="display: flex;justify-content: space-around;">
                        <a href="/buy_picture/<c:out value="${paymentVO.no_painting}"/>"><button class="ui secondary button" style="font-family: 'Gowun Dodum'">뒤로가기</button></a>
                        <button class="ui secondary button" style="font-family: 'Gowun Dodum'" onclick="showCommentModal('<c:out value="${paymentVO.sum}"/>')">결제하기</button>
                    </div>
                </div>
            </div>
            <div class="has_flex_column" style="width:50%;padding-left: 80px;padding-right: 80px;">
                <h2 class="ui header" style="margin-top: 100px;">
                    <i class="tag icon"></i>
                    <div class="content">Name: <c:out value="${paymentVO.pname}"/></div>
                </h2>
                <h1 style="font-family: 'Gowun Dodum'">Price: ₩<c:out value="${paymentVO.price}"/></h1>
                <div class="image" style="margin-top: 70px">
                    <img src="<c:out value="${paymentVO.paintingimg}"/>" style="width:300px;height: 300px;border-radius: 5%;">
                </div>
            </div>
        </div>
    </div>
</main>
<jsp:include page="../header_footer/footer.jsp"></jsp:include>
</body>
</html>