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
    <div class="flip-card">
        <div class="flip-card-inner" id="${cardVOlist.no_painting}" style="border-radius: 5px;">
            <div class="ui card flip-card-front" style="height: 100%; margin: 0 auto;">
                <div class="content" style=" display: flex; flex-direction: row; justify-content: space-evenly; align-items: center;">
                    <img src="${cardVOlist.avatarimg}" style="border-radius: 50%; width: 3em;height: 3em;object-fit: cover;">
                    <span style="font-size: 2em;">${cardVOlist.nickname}</span>
                </div>
                <div class="image">
                    <img src="${cardVOlist.paintingmimg}" onclick="buypainting(${cardVOlist.no_painting});" style="object-fit: cover; height: 250px">
                </div>
                <div class="content" style="display: flex;justify-content: center;">
                    <span style="font-size: 1.5em">${cardVOlist.pname}</span>
                </div>
                <div class="extra content">
                    <div class="ui large transparent left icon input" style="display: flex;">
                        <i class="pencil alternate icon"></i>
                        <input type="text" maxlength="20" size="20" id="input${cardVOlist.no_painting}"
                               placeholder="글자수 20글자 내 작성"
                               style="font-size: 0.8em"/>
                    </div>
                    <button class="ui blue icon button" onclick="addComment('input' + ${cardVOlist.no_painting})"
                            style="float: right; font-size: 0.8em;">Add
                    </button>
                </div>
                <div class="ui bottom attached button collapsible" onclick="flipCard(${cardVOlist.no_painting})">
                    <i class="add icon"></i>
                    <span><i class="comment icon"></i>${cardVOlist.commentNumber}</span>
                </div>
            </div>
            <div class="ui comments flip-card-back" style="display: flex;user-select: auto;margin: 0;flex-direction: column;justify-content: space-between;">
               <div>
                <c:forEach var="commentVOList" items="${cardVOlist.commentVOList}">
                    <div style=" background-color:var(--color-albescent-white)">
                        <h5 class="ui header" style="user-select: auto; margin: 10px;">
                            <div style="display: flex;align-items: center;justify-content: space-between;">
                                <img src="${commentVOList.avatarimg}"
                                     style="border-radius: 50%; height:40px; width:40px;object-fit: cover;">
                                <span class="author"
                                      style="margin-left: 10px; font-size: 1.5em">${commentVOList.author}</span>
                                <button class="ui red icon button" onclick="reply_delete(${commentVOList.no_comment})" style="font-size: 0.5em">X
                                </button>
                            </div>
                            <div class="text" style="margin: 10px;">${commentVOList.comments}</div>
                        </h5>
                    </div>
                </c:forEach>
               </div>
                <div class="ui button bottom attached collapsible" onclick="closeCard(${cardVOlist.no_painting})" id="close_btn">
                    <i class="large close icon icon"></i>
                </div>
            </div>
        </div>
    </div>
</c:forEach>
</body>
</html>

