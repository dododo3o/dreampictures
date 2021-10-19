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
<div class="carousel"
     data-flickity='{ "wrapAround": true }'>
    <div class="carousel-cell"></div>
    <div class="carousel-cell"></div>
    <div class="carousel-cell"></div>
    <div class="carousel-cell"></div>
    <div class="carousel-cell"></div>
</div>
<%--dvsdvdsvdvsz--%>
<main class="has_bg_harp">
    <div class="container">
        <div style="background-color:var( --color-white);display:flex;grid-column: 1/13">
            <div
                    style="border-right: 1px solid #ddd;width:50%;padding-left: 130px;padding-right: 100px;">
                <div class="has_flex_column has_evenly" style="height: 80%;padding-top: 100px;">
                    <button class="ui secondary button"><font style="vertical-align: inherit; "><font
                            style="vertical-align: inherit;">
                        그림 등록
                    </font></font></button>
                    <div class="ui horizontal divider"><font style="vertical-align: inherit;"><font
                            style="vertical-align: inherit;">
                        Painting Infomation
                    </font></font></div>
                    <div class="ui list has_flex_column has_font-base" style="display: flex; gap: 20px;">
                        <div style="user-select: auto; display: flex;">
                            <i class="edit outline icon" style="user-select: auto;"></i>
                            <div class="content" style="display: flex;">
                                <input class="painting_input" type="text" value="작품명">
                            </div>
                        </div>
                        <div class="ui selection dropdown">
                            <input type="hidden" name="gender">
                            <i class="dropdown icon"></i>
                            <div class="default text">Gender</div>
                            <div class="menu">
                                <div class="item" data-value="1">Male</div>
                                <div class="item" data-value="0">Female</div>
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
                <div  id="image_container;" style="margin-top: 70px; width: 100%; height: 80%; border: 1px solid red;">
                    <div class="avatar_img" id="preview_image" style="height: 130px;"></div>
                         <%--todo 사진이 가로라면~"~?~"!?!?~???어떻게 해야할까요~고민해봅시다~~--%>
                </div>
                <div>
                    <div><input type="file" onchange="setThumbnail(event);" name="filename" id="image"
                                     style="margin-left: 100px;margin-top: 10px"/></div>
                </div>
            </div><!--왼쪽div-->
        </div>
    </div>
</main>
<jsp:include page="../header_footer/footer.jsp"></jsp:include>
</body>
</html>