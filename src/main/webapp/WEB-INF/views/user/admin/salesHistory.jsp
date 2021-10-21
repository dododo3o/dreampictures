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
        <a href="/admin/salesHistory" class="w3-bar-item w3-button w3-padding w3-blue"><i class="fa fa-bullseye fa-fw"></i>  판매현황</a>
        <a href="/admin/report" class="w3-bar-item w3-button w3-padding"><i class="fa fa-bullseye fa-fw"></i>  신고내역</a>
        <a href="/admin/blacklist" class="w3-bar-item w3-button w3-padding"><i class="fa fa-bullseye fa-fw"></i>  블랙리스트</a>
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
            <div style="grid-column:4/11;display: flex;flex-direction: column; gap:20px; justify-content: center;margin-top: 22px;">
                <h1 class="ui header" style="margin-left:180px;margin-bottom:40px;font-family: 'BMHANNAPro';color:var(--color-chathams-blue)">기간별 판매내역</h1>
                <form action="">
                    <div style="display: flex;margin-bottom: 50px;align-items: center;">
                        <div class="ui form">
                            <div class="field" style="width:300px;margin-right: 40px;">
                                <select>
                                    <option value="0">기간설정</option>
                                    <option value="1">1주</option>
                                    <option value="2">1개월</option>
                                    <option value="3">3개월</option>
                                    <option value="4">6개월</option>
                                    <option value="5">1년</option>
                                </select>
                            </div>
                        </div>
                        <button class='button is_notification' onclick="searchOk">검색</button>
                    </div>
                </form>

                <div class="container" style="display: grid;grid-template-columns:repeat(4,1fr);grid-gap:1rem;">
                    <c:forEach var="cardVOlist" items="${cardVOlist}">
                        <div class="ui card" style="height: 100%; margin: 0 auto;">
                            <div class="content"
                                 style=" display: flex; flex-direction: row; justify-content: space-evenly; align-items: center;">
                                <img src="${cardVOlist.avatarimg}"
                                     style="border-radius: 50%; width: 3em;height: 3em;object-fit: cover;">
                                <span style="font-size: 2em;">${cardVOlist.nickname}</span>
                            </div>
                            <div class="image">
                                <img src="${cardVOlist.paintingmimg}" onclick="buypainting(${cardVOlist.no_painting});"
                                     style="object-fit: cover; height: 250px">
                            </div>
                            <div class="content" style="display: flex;justify-content: center;">
                                <span style="font-size: 1.5em">${cardVOlist.pname}</span><span></span>
                            </div>
                            <div class="extra content">
                                <div class="ui large transparent left icon input" style="display: flex;">
                                    <i class="pencil alternate icon"></i>
                                    <input type="text" maxlength="20" size="20" id="${cardVOlist.no_painting}"
                                           placeholder="글자수 20글자 내 작성"
                                           style="font-size: 0.8em"/>
                                </div>
                                <button class="ui blue icon button" onclick="addComment(${cardVOlist.no_painting})"
                                        style="float: right; font-size: 0.8em;">Add
                                </button>
                                <button class="ui blue icon button" onclick="showCommentModal()"
                                        style="float: right; font-size: 0.8em;">zxc
                                </button>
                            </div>
                            <div class="ui bottom attached button collapsible">
                                <i class="add icon"></i>
                                <span><i class="comment icon"></i>${cardVOlist.commentNumber}</span>
                            </div>
                            <div class="comments_css" style="background-color: white">
                                <div class="ui comments">
                                    <c:forEach var="commentVOList" items="${cardVOlist.commentVOList}">
                                        <h5 class="ui header" style="user-select: auto; margin: 10px;">
                                            <div style="display: flex;align-items: center;justify-content: space-between;">
                                                <img src="${commentVOList.avatarimg}" style="border-radius: 50%; height:40px; width:40px;object-fit: cover;">
                                                <span class="author" style="margin-left: 10px; font-size: 1.5em">${commentVOList.author}</span>
                                                <button class="ui red icon button" onclick="" style="font-size: 0.5em">X</button>
                                            </div>
                                            <div class="text" style="margin: 10px;">${commentVOList.comments}</div>
                                        </h5>
                                    </c:forEach>
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
            <div style="margin-right: 40px;">
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