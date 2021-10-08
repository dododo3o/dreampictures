<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                oncomplete: function(data) {
                    var addr = data.address; // 최종 주소 변수
                    document.getElementById("sample5_address").value = addr;
                    geocoder.addressSearch(data.address, function(results, status) {
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
<jsp:include page="../header_footer/header_not_login.jsp"></jsp:include>
<main class="has_bg_harp">
    <div class="container">
        <form action="/register3" enctype="multipart/form-data" method="post"></form>
        <div class="contents" style="grid-column: 5/9; margin-top: 85px; gap:30px;">
            <div class="title">회원 가입</div>
            <input type="text" class="is_login_input" name="addr" id="sample5_address" placeholder="주소" onclick="sample5_execDaumPostcode()"/>
            <input type="text" class="is_login_input" name="detailAddr" placeholder="상세주소"/>
            <div id="map" style="width:300px;height:150px;margin-top:10px;display:none"></div>
            <input type="text" class="is_login_input" placeholder="닉네임 등록"/>
            <img src="/resources/css/photo/darth.jpg" class="avatar_img" style="margin:0 auto"/>
            <button class='button is_login has_shadow has_flex_center'>가입완료</button>
        </div>
        <div class="contents" style="grid-column: 9/10;margin-top: 335px;gap: 24.5px;">
            <button class="button is_notification">인증 확인</button>
            <label className="button is_notification input-file-button" for="input-file">이미지 등록</label>
            <input type="file" id="input-file" style="display:none">
        </div>
    </div>
</main>
<jsp:include page="../header_footer/footer.jsp"></jsp:include>
</body>
</html>