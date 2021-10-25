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
<c:forEach var="cardVOlist" items="${cardVOlist}">
    <div class="ui card" style="height: 100%; margin: 0 auto;">
        <div class="content" style=" display: flex; flex-direction: row; justify-content: space-evenly; align-items: center;">
            <img src="${cardVOlist.avatarimg}" style="border-radius: 50%; width: 3em;height: 3em;object-fit: cover;">
            <span style="font-size: 1.5em;">${cardVOlist.nickname}</span>
        </div>
        <div class="image"><img src="${cardVOlist.paintingmimg}" onclick="buypainting(${cardVOlist.no_painting});" style="object-fit: cover; height: 250px"></div>
        <div class="content" style="display: flex;justify-content: center;">
            <span style="font-size: 1.5em">${cardVOlist.pname}</span>
        </div>
    </div>
</c:forEach>
</body>
</html>

