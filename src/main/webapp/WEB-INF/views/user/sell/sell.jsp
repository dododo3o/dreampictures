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
<<<<<<< HEAD
<script>
    //====================등록 완료 버튼을 활성 시킬 조건들======================
    //모든 정보가 입력되어야 함
    function nextBtn_condition() {
        //사진등록확인작업하기===========================
       document.getElementById('frm').submit();
    }
</script>
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
        <div class="contents" style="grid-column: 4/10; margin-top: 20px;">
            <form action="<%=conPath%>/sell_success" method="post" enctype="multipart/form-data">
                <div style="display: flex; flex-direction: column;gap: 20px;">
                    <div class="title">판매등록</div>
                    <div class="has_flex_space">
                        <img src="/resources/css/photo/darth.jpg" class="avatar_img"/>
                        <div style="margin-top: 10px">이미지등록<input type="file" name="filename" style="margin-left: 100px;margin-top: 10px"/></div>
                        <div style="margin-top: 10px">이미지등록<input type="file" name="filename" style="margin-left: 100px;margin-top: 10px"/></div>
                        <div style="margin-top: 10px">이미지등록<input type="file" name="filename" style="margin-left: 100px;margin-top: 10px"/></div>
                    </div>
                    <div class="has_flex_space"><input type="text" class="has_width_full" name="pname" placeholder="작품명을 입력해주세요."/>
                    </div>
                    <div class="has_flex_space">
                        <select class="has_width_half" name="style">
                            <option disabled selected>화풍</option>
                            <option value="oils">유화</option>
                            <option value="water">수채화</option>
                            <option value="acrylic">아크릴화</option>
                            <option value="pen">펜화</option>
                            <option value="pencil">연필화</option>
                            <option value="pastel">파스텔화</option>
                            <option value="crayon">크레용화</option>
                            <option value="gouache">과슈화</option>
                        </select>
                        <select class="has_width_half" name="theme">
                            <option disabled selected>테마</option>
                            <option value="scenery">풍경</option>
                            <option value="character">인물</option>
                            <option value="still">정물</option>
                            <option value="animal">동물</option>
                            <option value="abstract">추상</option>
                            <option value="popart">팝아트</option>
                            <option value="objet">오브제</option>
                        </select>
                    </div>
                    <div class="has_flex_space">
                        <input type="text" class="has_width_half" name="height" placeholder="높이(cm)" pattern="\d*" maxlength="3" max="200" min="0"/>
                        <input type="text" class="has_width_half" name="width" placeholder="너비(cm)" pattern="\d*" maxlength="3" max="200" min="0"/></div>
                    <div class="has_flex_space">
                        <input type="text" class="has_width_half " name="price" placeholder="가격(원)[10만원 이하]" pattern="\d*" maxlength="6" min="0" max="100000"/>
                        <input type="date" class="has_width_half " name="production" placeholder="제작년도"/>
                    </div>
                    <div class="has_flex_space">
                        <textarea class="has_width_full" name="exp" style="resize: none;" placeholder="작품을 설명해주세요.(250자 이내)" maxlength="250"></textarea></div>
                    <div class="has_flex_space">
                        <input type="submit" class="button is_enroll_button has_width_full" value="등록완료">
                    </div>
                </div>
            </form>
        </div>
    </div>
</main>
<jsp:include page="../header_footer/footer.jsp"></jsp:include>
</body>
</html>