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
</head>
<body>
<jsp:include page="../header_footer/header_not_login.jsp"></jsp:include>
<main class="has_bg_harp">
    <div class="container">                                             <!--갭추가-->
        <div class="contents" style="grid-column: 5/9; margin-top: 85px; gap:30px;">
            <div class="title">회원 가입</div>
            <input type="text" class="is_login_input" placeholder="주소"/>
            <input type="text" class="is_login_input" placeholder="상세주소"/>
            <input type="text" class="is_login_input" placeholder="닉네임 등록"/>
            <img src="cardimg4.png" class="avatar_img" style="margin: 0 auto"/>

            <button class='button is_login has_shadow has_flex_center'>가입완료</span></button>
        </div>                                                             <!--갭추가-->
        <div class="contents" style="grid-column: 9/10;margin-top: 335px;gap: 24.5px;">
            <button class="button is_notification">인증 확인</button><br>
            <button class="button is_notification">이미지 등록</button>
        </div>
    </div>
</main>
<jsp:include page="../header_footer/footer.jsp"></jsp:include>
</body>
</html>