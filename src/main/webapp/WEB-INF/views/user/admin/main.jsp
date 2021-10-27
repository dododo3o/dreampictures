<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% String conPath = request.getContextPath(); %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>관리자 메인</title>
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
</head>
<body class="w3-light-grey" oncontextmenu="return false" onselectstart="return false">
<nav class="w3-sidebar w3-collapse w3-white w3-animate-left" style="z-index:3;width:300px;" id="mySidebar"><br>
    <div class="w3-container w3-row">
        <div class="w3-col s8 w3-bar" style="text-align: center;margin-left: 50px">
            <span>Welcome, <strong>Master</strong></span><br><br>
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
        <a href="/admin/main" class="w3-bar-item w3-button w3-padding w3-blue"><i class="fa fa-bullseye fa-fw"></i>  관리자
            메인으로</a>
        <a href="/admin/notice" class="w3-bar-item w3-button w3-padding"><i class="fa fa-bullseye fa-fw"></i>  공지사항</a>
        <a href="/admin/qa" class="w3-bar-item w3-button w3-padding"><i class="fa fa-bullseye fa-fw"></i>  질문사항</a>
        <a href="/admin/salesHistory" class="w3-bar-item w3-button w3-padding"><i class="fa fa-bullseye fa-fw"></i> 
            판매내역</a>
        <a href="/admin/report" class="w3-bar-item w3-button w3-padding"><i class="fa fa-bullseye fa-fw"></i>  신고내역</a>
        <a href="/admin/allmembers" class="w3-bar-item w3-button w3-padding"><i class="fa fa-bullseye fa-fw"></i>  회원현황</a><br><br>
    </div>
</nav>
<div class="w3-overlay w3-hide-large w3-animate-opacity" onclick="w3_close()" style="cursor:pointer"
     title="close side menu" id="myOverlay"></div>
<div class="w3-main" style="margin-left:300px;margin-top:43px;">
    <div class="w3-row-padding w3-margin-bottom">
        <div class="w3-quarter">
            <a href="/admin/notice">
                <div class="w3-container w3-red w3-padding-16">
                    <div class="w3-left"><i class="fa fa-comment w3-xxxlarge"></i></div>
                    <div class="w3-right">
                        <h3><c:out value="${adminVO.noticeNum}"/></h3>
                    </div>
                    <div class="w3-clear"></div>
                    <h4 style="font-family: 'Gowun Dodum', sans-serif; font-size: var(--font-size-base)">공지사항</h4>
                </div>
            </a>
        </div>
        <div class="w3-quarter">
            <a href="/admin/qa">
                <div class="w3-container w3-blue w3-padding-16">
                    <div class="w3-left"><i class="fa fa-eye w3-xxxlarge"></i></div>
                    <div class="w3-right">
                        <h3><c:out value="${adminVO.questionNum}"/></h3>
                    </div>
                    <div class="w3-clear"></div>
                    <h4 style="font-family: 'Gowun Dodum', sans-serif;font-size: var(--font-size-base)"/>질문사항</h4>
                </div>
            </a>
        </div>
        <div class="w3-quarter">
            <a href="/admin/salesHistory">
                <div class="w3-container w3-teal w3-padding-16">
                    <div class="w3-left"><i class="fa fa-share-alt w3-xxxlarge"></i></div>
                    <div class="w3-right">
                        <h3><c:out value="${adminVO.registerNum}"/></h3>
                    </div>
                    <div class="w3-clear"></div>
                    <h4 style="font-family: 'Gowun Dodum', sans-serif;font-size: var(--font-size-base)">판매내역</h4>
                </div>
            </a>
        </div>
        <div class="w3-quarter">
            <a href="/admin/allmembers">
                <div class="w3-container w3-orange w3-text-white w3-padding-16">
                    <div class="w3-left"><i class="fa fa-users w3-xxxlarge"></i></div>
                    <div class="w3-right">
                        <h3><c:out value="${adminVO.memberNum}"/></h3>
                    </div>
                    <div class="w3-clear"></div>
                    <h4 style="font-family: 'Gowun Dodum', sans-serif; font-size: var(--font-size-base)">회원현황</h4>
                </div>
            </a>
        </div>
    </div>
    <hr>
    <div class="w3-container">
        <h5 style="font-family: 'Gowun Dodum', sans-serif;font-weight: bold;">주간 통계</h5>
        <p>1주일간 신규가입자수</p>
        <div class="w3-grey">
            <div class="w3-container w3-center w3-padding w3-green"
                 style="width:<c:out value="${adminVO.newMemberPercent}"/>%">+<c:out
                    value="${adminVO.newMemberPercent}"/></div>
        </div>
        <p>1주일간 판매량</p>
        <div class="w3-grey">
            <div class="w3-container w3-center w3-padding w3-orange"
                 style="width:<c:out value="${adminVO.oneWeekSaleVolumePercent}"/>%"><c:out
                    value="${adminVO.oneWeekSaleVolumePercent}"/></div>
        </div>
        <p>1주일간 작품 등록수</p>
        <div class="w3-grey">
            <div class="w3-container w3-center w3-padding w3-red"
                 style="width:<c:out value="${adminVO.oneWeekRegisterPercent}"/>%"><c:out
                    value="${adminVO.oneWeekRegisterPercent}"/></div>
        </div>
    </div>
    <hr>
    <div class="w3-container">
        <h5 style="font-family: 'Gowun Dodum', sans-serif;font-weight: bold;">테마별 등록량</h5>
        <table class="w3-table w3-striped w3-bordered w3-border w3-hoverable w3-white">
            <tr>
                <td>팝아트</td>
                <td><c:out value="${adminVO.popart}"/>개</td>
            </tr>
            <tr>
                <td>추상화</td>
                <td><c:out value="${adminVO.abstracts}"/>개</td>
            </tr>
            <tr>
                <td>동물</td>
                <td><c:out value="${adminVO.animal}"/>개</td>
            </tr>
            <tr>
                <td>풍경</td>
                <td><c:out value="${adminVO.scenery}"/>개</td>
            </tr>
            <tr>
                <td>인물</td>
                <td><c:out value="${adminVO.character}"/>개</td>
            </tr>
            <tr>
                <td>정물</td>
                <td><c:out value="${adminVO.still}"/>개</td>
            </tr>
            <tr>
                <td>오브제</td>
                <td><c:out value="${adminVO.objet}"/>개</td>
            </tr>
        </table>
        <br>
    </div>
    <hr>
    <div class="w3-container">
        <h5 style="font-family: 'Gowun Dodum', sans-serif;font-weight: bold;">스타일별 판매량</h5>
        <table class="w3-table w3-striped w3-bordered w3-border w3-hoverable w3-white">
            <tr>
                <td>수채화</td>
                <td><c:out value="${adminVO.water}"/>개</td>
            </tr>
            <tr>
                <td>유화</td>
                <td><c:out value="${adminVO.oils}"/>개</td>
            </tr>
            <tr>
                <td>파스텔화</td>
                <td><c:out value="${adminVO.pastel}"/>개</td>
            </tr>
            <tr>
                <td>아크릴화</td>
                <td><c:out value="${adminVO.acrylic}"/>개</td>
            </tr>
            <tr>
                <td>펜화</td>
                <td><c:out value="${adminVO.pen}"/>개</td>
            </tr>
            <tr>
                <td>연필화</td>
                <td><c:out value="${adminVO.pencil}"/>개</td>
            </tr>
            <tr>
                <td>크레용화</td>
                <td><c:out value="${adminVO.crayon}"/>개</td>
            </tr>
            <tr>
                <td>과슈화</td>
                <td><c:out value="${adminVO.gouache}"/>개</td>
            </tr>
        </table>
        <br>
    </div>
    <hr>
    <div class="w3-container">
        <h5 style="font-family: 'Gowun Dodum', sans-serif;font-weight: bold;">최근 가입자</h5>
        <ul class="w3-ul w3-card-4 w3-white">
            <li class="w3-padding-16">
                <img class="ui avatar image" src="<c:out value="${adminVO.person1img}"/>">
                <span><c:out value="${adminVO.person1}"/></span>
            </li>
            <li class="w3-padding-16">
                <img class="ui avatar image" src="<c:out value="${adminVO.person2img}"/>">
                <span><c:out value="${adminVO.person2}"/></span><br>
            </li>
            <li class="w3-padding-16">
                <img class="ui avatar image" src="<c:out value="${adminVO.person3img}"/>">
                <span><c:out value="${adminVO.person3}"/></span><br>
            </li>
        </ul>
    </div>
    <hr>
    <br>
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