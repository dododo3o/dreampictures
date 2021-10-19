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
<main class="has_bg_harp">
    <div class="container">
        <div style="background-color:var( --color-white);display:flex;grid-column: 1/13">
            <div
                    style="border-right: 1px solid #ddd;width:50%;padding-left: 130px;padding-right: 100px;">
                <div class="has_flex_column has_evenly" style="height: 80%;padding-top: 100px;">
                    <button class="ui secondary button"><font style="vertical-align: inherit; "><font
                            style="vertical-align: inherit;">
                        그림드림 페이
                    </font></font></button>
                    <div class="ui horizontal divider"><font style="vertical-align: inherit;"><font
                            style="vertical-align: inherit;">
                        Buyer Infomation
                    </font></font></div>
                    <div class="ui list has_flex_column has_font-base" style="display: flex; gap: 20px;">
                        <div style="user-select: auto; display: flex;">
                            <i class="users icon" style="user-select: auto;"></i>
                            <div class="content" style="user-select: auto;">
                                닉네임 : <c:out value="${paymentVO.nickname}"/>
                            </div>
                        </div>
                        <div style="user-select: auto; display: flex;">
                            <i class="mail icon" style="user-select: auto;"></i>
                            <div class="content" style="user-select: auto;">
                                이메일 : <c:out value="${paymentVO.email}"/>
                            </div>
                        </div>
                        <div style="user-select: auto; display: flex;">
                            <i class="phone icon" style="user-select: auto;"></i>
                            <div class="content" style="user-select: auto;">
                                연락처 : <c:out value="${paymentVO.tel}"/>
                            </div>
                        </div>
                    </div>
                    <div class="ui horizontal divider"><font style="vertical-align: inherit;"><font
                            style="vertical-align: inherit;">
                        Shipping Address
                    </font></font></div>
                    <div class="has_flex_column" style="">
                        <input type="text" style="" class="painting_input" value="<c:out value="${mypageVO.addr}"/>">
                    </div>
                    <div class="ui horizontal divider"><font style="vertical-align: inherit;"><font
                            style="vertical-align: inherit;">
                        Point
                    </font></font></div>
                    <div class="ui list has_flex_column has_font-base" style="display: flex; gap: 20px;">
                        <div style="user-select: auto; display: flex;">
                            <i class="hourglass half icon" style="user-select: auto;"></i>
                            <div class="content" style="user-select: auto;">
                                현재 포인트 : <%--todo--%>
                            </div>
                        </div>
                        <div style="user-select: auto; display: flex;">
                            <i class="hourglass outline icon" style="user-select: auto;"></i>
                            <div class="content" style="user-select: auto;">
                                결제 후 포인트 : <%--todo--%>
                            </div>
                        </div>
                    </div>
                    <button class="ui secondary button"><font style="vertical-align: inherit; "><font
                            style="vertical-align: inherit;">
                        드림페이 충전
                    </font></font></button>
                    <div class="ui horizontal divider"><font style="vertical-align: inherit;"><font
                            style="vertical-align: inherit;">
                        Payment
                    </font></font></div>
                    <div style="display: flex;justify-content: space-around;">
                        <button class="ui secondary button"><font style="vertical-align: inherit; "><font
                                style="vertical-align: inherit;">
                            결제하기
                        </font></font></button>
                        <button class="ui secondary button"><font style="vertical-align: inherit; "><font
                                style="vertical-align: inherit;">
                            뒤로가기
                        </font></font></button>
                    </div>
                </div>
            </div><!--오른쪽 div-->

            <div class="has_flex_column" style="width:50%;padding-left: 80px;padding-right: 80px;">
                <h4 style="margin-top: 100px"> 메롱메롱작가이름이지롱<c:out value="${paymentVO.nickname}"/></h4>
                <h2>메롱메롱메롱제목이지롱<c:out value="${paintingVO.pname}"/></h2>
                <h3>₩ <c:out value="${paymentVO.price}"/></h3>
                <div class="image" style="margin-top: 70px">
                    <img src="<c:out value="${paymentVO.paintingimg}"/>"
                         style="width:300px;height: 300px;border-radius: 5%;">
                </div>
            </div><!--왼쪽div-->
        </div>
    </div>
</main>
<jsp:include page="../header_footer/footer.jsp"></jsp:include>
</body>
</html>