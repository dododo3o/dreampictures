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
<% if (session.getAttribute("logStatus") == "Y") { %>
<jsp:include page="../header_footer/header_login.jsp">
    <jsp:param name="user" value="${user}"/>
</jsp:include>
<% } %>
<% if (session.getAttribute("logStatus") == null) { %>
<jsp:include page="../header_footer/header_not_login.jsp"></jsp:include>
<% } %>
<main class="has_bg_harp">
    <div class="container" style="padding-bottom: 20px">
        <div style="grid-column:1/3; display:flex;flex-direction: column; gap:40px; padding-top: 20px; background-color: #a2b0b36e">
            <div style="display: flex;justify-content: space-evenly; ">
                <span style=" color: var(--color-river-bed)"><i class="fas fa-bell fa-lg"></i></span>
                <div style=" display:flex;align-items: center; margin-left: 10px; color: var(--color-river-bed)">공지사항
                </div>
            </div>
            <div style="display: flex;justify-content: space-evenly;">
                <span style="color: var(--color-river-bed)"><i class="fas fa-question fa-lg"></i></span>
                <div style=" display:flex;align-items: center; margin-left: 15px; color: var(--color-river-bed)">질문사항
                </div>
            </div>
        </div>
        <div class="manager_card"
             style="grid-column: 3/12; display: grid;grid-template-columns:repeat(3,1fr);grid-gap:1.3rem; height: 100%">
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
        </div>
    </div>
</main>
<jsp:include page="../header_footer/footer.jsp"></jsp:include>
</body>
</html>