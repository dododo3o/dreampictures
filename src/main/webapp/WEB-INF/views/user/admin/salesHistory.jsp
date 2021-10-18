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
<jsp:include page="../header_footer/header_admin.jsp"></jsp:include>
<div class="has_bg_harp">
    <div class="container">
        <div style="grid-column:1/9;display: flex;flex-direction: column; gap:20px; justify-content: center; margin-top: 70px;">
            <div class="has_chathams-blue" style="font-size: 42px;">기간별 판매내역</div>
            <form action="">
                <div style="display: flex;margin-bottom: 50px" class="has_flex_space">
                    <select class="has_width_full" style="margin-right: 30px;">
                        <option value="" disabled selected>기간설정</option>
                        <option value="1week">1주</option>
                        <option value="1month">1개월</option>
                        <option value="3month">3개월</option>
                        <option value="6month">6개월</option>
                        <option value="1year">1년</option>
                    </select>
                    <button class='button is_notification' onclick="searchOk">검색</button>
                </div>
            </form>

            <div class="container" style="display: grid;grid-template-columns:repeat(4,1fr);grid-gap:1rem;">
                <c:forEach var="cardVOlist" items="${cardVOlist}">
                    <div class="ui card" style="height: 100%; margin: 0 auto;">
                        <div class="content">
                            <div class="right floated meta">14h</div>
                            <img src="${cardVOlist.avatarimg}"
                                 style="border-radius: 50%; width: 3em;height: 3em;object-fit: cover;">
                        </div>
                        <div class="image">
                            <img src="${cardVOlist.paintingmimg}" style="object-fit: cover; height: 250px">
                        </div>
                        <div class="content">
                    <span class="right floated">
                      <i class="heart outline like icon"></i>17 likes</span>
                            <i class="comment icon"></i>3 comments
                        </div>
                        <div class="extra content">
                            <div class="ui large transparent left icon input">
                                <i class="heart outline icon"></i>
                                <input type="text" placeholder="Add Comment...">
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
    <div class="container" style="display: grid;grid-template-columns:repeat(4,1fr);grid-gap:1rem;">
        <c:forEach var="cardVOlist" items="${cardVOlist}">
            <a href="/buy_picture/${cardVOlist.no_painting}">
                <div class="card has_flex_space_bt_cl has_shadow">
                    <div><img src="${cardVOlist.paintingmimg}" alt="" class="is_img_object-fit has_board_top_radius"></div>
                    <div class="card_history" style="width: 100%;">
                        <img src="${cardVOlist.avatarimg}" alt="" style="border-radius: 50%; width: 65px">
                        <span style="font-size: 1.3em">${cardVOlist.nickname}</span>
                    </div>
                    <div style="margin-bottom: 20px; font-size: 1.5em;">${cardVOlist.pname}</div>
                </div>
            </a>
        </c:forEach>
    </div>
    <div class="container" style="display: flex;justify-content: center;margin-top:30px;padding-bottom: 30px;
">
        <div>
            <div class="ui animated button" tabindex="0"
                 style="color:var(--color-white);background-color: var(--color-chathams-blue);">
                <div class="visible content">Perv</div>
                <div class="hidden content">
                    <i class="left arrow icon"></i>
                </div>
            </div>
            <c:forEach var="i" begin="1" end="${pageNum}" >
                <button class='button is_pagination'>${i}</button>
            </c:forEach>
            <div class="ui animated button" tabindex="0"
                 style="color:var(--color-white);background-color: var(--color-chathams-blue);">
                <div class="visible content">Next</div>
                <div class="hidden content">
                    <i class="right arrow icon"></i>
                </div>
            </div>
            <br>
        </div>
    </div>
</div>

<jsp:include page="../header_footer/footer.jsp"></jsp:include>
</body>
</html>