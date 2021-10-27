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
    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.2.13/semantic.min.css">
    <script src="https://kit.fontawesome.com/b14e6f064f.js" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script src="https://code.jquery.com/jquery-3.1.1.min.js" integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8=" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.2.13/semantic.js"></script>
</head>
<body>
<c:forEach var="memberVOList" items="${memberVOList}">
    <div class="ui card">
        <div class="content" >
            <img class="ui avatar image" src="${memberVOList.avatarimg}"><a class="header" style="display: inline;font-family: 'Gowun Dodum'">닉네임:${memberVOList.nickname}</a>
            <div class="meta"><span class="date">신고당한 횟수:${memberVOList.reported}</span></div>
            <div class="description">주소:${memberVOList.addr}</div>
            <div class="description">전화번호:${memberVOList.tel}</div>
            <div class="description">드림페이:${memberVOList.dreampay}</div>
            <div class="description">입금 총액:${memberVOList.input_total}</div>
            <div class="description">출금 총액:${memberVOList.output_total}</div>
        </div>
        <div class="extra content">
            <a><i class="user icon"></i>상세정보</a>
        </div>
    </div>
</c:forEach>
</body>
</html>

