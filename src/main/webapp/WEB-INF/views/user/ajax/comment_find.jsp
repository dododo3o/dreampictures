<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% String conPath = request.getContextPath(); %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>그림드림
    </title>
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
</head>
<body>
<div class="ui tiny modal" id="commentModal">
    <div class="ui comments">
        <h3 class="ui block header">댓글로 자유롭게 평가해주세요 !</h3>
        <c:forEach var="commentVOlist" items="${commentVOlist}">
            <h4 class="ui" style="user-select: auto;"></h4>
            <div class="comment" style="margin-left: 10px; margin-bottom: 10px;">
                <a class="avatar"><img src="${commentVOlist.avatarimg}" style="border-radius: 50%; height:40px; width:40px;object-fit: cover;"></a>
                <div class="content">
                    <a class="author">${commentVOlist.author}</a>
                    <div class="metadata">
                        <span class="date">${commentVOlist.date}</span>
                    </div>
                    <div class="text">${commentVOlist.comments}</div>
                    <div class="actions"></div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>
</body>
</html>
