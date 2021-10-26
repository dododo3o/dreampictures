<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% String conPath = request.getContextPath(); %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>블랙리스트</title>
    <link rel="stylesheet" href="/resources/css/dreampicturesytle.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">
    <link rel="stylesheet" type="text/css"
          href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.2.13/semantic.min.css">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <style>
        html, body, h1, h2, h3, h4, h5 {
            font-family: "Raleway", sans-serif
        }
    </style>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <style>
        html, body, h1, h2, h3, h4, h5 {
            font-family: "Raleway", sans-serif
        }
    </style>
    <script src="https://kit.fontawesome.com/b14e6f064f.js" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"
            integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ=="
            crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"
            integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8=" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.2.13/semantic.js"></script>
    <script type="text/javascript">
        showModal = function () {
            $('.ui.modal').modal('show');
        };
        requestQA = function () {
            $(() => {
                let question = document.getElementById("question").value;
                let status = 0; //0~4 까지 질문 종류
                $.ajax({
                    url: "/ajax_request_QA",
                    data: "question=" + question + "&status=" + status,
                    success: function (result) {
                        document.location.href = "/notice";
                    }
                });
            });
        };
    </script>

</head>
<body class="w3-light-grey" oncontextmenu="return false" onselectstart="return false">
<nav class="w3-sidebar w3-collapse w3-white w3-animate-left" style="z-index:3;width:300px;" id="mySidebar"><br>
    <div class="w3-container w3-row">
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
        <a href="/admin/qa" class="w3-bar-item w3-button w3-padding"><i class="fa fa-bullseye fa-fw"></i>  질문사항</a>
        <a href="/admin/salesHistory" class="w3-bar-item w3-button w3-padding"><i class="fa fa-bullseye fa-fw"></i> 
            판매내역</a>
        <a href="/admin/report" class="w3-bar-item w3-button w3-padding"><i class="fa fa-bullseye fa-fw"></i>  신고내역</a>
        <a href="/admin/blacklist" class="w3-bar-item w3-button w3-padding w3-blue"><i class="fa fa-bullseye fa-fw"></i> 
            블랙리스트</a>
        <a href="/admin/allmembers" class="w3-bar-item w3-button w3-padding"><i class="fa fa-bullseye fa-fw"></i>  회원현황</a><br><br>
    </div>
</nav>
<div class="w3-overlay w3-hide-large w3-animate-opacity" onclick="w3_close()" style="cursor:pointer;"
     title="close side menu" id="myOverlay"></div>
<div class="w3-main" style="margin-left:300px;height: 100%;">
    <div class="has_bg_harp" style="height:100%;display: flex;flex-direction: column;justify-content: space-between;">

        <div>
            <div style="padding: 10px 0px;flex-direction:column;display:flex;gap:20px;justify-content:center;align-items: center;border-bottom: 1px solid #BDBDBD;">
                <div><h1 style="font-family: 'Gowun Dodum', sans-serif;font-weight: bold;color:var(--color-chathams-blue)">블랙리스트 회원목록</h1></div>
                <form action="">
                    <div style="display: flex;align-items: stretch" class="has_flex_space">
                        <div class="ui input focus" style="margin-right: 20px">
                            <input type="text" style="width:300px;font-family: 'Gowun Dodum', sans-serif;" placeholder=" 닉네임을 입력해주세요.">
                        </div>
                        <button class="ui primary basic button"
                                style="font-family: 'Gowun Dodum', sans-serif;font-weight: bold;width:120px;height:50px;font-size:20px ">검색
                        </button>
                    </div>
                </form>
            </div>
            <div style="height: auto;display: grid;grid-template-columns:repeat(4,1fr);grid-gap:1rem;align-items: baseline;justify-items: center;padding:0 0 20px 0;">
             <c:forEach var="cardVOlist" items="${cardVOlist}">
                <div class="ui card">
                    <div class="image">
                        <img src="${cardVOlist.avatarimg}">
                    </div>
                    <div class="content">
                        <a class="header"  style="font-family: 'Gowun Dodum', sans-serif;">${cardVOlist.nickname}</a>
                        <div class="meta"><span class="date">${cardVOlist.date}</span></div>
                        <div class="description">${cardVOlist.email}</div>
                    </div>
                    <div class="extra content">
                        <a><i class="user icon"></i>${cardVOlist.reported}</a>
                    </div>
                </div>
              </c:forEach>

                <%--            </c:forEach>--%>

                <div class="ui card">
                    <div class="image">
                        <img src="${cardVOlist.avatarimg}">
                    </div>
                    <div class="content">
                        <a class="header"  style="font-family: 'Gowun Dodum', sans-serif;">${cardVOlist.nickname}</a>
                        <div class="meta"><span class="date">${cardVOlist.date}</span></div>
                        <div class="description">${cardVOlist.email}</div>
                    </div>
                    <div class="extra content">
                        <a><i class="user icon"></i>${cardVOlist.reported}</a>
                    </div>
                </div>

                <div class="ui card">
                    <div class="image">
                        <img src="${cardVOlist.avatarimg}">
                    </div>
                    <div class="content">
                        <a class="header"  style="font-family: 'Gowun Dodum', sans-serif;">${cardVOlist.nickname}</a>
                        <div class="meta"><span class="date">${cardVOlist.date}</span></div>
                        <div class="description">${cardVOlist.email}</div>
                    </div>
                    <div class="extra content">
                        <a><i class="user icon"></i>${cardVOlist.reported}</a>
                    </div>
                </div>

                <div class="ui card">
                    <div class="image">
                        <img src="${cardVOlist.avatarimg}">
                    </div>
                    <div class="content">
                        <a class="header"  style="font-family: 'Gowun Dodum', sans-serif;">${cardVOlist.nickname}</a>
                        <div class="meta"><span class="date">${cardVOlist.date}</span></div>
                        <div class="description">${cardVOlist.email}</div>
                    </div>
                    <div class="extra content">
                        <a><i class="user icon"></i>${cardVOlist.reported}</a>
                    </div>
                </div>
            </div>
        </div>
        <div style="display: flex;justify-content: center;padding-top:30px;padding-bottom: 30px;border-top: 1px solid #BDBDBD;">
            <div class="ui animated button" tabindex="0"
                 style="color:var(--color-white);background-color: var(--color-chathams-blue);">
                <div class="visible content">Perv</div>
                <div class="hidden content">
                    <i class="left arrow icon"></i>
                </div>
            </div>
            <c:forEach var="i" begin="1" end="${pageNum}">
                <div class="ui animated button" tabindex="0"
                     style="color:var(--color-white);background-color: var(--color-chathams-blue);">
                    <div class="visible content">${i}</div>
                    <div class="hidden content">${i}</div>
                </div>
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
<script>
    // Get the Sidebar
    var mySidebar = document.getElementById("mySidebar");

    // Get the DIV with overlay effect
    var overlayBg = document.getElementById("myOverlay");

    // Toggle between showing and hiding the sidebar, and add overlay effect
    function w3_open() {
        if (mySidebar.style.display === 'block') {
            mySidebar.style.display = 'none';
            overlayBg.style.display = "none";
        } else {
            mySidebar.style.display = 'block';
            overlayBg.style.display = "block";
        }
    }

    // Close the sidebar with the close button
    function w3_close() {
        mySidebar.style.display = "none";
        overlayBg.style.display = "none";
    }
</script>
</body>
</html>