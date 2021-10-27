<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% String conPath = request.getContextPath(); %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>그림드림 | 마이페이지</title>
    <link rel="stylesheet" href="/resources/css/dreampicturesytle.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Montserrat&display=swap" rel="stylesheet">
    <link rel="stylesheet" type="text/css"
          href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.2.13/semantic.min.css">
    <script src="https://kit.fontawesome.com/b14e6f064f.js" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"
            integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ=="
            crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"
            integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8=" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.2.13/semantic.js"></script>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e3b7b3147ef30d454b9901f4af5c27b4&libraries=services"></script>
</head>
<body oncontextmenu="return false" onselectstart="return false">
<jsp:include page="../header_footer/header_login.jsp"></jsp:include>
<main class="has_bg_harp">
    <div id="container" class="container">
        <div style="grid-column:1/3;display:flex;flex-direction: column;gap:40px; padding-top: 20px; background-color: #a2b0b36e">
            <div class="has_flex_column"
                 style="grid-column:1/3; gap:40px;padding-top: 30px;">
                <div class="ui vertical animated button" tabindex="0" onclick="showModal()">
                    <div class="hidden content"><a href="/mypage/+${user}">My Page</a></div>
                    <div class="visible content">
                        <i class="red user circle icon"></i>
                    </div>
                </div>
                <div class="ui vertical animated button" tabindex="0">
                    <div class="hidden content"><a href="/buylist">구매내역</a></div>
                    <div class="visible content">
                        <i class="orange shipping fast icon"></i>
                    </div>
                </div>
                <div class="ui vertical animated button" tabindex="0">
                    <div class="hidden content"><a href="/selllist">전시내역</a></div>
                    <div class="visible content">
                        <i class="orange shipping fast icon"></i>
                    </div>
                </div>
                <div class="ui vertical animated button" tabindex="0">
                    <div class="hidden content"><a href="/cart">장바구니</a></div>
                    <div class="visible content">
                        <i class="yellow shopping cart icon"></i>
                    </div>
                </div>
                <div class="ui vertical animated button" tabindex="0">
                    <div class="hidden content"><a href="/qalist">질문내역</a></div>
                    <div class="visible content">
                        <i class="green comments outline icon"></i>
                    </div>
                </div>
                <div class="ui vertical animated button" tabindex="0">
                    <div class="hidden content"><a href="/charge">포인트 입출금</a></div>
                    <div class="visible content">
                        <i class="blue money bill alternate outline icon"></i>
                    </div>
                </div>
            </div>
        </div>
        <div style="grid-column: 3/13;display: flex;flex-direction: column;justify-content: space-between;align-items: center;justify-content: space-evenly">
            <div style="font-family: 'Gowun Dodum',sans-serif;font-weight:bold;color:var(--color-chathams-blue);font-size:var(--font-size-xll);padding-top: 50px;">
                My Page
            </div>
            <div class="ui card" style="width:500px;grid-column: 5/12;height: fit-content;">
                <div class="content" style="display:flex;justify-content: space-evenly;align-items: center;">
                    <div><img src="${mypageVO.avatarimg}"
                              style="border-radius:50%;width:5em;height:5em; object-fit:cover;"></div>
                    <div style="color:black;font-size: 3em;"><c:out value="${mypageVO.nickname}"/></div>
                </div>
                <div class="content">
                    <span class="right floated"></span>
                    <div class="ui segment" style="text-align:center;">
                        <div style="font-size:1.5em;"><i class="money bill alternate outline icon"></i>포인트
                            <div style="font-size:25px;"><c:out value="${mypageVO.dreampay}"/></div>
                        </div>
                    </div>
                    <div class="ui segment" style="text-align:center;">
                        <div style="font-size:1.5em;"><i class="truck icon"></i>배송지
                            <div style=";font-size:25px;"><c:out value="${mypageVO.addr}"/></div>
                        </div>
                    </div>
                    <div class="ui segment" style="text-align:center;">
                        <div style="font-size:1.5em;"><i class="envelope icon"></i>이메일
                            <div style="font-size:25px;"><c:out value="${mypageVO.email}"/></div>
                        </div>
                    </div>
                    <div class="ui segment" style="text-align:center;">
                        <div style="font-size:1.5em;"><i class="phone icon"></i>연락처
                            <div style=";font-size:25px;"><c:out value="${mypageVO.tel}"/></div>
                        </div>
                    </div>
                </div>
                <div class="extra content">
                    <div style="display:flex; justify-content: space-evenly;">
                        <button class="ui primary basic button" onclick="showModal()"
                                style="font-weight:bold;font-family: 'Gowun Dodum';width:150px; height:50px;">수정하기
                        </button>
                        <button class="ui primary basic button"
                                style="font-weight:bold;font-family: 'Gowun Dodum';width:150px; height:50px;">탈퇴하기
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</main>
<!--정보수정 모달창-->
<div class="ui tiny modal" style="text-align: center;width:450px">
    <div class="header" style="font-family: 'Gowun Dodum';font-size:32px;background-color:lightblue">정보수정</div>
    <div class="ui form">
        <div class="field">
            <div class="field">
                <div class="field">
                    <div style="font-size: var(--font-size-lg);font-family: 'Gowun Dodum';font-weight: bold;padding:5px 0">
                        주소
                    </div>
                    <input type="text" class="has_width_full input_select" name="addr"
                           id="sample5_address" placeholder="주소"
                           onclick="sample5_execDaumPostcode()"/>
                    <div style="font-size: var(--font-size-lg);font-family: 'Gowun Dodum';font-weight: bold;padding:5px 0">
                        상세주소
                    </div>
                    <input type="text" id="addrdetail" maxlength="100" style="border: 1px solid lightblue">
                    <div style="font-size: var(--font-size-lg);font-family: 'Gowun Dodum';font-weight: bold;padding:5px 0">
                        연락처
                    </div>
                    <input type="text" id="tel" maxlength="30" style="border: 1px solid lightblue">
                </div>
            </div>
        </div>
    </div>
    <div class="actions" style="background-color:lightblue">
        <div class="ui positive right labeled icon button"
             style="background-color:steelblue;font-family: 'Gowun Dodum';font-weight: bold;" onclick="hello()">
            수정하기<i class="checkmark icon"></i>
        </div>
    </div>
</div>
<script>
    $(document).ready(function () {
        $('.ui.segment').hover(function () {
            $(this).css('background', '#E7F0F0');
        }, function () {
            $(this).css('background', 'white');
        });
    });

    function hello() {
        $(() => {
            let addr = document.getElementById("sample5_address").value;
            let addrDetail = document.getElementById("addrdetail").value;
            let tel = document.getElementById("tel").value;
            $.ajax({
                url: "/ajax_push_changeInfo",
                data: "addr=" + addr + "&addrDetail=" + addrDetail + "&tel=" + tel,
                success: function (result) {
                    document.location.href = "redirect/";
                }
            });
        });
    }

    <!--정보수정 모달창 띄우기-->
    function modal() {
        document.getElementById("modaldiv")
    }

    push_changeInfo = function () {
        $(() => {
            let addr = document.getElementById("addr").value;
            let addrDetail = document.getElementsById("addrdetail").value;
            let tel = document.getElementById("tel").value;
            $.ajax({
                url: "/ajax_push_changeInfo",
                data: "addr=" + addr + "&addrDetail=" + addrDetail + "&tel=" + tel,
                success: function (result) {
                    document.location.href = "/mypage";
                }
            });
        });
    };
    showModal = function () {
        $('.ui.tiny.modal').modal('show');
    };
    <!--모달창 띄우기 끝-->

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
                document.getElementById("sample5_address").value = addr;
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
</main>
<jsp:include page="../header_footer/footer.jsp"></jsp:include>
</body>
</html>