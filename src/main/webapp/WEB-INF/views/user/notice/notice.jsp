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
    <div class="container">
        <div style="grid-column:1/3; display:flex;flex-direction: column; gap:20px; margin-top: 20px;">
            <div style="display: flex; ">
                <span style=" color: var(--color-river-bed)"><i class="fas fa-bell fa-lg"></i></span>
                <div style=" display:flex;align-items: center; margin-left: 10px; color: var(--color-river-bed)">공지사항
                </div>
            </div>
            <div style="display: flex;">
                <span style="color: var(--color-river-bed)"><i class="fas fa-question fa-lg"></i></span>
                <div style=" display:flex;align-items: center; margin-left: 15px; color: var(--color-river-bed)">질문사항
                </div>
            </div>
        </div>
        <div class="manager_card" style="grid-column: 3/6; ">
            <div class="card has_flex_space_bt_cl has_shadow" style="grid-column: 5/8">
                <div class="card_img"></div>
                <div class="card_history">
                    <div class="card_img_avatar"></div>
                    <div>
                        <div>Manager</div>
                        <div>bitcamp University</div>
                    </div>
                </div>
                <span class="has_notice">긴급공지사항</span>
            </div>
            <div class="card has_flex_space_bt_cl has_shadow" style="grid-column: 5/8">
                <div class="card_img"></div>
                <div class="card_history">
                    <div class="card_img_avatar"></div>
                    <div>
                        <div>Manager</div>
                        <div>bitcamp University</div>
                    </div>
                </div>
                <span class="has_notice">긴급공지사항</span>
            </div>
        </div>
        <div class="manager_card" style="grid-column: 6/9; ">
            <div class="card has_flex_space_bt_cl has_shadow" style="grid-column: 5/8">
                <div class="card_img"></div>
                <div class="card_history">
                    <div class="card_img_avatar"></div>
                    <div>
                        <div>Manager</div>
                        <div>bitcamp University</div>
                    </div>
                </div>
                <span class="has_notice">긴급공지사항</span>
            </div>
            <div class="card has_flex_space_bt_cl has_shadow" style="grid-column: 5/8">
                <div class="card_img"></div>
                <div class="card_history">
                    <div class="card_img_avatar"></div>
                    <div>
                        <div>Manager</div>
                        <div>bitcamp University</div>
                    </div>
                </div>
                <span class="has_notice">긴급공지사항</span>
            </div>
        </div>
        <div class="manager_card" style="grid-column: 9/12; ">
            <div class="card has_flex_space_bt_cl has_shadow" style="grid-column: 5/8">
                <div class="card_img"></div>
                <div class="card_history">
                    <div class="card_img_avatar"></div>
                    <div>
                        <div>Manager</div>
                        <div>bitcamp University</div>
                    </div>
                </div>
                <span class="has_notice">긴급공지사항</span>
            </div>
            <div class="card has_flex_space_bt_cl has_shadow" style="grid-column: 5/8">
                <div class="card_img"></div>
                <div class="card_history">
                    <div class="card_img_avatar"></div>
                    <div>
                        <div>Manager</div>
                        <div>bitcamp University</div>
                    </div>
                </div>
                <span class="has_notice">긴급공지사항</span>
            </div>
        </div>
    </div>
</main>
<jsp:include page="../header_footer/footer.jsp"></jsp:include>
</body>
</html>