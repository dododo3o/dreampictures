<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% String conPath = request.getContextPath(); %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>판매내역</title>
    <link rel="stylesheet" href="/resources/css/dreampicturesytle.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">
    <link rel="stylesheet" type="text/css"
          href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.2.13/semantic.min.css">
    <style>html, body, h1, h2, h3, h4, h5 {
        font-family: "Raleway", sans-serif
    }</style>
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://kit.fontawesome.com/b14e6f064f.js" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"
            integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ=="
            crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"
            integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8=" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.2.13/semantic.js"></script>
    <script type="text/javascript">
        function showModal() {
            $('.ui.modal').modal('show')
        }

    </script>
</head>
<body class="w3-light-grey" oncontextmenu="return false" onselectstart="return false">
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
    <div class="w3-container">
    </div>
    <div class="w3-bar-block">
        <a href="#" class="w3-bar-item w3-button w3-padding-16 w3-hide-large w3-dark-grey w3-hover-black"
           onclick="w3_close()" title="close menu"><i class="fa fa-remove fa-fw"></i>  Close Menu</a>
        <a href="/admin/main" class="w3-bar-item w3-button w3-padding"><i class="fa fa-bullseye fa-fw"></i>  관리자
            메인으로</a>
        <a href="/admin/notice" class="w3-bar-item w3-button w3-padding"><i class="fa fa-bullseye fa-fw"></i>  공지사항</a>
        <a href="/admin/qa" class="w3-bar-item w3-button w3-padding"><i class="fa fa-bullseye fa-fw"></i>  질문사항</a>
        <a href="/admin/salesHistory" class="w3-bar-item w3-button w3-padding w3-blue"><i
                class="fa fa-bullseye fa-fw"></i> 
            판매내역</a>
        <a href="/admin/report" class="w3-bar-item w3-button w3-padding"><i class="fa fa-bullseye fa-fw"></i>  신고내역</a>
        <a href="/admin/allmembers" class="w3-bar-item w3-button w3-padding"><i class="fa fa-bullseye fa-fw"></i>  회원현황</a><br><br>
    </div>
</nav>
<div class="w3-overlay w3-hide-large w3-animate-opacity" onclick="w3_close()" style="cursor:pointer;"
     title="close side menu" id="myOverlay"></div>
<div class="w3-main" style="margin-left:300px; height: 100%;">
    <main class="has_bg_harp" style="height:auto;flex-direction: column;justify-content: space-between;display: flex;">
        <div style="height:100%;border-bottom: 1px solid #BDBDBD;">
            <div style="border-bottom: 1px solid #BDBDBD; padding: 10px 0px;flex-direction:column;display:flex;gap:20px;justify-content:center;align-items: center;">
                <div><h1 style="font-family: 'Gowun Dodum', sans-serif;font-weight: bold;color:var(--color-chathams-blue);">
                    판매내역</h1></div>
                <form action="">
                    <div style="display: flex;align-items: center;">
                        <div class="ui form">
                            <div class="field" style="width:300px;margin-right: 40px;">
                                <select id="deadline">
                                    <option value="0">기간설정</option>
                                    <option value="1">1주</option>
                                    <option value="2">1개월</option>
                                    <option value="3">3개월</option>
                                    <option value="4">6개월</option>
                                    <option value="5">1년</option>
                                </select>
                            </div>
                        </div>
                        <button class="ui primary basic button" onclick="find_deadline()"
                                style="font-family:'Gowun Dodum', sans-serif;font-weight: bold;width:120px;height:40px;font-size:15px">
                            검색
                        </button>
                    </div>
                </form>
            </div>
            <div id="container"
                 style="padding:20px 0 60px 0;display: grid;grid-template-columns: repeat(4,1fr);grid-gap:1rem;justify-content: space-around;">
                <c:forEach var="cardVOlist" items="${cardVOlist}">
                    <div class="ui card" style="height: 100%; margin: 0 auto;">
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
                    </div>
                </c:forEach>
            </div>
        </div>
    </main>
</div>
<script>
    find_deadline = function () {
        $(() => {
            let deadline = document.getElementById("deadline").value;
            switch (deadline) {
                case '0':
                    deadline = "20000101";
                    break;
                case '1':
                    deadline = "20211022";
                    break;
                case '2':
                    deadline = "20210922";
                    break;
                case '3':
                    deadline = "20210722";
                    break;
                case '4':
                    deadline = "20210422";
                    break;
                case '5':
                    deadline = "20201022";
                    break;
            }
            $.ajax({
                url: "/ajax_picture_finder_soldout",
                data: "deadline=" + deadline,
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

    function buypainting(num) {
        location.href = "http://localhost:8080/buy_picture/" + num;
    }
</script>
</body>
</html>