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
    <link rel="stylesheet" type="text/css"
          href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.2.13/semantic.min.css">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <style>
        html,body,h1,h2,h3,h4,h5 {font-family: "Raleway", sans-serif}
    </style><meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <style>
        html,body,h1,h2,h3,h4,h5 {font-family: "Raleway", sans-serif}
    </style>
    <script src="https://kit.fontawesome.com/b14e6f064f.js" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"
            integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ=="
            crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"
            integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8=" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.2.13/semantic.js"></script>
    <script>
        //a태그 마우스오버1
        function mouseOver() {
            document.getElementById('noticeLink').style.backgroundColor = "gray";
            document.getElementById('menuFont').style.color = "white";
            document.getElementById('menuIcon').style.color = "white";
        }

        //a태그 마우스오버
        function mouseOver2() {
            document.getElementById('noticeLink2').style.backgroundColor = "gray";
            document.getElementById('menuFont2').style.color = "white";
            document.getElementById('menuIcon2').style.color = "white";
        }

        //a태그 마우스아웃
        function mouseOut() {
            document.getElementById('noticeLink').style.backgroundColor = "rgba(255,255,255,0)";
            document.getElementById('menuFont').style.color = "var(--color-river-bed)";
            document.getElementById('menuIcon').style.color = "var(--color-river-bed)";
        }

        //a태그 마우스아웃2
        function mouseOut2() {
            document.getElementById('noticeLink2').style.backgroundColor = "rgba(255,255,255,0)";
            document.getElementById('menuFont2').style.color = "var(--color-river-bed)";
            document.getElementById('menuIcon2').style.color = "var(--color-river-bed)";
        }

        function modal() {
            document.getElementById("modaldiv")
        }
    </script>
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
<body class="w3-light-grey">

<!-- Sidebar/menu -->
<nav class="w3-sidebar w3-collapse w3-white w3-animate-left" style="z-index:3;width:300px;" id="mySidebar"><br>
    <div class="w3-container w3-row">
        <div class="w3-col s8 w3-bar" style="text-align: center;margin-left: 50px">
            <span>Welcome, <strong>Master</strong></span><br>
            <form action="<%=conPath%>/admin/login" method="post">
                <button class="ui secondary button" style="height:35px;font-family: 'BMHANNAPro';">
                    로그아웃
                </button>
            </form>
        </div>
    </div>
    <hr>
    <div class="w3-container">
    </div>
    <div class="w3-bar-block">
        <a href="#" class="w3-bar-item w3-button w3-padding-16 w3-hide-large w3-dark-grey w3-hover-black" onclick="w3_close()" title="close menu"><i class="fa fa-remove fa-fw"></i>  Close Menu</a>
        <a href="/admin/main" class="w3-bar-item w3-button w3-padding"><i class="fa fa-bullseye fa-fw"></i>  관리자 메인으로</a>
        <a href="/admin/notice" class="w3-bar-item w3-button w3-padding"><i class="fa fa-bullseye fa-fw"></i>  공지사항</a>
        <a href="/admin/qa" class="w3-bar-item w3-button w3-padding"><i class="fa fa-bullseye fa-fw"></i>  질문사항</a>
        <a href="/admin/salesHistory" class="w3-bar-item w3-button w3-padding"><i class="fa fa-bullseye fa-fw"></i>  판매현황</a>
        <a href="/admin/report" class="w3-bar-item w3-button w3-padding"><i class="fa fa-bullseye fa-fw"></i>  신고내역</a>
        <a href="/admin/blacklist" class="w3-bar-item w3-button w3-padding w3-blue"><i class="fa fa-bullseye fa-fw"></i>  블랙리스트</a>
        <a href="/admin/allmembers" class="w3-bar-item w3-button w3-padding"><i class="fa fa-bullseye fa-fw"></i>  회원현황</a><br><br>
    </div>
</nav>


<!-- Overlay effect when opening sidebar on small screens -->
<div class="w3-overlay w3-hide-large w3-animate-opacity" onclick="w3_close()" style="cursor:pointer" title="close side menu" id="myOverlay"></div>

<!-- !PAGE CONTENT! -->
<div class="w3-main" style="margin-left:300px;">

    <!-- Header -->


    <div class="has_bg_harp">
        <div class="container">
            <div class="has_chathams-blue" style="font-size:var(--font-size-xlll);grid-column:5/11;margin-top: 20px;">회원 블랙리스트</div>
            <div style="grid-column:3/11;display: flex;gap:20px; justify-content: center; margin-top:20px;margin-bottom: 70px;">
                <div>
                    <select class="has_width_half" style="font-family: 'BMHANNAPro';">
                        <option>검색조건</option>
                        <option value="아이디">아이디</option>
                        <option value="닉네임">닉네임</option>
                    </select>
                </div>
                <form action="" >
                    <div  style="display: flex;" class="has_flex_space">
                        <input type="text" class="has_width_middle_half"
                               placeholder="검색어를 입력해주세요." style="font-family: 'BMHANNAPro';margin-right: 20px"/>
                        <button class='button is_notification' style="font-family: 'BMHANNAPro';">검색</button>
                    </div>
                </form>
            </div>
        </div>
        <div class="container" style="display: grid;grid-template-columns:repeat(4,1fr);grid-gap:1rem;">

            <div class="ui card">
                <div class="image">
                    <img src="latte.jpgs">
                </div>
                <div class="content">
                    <a class="header"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">크리스티</font></font></a>
                    <div class="meta">
                        <span class="date"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">2013년에 합류</font></font></span>
                    </div>
                    <div class="description"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">
                        Kristy는 뉴욕에 거주하는 아트 디렉터입니다.
                    </font></font></div>
                </div>
                <div class="extra content">
                    <a>
                        <i class="user icon"></i><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">
                        22 친구
                    </font></font></a>
                </div>
            </div>
            <div class="ui card">
                <div class="image">
                    <img src="/images/avatar2/large/kristy.png">
                </div>
                <div class="content">
                    <a class="header"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">크리스티</font></font></a>
                    <div class="meta">
                        <span class="date"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">2013년에 합류</font></font></span>
                    </div>
                    <div class="description"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">
                        Kristy는 뉴욕에 거주하는 아트 디렉터입니다.
                    </font></font></div>
                </div>
                <div class="extra content">
                    <a>
                        <i class="user icon"></i><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">
                        22 친구
                    </font></font></a>
                </div>
            </div>
            <div class="ui card">
                <div class="image">
                    <img src="/images/avatar2/large/kristy.png">
                </div>
                <div class="content">
                    <a class="header"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">크리스티</font></font></a>
                    <div class="meta">
                        <span class="date"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">2013년에 합류</font></font></span>
                    </div>
                    <div class="description"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">
                        Kristy는 뉴욕에 거주하는 아트 디렉터입니다.
                    </font></font></div>
                </div>
                <div class="extra content">
                    <a>
                        <i class="user icon"></i><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">
                        22 친구
                    </font></font></a>
                </div>
            </div>
            <div class="ui card">
                <div class="image">
                    <img src="/images/avatar2/large/kristy.png">
                </div>
                <div class="content">
                    <a class="header"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">크리스티</font></font></a>
                    <div class="meta">
                        <span class="date"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">2013년에 합류</font></font></span>
                    </div>
                    <div class="description"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">
                        Kristy는 뉴욕에 거주하는 아트 디렉터입니다.
                    </font></font></div>
                </div>
                <div class="extra content">
                    <a>
                        <i class="user icon"></i><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">
                        22 친구
                    </font></font></a>
                </div>
            </div>
        </div>
        <div class="container" style="display: flex;justify-content: center;margin-top:30px;padding-bottom: 30px;
">
            <div>
                <button class='button is_pagination'>
                    <i class="fas fa-arrow-left"></i>
                </button>
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
                <button class='button is_pagination'>
                    <i class="fas fa-arrow-right"></i>
                </button>
                <br>
            </div>
        </div>
    </div>
    <footer class="has_bg_river-bed">
        <div class="container">
            <div class="is_logo">
                <a href="">
                    <div class="is_logos"><i class="fas fa-palette fg-lg"></i>
                        <div>
                            <div><span>그</span><span class="has_albescent-white">림</span></div>
                            <div><span class="has_albescent-white">드</span><span>림</span></div>
                        </div>
                    </div>
                </a>
            </div>
            <div class="has_flex_space" style="grid-column: 3/5">
                <a href="#" class="has_aqua-island">회사 소개</a>
                <a href="#" class="has_albescent-white">팀원 소개</a>
            </div>
            <div class="has_flex_space" style="grid-column: 10/12">
                <a href="#" class="has_white has_font-xl"><i class="fab fa-youtube"></i></a>
                <a href="#" class="has_white has_font-xl"><i class="fab fa-facebook-square"></i></a>
                <a href="#" class="has_white has_font-xl"><i class="fab fa-instagram-square"></i></a>
            </div>
        </div>

        <!-- End page content -->

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