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
    <link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Rampart+One&display=swap" rel="stylesheet">
    <script src="https://kit.fontawesome.com/b14e6f064f.js" crossorigin="anonymous"></script>
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
    <div class="container">
        <div style="display:flex;grid-column: 1/13; background-color: #F3F7F7;height: 100%;">
            <div class="has_flex_column" style="width: 40%;justify-content: center; gap:50px; ">
                <a class="ui red ribbon label">아티스트</a>
                <div class="has_flex_column ">
                    <div class="has_between" style="display: flex; height: 35px; justify-content: space-around;">
                        <h2 class="ui header">
                            <img src="${paintingVO.avatarimg}" style="border-radius: 50%; width: 3em;height: 3em;object-fit: cover;"><c:out value="${paintingVO.nickname}"/>
                        </h2>
                        <div class="ui vertical red animated button" tabindex="0">
                            <div class="hidden content" style="user-select: auto;">신고하기</div>
                            <div class="visible content" style="user-select: auto;"><i class="exclamation circle icon" style="user-select: auto;"></i></div>
                        </div>
                    </div>
                </div>
                <a class="ui blue ribbon label">그림 제목</a>
                <span style="font-size: 40px; margin: 0 auto; font-family: 'Black Han Sans', sans-serif;;"><c:out value="${paintingVO.pname}"/></span>
                <a class="ui teal ribbon label">그림 설명</a>
                <div style="padding-left: 35px;padding-right: 35px; font-size: 20px;line-height:30px;"><c:out value="${paintingVO.exp}"/></div>
                <div style="padding-left: 20px;">등록일 : <c:out value="${paintingVO.writedate}"/></div>
                <div class="has_evenly" style="display: flex;">
                    <div class="ui animated button" tabindex="0" id="prev_btn" style="width: 200px;">
                        <div class="hidden content" style="user-select: auto;">prev</div>
                        <div class=" visible content" style="user-select: auto;">
                            <i class="left arrow icon" style="user-select: auto;"></i>
                        </div>
                    </div>
                    <a href="/buy_payment/<c:out value="${paintingVO.no_painting}"/>">
                        <div class="ui vertical animated button" tabindex="0" id="shop_btn" style="width: 200px;">
                        <div class="hidden content" style="user-select: auto;">Shop</div>
                        <div class="visible content" style="user-select: auto;">
                            <i class="shop icon" style="user-select: auto;"></i>
                        </div>
                        </div>
                    </a>
                </div>
            </div>
            <div class="has_flex_center" style="width: 60%;">
                <div style="width: 80%; height: 80%;">
                    <img src="<c:out value="${paintingVO.paintingimg}"/>" style="object-fit: cover; width: 100%; height: 100%;">
                </div>
            </div>
        </div>
    </div>
</main>
<jsp:include page="../header_footer/footer.jsp"></jsp:include>
</body>
</html>