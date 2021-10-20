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
    <script>
        function nextBtn_condition() {document.getElementById('frm').submit();}
        function setThumbnail(event) {
            var reader = new FileReader();
            reader.onload = function (event) {
                var ex_img = document.getElementById("image_section");
                if (ex_img !== null) {
                    ex_img.parentNode.removeChild(ex_img);
                }

                var img = document.createElement("img");
                img.id = "image_section";
                img.className = "avatar_img";
                img.setAttribute("src", event.target.result);
                document.querySelector("div#preview_image").appendChild(img);
            };
            reader.readAsDataURL(event.target.files[0]);
        }
    </script>
    <link rel="stylesheet" href="https://unpkg.com/flickity@2/dist/flickity.min.css">
    <script src="https://unpkg.com/flickity@2/dist/flickity.pkgd.min.js"></script>
    <style>
        .carousel {
            background: #EEE;
        }
        .carousel-cell {
            width: 66%;
            height: 200px;
            margin-right: 10px;
            background: #8C8;
            border-radius: 5px;
            counter-increment: carousel-cell;
        }
        .carousel-cell:before {
            display: block;
            text-align: center;
            content: counter(carousel-cell);
            line-height: 200px;
            font-size: 80px;
            color: white;
        }
    </style>
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

<h1>Flickity - wrapAround</h1>
<div class="carousel"
     data-flickity='{ "wrapAround": true }'>
    <div class="carousel-cell"></div>
    <div class="carousel-cell"></div>
    <div class="carousel-cell"></div>
    <div class="carousel-cell"></div>
    <div class="carousel-cell"></div>
</div>
<main class="has_bg_harp">
    <div class="container">
        <div class="contents" style="grid-column: 4/10;justify-content: space-around ">
            <form action="<%=conPath%>/sell_success" method="post" enctype="multipart/form-data">
                <div style="display: flex; flex-direction: column;gap: 20px;">
                    <div class="title">판매등록</div>
                    <div style="display: flex; align-items: center" id="image_container;">
                        <div class="avatar_img" id="preview_image" style="height: 130px;"/>
                    </div>
                    <div>이미지등록<input type="file" onchange="setThumbnail(event);" name="filename" id="image"
                                     style="margin-left: 100px;margin-top: 10px"/></div>
                </div>
                <div class="ui input"><input type="text" class="has_width_full" name="pname"
                                             placeholder="작품명을 입력해주세요."></div>
                <div class="has_flex_space">
                    <select class="has_width_half" name="style">
                        <option disabled selected>Style</option>
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
                        <option disabled selected>Theme</option>
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
                    <input type="text" class="has_width_half" name="height" placeholder="높이(cm)" pattern="\d*"
                           maxlength="3" max="200" min="0"/>
                    <input type="text" class="has_width_half" name="width" placeholder="너비(cm)" pattern="\d*"
                           maxlength="3" max="200" min="0"/>
                </div>
                <div class="has_flex_space">
                    <input type="text" class="has_width_half" name="price" placeholder="가격(원)[10만원 이하]" pattern="\d*"
                           maxlength="6" min="0" max="100000"/>
                    <input type="date" class="has_width_half " name="production" placeholder="제작년도"/>
                </div>
                <div class="has_flex_space">
                    <textarea class="has_width_full" name="exp" style="resize: none;" placeholder="작품을 설명해주세요.(250자 이내)"
                              maxlength="250"></textarea></div>
                <div class="has_flex_space">
                    <input type="submit" class="button is_enroll_button has_width_full" value="등록완료">
                </div>
            </form>
        </div>
    </div>
</main>
<jsp:include page="../header_footer/footer.jsp"></jsp:include>
</body>
</html>