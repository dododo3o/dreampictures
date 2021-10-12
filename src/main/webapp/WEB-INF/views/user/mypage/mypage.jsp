<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
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
</head>
<body>
<jsp:include page="../header_footer/header_login.jsp"></jsp:include>
<main class="has_bg_harp">
    <div class="container">
        <div style="grid-column: 1/7; margin-top: 100px" class="has_bg_white my_page has_flex_column">
            <div class="item has_font-xxl has_flex_center">
                <p>마이 페이지</p>
            </div>
            <div style="justify-content:space-evenly" class="item has_flex_center has_evenly">
                <div class="my_img"></div>
                <div>
                    <p class="has_font-xxl">Jenny Kim</p>
                    </br>
                    <p class="has_font-xs">bitcamp University</p>
                </div>
            </div>
            <div class="item has_flex_center has_flex_column">
                <div><p class="has_font-lg">배송지 <i class="fas fa-home"></i></p>
                    <p>서울 마포구 백범로1길 10</p></div>
                <div><p class="has_font-lg">e-mail <i class="fas fa-envelope-square"></i></p>
                    <p>bitcamp@gmail.com</p></div>
                <div><p class="has_font-lg">Phone <i class="fas fa-phone"></i></p>
                    <p>010 - 1234 - 1234</p></div>
            </div>
            <div style="justify-content:space-evenly" class="item has_flex_center has_evenly">
                <button class='has_bg_dark-gray has_white button is_primary'>수정 하기</button>
                <button class='has_bg_dark-gray has_white button is_primary'>탈퇴 하기</button>
            </div>
        </div>
        <div style="grid-column: 7/13; margin-top: 100px; font-size:0;" class="my_page has_bg_white">
            <nav class="transactionHistory-item">
                <button class='button is_primary'>구매내역</button>
                <button class='button is_primary'>판매내역</button>
                <button class='button is_primary'>장바구니</button>
                <button class='button is_primary'>질문하기</button>
            </nav>
            <section class="has_flex_center has_between has_font-base">
                <button class='button is_round'><i class="fas fa-arrow-left fa-lg"></i></button>
                <div class="card has_flex_space_bt_cl has_shadow">
                    <div><img src="/resources/css/photo/test.jpg" alt="" class="is_img_object-fit"></div>
                    <div class="card_history" style=" display: flex;justify-content: space-evenly; width: 100%;flex-direction: row;align-items: center;">
                        <div class="card_img_avatar"></div>
                        <div>
                            <div style="font-size: 1.3em">Jenny Kim</div>
                        </div>
                    </div>
                    <div style="margin-bottom: 20px; font-size: 1.5em;">Darth Vader</div>
                </div>
                <button class='button is_round'><i class="fas fa-arrow-right fa-lg"></i></button>
            </section>
            <section style="margin-top:55px;" class="has_font-base has_flex_center has_evenly">
                <button class="button is_utility has_icon"><span>날짜 선택</span><i class="far fa-calendar-alt"
                                                                                style="padding-left: 60px"></i></button>
                <button class='button is_utility has_icon'><span>다스베이더</span><i class="fas fa-search"
                                                                                style="padding-left: 50px"></i></button>
            </section>


        </div>
    </div>
</main>
<jsp:include page="../header_footer/footer.jsp"></jsp:include>
</body>
</html>