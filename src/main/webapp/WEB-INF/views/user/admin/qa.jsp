<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<% String conPath = request.getContextPath(); %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>질문사항</title>
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
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"
            integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8=" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.2.13/semantic.js"></script>
    <script>
        function modal() {
            document.getElementById("modaldiv")
        }
    </script>
    <script type="text/javascript">
        showModal = function () {
            $('.ui.tiny.modal').modal('show');
        };
        answerQA = function (no_qa) {
            $(() => {
                let answer = document.getElementById(no_qa).value;
                $.ajax({
                    url: "/ajax_answer_QA",
                    data: "no_qa=" + no_qa + "&answer=" + answer,
                    success: function (result) {
                        document.location.href = "/admin/qa";
                    }
                });
            });
        };
        deleteQA = function (no_qa) {
            $(() => {
                $.ajax({
                    url: "/ajax_delete_QA",
                    data: "num=" + no_qa,
                    success: function (result) {
                        document.location.href = "/admin/qa";
                    }
                });
            });
        };
    </script>
</head>
<body style="height: 100%" class="w3-light-grey" oncontextmenu="return false" onselectstart="return false">
<nav class="w3-sidebar w3-collapse w3-white w3-animate-left" style="z-index:3;width:300px;" id="mySidebar"><br>
    <div class="w3-container w3-row" >
        <div class="w3-col s8 w3-bar" style="text-align: center;margin-left: 50px">
            <span>Welcome, <strong>Master</strong></span><br>
            <form action="<%=conPath%>/admin/login" method="post">
                <button class="ui secondary button" style="height:35px;font-family: 'Gowun Dodum'">
                    로그아웃
                </button>
            </form>
        </div>
    </div>
    <hr>
    <div class="w3-container">
    </div>
    <div class="w3-bar-block">
        <a href="#" class="w3-bar-item w3-button w3-padding-16 w3-hide-large w3-dark-grey w3-hover-black"
           onclick="w3_close()" title="close menu"><i class="fa fa-remove fa-fw"></i>  Close Menu</a>
        <a href="/admin/main" class="w3-bar-item w3-button w3-padding"><i class="fa fa-bullseye fa-fw"></i>  관리자
            메인으로</a>
        <a href="/admin/notice" class="w3-bar-item w3-button w3-padding"><i class="fa fa-bullseye fa-fw"></i>  공지사항</a>
        <a href="/admin/qa" class="w3-bar-item w3-button w3-padding w3-blue"><i class="fa fa-bullseye fa-fw"></i>  질문사항</a>
        <a href="/admin/salesHistory" class="w3-bar-item w3-button w3-padding"><i class="fa fa-bullseye fa-fw"></i> 
            판매내역</a>
        <a href="/admin/report" class="w3-bar-item w3-button w3-padding"><i class="fa fa-bullseye fa-fw"></i>  신고내역</a>
        <a href="/admin/allmembers" class="w3-bar-item w3-button w3-padding"><i class="fa fa-bullseye fa-fw"></i>  회원현황</a><br><br>
    </div>
</nav>
<div class="w3-overlay w3-hide-large w3-animate-opacity" onclick="w3_close()" style="cursor:pointer" title="close side menu" id="myOverlay"></div>
<div class="w3-main" style="margin-left:300px; height: 100%;">
    <main class="has_bg_harp" style="height: 100%;display: flex;flex-direction: column; justify-content: space-between;">
        <div style="padding-bottom: 60px">
            <div tabindex="0" style="display: flex;justify-content: center;border-bottom: 1px solid #BDBDBD"><h1 style="font-family: 'Gowun Dodum', sans-serif;font-weight: bold;padding: 10px 0px;color:var(--color-chathams-blue);">질문사항</h1></div>
            <div class="manager_card" style="display: grid;grid-template-columns:repeat(4,1fr);grid-gap:1rem;width: 100%;justify-items: center;padding-bottom: 30px">
                <c:forEach var="QaVOlist" items="${QaVOlist}">
                    <div class="ui card" style="margin:0">
                        <div class="content">
                            <div class="header" style="text-align:center;font-family: 'Gowun Dodum';font-weight: bold;">${QaVOlist.category}</div>
                            <div style="font-size: 1.3em">작성자 : ${QaVOlist.nickname}</div>
                        </div>
                        <div class="content">
                            <p style="font-size: 1.3em">${QaVOlist.content}</p>
                        </div>
                        <div class="extra content">
                            <div class="ui large transparent left icon input" style="display: flex;padding-bottom: 5px">
                                <textarea type="text" maxlength="100" size="20" id="${QaVOlist.no_qa}" placeholder="답변하기..." style="font-size: 0.8em;font-weight:bold;font-family: 'Gowun Dodum';width:100%;height:60px;resize: none;border: none; "/>${QaVOlist.answer}
                                </textarea>
                            </div>
                            <button class="ui red basic button" onclick="deleteQA(${QaVOlist.no_qa})" style="font-weight:bold;font-family: 'Gowun Dodum';font-size: 0.8em;float:right;">삭제</button>
                            <button class="ui primary basic button" onclick="answerQA(${QaVOlist.no_qa})" style="font-weight:bold;font-family: 'Gowun Dodum';float:right;font-size: 0.8em" >답변하기</button>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </main>
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