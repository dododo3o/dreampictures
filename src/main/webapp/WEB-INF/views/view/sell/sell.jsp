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
<jsp:include page="../header_footer/header_not_login.jsp"></jsp:include>
<main class="has_bg_harp">
    <div class="container">

        <div class="contents" style="grid-column: 4/10; margin-top: 20px;">
            <form>
                <div style="display: flex; flex-direction: column;gap: 20px;">
                    <div class="title">판매등록</div>
                    <div class="has_flex_space">
                        <img src="../../../uitility/photo.png" class="avatar_img"/>
                        <button class='button is_enroll' style="width: 70%"><span
                                style="padding-left: 10px;">사진 등록하기!</span></button>
                    </div>
                    <div class="has_flex_space"><input type="text" class="has_width_full" placeholder="작품명을 입력해주세요."/>
                    </div>
                    <div class="has_flex_space">
                        <select class="has_width_half">
                            <option value="" disabled selected>테마</option>
                            <option value="풍경">풍경</option>
                            <option value="인물">인물</option>
                            <option value="정물">정물</option>
                            <option value="동물">동물</option>
                            <option value="추상">추상</option>
                            <option value="팝아트">팝아트</option>
                            <option value="오브제">오브제</option>
                        </select>

                        <select class="has_width_half">
                            <option value="" disabled selected>화풍</option>
                            <option value="유화">유화</option>
                            <option value="수채화">수채화</option>
                            <option value="아크릴화">아크릴화</option>
                            <option value="펜화">펜화</option>
                            <option value="연필화">연필화</option>
                            <option value="파스텔화">파스텔화</option>
                            <option value="크레용화">크레용화</option>
                            <option value="과슈화">과슈화</option>
                        </select>
                    </div>
                    <div class="has_flex_space">
                        <input type="text" class="has_width_half" placeholder="높이(cm)" pattern="\d*" maxlength="3" max="200" min="0"/>
                        <input type="text" class="has_width_half" placeholder="너비(cm)" pattern="\d*" maxlength="3" max="200" min="0"/></div>
                    <div class="has_flex_space">
                        <input type="text" class="has_width_half " placeholder="가격(원)[10만원 이하]" pattern="\d*" maxlength="6" min="0" max="100000"/>
                        <input type="date" class="has_width_half " placeholder="제작년도"/>
                    </div>
                    <div class="has_flex_space">
                        <textarea class="has_width_full" style="resize: none;" placeholder="작품을 설명해주세요.(250자 이내)" maxlength="250"></textarea></div>
                    <div class="has_flex_space">
                        <button class="button is_enroll_button has_width_full"><span>등록완료!</span></button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</main>
<jsp:include page="../header_footer/footer.jsp"></jsp:include>
</body>
</html>