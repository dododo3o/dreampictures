<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% String conPath = request.getContextPath(); %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/dreampicturesytle.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Montserrat&display=swap" rel="stylesheet">
    <script src="https://kit.fontawesome.com/b14e6f064f.js" crossorigin="anonymous"></script>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e3b7b3147ef30d454b9901f4af5c27b4&libraries=services"></script>
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
</head>
<body>
<% if (session.getAttribute("logStatus") == "Y") { %>
<jsp:include page="../header_footer/header_login.jsp">
    <jsp:param name="user" value="${user}"/>
</jsp:include>
<% } %>
<main class="has_bg_harp">

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
                        <input type="text" id="address_input" name="addr" onclick="sample5_execDaumPostcode()" value="<c:out value="${paymentVO.addr}"/>">
                    </div>
                    <div class="ui horizontal divider">Point</div>
                    <div class="ui list has_flex_column has_font-base" style="display: flex; gap: 20px;">
                        <div style="user-select: auto; display: flex;">
                            <i class="hourglass half icon" style="user-select: auto;"></i>
                            <div class="content" style="user-select: auto;">현재 포인트 : <c:out value="${paymentVO.dreampay}"/></div>
                        </div>
                        <div style="user-select: auto; display: flex;">
                            <i class="hourglass outline icon" style="user-select: auto;"></i>
                            <div class="content" style="user-select: auto;">
                                결제 후 포인트 : <c:out value="${paymentVO.sum}"/>
                            </div>
                        </div>
                    </div>
                    <button class="ui secondary button"> 드림페이 충전 </button>
                    <div class="ui horizontal divider">Payment</div>
                    <div style="display: flex;justify-content: space-around;">
                        <button class="ui secondary button">결제하기</button>
                        <button class="ui secondary button">뒤로가기</button>
                    </div>
                </div>
            </div>
            <div class="has_flex_column" style="width:50%;padding-left: 80px;padding-right: 80px;">
                <h2 class="ui header" style="margin-top: 100px;">
                    <i class="tag icon"></i>
                    <div class="content">Name: <c:out value="${paymentVO.pname}"/></div>
                </h2>
                <h1>Price: <c:out value="${paymentVO.price}"/></h1>
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