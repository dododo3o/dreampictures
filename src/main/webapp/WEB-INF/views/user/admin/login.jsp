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
    <link rel="stylesheet" href="/resources/static/css/dreampicturesytle.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Montserrat&display=swap" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.2.13/semantic.min.css">
    <script src="https://kit.fontawesome.com/b14e6f064f.js" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script src="https://code.jquery.com/jquery-3.1.1.min.js" integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8=" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.2.13/semantic.js"></script>
</head>
<body>
<jsp:include page="../header_footer/header_not_login.jsp"></jsp:include>
<main class="has_bg_harp">
    <div class="container">
        <div class="contents" style="grid-column: 5/9; margin-top: 85px;">
            <div class="title">관리자 로그인</div>
            <form action="<%=conPath%>/admin/login_check" method="post">
                <div style="display: flex;user-select: auto;flex-direction: column;justify-content: space-evenly;align-items:center;height: 650px;">
                    <input type="text" placeholder="Login" name="admin" class="is_login_input"/>
                    <input type="text" placeholder="Password"  name="adminpwd" class="is_login_input"/>
                    <button class='button is_login has_shadow'>
                        <input type="submit" class='button is_login has_shadow has_flex_center has_width_full'
                               value="로그인">
                    </button>
                </div>
            </form>
        </div>
    </div>
</main>
<jsp:include page="../header_footer/footer.jsp"></jsp:include>
</body>
</html>