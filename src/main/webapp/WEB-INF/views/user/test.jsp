<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <!-- jQuery -->
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
    <!-- iamport.payment.js -->
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
    <!-- <script
        src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"
        integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>  -->
    <script async defer
            src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCJSzwXGvvtIypU1a6qlp-Vw0hY-4ZQ_I0&callback=initMap"></script>

    <style>
        * {
            box-sizing: border-box; /*border포함 250*/
        }

        a:link, a:hover, a:visited {
            text-decoration: none;
            color: black;
        }

        ul, li {
            margin: 0;
            padding: 0;
            list-style-type: none;
        }

        .main {
            display: flex;
            flex-direction: column;
            align-items: center;
            position: absolute;
        }

        .menu_title_container {
            display: flex;
            justify-content: center;
            border-bottom: 1px solid gray;
        }

        .menu_bar li {
            margin: 0 40px;
            line-height: 50px;
            height: 50px;
            width: 120px;
            text-align: center;
        }

        .imgwrap {
            width: 110px;
            height: 110px;
            display: flex;
            justify-content: center;
            overflow: hidden;
            border-radius: 100%;
            margin: 30px;
            position: relative;
        }

        .imgwrap:hover {
            border: 3px solid rgb(0, 163, 239);
        }

        #img {
            width: 110px;
            height: 110px;
            border-radius: 100%;
        }

        .menuList {
            display: flex;
            justify-content: center;
            flex-wrap: wrap;
            width: 800px;
            margin-top: 50px;
        }

        .imgtext {
            text-align: center;
        }

        .p_ename {
            font-size: 0.8em;
            color: rgb(0, 163, 239);
        }

        .menu_title_container>li:hover {
            border-bottom: 3px solid rgb(0, 163, 239);
            cursor: pointer
        }

        #img:hover {
            cursor: pointer;
            transform: scale(1.2); /* 마우스 오버시 이미지 크기를 1.1 배만큼 확대시킨다. */
            -o-transform: scale(1.2);
            -moz-transform: scale(1.2);
            -webkit-transform: scale(1.2);
            transition: transform .35s;
            -o-transition: transform .35s;
            -moz-transition: transform .35s;
            -webkit-transition: transform .35s;
            transition: all 0.3s ease-in-out;
        }

        #img:not(:hover) {
            cursor: pointer;
            transform: scale(1); /* 마우스 오버시 이미지 크기를 1.1 배만큼 확대시킨다. */
            -o-transform: scale(1);
            -moz-transform: scale(1);
            -webkit-transform: scale(1);
            transition: transform .35s;
            -o-transition: transform .35s;
            -moz-transition: transform .35s;
            -webkit-transition: transform .35s;
            transition: all 0.3s ease-in-out;
        }

        .menuList {
            display: flex;
        }

        .p_num, .m_code{display:none}
    </style>
    <script>
        let price;
        $(function() {
            $("#All").click(function() {
                $(".latte").css('display', 'block');
                $(".espresso").css('display', 'block');
                $(".coffee").css('display', 'block');
            });

            $("#Coffee").click(function() {
                $(".coffee").css('display', 'block');
                $(".latte").css('display', 'none');
                $(".espresso").css('display', 'none');

            });
            $("#Latte").click(function() {
                $(".latte").css('display', 'block');
                $(".coffee").css('display', 'none');
                $(".espresso").css('display', 'none');
            });
            $("#Espresso").click(function() {
                $(".espresso").css('display', 'block');
                $(".coffee").css('display', 'none');
                $(".latte").css('display', 'none');
            });
            //선택 메뉴 오른쪽에 띄우기
            $(".siren___menu").click(function() {
                $("#menuCnt").html(1);
                $("#shotCnt").html(0);
                $("#shotPrice").html(shot);
                $("#syrupNum").html(0);
                $("#selectName").html($(this).children(".imgtext").children(".p_name").text());
                $("#selectEname").html($(this).children(".imgtext").children(".p_ename").text());
                $("#selectPrice").html($(this).children(".imgtext").children(".p_price").text());
                price =$(this).children(".imgtext").children(".p_price").text();
                console.log(price);
            });
            //시럽추가
            $("#syrupPlus").click(function(){
                $("#syrupNum").html(parseInt($("#syrupNum").text())+1);
            });
            $("#syrupMinus").click(function(){
                if(parseInt($("#syrupNum").text())>0){
                    $("#syrupNum").html(parseInt($("#syrupNum").text())-1);
                }

            });
            //샷추가
            const shot = 500;
            $("#shotPlus").click(function(){
                $("#shotCnt").html(parseInt($("#shotCnt").text())+1);
                $("#shotPrice").html(parseInt($("#shotPrice").text())+shot);
                //	$("#shotPrice").html(parseInt($("#shotPrice").text())+shot);

            });
            $("#shotMinus").click(function(){
                if(parseInt($("#shotCnt").text())>0 && parseInt($("#shotPrice").text())>0){
                    $("#shotCnt").html(parseInt($("#shotCnt").text())-1);
                    $("#shotPrice").html(parseInt($("#shotPrice").text())-shot);
                }

            });
            //음료추가
            $("#MenuPlus").click(function(){
                $("#menuCnt").html(parseInt($("#menuCnt").text())+1);
                $("#selectPrice").html(parseInt($("#selectPrice").text())+parseInt(price));
            });
            $("#MenuMinus").click(function(){
                $("#menuCnt").html(parseInt($("#menuCnt").text())-1);
                $("#selectPrice").html(parseInt($("#selectPrice").text())+parseInt(price));
            });
            /*		$("#menuMinus").click(function(){
                        if(parseInt($("#menuCnt").text())>0 && ){
                            $("#menuCnt").html(parseInt($("#menuCnt").text())-1);
                            $("#shotPrice").html(parseInt($("#shotPrice").text())-shot);
                        }

                    });*/

        });
    </script>
    <style type="text/css">
        ul, li {
            margin: 0;
            padding: 0;
            list-style: none;
        }

        section {
            height: 700px;
            width: 100%;
            background-size: cover;
            position: relative;
            font-size: 1rem;
        }

        .position {
            width: 1400px;
            margin: 0 auto;
            position: relative;
        }

        .list {
            height: 600px;
            width: 60%;
            float: left;
            position: absolute;
            overflow: auto;
        }

        #mapList {
            position: absolute;
            left: 1%;
            top: 11%;
            background: white;
            border-radius: 3%;
            width: 300px;
            height: 300px;
            opacity: 0.8;
        }

        .detail {
            position: relative;
            left: 65%;
            top: 15%;
            height: 645px;
        }

        .searchstore {
            background: rgb(0, 163, 239);
            font-size: 1.5rem;
            color: white;
            text-align: center;
            padding-top: 10px;
        }

        #searched>li {
            height: 80px;
            padding: 5px;
            border-bottom: 1px solid #ddd;
        }

        input[type="button"] {
            width: 235px;
            font-size: 1.1rem;
            height: 35px;
            border: 1px solid rgb(0, 163, 239);
            border-radius: 5px;
            color: rgb(0, 163, 239);
            background: white;
        }

        .store li {
            width: 550px;
            height: 20px;
        }

        .menu li {
            height: 40px;
        }

        .menu img {
            width: 150px;
            height: 150px;
        }

        .cupSize input {
            width: 146px;
        }

        #countPlus, #countMinus {
            width: 50px;
        }

        span {
            margin-right: 30px;}

        .cart{
            border: 1px solid gray;
            margin: 4px;
            width: 450px;
            float: left;
            padding :15px;
        }
        .total{
            clear: both;
        }
        .xbutton{
            width: 20px;
        }
        .cart li:first-child{
            display: flex;
            justify-content: space-between;
        }
        .menuname{
            margin-left:80px;
        }
        .price{text-align: right;
            font-size: 1.1em;
            font-weight: 600;
        }
        .menuList>li{display:flex;flex-direction:column;justify-content:center;align-items:center;width:25%}

    </style>



    <!-- 지도 api -->
    <script>
        // https://cloud.google.com/maps-platform/
        // https://maps.googlepis.com/
        //위도, 경도
        var latitude = 37.5729503;
        var longitude = 126.9793578;

        function initMap() {
            var myCenter = new google.maps.LatLng(latitude, longitude);
            // 지도를 그릴 때 필요한  기타점을 JSON형식의 데이터로 생성한다.
            var mapProperty = {
                center : myCenter,
                zoom : 17,//0~21까지의 값을 사용한다. 숫자가 클수록 확대된다.
                mapTypeId : google.maps.MapTypeId.ROADMAP
                //지도종류(ROADMAP, HYBRID, STEELITE, TERRAIN)
            };
            //지도를 표시할 곳
            var map = new google.maps.Map(document.getElementById("map"),
                mapProperty);

        }
    </script>
</head>
<body>
<%--<%@ include file="/inc/top.jspf" %>--%>
<section class="section1">
    <div class="position">
        <h1 id="store">매장 선택</h1>
        <div id="map" class="list"></div>
        <div id='mapList'>
            <ul>
                <li class="searchstore">매장찾기</li>
                <li class="searchstore"><input type="text"
                                               placeholder="매장명 또는 주소"></li>
                <li>
                    <ul id="searched">
                        <li>무교로<br /> 서울특별시 중구 무교로 15(무교동)<br /> 1522-3232
                        </li>
                        <li>한국 프레스 센터<br />서울특별시 중구 세종대로 124(태평로1가)<br />1522-3232
                        </li>
                    </ul>
                </li>
            </ul>
        </div>
        <div class="detail store">
            <ul>
                <li style="height: 369px"><img
                        src="img/15066662951506666295_kospi007.jpg"></li>
                <li>문정하비오점</li>
                <li>서울시 송파구 송파대로 111(문정동 23-2)</li>
                <li>-사이렌 오더 운영시간 : 07:00 ~ 21:30</li>
                <li>-결제 및 주문은 매장 2km 이내에서 가능합니다.</li>
            </ul>
        </div>
    </div>
</section>
<section class="section2">
    <div class="position">
        <h1 id="menuSelect">메뉴 선택</h1>
        <div class="menu_bar" style="width:60%;">
            <ul class="menu_title_container">
                <li id="All">All</li>
                <li id="Coffee">Coffee</li>
                <li id="BEVERAGE">BEVERAGE</li>
                <li id="Food">Food</li>
            </ul>
        </div>
        <div class="list">
            <div class="main">
                <ul class="menuList">
                    <c:forEach var="menuVo" items="${menuVo}">
                        <li class="siren___menu">
                            <div class="imgwrap">
                                <img src="img/americano.png" id="img"/>
                            </div>
                            <div class="imgtext">
                                <div class="p_name">${menuVo.p_name}</div>
                                <div class="p_ename">${menuVo.p_ename}</div>
                                <div class="p_price">${menuVo.p_price}</div>
                                <div class="m_code">${menuVo.m_code}</div>
                            </div>
                        </li>
                    </c:forEach>
                </ul>
            </div>
        </div>
        <div class="detail menu">
            <ul>
                <li id="menuDetail">메뉴 상세</li>
                <li><hr /></li>
                <li style="display:flex;height: 170px; margin-left: 55px;"><img src="img/americano.png" id="img"
                                                                                style="width: 150px; height: 150px;" />
                    <ul class="menuname">
                        <li id="selectName">아메리카노</li>
                        <li id="selectEname" class="p_ename">Iced Americano</li>
                        <li id="selectPrice">4,300원</li>
                        <li><input id="menuMinus" type="button" value="-">
                            <span id="menuCnt"> 1 </span> <input id="MenuPlus" type="button" value="+"></li>
                    </ul>
                </li>
                <li>
                    <input type="button" value="일회용컵">
                    <input type="button" value="매장컵">
                </li>
                <li>
                    <input type="button" value="TALL">
                    <input type="button" value="GRANDE">
                </li>
                <li>
                    <input type="button" value="hot">
                    <input type="button" value="ice">
                </li>
                <li>
                    샷추가
                    <span id="shotPrice">0</span>
                    <input id="shotMinus" type="button" value="-">
                    <span id="shotCnt"> 0 </span>
                    <input id="shotPlus" type="button" value="+">
                </li>
                <li>
                    시럽추가
                    <span>500</span>
                    <input id="syrupMinus" type="button" value="-">
                    <span id="syrupNum"> 0 </span>
                    <input id="syrupPlus" type="button" value="+">
                </li>
                <li><hr /></li>
                <li id="totalPrice">6100원</li>
                <li>
                    <a href="#cart"><input type="button" value="장바구니 담기">
                    </a><input type="button" value="주문하기" id="orderBtn">
                </li>
            </ul>
        </div>
    </div>
</section>
<section class="section3">
    <div class="position">
        <h1 id="cart">장바구니</h1>
        <div class="text bn3">
            <div class="cart">
                <ul>
                    <li><span><input type="checkbox">음료</span><img class="xbutton" src="img/pngwing.com.png"></li><hr />

                    <li><input type="checkbox"> 아이스 카페 아메리카노</li>
                    <li>ICED / Tall/ 매장컵</li>
                    <li class="price">4,300원</li>
                    <hr />
                    <li class="price" >4,300원</li>
                </ul>
            </div>
            <div class="cart">

                <ul>
                    <li><span><input type="checkbox">푸드</span><img class="xbutton" src="img/pngwing.com.png"></li><hr />
                    <li><input type="checkbox"> 브렉퍼스트 잉글리쉬 머핀</li>
                    <li class="price">4,200원</li>
                    <hr />
                    <li class="price">4,200원</li>
                </ul>
            </div>
            <div class="total">
                <hr />
                <h1 style="color:red;">총 2개 8,500원</h1><br/><input type="button" value="주문결제하기" />
            </div>
        </div>
    </div>
</section>
<script>
    $('#orderBtn').click(function () {
        // getter
        var IMP = window.IMP;
        IMP.init('imp58961197');
        var money = 100;
        console.log(money);
        IMP.request_pay({
            pg: 'kakao',
            merchant_uid: 'merchant_' + new Date().getTime(),
            name: '주문명 : 주문명 설정',
            amount: money,
            buyer_email: 'iamport@siot.do',
            buyer_name: '구매자이름',
            buyer_tel: '010-1234-5678',
            buyer_addr: '인천광역시 부평구',
            buyer_postcode: '123-456'
        }, function (rsp) {
            console.log(rsp);
            if (rsp.success) {
                var msg = '결제가 완료되었습니다.';
                msg += '고유ID : ' + rsp.imp_uid;
                msg += '상점 거래ID : ' + rsp.merchant_uid;
                msg += '결제 금액 : ' + rsp.paid_amount;
                msg += '카드 승인번호 : ' + rsp.apply_num;
                $.ajax({
                    type: "GET",
                    url: "/user/mypage/charge/point", //충전 금액값을 보낼 url 설정
                    data: {
                        "amount": money
                    },
                });
            } else {
                var msg = '결제에 실패하였습니다.';
                msg += '에러내용 : ' + rsp.error_msg;
            }
            alert(msg);
            //      document.location.href = "/user/mypage/home"; //alert창 확인 후 이동할 url 설정
        });
    });
</script>
</body>
</html>