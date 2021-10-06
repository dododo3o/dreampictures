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
<jsp:include page="../header_footer/header_not_login.jsp"></jsp:include>
<main class="has_bg_harp">
    <div class="container">
        <div class="contents" style="grid-column: 5/9; margin-top: 85px">
            <div class="title">로그인 화면</div>
            <input type="text" placeholder="Login" class="is_login_input"/>
            <input type="password" placeholder="Password" class="is_login_input"/>
            <div class="has_flex_center" style="justify-content: space-between;">
                <div class="has_flex_center">
                    <input type="checkbox" id="login_check" style="height: 20px;"><label for="login_check"><span class="has_black has_font-xs">Remember me</span></label>
                </div>
                <a href='' class="has_black">Forgot password?</a>
            </div>
            <button class='button is_login has_shadow has_flex_center'><i class="fas fa-key"></i><span class="has_padding">로그인</span></button>
            <button class='button is_login has_shadow has_flex_center has_bg_turbo'><i class="fas fa-comment"></i></i></i><span class="has_padding">카카오톡 로그인</span></button>
            <button class='button is_login has_shadow has_flex_center has_bg_white'><i class="fab fa-google"></i><span class="has_padding">구글계정</span></button>
        </div>
    </div>
</main>
<jsp:include page="../header_footer/footer.jsp"></jsp:include>
</body>
</html>