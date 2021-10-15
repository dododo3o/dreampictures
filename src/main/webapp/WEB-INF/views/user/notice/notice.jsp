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
    <script>
        //a태그 마우스오버1
        function mouseOver(){
            document.getElementById('noticeLink').style.backgroundColor="gray";
            document.getElementById('menuFont').style.color="white";
            document.getElementById('menuIcon').style.color="white";
        }
        //a태그 마우스오버
        function mouseOver2(){
            document.getElementById('noticeLink2').style.backgroundColor="gray";
            document.getElementById('menuFont2').style.color="white";
            document.getElementById('menuIcon2').style.color="white";
        }

        //a태그 마우스아웃
        function mouseOut(){
            document.getElementById('noticeLink').style.backgroundColor="rgba(255,255,255,0)";
            document.getElementById('menuFont').style.color="var(--color-river-bed)";
            document.getElementById('menuIcon').style.color="var(--color-river-bed)";
        }
        //a태그 마우스아웃2
        function mouseOut2(){
            document.getElementById('noticeLink2').style.backgroundColor="rgba(255,255,255,0)";
            document.getElementById('menuFont2').style.color="var(--color-river-bed)";
            document.getElementById('menuIcon2').style.color="var(--color-river-bed)";
        }

        function modal(){
            document.getElementById("modaldiv")
        }
    </script>
    <script type = "text/javascript" >
        showModal = function () {$('.ui.modal').modal('show');};
    </script>
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
<main class="has_bg_harp" style="height: 100%;">
    <div class="ui modal">
        <i class="close icon"></i>
        <div class="header" style="background-color: var(--color-aqua-island)">
            질문사항
        </div>
        <div class="description has_flex_row" style="justify-content: flex-start;">
            <div class="ui medium has_flex_column" style="background-color: #a6bbc347; align-items: flex-start;padding-left: 10px;">
                <div class="has_flex_center"> <input type="radio" value="question1">question1 question1 question1 question1 question1 </div>
                <div class="has_flex_center"> <input type="radio" value="question2">question2 question2 question2 question2 question2 </div>
                <div class="has_flex_center">  <input type="radio" value="question3"> question3 question3 question3 question3 question3  question3 question3</div>
            </div>
            <div class="description has_margin has_width_100">
                <div class="ui header">질문을 구체적으로 작성해주세요!</div>
                <textarea class="has_width_100 has_height_80 input_textarea" placeholder="질문사항을 작성해주세요." style="resize: none;"></textarea>
            </div>
        </div>
        <div class="actions" style="background-color: var(--color-aqua-island)">
            <div class="ui positive right labeled icon button" style="background-color: var(--color-metallic-blue)">
                올리기
                <i class="checkmark icon"></i>
            </div>
        </div>
    </div>



    <div class="container" style="height: 100%;">
        <div class="has_flex_column" style="grid-column:1/3; gap:40px; height: 100%; padding-top: 30px; background-color: #a2b0b36e">
            <%--            <a href="#" class="has_evenly" onmouseover="mouseOver()" onmouseout="mouseOut()" style=" padding-top: 10px; padding-bottom: 10px;" id="noticeLink">--%>
            <%--                <span id="menuIcon" style=" color: var(--color-river-bed)"><i class="fas fa-bell fa-lg"></i></span>--%>
            <%--                <div id="menuFont" style="display:flex;align-items: center; margin-left: 10px; color: var(--color-river-bed)">공지사항--%>
            <%--                </div>--%>
            <%--            </a>--%>
            <%--            <a href="#" class="has_evenly" onmouseover="mouseOver2()"  onmouseout="mouseOut2()"style=" padding-top: 10px; padding-bottom: 10px;" id="noticeLink2">--%>
            <%--                <span id="menuIcon2" style=" color: var(--color-river-bed)"><i class="fas fa-question fa-lg"></i></span>--%>
            <%--                <div id="menuFont2" style="display:flex;align-items: center; margin-left: 10px; color: var(--color-river-bed)">질문사항--%>
            <%--                </div>--%>
            <%--            </a>--%>
            <div class="ui vertical animated button" tabindex="0" onclick="showModal()">
                <div class="hidden content">질문하기</div>
                <div class="visible content">
                    <i class="question circle icon"></i>
                </div>
            </div>
            <div class="ui vertical animated button" tabindex="0" onclick="showModal()">
                <div class="hidden content">질문하기</div>
                <div class="visible content">
                    <i class="question circle icon"></i>
                </div>
            </div>
            <div class="ui vertical animated button" tabindex="0" onclick="showModal()">
                <div class="hidden content">질문하기</div>
                <div class="visible content">
                    <i class="question circle icon"></i>
                </div>
            </div>
        </div>
        <div class="has_flex_end" style="grid-column: 3/13; flex-wrap: wrap; margin-top: 20px;">
            <div class="ui vertical animated button" tabindex="0" onclick="showModal()">
                <div class="hidden content">질문하기</div>
                <div class="visible content">
                    <i class="question circle icon"></i>
                </div>
            </div>
            <div class="manager_card" style="display: grid;grid-template-columns:repeat(3,1fr);grid-gap:1rem;width: 100%;">
                <div class="ui card" style="height: 100%; margin: 0 auto;">
                    <div class="content">
                        <div class="right floated meta">14h</div>
                        <img src="${cardVOlist.avatarimg}"
                             style="border-radius: 50%; width: 3em;height: 3em;object-fit: cover;">
                    </div>
                    <div class="image">
                        <img src="/resources/user/qwer/paintingimg/bitcamp/0.jpg" style="object-fit: cover; height: 250px"></a>
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
                <div class="ui card" style="height: 100%; margin: 0 auto;">
                    <div class="content">
                        <div class="right floated meta">14h</div>
                        <img src="${cardVOlist.avatarimg}"
                             style="border-radius: 50%; width: 3em;height: 3em;object-fit: cover;">
                    </div>
                    <div class="image">
                        <img src="/resources/user/qwer/paintingimg/bitcamp/0.jpg" style="object-fit: cover; height: 250px"></a>
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
                <div class="ui card" style="height: 100%; margin: 0 auto;">
                    <div class="content">
                        <div class="right floated meta">14h</div>
                        <img src="${cardVOlist.avatarimg}"
                             style="border-radius: 50%; width: 3em;height: 3em;object-fit: cover;">
                    </div>
                    <div class="image">
                        <img src="/resources/user/qwer/paintingimg/bitcamp/0.jpg" style="object-fit: cover; height: 250px"></a>
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
                <div class="ui card" style="height: 100%; margin: 0 auto;">
                    <div class="content">
                        <div class="right floated meta">14h</div>
                        <img src="${cardVOlist.avatarimg}"
                             style="border-radius: 50%; width: 3em;height: 3em;object-fit: cover;">
                    </div>
                    <div class="image">
                        <img src="/resources/user/qwer/paintingimg/bitcamp/0.jpg" style="object-fit: cover; height: 250px"></a>
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
            </div>
        </div>
    </div>
</main>

<jsp:include page="../header_footer/footer.jsp"></jsp:include>
</body>
</html>