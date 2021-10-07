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
<header class="has_bg_white">
    <div class="container">
        <div class="is_logo">
            <a href="/admin/qa">
                <div class="is_logos"><i class="fas fa-palette fg-lg"></i>
                    <div>
                        <div><span>그</span><span class="has_albescent-white">림</span></div>
                        <div><span class="has_albescent-white">드</span><span>림</span></div>
                    </div>
                </div>
            </a>
        </div>
        <div class="navigation">
            <a href='/admin/qa' class='anchor'>질문사항</a>
            <a href='/admin/notice' class='anchor'>공지사항</a>
            <a href='/admin/report' class='anchor'>신고내역</a>
            <a href='/admin/blacklist' class='anchor'>블랙리스트</a>
            <button class='button is_primary'>Logout</button>
        </div>
    </div>
</header>
</body>
</html>