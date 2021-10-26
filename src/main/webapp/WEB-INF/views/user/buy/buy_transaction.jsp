<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% String conPath = request.getContextPath(); %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>그림드림 | 구매</title>
    <link rel="stylesheet" href="/resources/css/dreampicturesytle.css">
    <!--고운돋움 글씨체 -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">
    <script src="https://kit.fontawesome.com/b14e6f064f.js" crossorigin="anonymous"></script>
</head>
<body oncontextmenu="return false" onselectstart="return false">
<% if (session.getAttribute("logStatus") == "Y") { %>
<jsp:include page="../header_footer/header_login.jsp">
    <jsp:param name="user" value="${user}"/>
</jsp:include>
<% } %>
<main class="has_bg_harp">
    <div class="container">
        <section style="grid-column:3/12; width:800px; margin-top:60px;">
            <h1 class="has_font-xxl" style="margin-left:280px; margin-bottom: 40px;">구매완료</h1>
            <div style="display:flex;">
                <div class="has_bg_puce is_buyer-card">
                    <div class="is_seller-card-img" style="background:url("<c:out value="${transactionVO.paintingimg}"/>");"></div>
                <div class="has_font-xl "><c:out value="${transactionVO.pname}"/></div>
                <div style="display:flex; margin-top: 20px;">
                    <div class="is_round is_seller-face" style="background:url("<c:out value="${transactionVO.avatarimg}"/>");"><div>
                <div class="has_font-xl"><c:out value="${transactionVO.nickname}"/></div>
            </div>
            <p class="has_font-base" style="margin-top: 20px;"><c:out value="${transactionVO.transactionDate}"/></p></section>
    </div>
    <div style="margin:0 70px;">
        <i style="font-size:120px; margin-top: 130px;" class="fas fa-hands-helping has_font-2xl"></i>
        <div>
            <button style="width:150px;">확인</button>
        </div>
    </div>
    <div class="has_bg_pink is_buyer-card">
        <div class="is_buyer-card-img" style="background:url("<c:out value="${transactionVO.buyer_avatarimg}"/>");"></div>
    <div></div>
    <ul>
        <c:out value="${transactionVO.paintingimg}"/>
        <c:out value="${transactionVO.buyer_avatarimg}"/>
        <li style="margin-top:35px;" class="has_font-xl has_white"><c:out value="${transactionVO.buyer_nickname}"/></li>
        <li style="margin-top:25px;" class="has_font-lg has_white"><c:out value="${transactionVO.buyer_email}"/></li>
        <li style="margin-top:10px;" class="has_font-base has_white"><c:out value="${transactionVO.buyer_tel}"/></li>
        <li style="margin-top:10px;" class="has_white"><c:out value="${transactionVO.buyer_addr}"/></li>
    </ul>
    <button class="button" style="margin-top:30px; width:185px; height:30px;">구매 내역</button>
    </div>
    </div>
    </section>
    </div>
</main>
<jsp:include page="../header_footer/footer.jsp"></jsp:include>
</body>
</html>