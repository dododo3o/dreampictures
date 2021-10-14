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
    <script src="https://kit.fontawesome.com/b14e6f064f.js" crossorigin="anonymous"></script>
</head>
<body>
<% if (session.getAttribute("logStatus")=="Y"){ %>
<jsp:include page="../header_footer/header_login.jsp">
    <jsp:param name="user" value="${user}"/>
</jsp:include>
<% } %>
<% if (session.getAttribute("logStatus")==null){ %>
<jsp:include page="../header_footer/header_not_login.jsp"></jsp:include>
<% } %>
<main class="has_bg_harp">
    <div class="container">
        <div class="has_flex_space" style="grid-column: 1/6;">
            <div class="paintingTitle" ><c:out value="${paintingVO.pname}"/></div>
            <button class='button is_report'>신고</button>
        </div>
        <div style="grid-column: 1/8;">
            <img src="<c:out value="${paintingVO.paintingimg}"/>" style="width: 100%; height: 485px; object-fit: cover;">
        </div>
        <div style="display: flex;flex-direction: column;gap:20px; justify-content: space-between; grid-column: 8/13;height: 485px;">
            <div class="avatar">
                <img src="<c:out value="${paintingVO.avatarimg}"/>" class="avatar_img"/>
                <div class="avatar_name has_chathams-blue">
                    <c:out value="${paintingVO.nickname}"/>
                </div>
            </div>
            <div name="curve" style="width: 100%; height:38px; ">
                <svg width="446" height="42" viewBox="0 0 446 42" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <path d="M1 20.2442C162.794 -44.0447 285.508 87.5564 446 20.2442" stroke="#949494" stroke-width="3"/>
                </svg>
            </div>
            <div style="width: 100% ; height: 174px">
                <ul style="">
                    <li style="font-size: 20px;"><c:out value="${paintingVO.writedate}"/></li>
                    <li><c:out value="${paintingVO.width}"/>x<c:out value="${paintingVO.height}"/></li><br/>
                    <li>설명 : <c:out value="${paintingVO.exp}"/></li>
                </ul>
            </div>
            <div style="display: flex; justify-content: space-between;">
                <a href="/buy_payment"><button class='button is_large is_buy'>구매하기</button></a>
                <a href="/buy"><button class='button is_large' style="width: 160px; background-color:var(--color-aqua-island);">뒤로가기</button></a>
            </div>
        </div>
    </div>
</main>
<jsp:include page="../header_footer/footer.jsp"></jsp:include>
</body>
</html>