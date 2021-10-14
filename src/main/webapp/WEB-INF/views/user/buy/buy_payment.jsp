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
</head>
<body>
<% if (session.getAttribute("logStatus")=="Y"){ %>
<jsp:include page="../header_footer/header_login.jsp">
    <jsp:param name="user" value="${user}"/>
</jsp:include>
<% } %>
<main class="has_bg_harp">

    <div class="container">

        <div class="payment-page-artwork" style="border-bottom:1px solid black; height:750px; grid-column: 1/7;">
            <h1 class="has_font-2xl has_dark-moderate-blue" style="margin:10px 0 25px 0;">결제페이지</h1>
            <div>
                <h2 class="has_font-xxl has_dark-moderate-blue" style="text-align:center; margin-bottom:10px;"><c:out value="${paymentVO.pname}"/></h2>
                <img src="<c:out value="${paymentVO.paintingimg}"/>" alt="" class="artwork-img">
            </div>
            <div>
                <ul>
                    <li class="has_font-lg">가격: <c:out value="${paymentVO.price}"/></li>
                    <li class="has_font-lg">높이: <c:out value="${paymentVO.height}"/> 넓이: <c:out value="${paymentVO.width}"/></li>
                    <li class="has_font-lg">제작년도: <c:out value="${paymentVO.production}"/></li>
                    <li>설명: <c:out value="${paymentVO.exp}"/></li>
                </ul>
            </div>
        </div>

        <div style="height:750px; grid-column: 7/13;">
            <!--구매자 정보-->
            <div style="margin-top:130px;" class="avatar">
                <img src="<c:out value="${paymentVO.avatarimg}"/>" class="avatar_img"/>
                <div class="avatar_name has_chathams-blue">
                    "<c:out value="${paymentVO.nickname}"/>"
                    <ul class="avatar_info">
                        <li>이메일 : <c:out value="${paymentVO.email}"/></li>
                        <li>번호 : <c:out value="${paymentVO.tel}"/></li>
                    </ul>
                </div>
            </div>
            <!--배송지-->
            <div style="margin:40px 0 0px 30px;">
                <div style="margin-bottom:15px;"><span style="margin:0 20px 0 20px;" class="has_metallic-blue has_font-xl">배송지</span><button style="width:100px; height:40px;" class="button has_font-base">수정</button></div>
                <div style="width:90%; border:3px solid #495057; height:40px; border-radius:8px; line-height:40px;"><a style="margin-left:15px; color:#495057;" href="#"><c:out value="${paintingVO.addr}"/></a></div>
            </div>
            <!--결제수단-->
            <div  style="margin:30px 0 0 30px;">
                <p class="has_font-xl has_metallic-blue" style="margin:0 0 25px 0;">결제수단</p>
                <!--카드결제-->
                <div class="has_flex_center has_between">
                    <div class="icon-card has_bg_middle-blue-green credit-card">
                        <div style="margin-top:20px;"><i class="far fa-credit-card has_font-xxl has_metallic-blue"></i></div>
                        <div><i class="fas fa-check has_font-xl has_puce"></i></div>
                        <p class="has_metallic-blue has_font-lg">카드결제</p>
                    </div>
                    <!--휴대폰 결제-->
                    <div class="icon-card has_bg_middle-blue-green credit-card">
                        <div style="margin:20px 0 36px;"><i class="fas fa-mobile-alt has_font-xxl has_white"></i></div>
                        <p class="has_white has_font-lg">휴대폰결제</p>
                    </div>
                    <!--드림페이-->
                    <div class="icon-card has_bg_middle-blue-green credit-card">
                        <div style="margin:20px 0 36px 0;"><i class="fas fa-palette has_font-xxl has_white"></i></div>
                        <p class="has_font-lg has_white">드림페이</p>
                    </div>
                </div>
            </div>
            <!--버튼-->
            <div style="margin:20px 0 0 30px;" class="has_flex_center has_between">
                <button style="width:320px; height:60px;" class="button has_font-sm has_bg_dark-moderate-blue has_white">구매 하기</button><button style="width:140px; height:60px;" class="has_font-sm button has_bg_dark-moderate-blue has_white">뒤로가기</button>
            </div>
        </div>
    </div>
</main>
<jsp:include page="../header_footer/footer.jsp"></jsp:include>
</body>
</html>