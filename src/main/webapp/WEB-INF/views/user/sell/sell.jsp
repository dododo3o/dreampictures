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
    <script src="https://cdnjs.cloudflare.com/ajax/libs/particlesjs/2.2.2/particles.min.js"></script>

    <script src= "particles.min.js"
    ></script>
    <script>
        function setThumbnail(event) {
            var reader = new FileReader();
            reader.onload = function (event) {
                var ex_img = document.getElementById("image_section");
                if (ex_img !== null) {
                    ex_img.parentNode.removeChild(ex_img);
                }
                var img = document.createElement("img");
                img.id = "image_section";
                img.className = "painting_img";
                img.setAttribute("src", event.target.result);
                document.querySelector("div#preview_image").appendChild(img);
            };
            reader.readAsDataURL(event.target.files[0]);
        }
        $('#standard_calendar')
            .calendar()
        ;
        function nextBtn_condition(){
            var pname = $("#pnameVal").val();
            var height = $("#heightVal").val();
            var width = $("#widthVal").val();
            var price = $("#priceVal").val();
            var calVal = $("#cal").val();
            var content = $("#contentVal").val();
            var style = $("#styleVal").val();
            var theme = $("#themeVal").val();

            if (pname && height && width && price && calVal && content && style && theme != null) {
                document.getElementById('frm').submit();
            } else {
                alert('모든 인증을 완료해주세요.');
            }
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

<%--dvsdvdsvdvsz--%>
<main class="has_bg_harp">
    <div class="container">
        <form action="<%=conPath%>/sell_success" method="post" onsubmit="return false" enctype="multipart/form-data">
            <div style="background-color:var( --color-white);display:flex;grid-column: 1/13;height: 100%;">
                <div style="border-right: 1px solid #ddd;width:50%;padding-left: 110px;padding-right: 100px;">
                    <div class="has_flex_column has_evenly" style="flex-wrap: wrap;width:100%;height: 85%;padding-top: 100px;">



                        <input type="submit" class="ui secondary button" value="그림등록" onclick="nextBtn_condition()"><font style="vertical-align: inherit; "><font
                                style="vertical-align: inherit;" >

                        </font></font>
                        <div class="ui horizontal divider"><font style="vertical-align: inherit;"><font
                                style="vertical-align: inherit;">
                            Painting Infomation
                        </font></font></div>
                        <div class="ui list has_flex_column has_font-base" style="display: flex; gap: 20px;">
                            <div style="display: flex;">
                                <i class="big edit outline icon" style="user-select: auto;"></i>
                                <div class="content" style="display: flex;">
                                    <input class="painting_input" id="pnameVal" type="text" placeholder="작품명">
                                </div>
                            </div>
                        </div>
                        <div class="ui list has_flex_column has_font-base" style="display: flex; gap: 20px;">
                            <div style="user-select: auto; display: flex;">
                                <i class="big long arrow alternate up icon" style="user-select: auto;"></i>
                                <div class="content" style="display: flex;">
                                    <input class="painting_input" id="heightVal" type="text" placeholder="높이 (cm)">
                                </div>
                            </div>
                        </div>
                        <div class="ui list has_flex_column has_font-base" style="display: flex; gap: 20px;">
                            <div style="user-select: auto; display: flex;">
                                <i class="big long arrow alternate right icon" style="user-select: auto;"></i>
                                <div class="content" style="display: flex;">
                                    <input class="painting_input" id="widthVal" type="text" placeholder="너비 (cm)">
                                </div>
                            </div>
                        </div>
                        <div class="ui list has_flex_column has_font-base" style="display: flex; gap: 20px;">
                            <div style="display: flex;">
                                <i class="big won sign icon" style="user-select: auto;"></i>
                                <div class="content" style="display: flex;">
                                    <input class="painting_input" id="priceVal" type="text" placeholder="가격 (원)">
                                </div>
                            </div>
                        </div>

                        <div class="ui calendar" id="standard_calendar">
                            <div class="ui input left icon" style="width: 100%;">
                                <i class="calendar icon"></i>
                                <input type="text" placeholder="Date/Time" id="cal" style="width: 100%;display: flex;">
                            </div>
                        </div>
                        <div class="ui list has_flex_column has_font-base" style="display: flex; ">
                            <div style=" display: flex;">
                                <div class="content" style="display: flex;width: 100%;">
                                    <textarea class="painting_input" id="contentVal" placeholder="작품설명"
                                              style="resize: none; height: 60px;width: 100%;"></textarea>
                                </div>
                            </div>
                        </div>
                        <%-- todo--%>
                        <div class="ui selection dropdown" id="styleVal" style="width: 103%;">
                            <input name="style">
                            <i class="dropdown icon"></i>
                            <div class="default text">화풍</div>
                            <div class="menu">
                                <div class="item">유화</div>
                                <div class="item">수채화</div>
                                <div class="item">아크릴화</div>
                                <div class="item">펜화</div>
                                <div class="item">연필화</div>
                                <div class="item">크레용화</div>
                                <div class="item">과슈화</div>
                                <div class="item">파스텔화</div>
                            </div>
                        </div>
                        <div class="ui selection dropdown" id="theme" style="width: 103%;">
                            <input name="thema">
                            <i class="dropdown icon"></i>
                            <div class="default text">테마</div>
                            <div class="menu">
                                <div class="item">인물</div>
                                <div class="item">풍경</div>
                                <div class="item">정물</div>
                                <div class="item">동물</div>
                                <div class="item">추상</div>
                                <div class="item">팝아트</div>
                                <div class="item">오브제</div>
                            </div>
                        </div>
                    </div>
                </div><!--오른쪽 div-->

                <div class="has_flex_column" style="width:50%;padding-left: 80px;padding-right: 80px;">
                    <div class="has_flex_center" id="image_container;"
                         style="margin-top: 70px; width: 100%; height: 80%;">
                        <div id="preview_image">


                        </div>
                        <%--todo 사진이 가로라면~"~?~"!?!?~???어떻게 해야할까요~고민해봅시다~~--%>
                    </div>
                    <div>
                        <div><input type="file" onchange="setThumbnail(event);" name="filename" id="image"
                                    style="margin-left: 100px;margin-top: 10px"/></div>
                    </div>
                </div><!--왼쪽div-->
            </div>
        </form>
    </div>
</main>
<jsp:include page="../header_footer/footer.jsp"></jsp:include>
</body>
</html>