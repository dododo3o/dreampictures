<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% String conPath = request.getContextPath(); %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>공지사항</title>
    <link rel="stylesheet" href="/resources/css/dreampicturesytle.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">
    <link rel="stylesheet" type="text/css"
          href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.2.13/semantic.min.css">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <style>html, body, h1, h2, h3, h4, h5 {
        font-family: "Raleway", sans-serif
    }</style>
    <script src="https://kit.fontawesome.com/b14e6f064f.js" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"
            integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ=="
            crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <style>
        html, body, h1, h2, h3, h4, h5 {
            font-family: "Raleway", sans-serif
        }
    </style>
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"
            integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8=" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.2.13/semantic.js"></script>
    <script>
        function modal() {document.getElementById("modaldiv")}
    </script>
    <script type="text/javascript">
        push_notice = function () {
            $(() => {
                let title = document.getElementById("title").value;
                let question = document.getElementById("question").value;
                $.ajax({
                    url: "/ajax_push_notice",
                    data: "title=" + title + "&question=" + question,
                    success: function () {
                        document.location.href = "/admin/notice";
                    }
                });
            });
        };
        delete_notice = function (num) {
            $(() => {
                $.ajax({
                    url: "/ajax_delete_notice",
                    data: "num=" + num,
                    success: function () {
                        document.location.href = "/admin/notice";
                    }
                });
            });
        };
        showModal = function () {
            $('.ui.tiny.modal').modal('show');
        };
    </script>
</head>
<body class="w3-light-grey" style="height:100%" oncontextmenu="return false" onselectstart="return false">
<nav class="w3-sidebar w3-collapse w3-white w3-animate-left" style="z-index:3;width:300px;" id="mySidebar"><br>
    <div class="w3-container w3-row">
        <div class="w3-col s8 w3-bar" style="text-align: center;margin-left: 50px">
            <span>Welcome, <strong>Master</strong></span><br>
            <form action="<%=conPath%>/admin/login" method="post">
                <button class="ui secondary button" style="height:35px;font-family: 'Gowun Dodum'">로그아웃</button>
            </form>
        </div>
    </div>
    <hr>
    <div class="w3-container"></div>
    <div class="w3-bar-block">
        <a href="#" class="w3-bar-item w3-button w3-padding-16 w3-hide-large w3-dark-grey w3-hover-black"
           onclick="w3_close()" title="close menu"><i class="fa fa-remove fa-fw"></i>  Close Menu</a>
        <a href="/admin/main" class="w3-bar-item w3-button w3-padding"><i class="fa fa-bullseye fa-fw"></i>  관리자
            메인으로</a>
        <a href="/admin/notice" class="w3-bar-item w3-button w3-padding w3-blue"><i class="fa fa-bullseye fa-fw"></i> 
            공지사항</a>
        <a href="/admin/qa" class="w3-bar-item w3-button w3-padding"><i class="fa fa-bullseye fa-fw"></i>  질문사항</a>
        <a href="/admin/salesHistory" class="w3-bar-item w3-button w3-padding"><i class="fa fa-bullseye fa-fw"></i> 
            판매내역</a>
        <a href="/admin/report" class="w3-bar-item w3-button w3-padding"><i class="fa fa-bullseye fa-fw"></i>  신고내역</a>
        <a href="/admin/allmembers" class="w3-bar-item w3-button w3-padding"><i class="fa fa-bullseye fa-fw"></i>  회원현황</a><br><br>
    </div>
</nav>
<div class="w3-overlay w3-hide-large w3-animate-opacity" onclick="w3_close()" style="cursor:pointer"
     title="close side menu" id="myOverlay"></div>
<div class="w3-main" style="margin-left:300px;height: 100%">
    <main class="has_bg_harp" style="height:100%;display:flex;flex-direction: column;justify-content: space-between;">
        <div>
            <div style="display: flex;align-items: center;justify-content:space-evenly;border-bottom: 1px solid #BDBDBD;padding: 10px 0">
                <div style="padding-left: 447px"><h1 style="font-family:'Gowun Dodum';color:var(--color-chathams-blue);font-weight: bold">공지사항</h1></div>
                <div><button class="ui primary basic button" style="font-family:'Gowun Dodum';font-weight: bold" onclick="showModal()">공지사항 올리기</button></div>
            </div>
            <div style="height:100%;padding:20px 0;padding-bottom: 30px;font-weight:bold;">
                <div style="display: grid;grid-template-columns:repeat(4,1fr);grid-gap:1rem;width: 100%;">
                    <c:forEach var="noticeVOList"  items="${noticeVOList}">
                        <div class="ui card" style="height: 350px; margin: 0 auto;">
                            <div class="content" style="height: 100%; margin: 0 auto;">
                                <div class="header" style="font-family: 'Gowun Dodum'">${noticeVOList.title}</div>
                                <div class="meta">${noticeVOList.writedate}</div>
                                <div class="description"><p>${noticeVOList.content}</p></div>
                            </div>
                            <div style="height:auto;border-top: 1px solid #ddd;text-align: center;padding: 5px 0;">
                                <button class="ui red basic button" onclick="delete_notice(${noticeVOList.no_notice})" style="font-family:'Gowun Dodum';font-weight:bold;">삭제</button>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
    </main>
    <div class="ui tiny modal" style="text-align: center;width:450px">
        <div class="header" style="font-family: 'Gowun Dodum';font-size:32px;background-color:lightblue">공지 사항</div>
        <div class="ui form">
            <div class="field">
                <div class="field">
                    <div style="font-size: var(--font-size-lg);font-family: 'Gowun Dodum';font-weight: bold;padding:5px 0">제목</div>
                    <input type="text" maxlength="30" id="title" style="border: 1px solid lightblue;font-family: 'Gowun Dodum';">
                    <div class="ui" style="font-size: var(--font-size-lg);font-family: 'Gowun Dodum';font-weight: bold;padding:5px 0">공지내용</div>
                    <textarea id="question" maxlength="200"></textarea>
                </div>
            </div>
        </div>
        <div class="actions" style="background-color:lightblue">
            <div class="ui positive right labeled icon button" style="background-color:steelblue;font-family: 'Gowun Dodum';font-weight: bold;" onclick="push_notice()">올리기<i class="checkmark icon"></i></div>
        </div>
    </div>
</div>
<script>
    var mySidebar = document.getElementById("mySidebar");
    var overlayBg = document.getElementById("myOverlay");

    function w3_open() {
        if (mySidebar.style.display === 'block') {
            mySidebar.style.display = 'none';
            overlayBg.style.display = "none";
        } else {
            mySidebar.style.display = 'block';
            overlayBg.style.display = "block";
        }
    }

    function w3_close() {
        mySidebar.style.display = "none";
        overlayBg.style.display = "none";
    }
</script>
</body>
</html>