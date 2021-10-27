<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% String conPath = request.getContextPath(); %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>그림드림 | 마이페이지</title>
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
    <script>
        showModal = function () {
            $(() => {
                $.ajax({
                    url: "/ajax_picture_finder",
                    data: "",
                    success: function (result) {
                        var container = document.getElementById("container");
                        while (container.hasChildNodes()) {
                            container.removeChild(container.firstChild);
                        }
                        $("#container").html(result);
                    }
                });
            });
        };

        function flipCard(num) {
            $('#' + num).css("transform", "rotateY(180deg)");
            $(".ui.comments.flip-card-back").css('margin', '0');
        }

        function closeCard(num) {
            $('#' + num).css("transform", "rotateY(0deg)");
        }

        function buypainting(num) {
            location.href = "http://localhost:8080/buy_picture/" + num;
        }
    </script>
</head>
<body oncontextmenu="return false" onselectstart="return false">
<jsp:include page="../header_footer/header_login.jsp"></jsp:include>
<main class="has_bg_harp" style="height: auto">
    <div id="container" class="container">
        <div class="has_flex_column" style="grid-column:1/3; gap:40px;padding-top: 30px;background-color: #a2b0b36e">
            <div class="ui vertical animated button" tabindex="0" onclick="showModal()">
                <div class="hidden content"><a href="/mypage/+${user}">My Page</a></div>
                <div class="visible content">
                    <i class="red user circle icon"></i>
                </div>
            </div>
            <div class="ui vertical animated button" tabindex="0" onclick="showModal()">
                <div class="hidden content"><a href="/buylist">구매내역</a></div>
                <div class="visible content">
                    <i class="orange shipping fast icon"></i>
                </div>
            </div>
            <div class="ui vertical animated button" tabindex="0" onclick="showModal()">
                <div class="hidden content"><a href="/selllist">전시내역</a></div>
                <div class="visible content">
                    <i class="orange shipping fast icon"></i>
                </div>
            </div>
            <div class="ui vertical animated button" tabindex="0" onclick="showModal()">
                <div class="hidden content"><a href="/cart">장바구니</a></div>
                <div class="visible content">
                    <i class="yellow shopping cart icon"></i>
                </div>
            </div>
            <div class="ui vertical animated button" tabindex="0" onclick="showModal()">
                <div class="hidden content"><a href="/qalist">질문내역</a></div>
                <div class="visible content">
                    <i class="green comments outline icon"></i>
                </div>
            </div>
            <div class="ui vertical animated button" tabindex="0" onclick="showModal()">
                <div class="hidden content"><a href="/charge">포인트 입출금</a></div>
                <div class="visible content">
                    <i class="blue money bill alternate outline icon"></i>
                </div>
            </div>
        </div>
        <div style="grid-column: 3/13;display: flex;flex-direction: column;align-items: center;">
            <!-- 추가요소 있으면 이 안에 넣기-->
            <div style="color:var(--color-chathams-blue);font-size:var(--font-size-xll);padding-top:60px;padding-bottom: 100px;">장바구니</div>
            <div style="display:flex;grid-template-columns: repeat(4,1fr); grid-gap: 1rem; width: 100%;flex-wrap: wrap;margin-bottom: 100px;">
                <c:forEach var="cardVOlist" items="${cardVOlist}">
                    <div class="flip-card">
                        <div class="ui card flip-card-front" style="height: 100%; margin: 0 auto;">
                            <div class="content"
                                 style=" display: flex; flex-direction: row; justify-content: space-evenly; align-items: center;">
                                <img src="${cardVOlist.avatarimg}"
                                     style="border-radius: 50%; width: 3em;height: 3em;object-fit: cover;">
                                <span style="font-size: 1.5em;">${cardVOlist.nickname}</span>
                            </div>
                            <div class="image">
                                <img src="${cardVOlist.paintingmimg}" onclick="buypainting(${cardVOlist.no_painting});"
                                     style="object-fit: cover; height: 250px">
                            </div>
                            <div class="content" style="display: flex;justify-content: center;">
                                <span style="font-size: 1.5em">${cardVOlist.pname}</span>
                            </div>
                            <div class="extra content">
                                <div class="ui large transparent left icon input" style="display: flex;">
                                    <i class="pencil alternate icon"></i>
                                    <input type="text" maxlength="20" size="20" id="${cardVOlist.no_painting}"
                                           placeholder="글자수 20글자 내 작성" style="font-size: 0.8em"/>
                                </div>
                                <button class="ui blue icon button" onclick="addComment(${cardVOlist.no_painting})"
                                        style="float: right; font-size: 0.8em;">Add
                                </button>
                            </div>
                            <div class="ui bottom attached button collapsible"
                                 onclick="flipCard(${cardVOlist.no_painting})"
                                 style="z-index: 1;">
                                <i class="add icon"></i>
                                <span><i class="comment icon"></i>${cardVOlist.commentNumber}</span>
                            </div>
                            <div class="ui comments flip-card-back">
                                <c:forEach var="commentVOList" items="${cardVOlist.commentVOList}">
                                    <h5 class="ui header" style="user-select: auto; margin: 10px;">
                                        <div style="display: flex;align-items: center;justify-content: space-between;">
                                            <img src="${commentVOList.avatarimg}"
                                                 style="border-radius: 50%; height:40px; width:40px;object-fit: cover;">
                                            <span class="author"
                                                  style="margin-left: 10px; font-size: 1.5em">${commentVOList.author}</span>
                                            <button class="ui red icon button" onclick="" style="font-size: 0.5em">X
                                            </button>
                                        </div>
                                        <div class="text" style="margin: 10px;">${commentVOList.comments}</div>
                                    </h5>
                                </c:forEach>
                                <div class="ui button bottom attached collapsible"
                                     onclick="closeCard(${cardVOlist.no_painting})" id="close_btn">
                                    <i class="large close icon icon"></i>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
</main>
<jsp:include page="../header_footer/footer.jsp"></jsp:include>
</body>
</html>