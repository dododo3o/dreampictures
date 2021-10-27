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
    <!--고운돋움 글씨체 -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">
    <script src="https://kit.fontawesome.com/b14e6f064f.js" crossorigin="anonymous"></script>
    </script>
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
            var file = document.getElementById('image');
            console.log(file)
            var form = new FormData();
            form.append("image", file.files[0])
            var settings = {
                "url": "https://api.imgbb.com/1/upload?key=a58b54558814eef28607f69ffed7f06c",
                "method": "POST",
                "timeout": 0,
                "processData": false,
                "mimeType": "multipart/form-data",
                "contentType": false,
                "data": form
            };
            $.ajax(settings).done(function (response) {
                console.log(response);
                var displayURL = JSON.parse(response);
                console.log(displayURL.data.url);
                $("#url").val(displayURL.data.url)

            });
            reader.readAsDataURL(event.target.files[0]);
        }

        function nextBtn_condition() {
            var pname = $("#pnameVal").val();
            var height = $("#heightVal").val();
            var width = $("#widthVal").val();
            var price = $("#priceVal").val();
            var calVal = $("#cal").val();
            var content = $("#contentVal").val();
            var img = $("#image_section").val();
            var f = document.form;
            if (pname != '' && height != '' && width != '' && price != '' && calVal != '' && content != '' && f.style.value !== '' && f.theme.value !== '') {
                $("#point").css("display", "none");
                document.getElementById('frm').submit();
            } else {
                $("#point").css("display", "block");
            }
        }

        function heightMaxLength(e) {
            if (e.value.length > e.maxLength) {e.value = e.value.slice(0, e.maxLength);}
        }
        function widthMaxLength(e) {
            if (e.value.length > e.maxLength) {e.value = e.value.slice(0, e.maxLength);}
        }
        function priceMaxLength(e) {
            if (e.value.length > e.maxLength) {e.value = e.value.slice(0, e.maxLength);}
        }
        function MaxLength(e) {//작품설명 최대 입력 수 200
            if (e.value.length > e.maxLength) {e.value = e.value.slice(0, e.maxLength);}
        }
    </script>
</head>
<body oncontextmenu="return false" onselectstart="return false">
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
        <form action="<%=conPath%>/sell_success" method="post" onsubmit="return false" enctype="multipart/form-data" id="frm" name="form">
            <div style="background-color:var( --color-white);display:flex;grid-column: 1/13;height: 100%;">
                <div style="border-right: 1px solid #ddd;width:50%;padding-left: 110px;padding-right: 100px;">
                    <div class="has_flex_column has_evenly" style="flex-wrap: wrap;width:100%;height: 90%;padding-top: 100px;">
                        <a class="ui red tag label" style="display: none; margin-bottom: 10px;" id="point"><span>그림 정보를 모두 작성해주세요.😥</span></a>
                        <input id="submitBtn" type="submit" class="ui secondary button" style="font-family:'Gowun Dodum'" value="그림등록" onclick="nextBtn_condition()">
                        <div class="ui horizontal divider" style="vertical-align: inherit;">Painting Infomation</div>
                        <div class="ui list has_flex_column has_font-base" style="display: flex; gap: 20px;">
                            <div style="display: flex;">
                                <i id="pen" class="big edit outline icon" style="user-select: auto;"></i>
                                <div class="content" style="display: flex;">
                                    <input class="painting_input" onclick="move('pen')" id="pnameVal" name="pname" type="text" style="font-family:'Gowun Dodum';width:200px" placeholder="작품명">
                                </div>
                            </div>
                        </div>
                        <div class="ui list has_flex_column has_font-base" style="display: flex; gap: 20px;">
                            <div style="user-select: auto; display: flex;">
                                <i id="up" class="big long arrow alternate up icon" style="user-select: auto;"></i>
                                <div class="content" style="display: flex;">
                                    <input class="painting_input" onclick="move('up')" id="heightVal" name="height" type="number"
                                           oninput="heightMaxLength(this)" style="font-family:'Gowun Dodum';width:200px"
                                           placeholder="높이 (cm) 최대 200CM" max="200" maxlength="3">
                                </div>
                            </div>
                        </div>
                        <div class="ui list has_flex_column has_font-base" style="display: flex; gap: 20px;">
                            <div style="user-select: auto; display: flex;">
                                <i id="right" class="big long arrow alternate right icon" style="user-select: auto;"></i>
                                <div class="content" style="display: flex;">
                                    <input class="painting_input" onclick="move('right')" id="widthVal" name="width" type="number"
                                           oninput="widthMaxLength(this)" style="font-family:'Gowun Dodum';width:200px"
                                           placeholder="너비 (cm) 최대 200CM" max="200" maxlength="3">
                                </div>
                            </div>
                        </div>
                        <div class="ui list has_flex_column has_font-base" style="display: flex; gap: 20px;">
                            <div style="display: flex;">
                                <i id="won" class="big won sign icon" style="user-select: auto;"></i>
                                <div class="content" style="display: flex;">
                                    <input class="painting_input" onclick="move('won')" id="priceVal" name="price" type="number"
                                           oninput="priceMaxLength(this)" style="font-family:'Gowun Dodum';width:200px"
                                           placeholder="가격 (원) 최대 10 만원" max="100000" maxlength="6">
                                </div>
                            </div>
                        </div>
                        <input type="date" class="has_width_half sell_select" name="production" id="cal"
                               style="font-family:'Gowun Dodum';" placeholder="제작년도"/>
                        <div class="ui list has_flex_column has_font-base" style="display: flex; ">
                            <div style=" display: flex;">
                                <div class="content" style="display: flex;width: 100%;">
                                    <textarea class="painting_input" id="contentVal" name="exp"
                                              placeholder="작품설명 200글자 내외로 입력해주세요" oninput="MaxLength(this)"
                                              maxlength="100"
                                              style="font-family:'Gowun Dodum';resize: none; height: 60px;width: 100%;"></textarea>
                                </div>
                            </div>
                        </div>
                        <select style="font-family:'Gowun Dodum'; font-size:var(--font-size-sm)"
                                class="has_width_half sell_select" id="style" name="style">
                            <option value="" disabled selected>Style</option>
                            <option value="oils">유화</option>
                            <option value="water">수채화</option>
                            <option value="acrylic">아크릴화</option>
                            <option value="pen">펜화</option>
                            <option value="pencil">연필화</option>
                            <option value="pastel">파스텔화</option>
                            <option value="crayon">크레용화</option>
                            <option value="gouache">과슈화</option>
                        </select>
                        <select style="font-family:'Gowun Dodum'; font-size:var(--font-size-sm)" onchange="change_button()"
                                class="has_width_half sell_select" id="theme" name="theme">
                            <option value="" disabled selected>Theme</option>
                            <option value="scenery">풍경</option>
                            <option value="character">인물</option>
                            <option value="still">정물</option>
                            <option value="animal">동물</option>
                            <option value="abstract">추상</option>
                            <option value="popart">팝아트</option>
                            <option value="objet">오브제</option>
                        </select>
                    </div>
                    <div style="display: none"><input type="text" id="url" name="url"></div>
                </div>
                <div class="has_flex_column" style="width:50%;padding-left: 80px;padding-right: 80px;">
                    <div class="has_flex_center" id="image_container;"
                         style="margin-top: 70px; width: 100%; height: 80%;">
                        <div id="preview_image">
                            <%-- 선택한 사진 들어가는 곳--%>
                        </div>
                    </div>
                    <div>
                        <input type="file" onchange="setThumbnail(event);" id="image"
                               style="margin-left: 100px;margin-top: 10px"/>
                    </div>
                </div>
            </div>
        </form>
    </div>
</main>
<script>
    move =function (id) {$('#'+id).transition('tada', '1000ms');}

    change_button = function () {
        $("#submitBtn").css('backgroundColor','#A7D9DF');
        $("#submitBtn").transition('set looping').transition('tada','3000ms');

    }

</script>

<jsp:include page="../header_footer/footer.jsp"></jsp:include>
</body>
</html>