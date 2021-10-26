<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String greeting = request.getParameter("greeting");
    String pageName = request.getParameter("pageName");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Title</title>
    <link rel="stylesheet" href="/resources/static/css/dreampicturesytle.css">
    <link rel="stylesheet" type="text/css"
          href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.2.13/semantic.min.css">
    <!--고운돋움 글씨체 -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">
    <script src="https://kit.fontawesome.com/b14e6f064f.js" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"
            integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ=="
            crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"
            integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8=" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.2.13/semantic.js"></script>
</head>
<body oncontextmenu="return false" onselectstart="return false">
<header class="has_bg_white">
    <div class="container">
        <div class="is_logo">
            <a href="/">
                <div class="is_logos">
                    <i class="fas fa-palette fg-lg"></i>
                    <div style="font-weight: bold">
                        <div style="margin-bottom:14px;">
                            <span>그</span><span class="has_albescent-white">림</span>
                        </div>
                        <div>
                            <span class="has_albescent-white">드</span><span>림</span>
                        </div>
                    </div>
                </div>
            </a>
        </div>
        <div class="navigation" style="font-weight: bold">
            <a href='/buy' class='anchor hover_header-btn'>Buyer</a>
            <a href='/sell' class='anchor hover_header-btn'>Seller</a>
            <a href='/notice' class='anchor hover_header-btn'>Notice</a>
            <a href='/logout' class='anchor has_aqua-island hover_header-btn' id="mainMenu_login">Logout</a>
            <button class='button is_primary hover_sign-btn'><a href="/mypage/+${user}"
                                                                style="font-weight: bold">MyPage</a></button>
        </div>
    </div>
</header>
<hr/>
</body>
</html>