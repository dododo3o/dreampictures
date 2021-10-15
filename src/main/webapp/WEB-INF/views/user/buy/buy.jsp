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
<% if (session.getAttribute("logStatus") == "Y") { %>
<jsp:include page="../header_footer/header_login.jsp">
    <jsp:param name="user" value="${user}"/>
</jsp:include>
<% } %>
<% if (session.getAttribute("logStatus") == null) { %>
<jsp:include page="../header_footer/header_not_login.jsp"></jsp:include>
<% } %>
<div class="has_bg_harp">
    <div class="container">
        <div style="grid-column:1/9;display: flex;flex-direction: column; gap:20px; justify-content: center; margin-top: 70px;">
            <div class="has_chathams-blue" style="font-size: 42px;">그림드림의 당신만의 그림찾기</div>
            <form action="">
                <div style="display: flex;" class="has_flex_space">
                    <input type="text" class="has_width_full" id="pname" placeholder="검색어를 입력해주세요."/>
                    <button class='button is_notification' onclick="searchOk">선택완료</button>
                </div>
            </form>
            <div>
                <select class="has_width_half" style="margin-right: 90px;">
                    <option value="" disabled selected>화풍</option>
                    <option value="oils">유화</option>
                    <option value="water">수채화</option>
                    <option value="acrylic">아크릴화</option>
                    <option value="pen">펜화</option>
                    <option value="pencil">연필화</option>
                    <option value="pastel">파스텔화</option>
                    <option value="crayon">크레용화</option>
                    <option value="gouache">과슈화</option>
                </select>
                <select class="has_width_half">
                    <option value="" disabled selected>테마</option>
                    <option value="scenery">풍경</option>
                    <option value="character">인물</option>
                    <option value="still">정물</option>
                    <option value="animal">동물</option>
                    <option value="abstract">추상</option>
                    <option value="popart">팝아트</option>
                    <option value="objet">오브제</option>
                </select>
            </div>
            <div style="display: flex;justify-content: space-between;grid-column:1/9;">
                <div><span class="has_chathams-blue">너비  : (CM)<br></span><input type="range" class="width_slider"
                                                                                 name="img_width" min="1" max="100"
                                                                                 value="50"/></div>
                <div><span class="has_chathams-blue">높이  : (CM)<br></span><input type="range" class="width_slider"
                                                                                 name="img_width" min="1" max="100"
                                                                                 value="50"/></div>
                <div><span class="has_chathams-blue">가격  : (원)<br></span><input type="range" class="width_slider"
                                                                                name="img_width" min="1" max="100"
                                                                                value="50"/></div>
                <div class="checkbox" style="display: flex;">
                    <input type="checkbox" style="margin-right:10px;"><label style="color: var(--color-chathams-blue);">거래완료
                    안보기</label>
                </div>
            </div>
        </div>
    </div>
    <div class="container" style="display: grid;grid-template-columns: repeat(5,1fr);;grid-gap:1rem;justify-content: space-around;">
        <c:forEach var="cardVOlist" items="${cardVOlist}">
            <div class="ui card" style="height: 100%; margin: 0 auto;">
                <div class="content">
                    <div class="right floated meta">14h</div>
                    <img src="${cardVOlist.avatarimg}"
                         style="border-radius: 50%; width: 3em;height: 3em;object-fit: cover;">
                </div>
                <div class="image" >
                    <a href="/buy_picture/${cardVOlist.no_painting}"><img src="${cardVOlist.paintingmimg}" style="object-fit: cover; height: 250px"></a>
                </div>
                <div class="content">
                    <span class="right floated">
                      <i class="heart outline like icon"></i>
                      17 likes
                    </span>
                    <i class="comment icon"></i>
                    3 comments
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
    <div class="container" style="display: flex;justify-content: center;margin-top:30px;padding-bottom: 30px;
">
        <div>
            <div class="ui animated button" tabindex="0" style="color:var(--color-white);background-color: var(--color-chathams-blue);">
                <div class="visible content">Perv</div>
                <div class="hidden content">
                    <i class="left arrow icon"></i>
                </div>
            </div>
            <button class='button is_pagination'>1</button>
            <button class='button is_pagination'>2</button>
            <button class='button is_pagination'>3</button>
            <button class='button is_pagination'>4</button>
            <button class='button is_pagination'>5</button>
            <button class='button is_pagination'>6</button>
            <button class='button is_pagination'>7</button>
            <button class='button is_pagination'>8</button>
            <button class='button is_pagination'>9</button>
            <button class='button is_pagination'>10</button>
            <div class="ui animated button" tabindex="0" style="color:var(--color-white);background-color: var(--color-chathams-blue);">
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