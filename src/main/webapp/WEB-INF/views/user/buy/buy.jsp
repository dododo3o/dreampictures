<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% String conPath = request.getContextPath(); %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>그림드림  | 구매</title>
    <link rel="stylesheet" href="/resources/css/dreampicturesytle.css">
    <!--고운돋움 글씨체 -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">
    <link rel="stylesheet" type="text/css"
          href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.2.13/semantic.min.css">
    <script src="https://kit.fontawesome.com/b14e6f064f.js" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"
            integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ=="
            crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"
            integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8=" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.2.13/semantic.js"></script>
    <script>
        function buypainting(num) {
            location.href = "/buy_picture/" + num;
        }
        find_picture = function () {
            $(() => {
                let pname = document.getElementById("pname").value;
                let style = document.getElementById("style").value;
                let theme = document.getElementById("theme").value;
                let width = document.getElementById("width").value;
                let height = document.getElementById("height").value;
                let price = document.getElementById("price").value;
                if(pname=='' && style==''&&theme==''&&width==200&&height==200&&price==100000){
                    $.ajax({
                        url: "/ajax_picture_finder",
                        data: "pname=" + "all",
                        success: function (result) {
                            var container = document.getElementById("container");
                            while (container.hasChildNodes()) {
                                container.removeChild(container.firstChild);
                            }
                            $("#container").html(result);
                        }
                    });
                }
                else{
                    $.ajax({
                        url: "/ajax_picture_finder",
                        data: "pname=" + pname + "&style=" + style + "&theme=" + theme + "&width=" + width + "&height=" + height + "&price=" + price,
                        success: function (result) {
                            var container = document.getElementById("container");
                            while (container.hasChildNodes()) {
                                container.removeChild(container.firstChild);
                            }
                            var container_page = document.getElementById("container_page");
                            while (container_page.hasChildNodes()) {
                                container_page.removeChild(container_page.firstChild);
                            }
                            $("#container").html(result);
                        }
                    });
                }
            });
        };

        pagination = function (num) {
            $(() => {
                $.ajax({
                    url: "/ajax_buy_pagination",
                    data: "num=" + num,
                    success: function (result) {
                        var container = document.getElementById("container");
                        while (container.hasChildNodes()) {
                            container.removeChild(container.firstChild);
                        }
                        $("#container").html(result);
                    }
                });
            });
        };
        addComment = function (no_painting) {
            $(() => {
                let text = document.getElementById(no_painting).value;
                let no_paint = no_painting;
                let real_no = no_paint.replace("input", "");
                $.ajax({
                    url: "/ajax_comment_add",
                    data: "comment=" + text + "&no_painting=" + real_no,
                    success: function (result) {
                        document.location.href = "/buy";
                    }
                });
            });
        };
        function flipCard(num) {
            $('#' + num).css("transform", "rotateY(180deg)");
            $(".ui.comments.flip-card-back").css('margin', '0');
        }
        function closeCard(num) {
            $('#' + num).css("transform", "rotateY(0deg)");
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
<div class="has_bg_harp">
    <div class="container">
        <div style="grid-column:1/7;display: flex;flex-direction: column; gap:20px; justify-content: center; margin-top: 70px;">
            <div class="has_chathams-blue" style="font-size: 42px;font-family: 'Gowun Dodum';font-weight: bold">그림드림의
                당신만의 그림찾기
            </div>
            <form action="">
                <div style="display: flex;" class="has_flex_space ">
                    <input type="text" class="has_width_full input_select" id="pname" style="font-family: 'Gowun Dodum';" placeholder="검색어를 입력해주세요."/>
                </div>
            </form>
            <button class=" ui blue icon button has_width_full" onclick="find_picture()" style="font-family: 'Gowun Dodum'"><i class="search icon"></i>찾기</button>
            <div style="display: flex; gap: 90px;">
                <select style="font-family: 'Gowun Dodum'; font-size: 1.5em;margin-right: 90px;" class="input_select has_width_half" id="style">
                    <option value="" selected>Style</option>
                    <option value="oils">유화</option>
                    <option value="water">수채화</option>
                    <option value="acrylic">아크릴화</option>
                    <option value="pen">펜화</option>
                    <option value="pencil">연필화</option>
                    <option value="pastel">파스텔화</option>
                    <option value="crayon">크레용화</option>
                    <option value="gouache">과슈화</option>
                </select>
                <select style="font-family: 'Gowun Dodum'; font-size: 1.5em;" class="input_select has_width_half" id="theme">
                    <option value="" selected>Theme</option>
                    <option value="scenery">풍경</option>
                    <option value="character">인물</option>
                    <option value="still">정물</option>
                    <option value="animal">동물</option>
                    <option value="abstract">추상</option>
                    <option value="popart">팝아트</option>
                    <option value="objet">오브제</option>
                </select>
            </div>
            <div style="display: flex;justify-content: space-between;grid-column:1/9;margin: 30px 0;">
                <div><span class="has_chathams-blue">최대너비  : <span id="widthVal">200</span>(CM)<br></span><input
                        type="range" class="width_slider"
                        id="width" min="0" max="200" step="10"
                        value="200" oninput="document.getElementById('widthVal').innerHTML=this.value;"/></div>
                <div><span class="has_chathams-blue">최대높이  :  <span id="heightVal">200</span>(CM)<br></span><input
                        type="range" class="width_slider"
                        id="height" min="0" max="200" step="10"
                        value="200" oninput="document.getElementById('heightVal').innerHTML=this.value;"/></div>
                <div><span class="has_chathams-blue">최대가격  : <span id="priceVal">100000</span>(원)<br></span><input
                        type="range" class="width_slider"
                        id="price" min="0" max="100000" step="1000"
                        value="100000" oninput="document.getElementById('priceVal').innerHTML=this.value;"/></div>
            </div>
        </div>
        <div style="grid-column:8/12;display:  flex;  flex-direction: column; gap:20px; justify-content: center;">
            <svg width="500" height="350"  id="looking_boy" viewBox="0 0 471 389" fill="none" xmlns="http://www.w3.org/2000/svg">
                <g opacity="0.37" filter="url(#filter0_f_0:1)">
                    <path d="M398.179 140.121L387.542 146.413L364.548 132.903L375.185 126.617L398.179 140.121Z" fill="url(#paint0_linear_0:1)" stroke="#C3D2D8" stroke-width="2" stroke-linejoin="round"/>
                    <path d="M398.038 170.441L398.026 192.939L387.389 199.231L387.542 146.413L398.178 140.121L398.089 171.199" fill="#FFF0F9" fill-opacity="0.41"/>
                    <path d="M398.038 170.441L398.026 192.939L387.389 199.231L387.542 146.413L398.178 140.121L398.089 171.199" stroke="#C3D2D8" stroke-width="2" stroke-linejoin="round"/>
                    <path d="M387.542 146.413L387.389 199.231L364.402 185.727L364.548 132.903L387.542 146.413Z" fill="#9593A8" stroke="#C3D2D8" stroke-width="2" stroke-linejoin="round"/>
                    <path d="M364.402 139.072L364.408 143.005L387.395 156.23L387.389 152.297L364.402 139.072Z" stroke="#C3D2D8" stroke-linejoin="round"/>
                    <path d="M364.402 151.351L364.408 155.284L387.395 168.51L387.389 164.57L364.402 151.351Z" stroke="#C3D2D8" stroke-linejoin="round"/>
                    <path d="M364.402 163.63L364.408 167.564L387.395 180.782L387.389 176.849L364.402 163.63Z" stroke="#C3D2D8" stroke-linejoin="round"/>
                    <path d="M364.402 175.91L364.408 179.843L387.395 193.062L387.389 189.128L364.402 175.91Z" stroke="#C3D2D8" stroke-linejoin="round"/>
                    <path d="M398.178 146.07L398.172 150.003L387.389 156.23L387.401 152.297L398.178 146.07Z" stroke="#C3D2D8" stroke-linejoin="round"/>
                    <path d="M398.331 158.349L398.319 162.283L387.542 168.51L387.548 164.57L398.331 158.349Z" stroke="#C3D2D8" stroke-linejoin="round"/>
                    <path d="M398.535 174.653L387.542 180.782L387.548 176.849L398.331 170.629" stroke="#C3D2D8" stroke-linejoin="round"/>
                    <path d="M397.898 186.964L387.542 193.062L387.548 189.129L397.898 183.076" stroke="#C3D2D8" stroke-linejoin="round"/>
                    <path d="M163.193 265.986L174.626 272.744L157.002 283.093L145.569 276.334L163.193 265.986Z" fill="url(#paint1_linear_0:1)" stroke="#C3D2D8" stroke-width="2" stroke-linejoin="round"/>
                    <path d="M174.626 272.744L174.721 305.144L157.091 315.498L157.002 283.093L174.626 272.744Z" fill="#FFF0F9" fill-opacity="0.41" stroke="#C3D2D8" stroke-width="2" stroke-linejoin="round"/>
                    <path d="M157.002 283.093L157.091 315.498L145.658 308.74L145.569 276.334L157.002 283.093Z" fill="#9593A8" stroke="#C3D2D8" stroke-width="2" stroke-linejoin="round"/>
                    <path d="M174.728 276.393L174.709 279.244L156.989 289.553L157.008 286.702L174.728 276.393Z" stroke="#C3D2D8" stroke-linejoin="round"/>
                    <path d="M174.709 290.583L156.989 300.893L157.008 298.042L174.728 287.732" stroke="#C3D2D8" stroke-linejoin="round"/>
                    <path d="M174.709 301.923L156.989 312.232L157.008 309.381L174.728 299.072" stroke="#C3D2D8" stroke-linejoin="round"/>
                    <path d="M145.556 280.125L145.575 282.976L156.989 289.553L156.97 286.702L145.556 280.125Z" stroke="#C3D2D8" stroke-linejoin="round"/>
                    <path d="M145.575 294.316L156.989 300.893L156.97 298.042L145.556 291.465" stroke="#C3D2D8" stroke-linejoin="round"/>
                    <path d="M145.575 305.655L156.989 312.233L156.97 309.381L145.556 302.804" stroke="#C3D2D8" stroke-linejoin="round"/>
                    <path d="M319.383 98.2228L328.026 103.297L302.6 118.323L276.791 103.16L285.262 98.1516" fill="url(#paint2_linear_0:1)"/>
                    <path d="M319.383 98.2228L328.026 103.297L302.6 118.323L276.791 103.16L285.262 98.1516" stroke="#C3D2D8" stroke-width="2" stroke-linejoin="round"/>
                    <path d="M328.026 103.297L327.873 156.114L302.453 171.147L302.6 118.323L328.026 103.297Z" fill="#FFF0F9" fill-opacity="0.41" stroke="#C3D2D8" stroke-width="2" stroke-linejoin="round"/>
                    <path d="M302.599 118.323L302.453 171.147L276.644 155.984L276.791 103.16L302.599 118.323Z" fill="#9593A8" stroke="#C3D2D8" stroke-width="2" stroke-linejoin="round"/>
                    <path d="M319.402 92.6696L302.479 102.674L285.294 92.5789L302.218 82.574L319.402 92.6696Z" fill="url(#paint3_linear_0:1)" stroke="#C3D2D8" stroke-width="2" stroke-linejoin="round"/>
                    <path d="M319.402 92.6696L319.377 102.811L302.447 112.815L302.479 102.674L319.402 92.6696Z" fill="#FFF0F9" fill-opacity="0.41" stroke="#C3D2D8" stroke-width="2" stroke-linejoin="round"/>
                    <path d="M302.478 102.674L302.447 112.815L285.262 102.72L285.294 92.5788L302.478 102.674Z" fill="#9593A8" stroke="#C3D2D8" stroke-width="2" stroke-linejoin="round"/>
                    <path d="M279.733 108.856L279.752 113.593L282.943 115.485L282.924 110.742L279.733 108.856Z" stroke="#C3D2D8" stroke-linejoin="round"/>
                    <path d="M285.262 112.135L285.281 116.878L288.472 118.77L288.453 114.027L285.262 112.135Z" stroke="#C3D2D8" stroke-linejoin="round"/>
                    <path d="M290.791 115.42L290.81 120.164L294.007 122.049L293.988 117.306L290.791 115.42Z" stroke="#C3D2D8" stroke-linejoin="round"/>
                    <path d="M296.326 118.699L296.338 123.442L299.536 125.328L299.517 120.591L296.326 118.699Z" stroke="#C3D2D8" stroke-linejoin="round"/>
                    <path d="M279.733 118.874L279.752 123.617L282.943 125.503L282.924 120.766L279.733 118.874Z" stroke="#C3D2D8" stroke-linejoin="round"/>
                    <path d="M285.262 122.159L285.281 126.903L288.472 128.788L288.453 124.045L285.262 122.159Z" stroke="#C3D2D8" stroke-linejoin="round"/>
                    <path d="M290.791 125.438L290.81 130.181L294.007 132.073L293.988 127.33L290.791 125.438Z" stroke="#C3D2D8" stroke-linejoin="round"/>
                    <path d="M296.326 128.723L296.338 133.467L299.536 135.352L299.517 130.609L296.326 128.723Z" stroke="#C3D2D8" stroke-linejoin="round"/>
                    <path d="M279.733 128.898L279.752 133.642L282.943 135.527L282.924 130.784L279.733 128.898Z" stroke="#C3D2D8" stroke-linejoin="round"/>
                    <path d="M285.262 132.177L285.281 136.92L288.472 138.806L288.453 134.069L285.262 132.177Z" stroke="#C3D2D8" stroke-linejoin="round"/>
                    <path d="M290.791 135.462L290.81 140.206L294.007 142.091L293.988 137.348L290.791 135.462Z" stroke="#C3D2D8" stroke-linejoin="round"/>
                    <path d="M296.326 138.741L296.338 143.484L299.536 145.37L299.517 140.633L296.326 138.741Z" stroke="#C3D2D8" stroke-linejoin="round"/>
                    <path d="M279.733 138.916L279.752 143.659L282.943 145.545L282.924 140.808L279.733 138.916Z" stroke="#C3D2D8" stroke-linejoin="round"/>
                    <path d="M285.262 142.201L285.281 146.945L288.472 148.83L288.453 144.087L285.262 142.201Z" stroke="#C3D2D8" stroke-linejoin="round"/>
                    <path d="M290.791 145.48L290.81 150.224L294.007 152.109L293.988 147.372L290.791 145.48Z" stroke="#C3D2D8" stroke-linejoin="round"/>
                    <path d="M296.326 148.766L296.338 153.509L299.536 155.394L299.517 150.651L296.326 148.766Z" stroke="#C3D2D8" stroke-linejoin="round"/>
                    <path d="M279.733 148.941L279.752 153.677L282.943 155.569L282.924 150.826L279.733 148.941Z" stroke="#C3D2D8" stroke-linejoin="round"/>
                    <path d="M285.262 152.219L285.281 156.963L288.472 158.848L288.453 154.111L285.262 152.219Z" stroke="#C3D2D8" stroke-linejoin="round"/>
                    <path d="M290.791 155.505L290.81 160.248L294.007 162.133L293.988 157.39L290.791 155.505Z" stroke="#C3D2D8" stroke-linejoin="round"/>
                    <path d="M296.326 158.783L296.338 163.527L299.536 165.412L299.517 160.676L296.326 158.783Z" stroke="#C3D2D8" stroke-linejoin="round"/>
                    <path d="M325.013 108.856L324.994 113.593L321.803 115.485L321.816 110.742L325.013 108.856Z" stroke="#C3D2D8" stroke-linejoin="round"/>
                    <path d="M319.485 112.135L319.466 116.878L316.268 118.77L316.287 114.027L319.485 112.135Z" stroke="#C3D2D8" stroke-linejoin="round"/>
                    <path d="M313.95 115.42L313.931 120.164L310.74 122.049L310.759 117.306L313.95 115.42Z" stroke="#C3D2D8" stroke-linejoin="round"/>
                    <path d="M308.421 118.699L308.402 123.442L305.211 125.328L305.23 120.591L308.421 118.699Z" stroke="#C3D2D8" stroke-linejoin="round"/>
                    <path d="M325.013 118.874L324.994 123.617L321.803 125.503L321.816 120.766L325.013 118.874Z" stroke="#C3D2D8" stroke-linejoin="round"/>
                    <path d="M319.485 122.159L319.466 126.903L316.268 128.788L316.287 124.045L319.485 122.159Z" stroke="#C3D2D8" stroke-linejoin="round"/>
                    <path d="M313.95 125.438L313.931 130.181L310.74 132.073L310.759 127.33L313.95 125.438Z" stroke="#C3D2D8" stroke-linejoin="round"/>
                    <path d="M308.421 128.723L308.402 133.467L305.211 135.352L305.23 130.609L308.421 128.723Z" stroke="#C3D2D8" stroke-linejoin="round"/>
                    <path d="M325.013 128.898L324.994 133.642L321.803 135.527L321.816 130.784L325.013 128.898Z" stroke="#C3D2D8" stroke-linejoin="round"/>
                    <path d="M319.485 132.177L319.466 136.92L316.268 138.806L316.287 134.069L319.485 132.177Z" stroke="#C3D2D8" stroke-linejoin="round"/>
                    <path d="M313.95 135.462L313.931 140.206L310.74 142.091L310.759 137.348L313.95 135.462Z" stroke="#C3D2D8" stroke-linejoin="round"/>
                    <path d="M308.421 138.741L308.402 143.484L305.211 145.37L305.23 140.633L308.421 138.741Z" stroke="#C3D2D8" stroke-linejoin="round"/>
                    <path d="M325.013 138.916L324.994 143.659L321.803 145.545L321.816 140.808L325.013 138.916Z" stroke="#C3D2D8" stroke-linejoin="round"/>
                    <path d="M319.485 142.201L319.466 146.945L316.268 148.83L316.287 144.087L319.485 142.201Z" stroke="#C3D2D8" stroke-linejoin="round"/>
                    <path d="M313.95 145.48L313.931 150.224L310.74 152.109L310.759 147.372L313.95 145.48Z" stroke="#C3D2D8" stroke-linejoin="round"/>
                    <path d="M308.421 148.766L308.402 153.509L305.211 155.394L305.23 150.651L308.421 148.766Z" stroke="#C3D2D8" stroke-linejoin="round"/>
                    <path d="M325.013 148.941L324.994 153.677L321.803 155.569L321.816 150.826L325.013 148.941Z" stroke="#C3D2D8" stroke-linejoin="round"/>
                    <path d="M319.485 152.219L319.466 156.963L316.268 158.848L316.287 154.111L319.485 152.219Z" stroke="#C3D2D8" stroke-linejoin="round"/>
                    <path d="M313.95 155.505L313.931 160.248L310.74 162.133L310.759 157.39L313.95 155.505Z" stroke="#C3D2D8" stroke-linejoin="round"/>
                    <path d="M308.421 158.783L308.402 163.527L305.211 165.412L305.23 160.676L308.421 158.783Z" stroke="#C3D2D8" stroke-linejoin="round"/>
                    <path d="M316.867 162.924L344.141 178.942L328.026 187.645L370.058 212.398L297.396 255.048" stroke="#C3D2D8" stroke-linecap="round" stroke-linejoin="round" stroke-dasharray="4 4"/>
                    <path d="M359.58 252.223L341.619 241.602L366.51 241.57L384.472 252.19L359.58 252.223Z" fill="url(#paint4_linear_0:1)" stroke="#C3D2D8" stroke-width="2" stroke-linejoin="round"/>
                    <path d="M359.58 252.223L384.472 252.19L384.555 281.991L369.561 290.797L350.236 302.143L335.249 310.95L335.166 281.149L359.58 252.223Z" fill="#FFF0F9" fill-opacity="0.41" stroke="#C3D2D8" stroke-width="2" stroke-linejoin="round"/>
                    <path d="M317.256 300.037L317.211 270.528L335.166 281.149L335.249 310.95L317.326 300.037" fill="#9593A8"/>
                    <path d="M317.256 300.037L317.211 270.528L335.166 281.149L335.249 310.95L317.326 300.037" stroke="#C3D2D8" stroke-width="2" stroke-linejoin="round"/>
                    <path d="M335.166 281.148L317.211 270.527L341.618 241.601L359.58 252.222L335.166 281.148Z" fill="#9593A8" stroke="#C3D2D8" stroke-width="2" stroke-linejoin="round"/>
                    <path d="M344.166 294.329L344.141 300.368L340.077 302.772L340.096 296.733L344.166 294.329Z" stroke="#C3D2D8" stroke-linejoin="round"/>
                    <path d="M351.809 290.104L351.784 296.143L347.72 298.547L347.739 292.508L351.809 290.104Z" stroke="#C3D2D8" stroke-linejoin="round"/>
                    <path d="M344.166 283.436L344.141 289.475L340.077 291.879L340.096 285.84L344.166 283.436Z" stroke="#C3D2D8" stroke-linejoin="round"/>
                    <path d="M351.809 279.211L351.784 285.25L347.72 287.654L347.739 281.615L351.809 279.211Z" stroke="#C3D2D8" stroke-linejoin="round"/>
                    <path d="M373.083 277.637L373.058 283.676L368.994 286.08L369.019 280.041L373.083 277.637Z" stroke="#C3D2D8" stroke-linejoin="round"/>
                    <path d="M380.726 273.412L380.701 279.451L376.637 281.855L376.663 275.816L380.726 273.412Z" stroke="#C3D2D8" stroke-linejoin="round"/>
                    <path d="M373.083 266.744L373.058 272.783L368.994 275.187L369.019 269.148L373.083 266.744Z" stroke="#C3D2D8" stroke-linejoin="round"/>
                    <path d="M380.726 262.519L380.701 268.558L376.637 270.969L376.663 264.93L380.726 262.519Z" stroke="#C3D2D8" stroke-linejoin="round"/>
                    <path d="M361.255 266.789C359.344 267.897 357.822 267.003 357.816 264.794C357.88 263.588 358.223 262.415 358.818 261.37C359.412 260.325 360.241 259.438 361.236 258.78C363.147 257.672 364.663 258.566 364.669 260.77C364.605 261.975 364.263 263.149 363.67 264.195C363.077 265.241 362.249 266.13 361.255 266.789V266.789ZM361.255 258.249C360.129 258.994 359.192 259.999 358.52 261.183C357.848 262.366 357.461 263.695 357.389 265.059C357.389 267.56 359.141 268.571 361.281 267.321C362.407 266.574 363.344 265.568 364.016 264.383C364.688 263.199 365.075 261.87 365.147 260.504C365.147 258.003 363.395 256.992 361.255 258.249Z" fill="#A7B3C2"/>
                    <path d="M94.2377 179.253L76.2824 168.639L88.1995 173.739L106.161 184.353L94.2377 179.253Z" fill="#9593A8" stroke="#C3D2D8" stroke-width="2" stroke-linejoin="round"/>
                    <path d="M94.2377 179.253L106.161 184.353L106.301 236.107L99.1358 240.319L89.8875 245.749L82.7155 249.968L82.569 198.207L94.2377 179.253Z" fill="#FFF0F9" fill-opacity="0.41" stroke="#C3D2D8" stroke-width="2" stroke-linejoin="round"/>
                    <path d="M64.703 239.127L64.6902 214.517L64.6138 187.593L82.5691 198.207L82.7156 249.968L75.0341 245.425L64.4609 239.127" fill="#9593A8"/>
                    <path d="M64.703 239.127L64.6902 214.517L64.6138 187.593L82.5691 198.207L82.7156 249.968L75.0341 245.425L64.4609 239.127" stroke="#C3D2D8" stroke-width="2" stroke-linejoin="round"/>
                    <path d="M82.5693 198.207L64.614 187.593L76.2827 168.639L94.238 179.253L82.5693 198.207Z" fill="url(#paint5_linear_0:1)" stroke="#C3D2D8" stroke-width="2" stroke-linejoin="round"/>
                    <path d="M92.3397 200.332L92.3142 206.371L88.2441 208.775L88.2696 202.736L92.3397 200.332Z" stroke="#C3D2D8" stroke-linejoin="round"/>
                    <path d="M101.263 195.382L101.238 201.421L97.1677 203.825L97.1931 197.786L101.263 195.382Z" stroke="#C3D2D8" stroke-linejoin="round"/>
                    <path d="M92.3397 213.292L92.3142 219.331L88.2441 221.735L88.2696 215.696L92.3397 213.292Z" stroke="#C3D2D8" stroke-linejoin="round"/>
                    <path d="M101.263 208.341L101.238 214.38L97.1677 216.784L97.1931 210.745L101.263 208.341Z" stroke="#C3D2D8" stroke-linejoin="round"/>
                    <path d="M92.3397 226.252L92.3142 232.291L88.2441 234.695L88.2696 228.656L92.3397 226.252Z" stroke="#C3D2D8" stroke-linejoin="round"/>
                    <path d="M101.263 221.301L101.238 227.34L97.1677 229.744L97.1931 223.705L101.263 221.301Z" stroke="#C3D2D8" stroke-linejoin="round"/>
                    <path d="M328.026 140.873L352.586 155.317L329.096 169.19" stroke="#C3D2D8" stroke-linecap="round" stroke-linejoin="round" stroke-dasharray="4 4"/>
                    <path d="M374.268 193.068L356.389 203.624" stroke="#C3D2D8" stroke-linecap="round" stroke-linejoin="round" stroke-dasharray="4 4"/>
                    <path d="M297.396 255.048L319.338 268.021" stroke="#C3D2D8" stroke-linecap="round" stroke-linejoin="round" stroke-dasharray="4 4"/>
                    <path d="M400 107.807L390.128 113.638L380.108 107.755L389.981 101.923L400 107.807Z" fill="url(#paint6_linear_0:1)" stroke="#C3D2D8" stroke-width="2" stroke-linejoin="round"/>
                    <path d="M400 107.807L399.981 119.004L390.115 124.842L390.127 113.638L400 107.807Z" fill="#FFF0F9" fill-opacity="0.41" stroke="#C3D2D8" stroke-width="2" stroke-linejoin="round"/>
                    <path d="M390.128 113.638L390.115 124.842L380.096 118.952L380.108 107.755L390.128 113.638Z" fill="#9593A8" stroke="#C3D2D8" stroke-width="2" stroke-linejoin="round"/>
                    <path d="M339.277 69.3712L338.943 69.7117L350.822 76.5215L362.212 69.7117L362.212 69.3712" fill="#9593A8"/>
                    <path d="M362.427 69.7633L362.567 119.574L358.994 121.673L354.389 124.375L350.816 126.475L350.676 76.6644L362.427 69.7633Z" fill="#FFF0F9" fill-opacity="0.41" stroke="#C3D2D8" stroke-width="2" stroke-linejoin="round"/>
                    <path d="M350.816 126.475L339.147 119.574L339.007 69.7633L350.676 76.6644L350.816 126.475Z" fill="#9593A8" stroke="#C3D2D8" stroke-width="2" stroke-linejoin="round"/>
                    <path d="M362.427 69.7633L350.676 76.6644L339.007 69.7633" stroke="#C3D2D8" stroke-width="2" stroke-linejoin="round"/>
                    <path d="M362.249 69.4912L350.784 58.4755L339.319 69.4912" fill="#9593A8"/>
                    <path d="M362.249 69.4912L350.784 58.4755L339.319 69.4912" stroke="#C3D2D8" stroke-width="2" stroke-linejoin="round"/>
                    <path d="M350.784 58.4755V76.619" stroke="#C3D2D8" stroke-width="2" stroke-linejoin="round"/>
                    <path d="M358.975 77.1439L358.956 81.8871L355.758 83.7793L355.777 79.036L358.975 77.1439Z" stroke="#C3D2D8" stroke-linejoin="round"/>
                    <path d="M358.975 86.2157L358.956 90.9589L355.758 92.851L355.777 88.1078L358.975 86.2157Z" stroke="#C3D2D8" stroke-linejoin="round"/>
                    <path d="M358.975 95.2874L358.956 100.031L355.758 101.923L355.777 97.1796L358.975 95.2874Z" stroke="#C3D2D8" stroke-linejoin="round"/>
                    <path d="M358.975 104.359L358.956 109.102L355.758 110.995L355.777 106.251L358.975 104.359Z" stroke="#C3D2D8" stroke-linejoin="round"/>
                    <path d="M358.975 113.431L358.956 118.174L355.758 120.066L355.777 115.323L358.975 113.431Z" stroke="#C3D2D8" stroke-linejoin="round"/>
                    <path d="M343.656 77.1439L343.676 81.8871L346.873 83.7793L346.854 79.036L343.656 77.1439Z" stroke="#C3D2D8" stroke-linejoin="round"/>
                    <path d="M343.656 86.2157L343.676 90.9589L346.873 92.851L346.854 88.1078L343.656 86.2157Z" stroke="#C3D2D8" stroke-linejoin="round"/>
                    <path d="M343.656 95.2874L343.676 100.031L346.873 101.923L346.854 97.1796L343.656 95.2874Z" stroke="#C3D2D8" stroke-linejoin="round"/>
                    <path d="M343.656 104.359L343.676 109.102L346.873 110.995L346.854 106.251L343.656 104.359Z" stroke="#C3D2D8" stroke-linejoin="round"/>
                    <path d="M343.656 113.431L343.676 118.174L346.873 120.066L346.854 115.323L343.656 113.431Z" stroke="#C3D2D8" stroke-linejoin="round"/>
                    <path d="M344.102 122.347L327.943 131.892" stroke="#C3D2D8" stroke-linecap="round" stroke-linejoin="round" stroke-dasharray="4 4"/>
                    <path d="M106.053 261.703L93.9512 254.575L106.053 243.559L117.518 254.575L106.053 261.703Z" fill="#FBF9FF"/>
                    <path d="M117.971 254.428L106.253 261.408L94.7018 254.428" fill="#9593A8"/>
                    <path d="M106.282 298.074L106.384 261.69L94.6391 254.789L94.499 304.599L98.0722 306.699L102.677 309.407L106.251 311.507" fill="#9593A8"/>
                    <path d="M106.282 298.074L106.384 261.69L94.6391 254.789L94.499 304.599L98.0722 306.699L102.677 309.407L106.251 311.507" stroke="#C3D2D8" stroke-width="2" stroke-linejoin="round"/>
                    <path d="M117.958 291.102L118.059 254.789L106.384 261.69L106.251 298.074" fill="#FFF0F9" fill-opacity="0.41"/>
                    <path d="M117.958 291.102L118.059 254.789L106.384 261.69L106.251 298.074" stroke="#C3D2D8" stroke-width="2" stroke-linejoin="round"/>
                    <path d="M94.6392 254.789L106.384 261.69L118.059 254.789" stroke="#C3D2D8" stroke-width="2" stroke-linejoin="round"/>
                    <path d="M94.8112 254.523L106.276 243.507L117.741 254.523" fill="#9593A8"/>
                    <path d="M94.8112 254.523L106.276 243.507L117.741 254.523" stroke="#C3D2D8" stroke-width="2" stroke-linejoin="round"/>
                    <path d="M106.276 243.507V261.651" stroke="#C3D2D8" stroke-width="2" stroke-linejoin="round"/>
                    <path d="M98.3971 275.22L98.4226 281.259L102.486 283.663L102.467 277.624L98.3971 275.22Z" stroke="#C3D2D8" stroke-linejoin="round"/>
                    <path d="M98.3971 262.992L98.4226 269.031L102.486 271.435L102.467 265.396L98.3971 262.992Z" stroke="#C3D2D8" stroke-linejoin="round"/>
                    <path d="M109.225 303.083L109.251 309.122L113.314 311.526L113.295 305.487L109.225 303.083Z" stroke="#C3D2D8" stroke-linejoin="round"/>
                    <path d="M98.3971 288.179L98.4226 294.219L102.486 296.623L102.467 290.583L98.3971 288.179Z" stroke="#C3D2D8" stroke-linejoin="round"/>
                    <path d="M106.27 298.009L118.359 305.118L118.34 318.635L106.251 311.533" fill="#9593A8"/>
                    <path d="M106.27 298.009L118.359 305.118L118.34 318.635L106.251 311.533" stroke="#C3D2D8" stroke-width="2" stroke-linejoin="round"/>
                    <path d="M130.269 298.074L118.359 305.118L106.269 298.009L118.18 290.972L130.269 298.074Z" fill="url(#paint7_linear_0:1)" stroke="#C3D2D8" stroke-width="2" stroke-linejoin="round"/>
                    <path d="M130.27 298.074L130.251 311.591L118.34 318.635L118.359 305.118L130.27 298.074Z" fill="#FFF0F9" fill-opacity="0.41" stroke="#C3D2D8" stroke-width="2" stroke-linejoin="round"/>
                    <path d="M278.772 286.346L269.893 291.594L260.88 286.3L269.759 281.052L278.772 286.346Z" fill="url(#paint8_linear_0:1)" stroke="#C3D2D8" stroke-width="2" stroke-linejoin="round"/>
                    <path d="M278.772 286.346L278.759 296.422L269.88 301.67L269.893 291.594L278.772 286.346Z" fill="#FFF0F9" fill-opacity="0.41" stroke="#C3D2D8" stroke-width="2" stroke-linejoin="round"/>
                    <path d="M269.893 291.594L269.88 301.67L260.867 296.376L260.88 286.3L269.893 291.594Z" fill="#9593A8" stroke="#C3D2D8" stroke-width="2" stroke-linejoin="round"/>
                    <path d="M413 180.245C413 178.262 412.437 176.321 411.378 174.656C410.319 172.991 408.809 171.673 407.031 170.861C405.253 170.049 403.281 169.777 401.355 170.079C399.428 170.38 397.628 171.242 396.172 172.561C394.716 173.879 393.665 175.597 393.147 177.509C392.629 179.421 392.665 181.444 393.252 183.336C393.838 185.227 394.949 186.905 396.452 188.169C397.954 189.432 399.784 190.227 401.72 190.457V202.652L402.898 203.345L404.064 202.658V190.457C406.524 190.163 408.793 188.961 410.44 187.079C412.087 185.197 412.998 182.765 413 180.245V180.245Z" fill="url(#paint9_radial_0:1)" stroke="#C3D2D8" stroke-width="2" stroke-linejoin="round"/>
                    <path d="M318.95 302.61C319.224 302.689 319.503 302.751 319.784 302.798V314.384L320.962 315.071L322.122 314.39V302.798C323.131 302.627 324.094 302.239 324.944 301.659C325.794 301.079 326.512 300.32 327.051 299.435C327.589 298.549 327.935 297.556 328.066 296.523C328.196 295.491 328.108 294.441 327.807 293.446C327.505 292.451 326.999 291.532 326.32 290.753C325.641 289.973 324.807 289.35 323.872 288.925C322.937 288.501 321.924 288.285 320.9 288.291C319.877 288.298 318.866 288.527 317.937 288.963" fill="url(#paint10_radial_0:1)"/>
                    <path d="M318.95 302.61C319.224 302.689 319.503 302.751 319.784 302.798V314.384L320.962 315.071L322.122 314.39V302.798C323.131 302.627 324.094 302.239 324.944 301.659C325.794 301.079 326.512 300.32 327.051 299.435C327.589 298.549 327.935 297.556 328.066 296.523C328.196 295.491 328.108 294.441 327.807 293.446C327.505 292.451 326.999 291.532 326.32 290.753C325.641 289.973 324.807 289.35 323.872 288.925C322.937 288.501 321.924 288.285 320.9 288.291C319.877 288.298 318.866 288.527 317.937 288.963" stroke="#C3D2D8" stroke-width="2" stroke-linejoin="round"/>
                    <path d="M321.032 296.363C321.034 294.38 320.472 292.438 319.414 290.773C318.355 289.107 316.846 287.788 315.068 286.975C313.29 286.162 311.318 285.89 309.391 286.19C307.464 286.491 305.664 287.353 304.207 288.671C302.75 289.989 301.699 291.707 301.18 293.619C300.662 295.531 300.698 297.555 301.284 299.446C301.87 301.338 302.981 303.017 304.484 304.281C305.986 305.544 307.816 306.339 309.752 306.569V318.771L310.931 319.464L312.096 318.777V306.569C314.557 306.278 316.826 305.078 318.474 303.197C320.121 301.315 321.032 298.883 321.032 296.363Z" fill="url(#paint11_radial_0:1)" stroke="#C3D2D8" stroke-width="2" stroke-linejoin="round"/>
                    <path d="M78.257 229.971C78.2569 227.989 77.6938 226.049 76.6353 224.385C75.5768 222.721 74.0681 221.403 72.2908 220.591C70.5135 219.779 68.5433 219.506 66.6174 219.807C64.6915 220.107 62.892 220.967 61.4354 222.283C59.9788 223.6 58.9272 225.317 58.4072 227.227C57.8872 229.137 57.921 231.16 58.5045 233.051C59.0879 234.942 60.1962 236.621 61.696 237.887C63.1957 239.152 65.0229 239.95 66.9577 240.183V252.378L68.1361 253.072L69.2953 252.385V240.183C71.7608 239.897 74.0366 238.698 75.6892 236.815C77.3419 234.931 78.2558 232.495 78.257 229.971V229.971Z" fill="url(#paint12_radial_0:1)" stroke="#C3D2D8" stroke-width="2" stroke-linejoin="round"/>
                    <path d="M264.982 283.78L256.791 278.959L296.052 255.851" stroke="#C3D2D8" stroke-linecap="round" stroke-linejoin="round" stroke-dasharray="4 4"/>
                    <path d="M101.951 247L95.2379 242.827" stroke="#C3D2D8" stroke-linecap="round" stroke-linejoin="round" stroke-dasharray="4 4"/>
                    <path d="M147.428 275.22L118.053 256.985" stroke="#C3D2D8" stroke-linecap="round" stroke-linejoin="round" stroke-dasharray="4 4"/>
                    <path d="M255.536 279.794L206.759 312.038L174.626 292.1" stroke="#C3D2D8" stroke-linecap="round" stroke-linejoin="round" stroke-dasharray="4 4"/>
                    <path d="M193.052 304.709L153.925 330.577L125.69 314.287" stroke="#C3D2D8" stroke-linecap="round" stroke-linejoin="round" stroke-dasharray="4 4"/>
                    <path d="M275.612 245.639L292.975 255.968" stroke="#C3D2D8" stroke-linecap="round" stroke-linejoin="round" stroke-dasharray="4 4"/>
                    <path d="M282.294 242.38L299.555 252.65" stroke="#C3D2D8" stroke-linecap="round" stroke-linejoin="round" stroke-dasharray="4 4"/>
                    <path d="M272.835 247.855L290.198 258.184" stroke="#C3D2D8" stroke-linecap="round" stroke-linejoin="round" stroke-dasharray="4 4"/>
                    <path d="M284.294 240.254L301.313 250.104" stroke="#C3D2D8" stroke-linecap="round" stroke-linejoin="round" stroke-dasharray="4 4"/>
                    <path d="M279.3 244.201L296.606 254.497" stroke="#C3D2D8" stroke-linecap="round" stroke-linejoin="round" stroke-dasharray="4 4"/>
                    <path d="M245.543 75.8285C245.543 71.2472 242.358 69.4005 238.428 71.7008L140.288 129.371C136.384 131.646 133.199 137.218 133.199 141.8L133.39 210.428C133.39 215.009 136.575 216.849 140.505 214.549L238.651 156.878C242.568 154.578 245.727 149.012 245.715 144.431L245.543 75.8285Z" stroke="#C3D2D8" stroke-miterlimit="10"/>
                    <path d="M245.084 62.6096C247.867 60.9702 250.129 62.2856 250.141 65.5385L250.396 149.316C250.396 152.556 248.16 156.528 245.377 158.168L133.913 223.647C131.136 225.28 128.868 223.971 128.862 220.718L128.626 136.94C128.626 133.7 130.868 129.721 133.652 128.088L245.084 62.6096Z" fill="url(#paint13_linear_0:1)" stroke="#C3D2D8" stroke-width="2" stroke-linejoin="round"/>
                    <path d="M248.67 62.2467L244.409 59.7325C243.492 59.1882 242.224 59.266 240.823 60.0889L129.378 125.568C126.594 127.201 124.346 131.166 124.352 134.419L124.588 218.197C124.588 219.811 125.155 220.951 126.059 221.482L130.314 224.003C129.41 223.465 128.849 222.331 128.849 220.718L128.613 136.94C128.613 133.7 130.855 129.721 133.639 128.088L245.103 62.6096C245.826 62.142 246.667 61.8988 247.523 61.9098C247.933 61.9251 248.333 62.0407 248.689 62.2467H248.67Z" fill="url(#paint14_linear_0:1)" stroke="#C3D2D8" stroke-width="2" stroke-linejoin="round"/>
                    <path d="M246.097 157.773C248.88 156.14 253.377 156.133 256.141 157.773L327.338 199.891C330.109 201.524 330.09 204.181 327.306 205.814L215.842 271.26C213.059 272.893 208.555 272.893 205.791 271.26L134.594 229.141C131.823 227.502 131.843 224.852 134.594 223.219L246.097 157.773Z" fill="url(#paint15_linear_0:1)" stroke="#C3D2D8" stroke-width="2" stroke-linejoin="round"/>
                    <path d="M292.307 190.12L248.358 164.129C247.579 163.724 246.717 163.512 245.842 163.512C244.967 163.512 244.105 163.724 243.326 164.129L145.403 221.631C144.015 222.448 144.008 223.776 145.403 224.593L189.352 250.59C190.132 250.992 190.993 251.202 191.868 251.202C192.742 251.202 193.604 250.992 194.384 250.59L292.281 193.088C293.676 192.265 293.689 190.943 292.281 190.12" stroke="#C3D2D8" stroke-width="0.5" stroke-linejoin="round"/>
                    <path d="M285.752 223.582L268.262 213.214C267.399 212.767 266.444 212.534 265.475 212.534C264.507 212.534 263.552 212.767 262.689 213.214L229.568 232.654C228.02 233.561 228.014 235.032 229.568 235.939L247.058 246.307C247.922 246.754 248.876 246.987 249.845 246.987C250.814 246.987 251.769 246.754 252.632 246.307L285.752 226.867C287.294 225.96 287.307 224.489 285.752 223.582Z" stroke="#C3D2D8" stroke-width="0.5" stroke-linejoin="round"/>
                    <path d="M284.854 235.744L327.325 210.797C328.72 209.974 329.421 208.899 329.421 207.816V202.807C329.421 203.883 328.727 204.965 327.325 205.788L215.861 271.235C213.078 272.867 208.575 272.867 205.81 271.235L134.613 229.116C134.007 228.776 133.479 228.308 133.066 227.742C132.739 227.286 132.559 226.738 132.55 226.174V226.174V231.189C132.55 232.252 133.238 233.315 134.613 234.125L205.81 276.244C208.575 277.883 213.078 277.883 215.861 276.244L265.683 247" fill="url(#paint16_linear_0:1)"/>
                    <path d="M284.854 235.744L327.325 210.797C328.72 209.974 329.421 208.899 329.421 207.816V202.807C329.421 203.883 328.727 204.965 327.325 205.788L215.861 271.235C213.078 272.867 208.575 272.867 205.81 271.235L134.613 229.116C134.007 228.776 133.479 228.308 133.066 227.742C132.739 227.286 132.559 226.738 132.55 226.174V226.174V231.189C132.55 232.252 133.238 233.315 134.613 234.125L205.81 276.244C208.575 277.883 213.078 277.883 215.861 276.244L265.683 247" stroke="#C3D2D8" stroke-width="2" stroke-linejoin="round"/>
                    <path d="M287.409 190.975L282.555 193.826C282.432 193.89 282.295 193.923 282.157 193.923C282.019 193.923 281.882 193.89 281.759 193.826L276.937 190.975C276.89 190.957 276.849 190.925 276.821 190.883C276.792 190.84 276.776 190.79 276.776 190.739C276.776 190.687 276.792 190.637 276.821 190.595C276.849 190.553 276.89 190.52 276.937 190.502L281.791 187.651C281.916 187.589 282.053 187.556 282.192 187.556C282.331 187.556 282.468 187.589 282.593 187.651L287.415 190.502C287.462 190.52 287.503 190.553 287.532 190.595C287.56 190.637 287.576 190.687 287.576 190.739C287.576 190.79 287.56 190.84 287.532 190.883C287.503 190.925 287.462 190.957 287.415 190.975M275.931 183.77L280.753 186.621C280.975 186.75 280.969 186.958 280.753 187.087L267.517 194.863C267.393 194.924 267.257 194.956 267.119 194.956C266.981 194.956 266.845 194.924 266.721 194.863L261.899 192.012C261.676 191.876 261.676 191.669 261.899 191.539L275.135 183.763C275.259 183.699 275.397 183.666 275.536 183.666C275.675 183.666 275.813 183.699 275.937 183.763L275.931 183.77ZM224.243 189.751C224.276 189.706 224.317 189.669 224.364 189.64L229.218 186.789C229.342 186.725 229.48 186.692 229.619 186.692C229.759 186.692 229.896 186.725 230.02 186.789L234.848 189.64C235.065 189.77 235.065 189.984 234.848 190.113L229.995 192.965C229.938 193 229.876 193.024 229.81 193.036C229.607 193.087 229.392 193.062 229.205 192.965L224.377 190.113C224.338 190.093 224.304 190.063 224.277 190.028C224.251 189.992 224.233 189.95 224.224 189.906C224.224 189.906 224.224 189.906 224.224 189.874C224.225 189.829 224.24 189.785 224.269 189.751H224.243ZM239.135 195.142C239.182 195.16 239.223 195.192 239.252 195.234C239.28 195.277 239.296 195.327 239.296 195.378C239.296 195.43 239.28 195.48 239.252 195.522C239.223 195.564 239.182 195.597 239.135 195.615L234.282 198.466C234.157 198.528 234.019 198.561 233.88 198.561C233.741 198.561 233.604 198.528 233.479 198.466L228.657 195.615C228.61 195.597 228.569 195.564 228.541 195.522C228.512 195.48 228.496 195.43 228.496 195.378C228.496 195.327 228.512 195.277 228.541 195.234C228.569 195.192 228.61 195.16 228.657 195.142L233.511 192.291C233.634 192.227 233.771 192.194 233.909 192.194C234.047 192.194 234.184 192.227 234.307 192.291L239.129 195.142H239.135ZM235.415 191.17L240.269 188.319C240.393 188.255 240.531 188.221 240.67 188.221C240.809 188.221 240.947 188.255 241.071 188.319L245.893 191.17C246.116 191.299 246.109 191.513 245.893 191.643L241.039 194.494C240.917 194.559 240.78 194.593 240.641 194.593C240.503 194.593 240.366 194.559 240.243 194.494L235.422 191.643C235.374 191.626 235.332 191.595 235.302 191.553C235.273 191.511 235.257 191.461 235.257 191.409C235.257 191.358 235.273 191.308 235.302 191.266C235.332 191.224 235.374 191.193 235.422 191.176L235.415 191.17ZM232.377 199.12C232.6 199.25 232.594 199.457 232.377 199.587L227.524 202.438C227.4 202.505 227.262 202.54 227.122 202.54C226.982 202.54 226.845 202.505 226.721 202.438L221.899 199.587C221.677 199.457 221.683 199.25 221.899 199.12L226.753 196.269C226.876 196.206 227.013 196.172 227.151 196.172C227.289 196.172 227.426 196.206 227.549 196.269L232.371 199.12H232.377ZM225.555 203.086C225.778 203.222 225.778 203.43 225.555 203.559L220.702 206.41C220.579 206.474 220.442 206.507 220.304 206.507C220.166 206.507 220.029 206.474 219.906 206.41L215.078 203.559C214.861 203.43 214.861 203.222 215.078 203.093L219.931 200.241C220.054 200.176 220.191 200.142 220.329 200.142C220.468 200.142 220.605 200.176 220.727 200.241L225.549 203.093L225.555 203.086ZM218.791 207.065C218.838 207.083 218.879 207.115 218.908 207.157C218.937 207.2 218.952 207.25 218.952 207.301C218.952 207.353 218.937 207.403 218.908 207.445C218.879 207.487 218.838 207.52 218.791 207.538L213.938 210.389C213.813 210.453 213.676 210.486 213.536 210.486C213.397 210.486 213.26 210.453 213.135 210.389L208.358 207.512C208.311 207.494 208.27 207.461 208.241 207.419C208.213 207.377 208.197 207.327 208.197 207.275C208.197 207.224 208.213 207.174 208.241 207.131C208.27 207.089 208.311 207.057 208.358 207.039L213.212 204.188C213.335 204.127 213.47 204.095 213.607 204.095C213.743 204.095 213.878 204.127 214.001 204.188L218.829 207.039L218.791 207.065ZM212.065 211.011C212.112 211.029 212.153 211.061 212.182 211.104C212.211 211.146 212.226 211.196 212.226 211.247C212.226 211.299 212.211 211.349 212.182 211.391C212.153 211.434 212.112 211.466 212.065 211.484L207.205 214.335C207.081 214.399 206.943 214.432 206.804 214.432C206.665 214.432 206.527 214.399 206.403 214.335L201.581 211.484C201.534 211.466 201.493 211.434 201.464 211.391C201.436 211.349 201.42 211.299 201.42 211.247C201.42 211.196 201.436 211.146 201.464 211.104C201.493 211.061 201.534 211.029 201.581 211.011L206.447 208.16C206.571 208.096 206.707 208.063 206.845 208.063C206.984 208.063 207.12 208.096 207.244 208.16L212.065 211.011V211.011ZM205.307 214.983C205.354 215.001 205.395 215.034 205.424 215.076C205.453 215.118 205.468 215.168 205.468 215.22C205.468 215.271 205.453 215.321 205.424 215.363C205.395 215.406 205.354 215.438 205.307 215.456L200.454 218.307C200.33 218.373 200.192 218.407 200.052 218.407C199.913 218.407 199.775 218.373 199.651 218.307L194.83 215.456C194.782 215.44 194.74 215.408 194.71 215.366C194.681 215.325 194.665 215.274 194.665 215.223C194.665 215.171 194.681 215.121 194.71 215.079C194.74 215.037 194.782 215.006 194.83 214.99L199.689 212.138C199.813 212.075 199.949 212.041 200.087 212.041C200.226 212.041 200.362 212.075 200.486 212.138L205.307 214.99V214.983ZM198.549 218.962C198.772 219.091 198.766 219.305 198.549 219.435L193.696 222.286C193.572 222.348 193.436 222.381 193.298 222.381C193.16 222.381 193.023 222.348 192.9 222.286L188.078 219.435C188.03 219.418 187.988 219.387 187.959 219.345C187.929 219.303 187.913 219.253 187.913 219.201C187.913 219.15 187.929 219.1 187.959 219.058C187.988 219.016 188.03 218.985 188.078 218.968L192.931 216.117C193.056 216.055 193.194 216.022 193.333 216.022C193.472 216.022 193.609 216.055 193.734 216.117L198.556 218.975L198.549 218.962ZM191.798 222.947C192.021 223.076 192.021 223.284 191.798 223.413L186.944 226.264C186.82 226.328 186.682 226.362 186.543 226.362C186.404 226.362 186.266 226.328 186.142 226.264L181.32 223.413C181.104 223.284 181.104 223.076 181.32 222.947L186.174 220.096C186.297 220.032 186.433 219.999 186.572 219.999C186.71 219.999 186.846 220.032 186.97 220.096L191.791 222.947H191.798ZM189.766 225.947L194.626 223.096C194.75 223.032 194.888 222.999 195.027 222.999C195.166 222.999 195.304 223.032 195.428 223.096L200.25 225.947C200.466 226.077 200.466 226.284 200.25 226.42L195.396 229.271C195.273 229.335 195.137 229.368 194.998 229.368C194.86 229.368 194.724 229.335 194.6 229.271L189.779 226.42C189.556 226.284 189.556 226.077 189.779 225.947H189.766ZM196.581 222.415C196.534 222.397 196.493 222.365 196.464 222.323C196.436 222.28 196.42 222.23 196.42 222.179C196.42 222.128 196.436 222.077 196.464 222.035C196.493 221.993 196.534 221.961 196.581 221.942L201.435 219.091C201.559 219.026 201.696 218.992 201.836 218.992C201.976 218.992 202.113 219.026 202.237 219.091L207.059 221.942C207.107 221.959 207.148 221.99 207.178 222.032C207.207 222.074 207.223 222.124 207.223 222.176C207.223 222.227 207.207 222.277 207.178 222.319C207.148 222.361 207.107 222.392 207.059 222.409L202.199 225.26C202.076 225.324 201.939 225.357 201.801 225.357C201.663 225.357 201.526 225.324 201.403 225.26L196.581 222.409V222.415ZM203.409 218.398C203.186 218.268 203.186 218.061 203.409 217.931L208.263 215.08C208.387 215.016 208.524 214.983 208.664 214.983C208.803 214.983 208.941 215.016 209.065 215.08L213.887 217.931C214.103 218.061 214.103 218.268 213.887 218.398L209.033 221.249C208.91 221.313 208.774 221.346 208.635 221.346C208.497 221.346 208.36 221.313 208.237 221.249L203.416 218.398H203.409ZM210.237 214.393C210.19 214.375 210.149 214.343 210.12 214.301C210.092 214.258 210.076 214.208 210.076 214.157C210.076 214.105 210.092 214.055 210.12 214.013C210.149 213.971 210.19 213.938 210.237 213.92L215.097 211.069C215.22 211.006 215.357 210.972 215.495 210.972C215.633 210.972 215.77 211.006 215.893 211.069L220.715 213.92C220.762 213.938 220.803 213.971 220.832 214.013C220.86 214.055 220.876 214.105 220.876 214.157C220.876 214.208 220.86 214.258 220.832 214.301C220.803 214.343 220.762 214.375 220.715 214.393L215.861 217.245C215.736 217.307 215.599 217.339 215.46 217.339C215.321 217.339 215.184 217.307 215.059 217.245L210.237 214.393ZM217.065 210.382C217.018 210.364 216.977 210.332 216.948 210.29C216.92 210.247 216.904 210.197 216.904 210.146C216.904 210.094 216.92 210.044 216.948 210.002C216.977 209.96 217.018 209.927 217.065 209.909L221.919 207.058C222.043 206.994 222.18 206.961 222.32 206.961C222.459 206.961 222.597 206.994 222.721 207.058L227.543 209.909C227.59 209.927 227.631 209.96 227.659 210.002C227.688 210.044 227.704 210.094 227.704 210.146C227.704 210.197 227.688 210.247 227.659 210.29C227.631 210.332 227.59 210.364 227.543 210.382L222.683 213.234C222.56 213.297 222.423 213.33 222.285 213.33C222.146 213.33 222.01 213.297 221.887 213.234L217.065 210.382V210.382ZM223.893 206.371C223.67 206.242 223.67 206.028 223.893 205.905L228.747 203.054C228.871 202.988 229.008 202.954 229.148 202.954C229.287 202.954 229.425 202.988 229.549 203.054L234.371 205.905C234.587 206.028 234.581 206.242 234.371 206.371L229.517 209.222C229.394 209.286 229.257 209.319 229.119 209.319C228.981 209.319 228.844 209.286 228.721 209.222L223.899 206.371H223.893ZM230.721 202.367C230.498 202.231 230.498 202.023 230.721 201.894L235.581 199.043C235.704 198.979 235.841 198.946 235.979 198.946C236.117 198.946 236.254 198.979 236.377 199.043L241.199 201.894C241.247 201.91 241.288 201.942 241.318 201.983C241.347 202.025 241.363 202.076 241.363 202.127C241.363 202.179 241.347 202.229 241.318 202.271C241.288 202.312 241.247 202.344 241.199 202.36L236.345 205.211C236.221 205.277 236.084 205.311 235.944 205.311C235.804 205.311 235.667 205.277 235.543 205.211L230.721 202.36V202.367ZM237.549 198.349C237.502 198.331 237.461 198.299 237.432 198.257C237.404 198.214 237.388 198.164 237.388 198.113C237.388 198.061 237.404 198.011 237.432 197.969C237.461 197.927 237.502 197.894 237.549 197.876L242.403 195.025C242.527 194.961 242.664 194.928 242.804 194.928C242.943 194.928 243.081 194.961 243.205 195.025L248.027 197.876C248.074 197.894 248.115 197.927 248.143 197.969C248.172 198.011 248.188 198.061 248.188 198.113C248.188 198.164 248.172 198.214 248.143 198.257C248.115 198.299 248.074 198.331 248.027 198.349L243.173 201.2C243.05 201.264 242.913 201.297 242.775 201.297C242.637 201.297 242.5 201.264 242.377 201.2L237.555 198.349H237.549ZM244.377 194.338C244.154 194.209 244.16 193.995 244.377 193.865L249.23 191.014C249.353 190.949 249.49 190.915 249.629 190.915C249.767 190.915 249.904 190.949 250.027 191.014L254.855 193.904C254.903 193.921 254.944 193.952 254.974 193.994C255.003 194.036 255.019 194.086 255.019 194.137C255.019 194.189 255.003 194.239 254.974 194.281C254.944 194.323 254.903 194.354 254.855 194.371L250.001 197.222C249.877 197.286 249.739 197.319 249.6 197.319C249.461 197.319 249.323 197.286 249.199 197.222L244.377 194.371V194.338ZM251.205 190.36C250.982 190.23 250.982 190.023 251.205 189.893L256.065 187.042C256.188 186.978 256.325 186.945 256.463 186.945C256.601 186.945 256.738 186.978 256.861 187.042L261.683 189.893C261.731 189.91 261.772 189.941 261.802 189.983C261.831 190.025 261.847 190.075 261.847 190.126C261.847 190.178 261.831 190.228 261.802 190.27C261.772 190.312 261.731 190.343 261.683 190.36L256.823 193.217C256.699 193.278 256.563 193.31 256.425 193.31C256.287 193.31 256.151 193.278 256.027 193.217L251.205 190.36ZM258.039 186.329C257.994 186.307 257.955 186.273 257.926 186.231C257.897 186.189 257.879 186.141 257.874 186.089C257.879 186.039 257.897 185.991 257.926 185.951C257.955 185.91 257.994 185.877 258.039 185.856L261.657 183.731L262.294 183.368L262.485 183.258L262.918 183.005C263.043 182.941 263.18 182.908 263.32 182.908C263.459 182.908 263.596 182.941 263.721 183.005L268.542 185.856C268.708 185.953 268.746 186.096 268.663 186.219C268.628 186.264 268.585 186.301 268.536 186.329L268.103 186.582L267.702 186.815L267.3 187.055L263.683 189.18C263.559 189.244 263.423 189.277 263.285 189.277C263.146 189.277 263.01 189.244 262.886 189.18L258.065 186.329H258.039ZM259.441 183.705L254.581 186.556C254.456 186.62 254.319 186.653 254.179 186.653C254.04 186.653 253.903 186.62 253.778 186.556L248.957 183.705C248.909 183.687 248.869 183.654 248.84 183.612C248.811 183.57 248.796 183.52 248.796 183.468C248.796 183.417 248.811 183.367 248.84 183.325C248.869 183.282 248.909 183.25 248.957 183.232L253.81 180.381C253.934 180.32 254.07 180.288 254.208 180.288C254.346 180.288 254.482 180.32 254.606 180.381L259.428 183.232C259.651 183.368 259.651 183.575 259.428 183.705H259.441ZM252.664 187.204C252.711 187.222 252.752 187.254 252.78 187.297C252.809 187.339 252.824 187.389 252.824 187.441C252.824 187.492 252.809 187.542 252.78 187.584C252.752 187.627 252.711 187.659 252.664 187.677L247.81 190.528C247.686 190.592 247.548 190.625 247.409 190.625C247.269 190.625 247.132 190.592 247.008 190.528L242.186 187.677C242.139 187.659 242.098 187.627 242.069 187.584C242.04 187.542 242.025 187.492 242.025 187.441C242.025 187.389 242.04 187.339 242.069 187.297C242.098 187.254 242.139 187.222 242.186 187.204L247.046 184.353C247.169 184.289 247.306 184.256 247.444 184.256C247.582 184.256 247.719 184.289 247.842 184.353L252.664 187.204ZM248.205 182.253C248.171 182.3 248.128 182.337 248.078 182.364L243.224 185.215C243.101 185.278 242.964 185.312 242.826 185.312C242.688 185.312 242.551 185.278 242.428 185.215L237.606 182.364C237.561 182.341 237.522 182.308 237.493 182.266C237.464 182.224 237.446 182.175 237.441 182.124C237.446 182.074 237.464 182.026 237.493 181.985C237.522 181.944 237.561 181.912 237.606 181.891L242.46 179.039C242.583 178.973 242.721 178.94 242.861 178.942C243.001 178.939 243.139 178.973 243.262 179.039L248.084 181.891C248.133 181.917 248.174 181.954 248.205 182.001C248.232 182.037 248.247 182.081 248.247 182.127C248.247 182.173 248.232 182.217 248.205 182.253V182.253ZM241.479 185.772C241.702 185.902 241.695 186.109 241.479 186.238L236.625 189.09C236.502 189.153 236.366 189.187 236.227 189.187C236.089 189.187 235.953 189.153 235.829 189.09L231.008 186.238C230.785 186.109 230.791 185.902 231.008 185.772L235.861 182.921C235.985 182.854 236.122 182.819 236.262 182.819C236.402 182.819 236.54 182.854 236.664 182.921L241.485 185.772H241.479ZM228.282 193.548C228.498 193.677 228.498 193.885 228.282 194.014L223.422 196.872C223.299 196.933 223.164 196.964 223.027 196.964C222.89 196.964 222.755 196.933 222.632 196.872L217.81 194.014C217.587 193.885 217.587 193.677 217.81 193.548L222.664 190.697C222.788 190.633 222.926 190.6 223.065 190.6C223.204 190.6 223.342 190.633 223.466 190.697L228.294 193.548H228.282ZM221.689 197.436C221.906 197.559 221.899 197.773 221.689 197.902L216.836 200.753C216.712 200.817 216.576 200.85 216.438 200.85C216.299 200.85 216.163 200.817 216.04 200.753L211.218 197.902C210.995 197.773 210.995 197.559 211.218 197.436L216.001 194.552C216.126 194.49 216.264 194.457 216.403 194.457C216.542 194.457 216.679 194.49 216.804 194.552L221.626 197.41L221.689 197.436ZM215.021 201.298C215.186 201.395 215.224 201.537 215.135 201.661C215.104 201.707 215.063 201.745 215.014 201.771L210.161 204.622C210.102 204.652 210.04 204.676 209.976 204.693C209.836 204.728 209.689 204.728 209.549 204.693C209.485 204.676 209.423 204.652 209.365 204.622L204.543 201.771C204.496 201.753 204.455 201.72 204.426 201.678C204.397 201.636 204.382 201.586 204.382 201.534C204.382 201.483 204.397 201.433 204.426 201.39C204.455 201.348 204.496 201.316 204.543 201.298L209.396 198.447C209.521 198.383 209.658 198.349 209.798 198.349C209.937 198.349 210.074 198.383 210.199 198.447L215.021 201.298V201.298ZM208.415 205.186C208.632 205.315 208.632 205.523 208.415 205.652L203.562 208.503C203.439 208.567 203.302 208.6 203.164 208.6C203.026 208.6 202.889 208.567 202.766 208.503L197.944 205.652C197.721 205.523 197.721 205.315 197.944 205.186L202.798 202.334C202.922 202.271 203.06 202.237 203.199 202.237C203.338 202.237 203.476 202.271 203.6 202.334L208.422 205.186H208.415ZM201.817 209.073C202.04 209.203 202.033 209.417 201.817 209.546L196.963 212.398C196.84 212.461 196.704 212.495 196.565 212.495C196.427 212.495 196.29 212.461 196.167 212.398L191.346 209.546C191.298 209.528 191.258 209.496 191.229 209.454C191.2 209.412 191.185 209.361 191.185 209.31C191.185 209.259 191.2 209.208 191.229 209.166C191.258 209.124 191.298 209.092 191.346 209.073L196.199 206.222C196.323 206.159 196.461 206.125 196.6 206.125C196.74 206.125 196.877 206.159 197.002 206.222L201.823 209.073H201.817ZM195.218 212.961C195.441 213.091 195.435 213.305 195.218 213.434L190.365 216.286C190.242 216.349 190.107 216.382 189.97 216.382C189.832 216.382 189.697 216.349 189.575 216.286L184.747 213.434C184.7 213.416 184.659 213.384 184.63 213.342C184.601 213.299 184.586 213.249 184.586 213.198C184.586 213.146 184.601 213.096 184.63 213.054C184.659 213.012 184.7 212.979 184.747 212.961L189.6 210.11C189.725 210.046 189.862 210.013 190.002 210.013C190.141 210.013 190.278 210.046 190.403 210.11L195.224 212.961H195.218ZM188.626 216.849C188.842 216.979 188.836 217.186 188.626 217.316L183.766 220.167C183.644 220.231 183.508 220.264 183.371 220.264C183.234 220.264 183.098 220.231 182.976 220.167L178.155 217.316C177.932 217.186 177.932 216.972 178.155 216.849L183.008 213.998C183.132 213.933 183.27 213.899 183.409 213.899C183.549 213.899 183.687 213.933 183.811 213.998L188.639 216.849H188.626ZM182.033 220.737C182.081 220.755 182.121 220.788 182.15 220.83C182.179 220.872 182.194 220.922 182.194 220.974C182.194 221.025 182.179 221.075 182.15 221.117C182.121 221.16 182.081 221.192 182.033 221.21L177.18 224.061C177.057 224.125 176.92 224.158 176.782 224.158C176.644 224.158 176.507 224.125 176.384 224.061L171.562 221.21C171.515 221.192 171.474 221.16 171.445 221.117C171.417 221.075 171.401 221.025 171.401 220.974C171.401 220.922 171.417 220.872 171.445 220.83C171.474 220.788 171.515 220.755 171.562 220.737L176.422 217.886C176.547 217.822 176.684 217.789 176.823 217.789C176.963 217.789 177.1 217.822 177.225 217.886L182.046 220.737H182.033ZM175.435 224.625C175.483 224.642 175.524 224.673 175.554 224.715C175.583 224.757 175.599 224.807 175.599 224.858C175.599 224.91 175.583 224.96 175.554 225.002C175.524 225.044 175.483 225.075 175.435 225.092L170.581 227.949C170.457 228.01 170.321 228.042 170.183 228.042C170.045 228.042 169.909 228.01 169.785 227.949L164.925 225.007C164.702 224.878 164.702 224.67 164.925 224.541L169.779 221.69C169.902 221.626 170.039 221.593 170.177 221.593C170.315 221.593 170.452 221.626 170.575 221.69L175.397 224.541L175.435 224.625ZM174.543 226.951L179.403 224.094C179.526 224.03 179.663 223.997 179.801 223.997C179.939 223.997 180.076 224.03 180.199 224.094L185.021 226.945C185.068 226.963 185.109 226.995 185.137 227.038C185.166 227.08 185.182 227.13 185.182 227.181C185.182 227.233 185.166 227.283 185.137 227.325C185.109 227.367 185.068 227.4 185.021 227.418L180.161 230.269C180.038 230.333 179.901 230.366 179.763 230.366C179.624 230.366 179.488 230.333 179.365 230.269L174.543 227.418C174.32 227.288 174.327 227.081 174.543 226.951V226.951ZM182.932 229.99L187.785 227.139C187.909 227.075 188.047 227.042 188.186 227.042C188.326 227.042 188.463 227.075 188.588 227.139L193.409 229.99C193.626 230.12 193.626 230.327 193.409 230.457L188.556 233.308C188.432 233.37 188.296 233.403 188.158 233.403C188.02 233.403 187.883 233.37 187.76 233.308L182.938 230.457C182.715 230.321 182.715 230.113 182.938 229.984L182.932 229.99ZM193.186 231.928L198.04 229.077C198.164 229.013 198.302 228.98 198.441 228.98C198.58 228.98 198.718 229.013 198.842 229.077L203.664 231.928C203.711 231.946 203.752 231.978 203.781 232.021C203.809 232.063 203.825 232.113 203.825 232.164C203.825 232.216 203.809 232.266 203.781 232.308C203.752 232.35 203.711 232.383 203.664 232.401L198.81 235.252C198.687 235.316 198.551 235.349 198.412 235.349C198.274 235.349 198.138 235.316 198.014 235.252L193.193 232.401C193.145 232.383 193.105 232.35 193.076 232.308C193.047 232.266 193.032 232.216 193.032 232.164C193.032 232.113 193.047 232.063 193.076 232.021C193.105 231.978 193.145 231.946 193.193 231.928H193.186ZM200.065 228.364C200.018 228.346 199.977 228.314 199.948 228.271C199.92 228.229 199.904 228.179 199.904 228.127C199.904 228.076 199.92 228.026 199.948 227.984C199.977 227.941 200.018 227.909 200.065 227.891L204.919 225.04C205.043 224.976 205.181 224.943 205.32 224.943C205.459 224.943 205.597 224.976 205.721 225.04L210.543 227.891C210.59 227.909 210.631 227.941 210.66 227.984C210.688 228.026 210.704 228.076 210.704 228.127C210.704 228.179 210.688 228.229 210.66 228.271C210.631 228.314 210.59 228.346 210.543 228.364L205.689 231.215C205.566 231.279 205.43 231.312 205.291 231.312C205.153 231.312 205.017 231.279 204.893 231.215L200.072 228.364H200.065ZM206.944 224.327C206.721 224.197 206.721 223.984 206.944 223.86L211.804 221.009C211.928 220.942 212.065 220.907 212.205 220.907C212.345 220.907 212.483 220.942 212.607 221.009L217.428 223.86C217.645 223.984 217.645 224.197 217.428 224.327L212.575 227.178C212.451 227.242 212.315 227.275 212.177 227.275C212.038 227.275 211.902 227.242 211.778 227.178L206.957 224.327H206.944ZM213.823 220.29C213.775 220.274 213.733 220.242 213.704 220.2C213.674 220.159 213.659 220.108 213.659 220.057C213.659 220.005 213.674 219.955 213.704 219.913C213.733 219.871 213.775 219.84 213.823 219.824L218.677 216.972C218.8 216.905 218.938 216.87 219.078 216.87C219.218 216.87 219.356 216.905 219.479 216.972L224.282 219.824C224.505 219.953 224.498 220.16 224.282 220.29L219.428 223.141C219.306 223.205 219.171 223.238 219.033 223.238C218.896 223.238 218.761 223.205 218.638 223.141L213.81 220.29H213.823ZM220.683 216.253C220.46 216.124 220.46 215.916 220.683 215.787L225.536 212.935C225.661 212.872 225.798 212.838 225.938 212.838C226.077 212.838 226.214 212.872 226.339 212.935L231.161 215.787C231.377 215.916 231.377 216.124 231.161 216.253L226.307 219.111C226.183 219.172 226.047 219.203 225.909 219.203C225.771 219.203 225.635 219.172 225.511 219.111L220.689 216.253H220.683ZM227.562 212.223C227.339 212.087 227.339 211.879 227.562 211.75L232.415 208.898C232.54 208.835 232.677 208.801 232.817 208.801C232.956 208.801 233.093 208.835 233.218 208.898L238.039 211.75C238.256 211.879 238.256 212.087 238.039 212.223L233.186 215.074C233.063 215.138 232.926 215.171 232.788 215.171C232.65 215.171 232.513 215.138 232.39 215.074L227.568 212.223H227.562ZM234.409 208.16C234.359 208.133 234.315 208.096 234.282 208.05C234.199 207.927 234.243 207.784 234.403 207.687L239.262 204.836C239.386 204.769 239.524 204.735 239.664 204.738C239.803 204.737 239.941 204.77 240.065 204.836L244.887 207.687C244.934 207.705 244.975 207.737 245.003 207.779C245.032 207.822 245.047 207.872 245.047 207.923C245.047 207.975 245.032 208.025 245.003 208.067C244.975 208.109 244.934 208.142 244.887 208.16L240.033 211.011C239.974 211.045 239.909 211.069 239.842 211.082C239.772 211.092 239.702 211.092 239.632 211.082C239.494 211.085 239.358 211.051 239.237 210.985L234.409 208.16ZM241.275 204.123C241.228 204.105 241.187 204.072 241.158 204.03C241.13 203.988 241.114 203.938 241.114 203.886C241.114 203.835 241.13 203.785 241.158 203.743C241.187 203.7 241.228 203.668 241.275 203.65L246.129 200.799C246.253 200.735 246.39 200.702 246.53 200.702C246.669 200.702 246.807 200.735 246.931 200.799L251.759 203.65C251.976 203.779 251.976 203.993 251.759 204.123L246.906 206.974C246.783 207.038 246.648 207.071 246.511 207.071C246.373 207.071 246.238 207.038 246.116 206.974L241.288 204.123H241.275ZM248.16 200.086C248.112 200.069 248.071 200.038 248.041 199.996C248.012 199.954 247.996 199.904 247.996 199.853C247.996 199.801 248.012 199.751 248.041 199.709C248.071 199.667 248.112 199.636 248.16 199.619L253.014 196.768C253.138 196.703 253.276 196.669 253.415 196.669C253.555 196.669 253.692 196.703 253.816 196.768L258.638 199.619C258.855 199.742 258.855 199.956 258.638 200.086L253.785 202.937C253.661 203.001 253.525 203.034 253.387 203.034C253.248 203.034 253.112 203.001 252.988 202.937L248.167 200.086H248.16ZM255.039 196.049C254.816 195.919 254.816 195.712 255.039 195.582L259.893 192.731C260.017 192.666 260.154 192.632 260.294 192.632C260.434 192.632 260.571 192.666 260.695 192.731L265.517 195.582C265.734 195.712 265.727 195.919 265.517 196.049L260.664 198.9C260.54 198.964 260.404 198.997 260.265 198.997C260.127 198.997 259.991 198.964 259.867 198.9L255.046 196.049H255.039ZM262.052 175.676C262.19 175.674 262.326 175.707 262.447 175.774L274.033 182.623C274.078 182.644 274.117 182.676 274.146 182.717C274.175 182.758 274.193 182.806 274.198 182.856C274.194 182.908 274.175 182.958 274.145 183C274.114 183.042 274.074 183.075 274.026 183.096L270.447 185.195C270.326 185.262 270.19 185.295 270.052 185.292C269.914 185.296 269.778 185.262 269.657 185.195L263.689 181.67C263.566 181.606 263.429 181.573 263.291 181.573C263.153 181.573 263.016 181.606 262.893 181.67L261.332 182.584C261.208 182.648 261.07 182.681 260.931 182.681C260.792 182.681 260.654 182.648 260.53 182.584L255.708 179.733C255.66 179.716 255.619 179.685 255.589 179.643C255.559 179.601 255.544 179.551 255.544 179.499C255.544 179.448 255.559 179.398 255.589 179.356C255.619 179.314 255.66 179.283 255.708 179.266L261.651 175.774C261.774 175.707 261.912 175.673 262.052 175.676V175.676ZM255.256 171.659C255.396 171.656 255.534 171.689 255.657 171.756L260.479 174.607C260.524 174.629 260.564 174.663 260.593 174.705C260.622 174.747 260.639 174.796 260.644 174.847C260.639 174.898 260.62 174.947 260.59 174.988C260.56 175.029 260.519 175.061 260.472 175.08L249.829 181.333C249.706 181.397 249.569 181.43 249.431 181.43C249.293 181.43 249.156 181.397 249.033 181.333L244.211 178.482C244.164 178.464 244.123 178.432 244.095 178.389C244.066 178.347 244.051 178.297 244.051 178.246C244.051 178.194 244.066 178.144 244.095 178.102C244.123 178.06 244.164 178.027 244.211 178.009L254.855 171.756C254.978 171.69 255.116 171.656 255.256 171.659ZM241.479 169.598L246.332 166.747C246.456 166.682 246.594 166.648 246.734 166.648C246.873 166.648 247.011 166.682 247.135 166.747L251.957 169.598C252.18 169.734 252.18 169.942 251.957 170.071L247.097 172.922C246.973 172.986 246.837 173.019 246.699 173.019C246.56 173.019 246.424 172.986 246.301 172.922L241.479 170.071C241.431 170.055 241.389 170.023 241.36 169.982C241.33 169.94 241.314 169.89 241.314 169.838C241.314 169.787 241.33 169.736 241.36 169.694C241.389 169.653 241.431 169.621 241.479 169.605V169.598ZM234.135 173.914L238.989 171.063C239.113 171.002 239.249 170.97 239.387 170.97C239.524 170.97 239.66 171.002 239.785 171.063L244.606 173.914C244.829 174.05 244.829 174.257 244.606 174.387L239.753 177.238C239.628 177.302 239.491 177.335 239.352 177.335C239.212 177.335 239.075 177.302 238.95 177.238L234.129 174.387C234.081 174.369 234.041 174.336 234.012 174.294C233.983 174.252 233.968 174.202 233.968 174.15C233.968 174.099 233.983 174.049 234.012 174.007C234.041 173.964 234.081 173.932 234.129 173.914H234.135ZM226.778 178.236L231.632 175.385C231.756 175.319 231.893 175.285 232.033 175.285C232.173 175.285 232.31 175.319 232.434 175.385L237.256 178.236C237.479 178.372 237.479 178.579 237.256 178.709L232.396 181.56C232.273 181.624 232.136 181.657 231.998 181.657C231.86 181.657 231.723 181.624 231.6 181.56L226.778 178.709C226.73 178.692 226.689 178.661 226.659 178.619C226.63 178.577 226.614 178.527 226.614 178.476C226.614 178.424 226.63 178.374 226.659 178.332C226.689 178.29 226.73 178.259 226.778 178.242V178.236ZM219.435 182.551L224.288 179.7C224.412 179.639 224.548 179.608 224.686 179.608C224.824 179.608 224.96 179.639 225.084 179.7L229.906 182.551C230.129 182.688 230.129 182.895 229.906 183.024L225.052 185.876C224.929 185.939 224.793 185.973 224.654 185.973C224.516 185.973 224.379 185.939 224.256 185.876L219.435 183.024C219.387 183.006 219.346 182.974 219.318 182.932C219.289 182.89 219.274 182.839 219.274 182.788C219.274 182.737 219.289 182.686 219.318 182.644C219.346 182.602 219.387 182.57 219.435 182.551V182.551ZM211.944 186.958L216.798 184.107C216.921 184.043 217.057 184.01 217.196 184.01C217.334 184.01 217.47 184.043 217.594 184.107L222.415 186.958C222.463 186.976 222.503 187.008 222.532 187.05C222.561 187.093 222.576 187.143 222.576 187.194C222.576 187.246 222.561 187.296 222.532 187.338C222.503 187.38 222.463 187.413 222.415 187.431L217.562 190.282C217.437 190.346 217.3 190.379 217.161 190.379C217.021 190.379 216.884 190.346 216.759 190.282L211.938 187.431C211.721 187.301 211.721 187.094 211.938 186.964L211.944 186.958ZM204.587 191.273L209.447 188.422C209.57 188.361 209.705 188.33 209.842 188.33C209.979 188.33 210.114 188.361 210.237 188.422L215.059 191.273C215.282 191.409 215.282 191.617 215.059 191.746L210.199 194.597C210.076 194.661 209.939 194.694 209.801 194.694C209.662 194.694 209.526 194.661 209.403 194.597L204.575 191.746C204.358 191.617 204.358 191.409 204.575 191.273H204.587ZM197.231 195.595L202.084 192.744C202.207 192.679 202.344 192.645 202.482 192.645C202.621 192.645 202.758 192.679 202.88 192.744L207.702 195.595C207.925 195.731 207.925 195.939 207.702 196.068L202.849 198.92C202.724 198.983 202.587 199.017 202.447 199.017C202.308 199.017 202.171 198.983 202.046 198.92L197.224 196.068C197.008 195.939 197.008 195.731 197.224 195.602L197.231 195.595ZM189.887 199.885L194.74 197.034C194.865 196.973 195.001 196.941 195.138 196.941C195.276 196.941 195.412 196.973 195.537 197.034L200.358 199.885C200.581 200.021 200.581 200.228 200.358 200.358L195.498 203.209C195.374 203.273 195.236 203.306 195.097 203.306C194.958 203.306 194.82 203.273 194.696 203.209L189.887 200.384C189.84 200.366 189.799 200.334 189.77 200.291C189.741 200.249 189.726 200.199 189.726 200.147C189.726 200.096 189.741 200.046 189.77 200.004C189.799 199.961 189.84 199.929 189.887 199.911V199.885ZM182.416 204.272L187.269 201.421C187.392 201.357 187.529 201.324 187.667 201.324C187.806 201.324 187.942 201.357 188.065 201.421L192.893 204.272C192.941 204.29 192.981 204.322 193.01 204.365C193.039 204.407 193.054 204.457 193.054 204.508C193.054 204.56 193.039 204.61 193.01 204.652C192.981 204.694 192.941 204.727 192.893 204.745L188.04 207.596C187.916 207.66 187.78 207.693 187.642 207.693C187.503 207.693 187.367 207.66 187.244 207.596L182.416 204.745C182.368 204.728 182.326 204.697 182.296 204.655C182.267 204.613 182.251 204.563 182.251 204.512C182.251 204.46 182.267 204.41 182.296 204.368C182.326 204.326 182.368 204.295 182.416 204.278V204.272ZM175.072 208.587L179.925 205.736C180.049 205.675 180.185 205.644 180.323 205.644C180.461 205.644 180.597 205.675 180.721 205.736L185.543 208.587C185.59 208.606 185.631 208.638 185.66 208.68C185.689 208.722 185.704 208.773 185.704 208.824C185.704 208.875 185.689 208.926 185.66 208.968C185.631 209.01 185.59 209.042 185.543 209.06L180.69 211.912C180.565 211.975 180.428 212.009 180.288 212.009C180.149 212.009 180.011 211.975 179.887 211.912L175.065 209.06C174.842 208.931 174.849 208.724 175.065 208.587H175.072ZM167.715 212.91L172.569 210.058C172.691 209.993 172.828 209.959 172.967 209.959C173.105 209.959 173.242 209.993 173.365 210.058L178.193 212.91C178.24 212.928 178.281 212.96 178.309 213.002C178.338 213.044 178.354 213.095 178.354 213.146C178.354 213.197 178.338 213.248 178.309 213.29C178.281 213.332 178.24 213.364 178.193 213.383L173.339 216.234C173.216 216.297 173.08 216.331 172.941 216.331C172.803 216.331 172.666 216.297 172.543 216.234L167.715 213.383C167.667 213.366 167.625 213.335 167.596 213.293C167.566 213.251 167.551 213.201 167.551 213.149C167.551 213.098 167.566 213.048 167.596 213.006C167.625 212.964 167.667 212.932 167.715 212.916V212.91ZM160.378 217.232L165.231 214.38C165.354 214.32 165.489 214.288 165.626 214.288C165.763 214.288 165.898 214.32 166.021 214.38L170.849 217.232C170.896 217.25 170.937 217.282 170.966 217.324C170.994 217.367 171.01 217.417 171.01 217.468C171.01 217.519 170.994 217.57 170.966 217.612C170.937 217.654 170.896 217.686 170.849 217.705L165.995 220.556C165.871 220.62 165.733 220.653 165.594 220.653C165.455 220.653 165.317 220.62 165.193 220.556L160.371 217.705C160.148 217.575 160.155 217.361 160.371 217.232H160.378ZM154.639 226.744L149.817 223.893C149.769 223.876 149.728 223.845 149.698 223.803C149.668 223.761 149.653 223.711 149.653 223.66C149.653 223.608 149.668 223.558 149.698 223.516C149.728 223.474 149.769 223.443 149.817 223.426L154.671 220.575C154.794 220.511 154.93 220.478 155.069 220.478C155.207 220.478 155.343 220.511 155.467 220.575L160.288 223.426C160.511 223.556 160.511 223.763 160.288 223.893L155.435 226.744C155.311 226.809 155.173 226.843 155.034 226.843C154.894 226.843 154.756 226.809 154.632 226.744H154.639ZM163.136 231.759L158.308 228.908C158.26 228.89 158.22 228.858 158.191 228.816C158.162 228.773 158.147 228.723 158.147 228.672C158.147 228.62 158.162 228.57 158.191 228.528C158.22 228.486 158.26 228.453 158.308 228.435L163.161 225.584C163.285 225.522 163.421 225.489 163.559 225.489C163.697 225.489 163.833 225.522 163.957 225.584L168.779 228.435C169.002 228.565 168.995 228.772 168.779 228.902L163.925 231.753C163.802 231.817 163.666 231.85 163.527 231.85C163.389 231.85 163.253 231.817 163.129 231.753L163.136 231.759ZM169.919 235.77L165.091 232.919C164.874 232.79 164.881 232.576 165.091 232.446L172.575 228.053C172.699 227.988 172.837 227.953 172.976 227.953C173.116 227.953 173.253 227.988 173.377 228.053L178.199 230.904C178.422 231.034 178.416 231.247 178.199 231.377L170.715 235.777C170.591 235.841 170.453 235.874 170.314 235.874C170.174 235.874 170.037 235.841 169.913 235.777L169.919 235.77ZM176.677 239.775L171.849 236.924C171.626 236.794 171.632 236.58 171.849 236.451L181.04 231.053C181.164 230.989 181.302 230.956 181.441 230.956C181.581 230.956 181.718 230.989 181.842 231.053L186.664 233.904C186.711 233.922 186.752 233.955 186.781 233.997C186.81 234.039 186.825 234.089 186.825 234.141C186.825 234.192 186.81 234.242 186.781 234.285C186.752 234.327 186.711 234.359 186.664 234.377L177.473 239.775C177.35 239.839 177.213 239.872 177.075 239.872C176.937 239.872 176.8 239.839 176.677 239.775V239.775ZM183.454 243.799L178.632 240.948C178.585 240.93 178.544 240.897 178.515 240.855C178.487 240.813 178.471 240.763 178.471 240.711C178.471 240.66 178.487 240.61 178.515 240.567C178.544 240.525 178.585 240.493 178.632 240.475L191.193 233.094C191.317 233.03 191.455 232.997 191.594 232.997C191.733 232.997 191.871 233.03 191.995 233.094L196.817 235.945C197.04 236.075 197.033 236.289 196.817 236.418L184.25 243.799C184.127 243.863 183.99 243.896 183.852 243.896C183.714 243.896 183.577 243.863 183.454 243.799V243.799ZM198.651 243.19L190.912 247.726C190.788 247.79 190.651 247.823 190.511 247.823C190.372 247.823 190.234 247.79 190.11 247.726L185.288 244.875C185.241 244.856 185.2 244.824 185.171 244.782C185.143 244.74 185.127 244.689 185.127 244.638C185.127 244.587 185.143 244.536 185.171 244.494C185.2 244.452 185.241 244.42 185.288 244.402L193.027 239.866C193.151 239.802 193.289 239.769 193.428 239.769C193.568 239.769 193.705 239.802 193.83 239.866L198.651 242.717C198.698 242.735 198.739 242.767 198.768 242.809C198.797 242.852 198.812 242.902 198.812 242.953C198.812 243.005 198.797 243.055 198.768 243.097C198.739 243.139 198.698 243.172 198.651 243.19V243.19ZM205.384 239.231L200.53 242.082C200.406 242.146 200.268 242.179 200.129 242.179C199.99 242.179 199.852 242.146 199.728 242.082L194.906 239.231C194.859 239.213 194.818 239.18 194.789 239.138C194.761 239.096 194.745 239.045 194.745 238.994C194.745 238.943 194.761 238.893 194.789 238.85C194.818 238.808 194.859 238.776 194.906 238.758L199.766 235.906C199.889 235.843 200.026 235.809 200.164 235.809C200.302 235.809 200.439 235.843 200.562 235.906L205.384 238.758C205.432 238.774 205.473 238.805 205.503 238.847C205.532 238.889 205.548 238.939 205.548 238.991C205.548 239.042 205.532 239.093 205.503 239.134C205.473 239.176 205.432 239.208 205.384 239.224V239.231ZM212.18 235.2L207.326 238.051C207.203 238.115 207.067 238.148 206.928 238.148C206.79 238.148 206.653 238.115 206.53 238.051L201.709 235.2C201.661 235.182 201.62 235.15 201.592 235.107C201.563 235.065 201.548 235.015 201.548 234.964C201.548 234.912 201.563 234.862 201.592 234.82C201.62 234.778 201.661 234.745 201.709 234.727L206.562 231.876C206.686 231.812 206.824 231.779 206.963 231.779C207.103 231.779 207.24 231.812 207.365 231.876L212.186 234.727C212.233 234.745 212.274 234.778 212.303 234.82C212.332 234.862 212.347 234.912 212.347 234.964C212.347 235.015 212.332 235.065 212.303 235.107C212.274 235.15 212.233 235.182 212.186 235.2H212.18ZM218.95 231.228L214.091 234.079C213.967 234.143 213.831 234.176 213.693 234.176C213.554 234.176 213.418 234.143 213.294 234.079L208.473 231.228C208.426 231.21 208.385 231.178 208.356 231.135C208.327 231.093 208.312 231.043 208.312 230.992C208.312 230.94 208.327 230.89 208.356 230.848C208.385 230.805 208.426 230.773 208.473 230.755L213.326 227.904C213.45 227.84 213.586 227.807 213.724 227.807C213.863 227.807 213.999 227.84 214.122 227.904L218.944 230.755C218.992 230.771 219.034 230.803 219.063 230.845C219.093 230.887 219.109 230.937 219.109 230.988C219.109 231.04 219.093 231.09 219.063 231.132C219.034 231.174 218.992 231.205 218.944 231.222L218.95 231.228ZM259.6 207.343L220.798 230.133C220.674 230.197 220.538 230.23 220.399 230.23C220.261 230.23 220.125 230.197 220.001 230.133L215.18 227.282C215.132 227.264 215.092 227.231 215.063 227.189C215.034 227.147 215.019 227.097 215.019 227.045C215.019 226.994 215.034 226.944 215.063 226.901C215.092 226.859 215.132 226.827 215.18 226.809L253.982 204.019C254.107 203.955 254.244 203.922 254.383 203.922C254.523 203.922 254.66 203.955 254.785 204.019L259.606 206.87C259.823 207 259.823 207.207 259.606 207.343H259.6ZM266.746 203.144L261.893 205.996C261.769 206.059 261.633 206.092 261.495 206.092C261.356 206.092 261.22 206.059 261.097 205.996L256.275 203.144C256.228 203.126 256.187 203.094 256.158 203.052C256.13 203.009 256.114 202.959 256.114 202.908C256.114 202.856 256.13 202.806 256.158 202.764C256.187 202.722 256.228 202.689 256.275 202.671L261.128 199.82C261.253 199.758 261.391 199.725 261.53 199.725C261.669 199.725 261.806 199.758 261.931 199.82L266.753 202.671C266.969 202.801 266.969 203.008 266.753 203.138L266.746 203.144ZM273.644 199.088L268.791 201.939C268.667 202 268.531 202.032 268.393 202.032C268.255 202.032 268.119 202 267.995 201.939L263.173 199.088C263.126 199.07 263.085 199.038 263.056 198.995C263.028 198.953 263.012 198.903 263.012 198.852C263.012 198.8 263.028 198.75 263.056 198.708C263.085 198.665 263.126 198.633 263.173 198.615L268.027 195.764C268.151 195.7 268.288 195.667 268.428 195.667C268.567 195.667 268.705 195.7 268.829 195.764L273.651 198.615C273.874 198.745 273.867 198.952 273.651 199.088H273.644ZM280.536 195.045L275.683 197.896C275.624 197.926 275.562 197.95 275.498 197.967C275.426 197.973 275.353 197.973 275.281 197.967C275.142 197.97 275.004 197.936 274.88 197.87L270.058 195.019C270.011 195.001 269.97 194.968 269.942 194.926C269.913 194.884 269.897 194.834 269.897 194.782C269.897 194.731 269.913 194.681 269.942 194.638C269.97 194.596 270.011 194.564 270.058 194.546L274.912 191.695C275.035 191.631 275.172 191.598 275.31 191.598C275.448 191.598 275.585 191.631 275.708 191.695L280.53 194.546C280.579 194.574 280.622 194.611 280.657 194.656C280.733 194.779 280.695 194.921 280.53 195.019L280.536 195.045Z" stroke="#C3D2D8" stroke-width="0.5" stroke-linejoin="bevel"/>
                    <path d="M129.295 125.451L133.524 127.913" stroke="#C3D2D8" stroke-linejoin="round"/>
                    <path d="M124.461 134.672L128.69 137.134" stroke="#C3D2D8" stroke-linejoin="round"/>
                    <path d="M216.021 271.474V276.393" stroke="#C3D2D8" stroke-linejoin="round"/>
                    <path d="M206.957 272.09V276.393" stroke="#C3D2D8" stroke-linejoin="round"/>
                    <path d="M327.224 205.691V210.609" stroke="#C3D2D8" stroke-linejoin="round"/>
                    <path d="M134.429 229.051V233.969" stroke="#C3D2D8" stroke-linejoin="round"/>
                    <path d="M284.854 235.498L269.427 244.842L265.421 242.49L280.847 233.146L284.854 235.498Z" stroke="#C3D2D8" stroke-width="2" stroke-linejoin="round"/>
                    <path d="M284.854 235.44L284.848 239.918L269.421 249.313L269.428 244.842L284.854 235.44Z" fill="#FFF0F9" fill-opacity="0.41" stroke="#C3D2D8" stroke-width="2" stroke-linejoin="round"/>
                    <path d="M269.428 244.842L269.421 249.313L265.415 246.961L265.421 242.49L269.428 244.842Z" fill="#9593A8" stroke="#C3D2D8" stroke-width="2" stroke-linejoin="round"/>
                    <path d="M144.938 166.812V156.839L153.473 151.824V161.803L144.938 166.812ZM153.671 151.17L144.664 156.444C144.6 156.488 144.546 156.547 144.507 156.615C144.469 156.684 144.446 156.761 144.441 156.839V167.343C144.441 167.486 144.55 167.544 144.671 167.473L153.658 162.198C153.722 162.154 153.775 162.095 153.814 162.027C153.852 161.958 153.875 161.882 153.881 161.803V151.293C153.881 151.15 153.779 151.092 153.652 151.17" fill="#A7B3C2"/>
                    <path d="M186.314 133.058L160.014 148.506C159.949 148.551 159.895 148.61 159.856 148.68C159.817 148.75 159.795 148.828 159.792 148.908C159.792 149.051 159.893 149.109 160.021 149.031L186.32 133.59C186.385 133.546 186.439 133.488 186.478 133.419C186.516 133.351 186.539 133.274 186.543 133.195C186.543 133.045 186.435 132.987 186.314 133.058" fill="#A7B3C2"/>
                    <path d="M186.326 137.244L160.027 152.692C159.961 152.734 159.906 152.792 159.867 152.861C159.828 152.93 159.806 153.008 159.804 153.088C159.804 153.237 159.906 153.295 160.027 153.224L186.326 137.776C186.391 137.732 186.445 137.673 186.484 137.605C186.522 137.536 186.545 137.459 186.549 137.38C186.549 137.231 186.448 137.173 186.326 137.244" fill="#A7B3C2"/>
                    <path d="M186.339 141.417L160.04 156.865C159.973 156.907 159.917 156.965 159.877 157.034C159.837 157.103 159.814 157.181 159.811 157.261C159.811 157.41 159.913 157.468 160.04 157.39L186.339 141.949C186.404 141.903 186.458 141.844 186.496 141.774C186.535 141.705 186.557 141.627 186.562 141.547C186.562 141.398 186.46 141.346 186.339 141.417Z" fill="#A7B3C2"/>
                    <path d="M144.983 183.271V173.298L153.518 168.283V178.255L144.976 183.271H144.983ZM153.709 167.622L144.728 172.896C144.661 172.94 144.606 173 144.566 173.069C144.526 173.139 144.503 173.218 144.499 173.298L144.531 183.796C144.531 183.945 144.632 184.003 144.76 183.932L153.741 178.657C153.807 178.613 153.863 178.554 153.903 178.484C153.943 178.414 153.966 178.336 153.97 178.255L153.938 167.751C153.938 167.609 153.836 167.544 153.709 167.622Z" fill="#A7B3C2"/>
                    <path d="M186.358 149.517L160.065 164.965C159.998 165.009 159.943 165.068 159.903 165.138C159.863 165.208 159.84 165.286 159.836 165.367C159.836 165.509 159.938 165.568 160.065 165.49L186.365 150.042C186.429 150 186.483 149.942 186.522 149.875C186.56 149.807 186.583 149.731 186.588 149.653C186.588 149.504 186.486 149.446 186.358 149.517" fill="#A7B3C2"/>
                    <path d="M186.371 153.729L160.072 169.171C160.007 169.216 159.953 169.276 159.915 169.345C159.876 169.415 159.853 169.492 159.849 169.572C159.849 169.715 159.951 169.773 160.078 169.702L186.377 154.254C186.442 154.21 186.496 154.152 186.534 154.083C186.573 154.014 186.596 153.938 186.6 153.859C186.604 153.83 186.6 153.801 186.587 153.775C186.575 153.749 186.555 153.727 186.53 153.713C186.505 153.699 186.476 153.693 186.448 153.696C186.42 153.699 186.393 153.71 186.371 153.729" fill="#A7B3C2"/>
                    <path d="M186.384 157.883L160.085 173.331C160.018 173.374 159.963 173.433 159.924 173.503C159.885 173.573 159.864 173.652 159.862 173.732C159.862 173.875 159.964 173.933 160.085 173.862L186.384 158.414C186.449 158.371 186.503 158.313 186.542 158.244C186.581 158.175 186.603 158.098 186.607 158.019C186.607 157.87 186.505 157.811 186.384 157.883" fill="#A7B3C2"/>
                    <path d="M145.034 199.736L145.002 189.763L153.537 184.748V194.727L145.034 199.736ZM153.76 184.094L144.779 189.368C144.712 189.412 144.656 189.471 144.616 189.541C144.576 189.611 144.554 189.689 144.55 189.77L144.582 200.267C144.582 200.416 144.683 200.468 144.811 200.397L153.792 195.122C153.858 195.08 153.913 195.021 153.953 194.953C153.993 194.884 154.016 194.807 154.021 194.727L153.989 184.184C153.989 184.035 153.887 183.977 153.76 184.055" fill="#A7B3C2"/>
                    <path d="M186.409 165.976L160.11 181.424C160.044 181.467 159.989 181.525 159.949 181.594C159.909 181.662 159.886 181.74 159.881 181.819C159.881 181.962 159.983 182.027 160.11 181.949L186.409 166.501C186.474 166.457 186.528 166.399 186.567 166.33C186.606 166.262 186.628 166.185 186.632 166.106C186.632 165.963 186.53 165.905 186.409 165.976Z" fill="#A7B3C2"/>
                    <path d="M186.422 170.162L160.123 185.603C160.057 185.647 160.002 185.705 159.962 185.773C159.922 185.842 159.899 185.919 159.893 185.999C159.893 186.148 159.995 186.206 160.123 186.135L186.422 170.687C186.487 170.643 186.54 170.584 186.579 170.516C186.618 170.447 186.64 170.371 186.645 170.292C186.645 170.149 186.543 170.084 186.422 170.162Z" fill="#A7B3C2"/>
                    <path d="M186.428 174.341L160.129 189.789C160.065 189.833 160.011 189.892 159.972 189.96C159.933 190.029 159.911 190.106 159.906 190.185C159.906 190.334 160.008 190.392 160.136 190.314L186.435 174.873C186.5 174.828 186.553 174.768 186.592 174.698C186.631 174.629 186.653 174.551 186.658 174.471C186.658 174.329 186.549 174.27 186.428 174.341Z" fill="#A7B3C2"/>
                    <path d="M139.371 208.523L139.594 208.393L139.371 208.523ZM139.569 208.16L139.416 154.883L191.224 124.427L191.371 177.705L139.569 208.16ZM191.447 123.792L139.218 154.481C139.153 154.526 139.099 154.586 139.059 154.656C139.017 154.721 138.993 154.798 138.989 154.876L139.142 208.691C139.139 208.719 139.143 208.746 139.154 208.772C139.165 208.797 139.183 208.818 139.206 208.834C139.231 208.849 139.259 208.857 139.288 208.857C139.318 208.857 139.346 208.849 139.371 208.834L191.6 178.145C191.667 178.102 191.722 178.041 191.759 177.97C191.798 177.903 191.82 177.827 191.823 177.75L191.677 123.967C191.679 123.938 191.674 123.909 191.662 123.883C191.649 123.857 191.63 123.834 191.607 123.818C191.582 123.805 191.555 123.797 191.527 123.797C191.499 123.797 191.472 123.805 191.447 123.818" fill="#A7B3C2"/>
                    <path d="M139.199 146.491L139.422 146.362L139.199 146.491ZM139.422 146.096V137.231L238.428 79.0619V87.9263L139.422 146.096V146.096ZM238.645 78.401L139.168 136.836C139.102 136.879 139.048 136.937 139.008 137.005C138.967 137.073 138.946 137.151 138.945 137.231V146.627C138.943 146.655 138.947 146.684 138.958 146.71C138.97 146.736 138.987 146.759 139.008 146.776C139.033 146.792 139.062 146.8 139.091 146.8C139.12 146.8 139.149 146.792 139.174 146.776L238.676 88.3281C238.743 88.2846 238.798 88.2243 238.836 88.1531C238.877 88.0874 238.899 88.0109 238.899 87.9328V78.537C238.902 78.5081 238.897 78.479 238.884 78.4528C238.872 78.4265 238.853 78.4042 238.829 78.388C238.805 78.3738 238.778 78.3663 238.75 78.3663C238.722 78.3663 238.694 78.3738 238.67 78.388" fill="#A7B3C2"/>
                    <path d="M196.205 175.113L196.435 174.976L196.205 175.113ZM196.435 174.711L196.256 121.459L224.498 104.878L224.645 158.155L196.409 174.737L196.435 174.711ZM224.747 104.217L196.052 121.064C195.987 121.107 195.933 121.165 195.893 121.233C195.852 121.301 195.83 121.379 195.829 121.459L195.976 175.242C195.972 175.27 195.977 175.299 195.99 175.324C196.002 175.35 196.022 175.371 196.046 175.385C196.07 175.4 196.098 175.407 196.126 175.407C196.154 175.407 196.181 175.4 196.205 175.385L224.899 158.537C224.966 158.496 225.021 158.438 225.059 158.369C225.097 158.302 225.119 158.226 225.122 158.148L224.969 104.366C224.973 104.337 224.969 104.308 224.958 104.282C224.947 104.256 224.929 104.233 224.906 104.217C224.881 104.203 224.854 104.196 224.826 104.196C224.798 104.196 224.771 104.203 224.747 104.217" fill="#A7B3C2"/>
                    <path d="M229.211 155.751L229.441 155.615L229.211 155.751ZM229.441 155.349L229.294 102.072L240.122 95.7151L240.269 148.992L229.441 155.349ZM240.339 95.0866L229.065 101.715C228.998 101.756 228.943 101.815 228.906 101.884C228.865 101.95 228.843 102.026 228.842 102.104L228.989 155.887C228.987 155.915 228.991 155.943 229.002 155.969C229.013 155.995 229.031 156.018 229.052 156.036C229.076 156.052 229.104 156.06 229.132 156.06C229.16 156.06 229.188 156.052 229.211 156.036L240.492 149.414C240.558 149.373 240.613 149.314 240.651 149.245C240.689 149.178 240.711 149.102 240.715 149.025L240.562 95.2421C240.564 95.2148 240.559 95.1874 240.548 95.1625C240.537 95.1375 240.52 95.1159 240.498 95.0995C240.474 95.0853 240.446 95.0778 240.418 95.0778C240.39 95.0778 240.363 95.0853 240.339 95.0995" fill="#A7B3C2"/>
                    <path d="M218.052 114.416L199.766 125.159C199.699 125.203 199.644 125.263 199.604 125.332C199.564 125.402 199.541 125.481 199.537 125.561C199.537 125.71 199.638 125.762 199.766 125.691L218.052 114.947C218.119 114.904 218.174 114.846 218.214 114.778C218.254 114.709 218.277 114.632 218.282 114.552C218.282 114.403 218.18 114.345 218.052 114.416" fill="#A7B3C2"/>
                    <path d="M221.097 116.826L199.791 129.345C199.725 129.388 199.67 129.446 199.63 129.515C199.59 129.584 199.567 129.661 199.562 129.741C199.562 129.89 199.664 129.948 199.791 129.877L221.097 117.358C221.162 117.314 221.216 117.256 221.255 117.187C221.293 117.118 221.316 117.042 221.32 116.962C221.32 116.813 221.218 116.755 221.097 116.826" fill="#A7B3C2"/>
                    <path d="M218.078 123.345L199.791 134.089C199.725 134.132 199.67 134.19 199.63 134.258C199.59 134.327 199.567 134.404 199.562 134.484C199.562 134.633 199.664 134.691 199.791 134.614L218.078 123.876C218.145 123.833 218.2 123.773 218.24 123.704C218.28 123.634 218.303 123.555 218.307 123.475C218.307 123.332 218.205 123.274 218.078 123.345Z" fill="#A7B3C2"/>
                    <path d="M221.097 125.756L199.785 138.275C199.72 138.318 199.666 138.377 199.627 138.445C199.589 138.514 199.566 138.591 199.562 138.67C199.562 138.813 199.664 138.871 199.791 138.8L221.097 126.281C221.162 126.237 221.216 126.179 221.255 126.11C221.293 126.041 221.316 125.964 221.32 125.885C221.32 125.743 221.218 125.684 221.097 125.756Z" fill="#A7B3C2"/>
                    <path d="M237.02 103.264L231.454 106.504C231.389 106.548 231.335 106.606 231.296 106.675C231.258 106.744 231.235 106.82 231.231 106.899C231.231 107.048 231.333 107.1 231.454 107.029L237.027 103.789C237.093 103.747 237.148 103.688 237.187 103.62C237.225 103.551 237.247 103.473 237.25 103.394C237.25 103.251 237.148 103.193 237.02 103.264Z" fill="#A7B3C2"/>
                    <path d="M237.976 106.906L231.485 110.722C231.419 110.765 231.364 110.823 231.326 110.892C231.287 110.961 231.265 111.038 231.262 111.118C231.262 111.267 231.364 111.325 231.485 111.254L237.976 107.437C238.042 107.395 238.097 107.337 238.136 107.268C238.175 107.199 238.197 107.121 238.199 107.042C238.199 106.893 238.097 106.835 237.976 106.906Z" fill="#A7B3C2"/>
                    <path d="M237.065 112.193L231.498 115.433C231.434 115.476 231.38 115.533 231.341 115.601C231.302 115.668 231.28 115.744 231.275 115.822C231.275 115.971 231.377 116.029 231.498 115.958L237.071 112.686C237.137 112.641 237.191 112.582 237.23 112.512C237.269 112.442 237.291 112.364 237.294 112.284C237.294 112.141 237.192 112.083 237.065 112.161" fill="#A7B3C2"/>
                    <path d="M238.001 115.835L231.511 119.645C231.445 119.686 231.391 119.744 231.352 119.811C231.313 119.879 231.291 119.956 231.288 120.034C231.288 120.183 231.39 120.241 231.511 120.17L238.001 116.353C238.067 116.311 238.122 116.253 238.161 116.184C238.2 116.115 238.222 116.038 238.224 115.958C238.224 115.816 238.122 115.757 238.001 115.829" fill="#A7B3C2"/>
                    <path d="M218.154 151.241L199.868 161.978C199.801 162.022 199.746 162.081 199.706 162.151C199.666 162.221 199.643 162.299 199.639 162.38C199.639 162.522 199.74 162.581 199.868 162.509L218.154 151.785C218.221 151.742 218.276 151.684 218.316 151.616C218.356 151.547 218.379 151.47 218.384 151.39C218.384 151.241 218.282 151.183 218.154 151.26" fill="#A7B3C2"/>
                    <path d="M221.186 153.645L199.88 166.164C199.813 166.207 199.758 166.267 199.718 166.336C199.678 166.406 199.655 166.485 199.651 166.566C199.651 166.708 199.753 166.767 199.88 166.689L221.186 154.176C221.251 154.133 221.306 154.075 221.344 154.006C221.383 153.937 221.405 153.86 221.409 153.781C221.409 153.632 221.307 153.574 221.186 153.645" fill="#A7B3C2"/>
                </g>
                <g opacity="0.7" filter="url(#filter1_f_0:1)">
                    <path d="M229.023 155.121C231.991 153.38 236.785 153.373 239.733 155.121L315.646 200.022C318.6 201.763 318.58 204.595 315.612 206.336L196.764 276.105C193.797 277.846 188.995 277.846 186.048 276.105L110.135 231.204C107.18 229.457 107.201 226.631 110.135 224.89L229.023 155.121Z" fill="#DBDBF9"/>
                </g>
                <g filter="url(#filter2_f_0:1)">
                    <ellipse cx="282.193" cy="163.857" rx="31.9739" ry="13.1089" fill="#DBDBF9"/>
                </g>
                <g filter="url(#filter3_f_0:1)">
                    <ellipse cx="338.106" cy="118.913" rx="20.9254" ry="8.68251" fill="#DBDBF9"/>
                </g>
                <g filter="url(#filter4_f_0:1)">
                    <ellipse cx="370.917" cy="188.373" rx="20.9254" ry="8.68251" fill="#DBDBF9"/>
                </g>
                <g filter="url(#filter5_f_0:1)">
                    <ellipse cx="317.348" cy="307.885" rx="20.9254" ry="8.68251" fill="#DBDBF9"/>
                </g>
                <g filter="url(#filter6_f_0:1)">
                    <ellipse cx="147.266" cy="302.777" rx="20.9254" ry="8.68251" fill="#DBDBF9"/>
                </g>
                <g filter="url(#filter7_f_0:1)">
                    <ellipse cx="72.9395" cy="249.32" rx="20.9254" ry="8.68251" fill="#DBDBF9"/>
                </g>
                <g filter="url(#filter8_f_0:1)">
                    <ellipse cx="265.118" cy="295.627" rx="12.5552" ry="5.2776" fill="#DBDBF9"/>
                </g>
                <path d="M421.883 101.646L410.317 107.938L385.313 94.4274L396.88 88.142L421.883 101.646Z" fill="url(#paint17_linear_0:1)" stroke="#C3D2D8" stroke-width="2" stroke-linejoin="round"/>
                <path d="M421.731 131.965L421.717 154.463L410.15 160.755L410.316 107.938L421.883 101.646L421.786 132.723" fill="#FFF0F9" fill-opacity="0.41"/>
                <path d="M421.731 131.965L421.717 154.463L410.15 160.755L410.316 107.938L421.883 101.646L421.786 132.723" stroke="#C3D2D8" stroke-width="2" stroke-linejoin="round"/>
                <path d="M410.316 107.938L410.15 160.755L385.154 147.251L385.313 94.4275L410.316 107.938Z" fill="#9593A8" stroke="#C3D2D8" stroke-width="2" stroke-linejoin="round"/>
                <path d="M385.154 100.596L385.161 104.53L410.157 117.755L410.15 113.822L385.154 100.596Z" stroke="#C3D2D8" stroke-linejoin="round"/>
                <path d="M385.154 112.876L385.161 116.809L410.157 130.034L410.15 126.094L385.154 112.876Z" stroke="#C3D2D8" stroke-linejoin="round"/>
                <path d="M385.154 125.155L385.161 129.088L410.157 142.307L410.15 138.374L385.154 125.155Z" stroke="#C3D2D8" stroke-linejoin="round"/>
                <path d="M385.154 137.434L385.161 141.367L410.157 154.586L410.15 150.653L385.154 137.434Z" stroke="#C3D2D8" stroke-linejoin="round"/>
                <path d="M421.883 107.594L421.876 111.528L410.15 117.755L410.164 113.822L421.883 107.594Z" stroke="#C3D2D8" stroke-linejoin="round"/>
                <path d="M422.049 119.874L422.035 123.807L410.316 130.034L410.323 126.094L422.049 119.874Z" stroke="#C3D2D8" stroke-linejoin="round"/>
                <path d="M422.271 136.177L410.316 142.307L410.323 138.374L422.049 132.153" stroke="#C3D2D8" stroke-linejoin="round"/>
                <path d="M421.578 148.489L410.316 154.586L410.323 150.653L421.578 144.601" stroke="#C3D2D8" stroke-linejoin="round"/>
                <path d="M166.357 227.51L178.79 234.269L159.625 244.617L147.193 237.859L166.357 227.51Z" fill="url(#paint18_linear_0:1)" stroke="#C3D2D8" stroke-width="2" stroke-linejoin="round"/>
                <path d="M178.79 234.269L178.894 266.668L159.722 277.023L159.625 244.617L178.79 234.269Z" fill="#FFF0F9" fill-opacity="0.41" stroke="#C3D2D8" stroke-width="2" stroke-linejoin="round"/>
                <path d="M159.625 244.617L159.722 277.023L147.29 270.264L147.193 237.859L159.625 244.617Z" fill="#9593A8" stroke="#C3D2D8" stroke-width="2" stroke-linejoin="round"/>
                <path d="M178.901 237.917L178.88 240.768L159.612 251.078L159.632 248.226L178.901 237.917Z" stroke="#C3D2D8" stroke-linejoin="round"/>
                <path d="M178.88 252.108L159.612 262.417L159.632 259.566L178.901 249.257" stroke="#C3D2D8" stroke-linejoin="round"/>
                <path d="M178.88 263.448L159.612 273.757L159.632 270.906L178.901 260.597" stroke="#C3D2D8" stroke-linejoin="round"/>
                <path d="M147.179 241.649L147.2 244.501L159.611 251.078L159.591 248.226L147.179 241.649Z" stroke="#C3D2D8" stroke-linejoin="round"/>
                <path d="M147.2 255.84L159.611 262.417L159.591 259.566L147.179 252.989" stroke="#C3D2D8" stroke-linejoin="round"/>
                <path d="M147.2 267.18L159.611 273.757L159.591 270.906L147.179 264.329" stroke="#C3D2D8" stroke-linejoin="round"/>
                <path d="M336.2 59.7474L345.599 64.8211L317.95 79.8478L289.885 64.685L299.097 59.6761" fill="url(#paint19_linear_0:1)"/>
                <path d="M336.2 59.7474L345.599 64.8211L317.95 79.8478L289.885 64.685L299.097 59.6761" stroke="#C3D2D8" stroke-width="2" stroke-linejoin="round"/>
                <path d="M345.599 64.821L345.433 117.638L317.79 132.671L317.95 79.8478L345.599 64.821Z" fill="#FFF0F9" fill-opacity="0.41" stroke="#C3D2D8" stroke-width="2" stroke-linejoin="round"/>
                <path d="M317.949 79.8478L317.79 132.672L289.726 117.509L289.885 64.685L317.949 79.8478Z" fill="#9593A8" stroke="#C3D2D8" stroke-width="2" stroke-linejoin="round"/>
                <path d="M336.221 54.1941L317.818 64.199L299.132 54.1034L317.534 44.0985L336.221 54.1941Z" fill="url(#paint20_linear_0:1)" stroke="#C3D2D8" stroke-width="2" stroke-linejoin="round"/>
                <path d="M336.221 54.1941L336.193 64.335L317.783 74.3399L317.818 64.199L336.221 54.1941Z" fill="#FFF0F9" fill-opacity="0.41" stroke="#C3D2D8" stroke-width="2" stroke-linejoin="round"/>
                <path d="M317.818 64.199L317.783 74.3399L299.097 64.2443L299.131 54.1034L317.818 64.199Z" fill="#9593A8" stroke="#C3D2D8" stroke-width="2" stroke-linejoin="round"/>
                <path d="M293.085 70.3808L293.105 75.1175L296.575 77.0096L296.555 72.2664L293.085 70.3808Z" stroke="#C3D2D8" stroke-linejoin="round"/>
                <path d="M299.097 73.6596L299.117 78.4028L302.587 80.2949L302.567 75.5517L299.097 73.6596Z" stroke="#C3D2D8" stroke-linejoin="round"/>
                <path d="M305.108 76.9448L305.129 81.6881L308.606 83.5737L308.585 78.8305L305.108 76.9448Z" stroke="#C3D2D8" stroke-linejoin="round"/>
                <path d="M311.127 80.2236L311.141 84.9668L314.618 86.8525L314.597 82.1157L311.127 80.2236Z" stroke="#C3D2D8" stroke-linejoin="round"/>
                <path d="M293.085 80.3986L293.105 85.1418L296.575 87.0275L296.555 82.2907L293.085 80.3986Z" stroke="#C3D2D8" stroke-linejoin="round"/>
                <path d="M299.097 83.6839L299.117 88.4271L302.587 90.3128L302.567 85.5695L299.097 83.6839Z" stroke="#C3D2D8" stroke-linejoin="round"/>
                <path d="M305.108 86.9626L305.129 91.7059L308.606 93.598L308.585 88.8548L305.108 86.9626Z" stroke="#C3D2D8" stroke-linejoin="round"/>
                <path d="M311.127 90.248L311.141 94.9912L314.618 96.8768L314.597 92.1336L311.127 90.248Z" stroke="#C3D2D8" stroke-linejoin="round"/>
                <path d="M293.085 90.4229L293.105 95.1662L296.575 97.0518L296.555 92.3086L293.085 90.4229Z" stroke="#C3D2D8" stroke-linejoin="round"/>
                <path d="M299.097 93.7017L299.117 98.445L302.587 100.331L302.567 95.5938L299.097 93.7017Z" stroke="#C3D2D8" stroke-linejoin="round"/>
                <path d="M305.108 96.987L305.129 101.73L308.606 103.616L308.585 98.8726L305.108 96.987Z" stroke="#C3D2D8" stroke-linejoin="round"/>
                <path d="M311.127 100.266L311.141 105.009L314.618 106.895L314.597 102.158L311.127 100.266Z" stroke="#C3D2D8" stroke-linejoin="round"/>
                <path d="M293.085 100.441L293.105 105.184L296.575 107.07L296.555 102.333L293.085 100.441Z" stroke="#C3D2D8" stroke-linejoin="round"/>
                <path d="M299.097 103.726L299.117 108.469L302.587 110.355L302.567 105.612L299.097 103.726Z" stroke="#C3D2D8" stroke-linejoin="round"/>
                <path d="M305.108 107.005L305.129 111.748L308.606 113.634L308.585 108.897L305.108 107.005Z" stroke="#C3D2D8" stroke-linejoin="round"/>
                <path d="M311.127 110.29L311.141 115.033L314.618 116.919L314.597 112.176L311.127 110.29Z" stroke="#C3D2D8" stroke-linejoin="round"/>
                <path d="M293.085 110.465L293.105 115.202L296.575 117.094L296.555 112.351L293.085 110.465Z" stroke="#C3D2D8" stroke-linejoin="round"/>
                <path d="M299.097 113.744L299.117 118.487L302.587 120.373L302.567 115.636L299.097 113.744Z" stroke="#C3D2D8" stroke-linejoin="round"/>
                <path d="M305.108 117.029L305.129 121.772L308.606 123.658L308.585 118.915L305.108 117.029Z" stroke="#C3D2D8" stroke-linejoin="round"/>
                <path d="M311.127 120.308L311.141 125.051L314.618 126.937L314.597 122.2L311.127 120.308Z" stroke="#C3D2D8" stroke-linejoin="round"/>
                <path d="M342.323 70.3808L342.302 75.1175L338.832 77.0096L338.846 72.2664L342.323 70.3808Z" stroke="#C3D2D8" stroke-linejoin="round"/>
                <path d="M336.311 73.6596L336.29 78.4028L332.813 80.2949L332.834 75.5517L336.311 73.6596Z" stroke="#C3D2D8" stroke-linejoin="round"/>
                <path d="M330.292 76.9448L330.271 81.6881L326.801 83.5737L326.822 78.8305L330.292 76.9448Z" stroke="#C3D2D8" stroke-linejoin="round"/>
                <path d="M324.28 80.2236L324.259 84.9668L320.789 86.8525L320.81 82.1157L324.28 80.2236Z" stroke="#C3D2D8" stroke-linejoin="round"/>
                <path d="M342.323 80.3986L342.302 85.1418L338.832 87.0275L338.846 82.2907L342.323 80.3986Z" stroke="#C3D2D8" stroke-linejoin="round"/>
                <path d="M336.311 83.6839L336.29 88.4271L332.813 90.3128L332.834 85.5695L336.311 83.6839Z" stroke="#C3D2D8" stroke-linejoin="round"/>
                <path d="M330.292 86.9626L330.271 91.7059L326.801 93.598L326.822 88.8548L330.292 86.9626Z" stroke="#C3D2D8" stroke-linejoin="round"/>
                <path d="M324.28 90.248L324.259 94.9912L320.789 96.8768L320.81 92.1336L324.28 90.248Z" stroke="#C3D2D8" stroke-linejoin="round"/>
                <path d="M342.323 90.4229L342.302 95.1662L338.832 97.0518L338.846 92.3086L342.323 90.4229Z" stroke="#C3D2D8" stroke-linejoin="round"/>
                <path d="M336.311 93.7017L336.29 98.445L332.813 100.331L332.834 95.5938L336.311 93.7017Z" stroke="#C3D2D8" stroke-linejoin="round"/>
                <path d="M330.292 96.987L330.271 101.73L326.801 103.616L326.822 98.8726L330.292 96.987Z" stroke="#C3D2D8" stroke-linejoin="round"/>
                <path d="M324.28 100.266L324.259 105.009L320.789 106.895L320.81 102.158L324.28 100.266Z" stroke="#C3D2D8" stroke-linejoin="round"/>
                <path d="M342.323 100.441L342.302 105.184L338.832 107.07L338.846 102.333L342.323 100.441Z" stroke="#C3D2D8" stroke-linejoin="round"/>
                <path d="M336.311 103.726L336.29 108.469L332.813 110.355L332.834 105.612L336.311 103.726Z" stroke="#C3D2D8" stroke-linejoin="round"/>
                <path d="M330.292 107.005L330.271 111.748L326.801 113.634L326.822 108.897L330.292 107.005Z" stroke="#C3D2D8" stroke-linejoin="round"/>
                <path d="M324.28 110.29L324.259 115.033L320.789 116.919L320.81 112.176L324.28 110.29Z" stroke="#C3D2D8" stroke-linejoin="round"/>
                <path d="M342.323 110.465L342.302 115.202L338.832 117.094L338.846 112.351L342.323 110.465Z" stroke="#C3D2D8" stroke-linejoin="round"/>
                <path d="M336.311 113.744L336.29 118.487L332.813 120.373L332.834 115.636L336.311 113.744Z" stroke="#C3D2D8" stroke-linejoin="round"/>
                <path d="M330.292 117.029L330.271 121.772L326.801 123.658L326.822 118.915L330.292 117.029Z" stroke="#C3D2D8" stroke-linejoin="round"/>
                <path d="M324.28 120.308L324.259 125.051L320.789 126.937L320.81 122.2L324.28 120.308Z" stroke="#C3D2D8" stroke-linejoin="round"/>
                <path d="M333.464 124.449L363.122 140.467L345.599 149.169L391.304 173.922L312.291 216.572" stroke="#C3D2D8" stroke-linecap="round" stroke-linejoin="round" stroke-dasharray="4 4"/>
                <path d="M379.911 213.747L360.379 203.127L387.446 203.094L406.978 213.715L379.911 213.747Z" fill="url(#paint21_linear_0:1)" stroke="#C3D2D8" stroke-width="2" stroke-linejoin="round"/>
                <path d="M379.911 213.747L406.978 213.715L407.068 243.516L390.764 252.322L369.75 263.668L353.453 272.474L353.363 242.673L379.911 213.747Z" fill="#FFF0F9" fill-opacity="0.41" stroke="#C3D2D8" stroke-width="2" stroke-linejoin="round"/>
                <path d="M333.887 261.562L333.838 232.053L353.363 242.673L353.453 272.474L333.963 261.562" fill="#9593A8"/>
                <path d="M333.887 261.562L333.838 232.053L353.363 242.673L353.453 272.474L333.963 261.562" stroke="#C3D2D8" stroke-width="2" stroke-linejoin="round"/>
                <path d="M353.363 242.672L333.838 232.052L360.379 203.126L379.911 213.746L353.363 242.672Z" fill="#9593A8" stroke="#C3D2D8" stroke-width="2" stroke-linejoin="round"/>
                <path d="M363.149 255.853L363.122 261.892L358.703 264.296L358.724 258.257L363.149 255.853Z" stroke="#C3D2D8" stroke-linejoin="round"/>
                <path d="M371.461 251.628L371.433 257.668L367.014 260.072L367.035 254.032L371.461 251.628Z" stroke="#C3D2D8" stroke-linejoin="round"/>
                <path d="M363.149 244.961L363.122 251L358.703 253.404L358.724 247.365L363.149 244.961Z" stroke="#C3D2D8" stroke-linejoin="round"/>
                <path d="M371.461 240.736L371.433 246.775L367.014 249.179L367.035 243.14L371.461 240.736Z" stroke="#C3D2D8" stroke-linejoin="round"/>
                <path d="M394.594 239.161L394.566 245.2L390.147 247.604L390.175 241.565L394.594 239.161Z" stroke="#C3D2D8" stroke-linejoin="round"/>
                <path d="M402.905 234.936L402.878 240.976L398.459 243.38L398.487 237.34L402.905 234.936Z" stroke="#C3D2D8" stroke-linejoin="round"/>
                <path d="M394.594 228.269L394.566 234.308L390.147 236.712L390.175 230.673L394.594 228.269Z" stroke="#C3D2D8" stroke-linejoin="round"/>
                <path d="M402.905 224.044L402.878 230.083L398.459 232.493L398.487 226.454L402.905 224.044Z" stroke="#C3D2D8" stroke-linejoin="round"/>
                <path d="M381.732 228.314C379.654 229.422 377.999 228.528 377.992 226.318C378.062 225.113 378.436 223.94 379.082 222.895C379.728 221.85 380.629 220.962 381.712 220.305C383.789 219.197 385.438 220.091 385.445 222.294C385.375 223.5 385.003 224.674 384.358 225.719C383.713 226.765 382.813 227.654 381.732 228.314V228.314ZM381.732 219.773C380.508 220.519 379.489 221.524 378.758 222.707C378.028 223.891 377.606 225.219 377.528 226.584C377.528 229.085 379.433 230.096 381.76 228.845C382.985 228.099 384.004 227.092 384.734 225.908C385.465 224.723 385.886 223.394 385.964 222.028C385.964 219.527 384.06 218.516 381.732 219.773Z" fill="#A7B3C2"/>
                <path d="M91.3752 140.778L71.8505 130.164L84.8092 135.263L104.341 145.877L91.3752 140.778Z" fill="#9593A8" stroke="#C3D2D8" stroke-width="2" stroke-linejoin="round"/>
                <path d="M91.3752 140.778L104.341 145.877L104.493 197.632L96.7014 201.844L86.6447 207.274L78.8459 211.492L78.6866 159.731L91.3752 140.778Z" fill="#FFF0F9" fill-opacity="0.41" stroke="#C3D2D8" stroke-width="2" stroke-linejoin="round"/>
                <path d="M59.2589 200.652L59.2451 176.041L59.162 149.117L78.6867 159.731L78.846 211.492L70.4931 206.95L58.9957 200.652" fill="#9593A8"/>
                <path d="M59.2589 200.652L59.2451 176.041L59.162 149.117L78.6867 159.731L78.846 211.492L70.4931 206.95L58.9957 200.652" stroke="#C3D2D8" stroke-width="2" stroke-linejoin="round"/>
                <path d="M78.6869 159.731L59.1622 149.117L71.8508 130.164L91.3756 140.778L78.6869 159.731Z" fill="url(#paint22_linear_0:1)" stroke="#C3D2D8" stroke-width="2" stroke-linejoin="round"/>
                <path d="M89.3113 161.857L89.2836 167.896L84.8578 170.3L84.8856 164.261L89.3113 161.857Z" stroke="#C3D2D8" stroke-linejoin="round"/>
                <path d="M99.0147 156.906L98.987 162.945L94.5612 165.349L94.5889 159.31L99.0147 156.906Z" stroke="#C3D2D8" stroke-linejoin="round"/>
                <path d="M89.3113 174.816L89.2836 180.856L84.8578 183.26L84.8856 177.22L89.3113 174.816Z" stroke="#C3D2D8" stroke-linejoin="round"/>
                <path d="M99.0147 169.866L98.987 175.905L94.5612 178.309L94.5889 172.27L99.0147 169.866Z" stroke="#C3D2D8" stroke-linejoin="round"/>
                <path d="M89.3113 187.776L89.2836 193.815L84.8578 196.219L84.8856 190.18L89.3113 187.776Z" stroke="#C3D2D8" stroke-linejoin="round"/>
                <path d="M99.0147 182.825L98.987 188.865L94.5612 191.269L94.5889 185.229L99.0147 182.825Z" stroke="#C3D2D8" stroke-linejoin="round"/>
                <path d="M345.599 102.398L372.306 116.841L346.762 130.715" stroke="#C3D2D8" stroke-linecap="round" stroke-linejoin="round" stroke-dasharray="4 4"/>
                <path d="M395.882 154.593L376.441 165.148" stroke="#C3D2D8" stroke-linecap="round" stroke-linejoin="round" stroke-dasharray="4 4"/>
                <path d="M312.291 216.572L336.151 229.545" stroke="#C3D2D8" stroke-linecap="round" stroke-linejoin="round" stroke-dasharray="4 4"/>
                <path d="M423.864 69.3311L413.128 75.1629L402.233 69.2792L412.969 63.4474L423.864 69.3311Z" fill="url(#paint23_linear_0:1)" stroke="#C3D2D8" stroke-width="2" stroke-linejoin="round"/>
                <path d="M423.864 69.331L423.843 80.5282L413.114 86.3665L413.128 75.1629L423.864 69.331Z" fill="#FFF0F9" fill-opacity="0.41" stroke="#C3D2D8" stroke-width="2" stroke-linejoin="round"/>
                <path d="M413.128 75.1629L413.114 86.3665L402.22 80.4764L402.233 69.2792L413.128 75.1629Z" fill="#9593A8" stroke="#C3D2D8" stroke-width="2" stroke-linejoin="round"/>
                <path d="M357.833 30.8957L357.469 31.2362L370.388 38.046L382.772 31.2362L382.772 30.8957" fill="#9593A8"/>
                <path d="M383.007 31.2879L383.159 81.0984L379.274 83.1979L374.266 85.9L370.38 87.9995L370.228 38.1889L383.007 31.2879Z" fill="#FFF0F9" fill-opacity="0.41" stroke="#C3D2D8" stroke-width="2" stroke-linejoin="round"/>
                <path d="M370.38 87.9995L357.692 81.0984L357.539 31.2879L370.228 38.1889L370.38 87.9995Z" fill="#9593A8" stroke="#C3D2D8" stroke-width="2" stroke-linejoin="round"/>
                <path d="M383.007 31.2879L370.228 38.1889L357.539 31.2879" stroke="#C3D2D8" stroke-width="2" stroke-linejoin="round"/>
                <path d="M382.813 31.0157L370.346 20L357.879 31.0157" fill="#9593A8"/>
                <path d="M382.813 31.0157L370.346 20L357.879 31.0157" stroke="#C3D2D8" stroke-width="2" stroke-linejoin="round"/>
                <path d="M370.346 20V38.1436" stroke="#C3D2D8" stroke-width="2" stroke-linejoin="round"/>
                <path d="M379.253 38.6684L379.232 43.4117L375.755 45.3038L375.776 40.5605L379.253 38.6684Z" stroke="#C3D2D8" stroke-linejoin="round"/>
                <path d="M379.253 47.7402L379.232 52.4835L375.755 54.3756L375.776 49.6323L379.253 47.7402Z" stroke="#C3D2D8" stroke-linejoin="round"/>
                <path d="M379.253 56.812L379.232 61.5552L375.755 63.4473L375.776 58.7041L379.253 56.812Z" stroke="#C3D2D8" stroke-linejoin="round"/>
                <path d="M379.253 65.8838L379.232 70.627L375.755 72.5191L375.776 67.7759L379.253 65.8838Z" stroke="#C3D2D8" stroke-linejoin="round"/>
                <path d="M379.253 74.9555L379.232 79.6988L375.755 81.5909L375.776 76.8477L379.253 74.9555Z" stroke="#C3D2D8" stroke-linejoin="round"/>
                <path d="M362.595 38.6684L362.616 43.4117L366.093 45.3038L366.072 40.5605L362.595 38.6684Z" stroke="#C3D2D8" stroke-linejoin="round"/>
                <path d="M362.595 47.7402L362.616 52.4835L366.093 54.3756L366.072 49.6323L362.595 47.7402Z" stroke="#C3D2D8" stroke-linejoin="round"/>
                <path d="M362.595 56.812L362.616 61.5552L366.093 63.4473L366.072 58.7041L362.595 56.812Z" stroke="#C3D2D8" stroke-linejoin="round"/>
                <path d="M362.595 65.8838L362.616 70.627L366.093 72.5191L366.072 67.7759L362.595 65.8838Z" stroke="#C3D2D8" stroke-linejoin="round"/>
                <path d="M362.595 74.9555L362.616 79.6988L366.093 81.5909L366.072 76.8477L362.595 74.9555Z" stroke="#C3D2D8" stroke-linejoin="round"/>
                <path d="M363.08 83.8718L345.509 93.4166" stroke="#C3D2D8" stroke-linecap="round" stroke-linejoin="round" stroke-dasharray="4 4"/>
                <path d="M104.223 223.227L91.0636 216.099L104.223 205.084L116.69 216.099L104.223 223.227Z" fill="#FBF9FF"/>
                <path d="M117.183 215.952L104.44 222.932L91.8798 215.952" fill="#9593A8"/>
                <path d="M104.473 259.599L104.583 223.214L91.8117 216.313L91.6593 266.124L95.5449 268.223L100.552 270.932L104.438 273.031" fill="#9593A8"/>
                <path d="M104.473 259.599L104.583 223.214L91.8117 216.313L91.6593 266.124L95.5449 268.223L100.552 270.932L104.438 273.031" stroke="#C3D2D8" stroke-width="2" stroke-linejoin="round"/>
                <path d="M117.168 252.626L117.279 216.313L104.584 223.214L104.438 259.599" fill="#FFF0F9" fill-opacity="0.41"/>
                <path d="M117.168 252.626L117.279 216.313L104.584 223.214L104.438 259.599" stroke="#C3D2D8" stroke-width="2" stroke-linejoin="round"/>
                <path d="M91.8118 216.313L104.584 223.214L117.279 216.313" stroke="#C3D2D8" stroke-width="2" stroke-linejoin="round"/>
                <path d="M91.9988 216.048L104.466 205.032L116.933 216.048" fill="#9593A8"/>
                <path d="M91.9988 216.048L104.466 205.032L116.933 216.048" stroke="#C3D2D8" stroke-width="2" stroke-linejoin="round"/>
                <path d="M104.466 205.032V223.175" stroke="#C3D2D8" stroke-width="2" stroke-linejoin="round"/>
                <path d="M95.8981 236.744L95.9258 242.783L100.345 245.187L100.324 239.148L95.8981 236.744Z" stroke="#C3D2D8" stroke-linejoin="round"/>
                <path d="M95.8981 224.517L95.9258 230.556L100.345 232.96L100.324 226.921L95.8981 224.517Z" stroke="#C3D2D8" stroke-linejoin="round"/>
                <path d="M107.672 264.608L107.7 270.647L112.119 273.051L112.098 267.012L107.672 264.608Z" stroke="#C3D2D8" stroke-linejoin="round"/>
                <path d="M95.8981 249.704L95.9258 255.743L100.345 258.147L100.324 252.108L95.8981 249.704Z" stroke="#C3D2D8" stroke-linejoin="round"/>
                <path d="M104.459 259.534L117.605 266.642L117.584 280.159L104.438 273.057" fill="#9593A8"/>
                <path d="M104.459 259.534L117.605 266.642L117.584 280.159L104.438 273.057" stroke="#C3D2D8" stroke-width="2" stroke-linejoin="round"/>
                <path d="M130.556 259.599L117.604 266.642L104.458 259.534L117.41 252.497L130.556 259.599Z" fill="url(#paint24_linear_0:1)" stroke="#C3D2D8" stroke-width="2" stroke-linejoin="round"/>
                <path d="M130.557 259.599L130.536 273.116L117.584 280.159L117.605 266.642L130.557 259.599Z" fill="#FFF0F9" fill-opacity="0.41" stroke="#C3D2D8" stroke-width="2" stroke-linejoin="round"/>
                <path d="M292.039 247.87L282.384 253.119L272.583 247.825L282.238 242.576L292.039 247.87Z" fill="url(#paint25_linear_0:1)" stroke="#C3D2D8" stroke-width="2" stroke-linejoin="round"/>
                <path d="M292.039 247.87L292.025 257.946L282.37 263.195L282.384 253.119L292.039 247.87Z" fill="#FFF0F9" fill-opacity="0.41" stroke="#C3D2D8" stroke-width="2" stroke-linejoin="round"/>
                <path d="M282.384 253.119L282.37 263.195L272.57 257.901L272.584 247.825L282.384 253.119Z" fill="#9593A8" stroke="#C3D2D8" stroke-width="2" stroke-linejoin="round"/>
                <g filter="url(#filter9_b_0:1)">
                    <path d="M438 141.769C438 139.786 437.388 137.845 436.236 136.18C435.085 134.515 433.443 133.197 431.509 132.385C429.575 131.573 427.432 131.302 425.337 131.603C423.242 131.905 421.285 132.767 419.701 134.085C418.118 135.403 416.975 137.122 416.412 139.034C415.848 140.946 415.888 142.969 416.525 144.86C417.163 146.751 418.371 148.43 420.005 149.693C421.639 150.957 423.628 151.751 425.734 151.981V164.176L427.015 164.87L428.283 164.183V151.981C430.958 151.688 433.425 150.486 435.216 148.604C437.008 146.721 437.998 144.289 438 141.769V141.769Z" fill="url(#paint26_radial_0:1)"/>
                    <path d="M438 141.769C438 139.786 437.388 137.845 436.236 136.18C435.085 134.515 433.443 133.197 431.509 132.385C429.575 131.573 427.432 131.302 425.337 131.603C423.242 131.905 421.285 132.767 419.701 134.085C418.118 135.403 416.975 137.122 416.412 139.034C415.848 140.946 415.888 142.969 416.525 144.86C417.163 146.751 418.371 148.43 420.005 149.693C421.639 150.957 423.628 151.751 425.734 151.981V164.176L427.015 164.87L428.283 164.183V151.981C430.958 151.688 433.425 150.486 435.216 148.604C437.008 146.721 437.998 144.289 438 141.769V141.769Z" stroke="#C3D2D8" stroke-width="2" stroke-linejoin="round"/>
                </g>
                <g filter="url(#filter10_b_0:1)">
                    <path d="M335.729 264.135C336.027 264.213 336.33 264.276 336.636 264.322V275.908L337.918 276.595L339.178 275.915V264.322C340.276 264.152 341.323 263.763 342.247 263.183C343.172 262.603 343.953 261.845 344.538 260.959C345.124 260.074 345.5 259.081 345.642 258.048C345.783 257.015 345.687 255.966 345.36 254.97C345.033 253.975 344.481 253.057 343.743 252.277C343.006 251.497 342.098 250.874 341.081 250.45C340.065 250.025 338.963 249.809 337.85 249.816C336.737 249.822 335.638 250.051 334.628 250.488" fill="url(#paint27_radial_0:1)"/>
                    <path d="M335.729 264.135C336.027 264.213 336.33 264.276 336.636 264.322V275.908L337.918 276.595L339.178 275.915V264.322C340.276 264.152 341.323 263.763 342.247 263.183C343.172 262.603 343.953 261.845 344.538 260.959C345.124 260.074 345.5 259.081 345.642 258.048C345.783 257.015 345.687 255.966 345.36 254.97C345.033 253.975 344.481 253.057 343.743 252.277C343.006 251.497 342.098 250.874 341.081 250.45C340.065 250.025 338.963 249.809 337.85 249.816C336.737 249.822 335.638 250.051 334.628 250.488" stroke="#C3D2D8" stroke-width="2" stroke-linejoin="round"/>
                </g>
                <g filter="url(#filter11_b_0:1)">
                    <path d="M337.994 257.888C337.996 255.905 337.384 253.963 336.233 252.297C335.083 250.632 333.441 249.313 331.508 248.5C329.574 247.687 327.43 247.414 325.335 247.715C323.239 248.016 321.282 248.877 319.697 250.195C318.113 251.513 316.97 253.232 316.406 255.144C315.842 257.056 315.881 259.079 316.519 260.971C317.156 262.863 318.364 264.541 319.998 265.805C321.632 267.069 323.622 267.864 325.728 268.094V280.295L327.009 280.989L328.276 280.302V268.094C330.952 267.803 333.42 266.603 335.211 264.721C337.003 262.84 337.993 260.408 337.994 257.888Z" fill="url(#paint28_radial_0:1)"/>
                    <path d="M337.994 257.888C337.996 255.905 337.384 253.963 336.233 252.297C335.083 250.632 333.441 249.313 331.508 248.5C329.574 247.687 327.43 247.414 325.335 247.715C323.239 248.016 321.282 248.877 319.697 250.195C318.113 251.513 316.97 253.232 316.406 255.144C315.842 257.056 315.881 259.079 316.519 260.971C317.156 262.863 318.364 264.541 319.998 265.805C321.632 267.069 323.622 267.864 325.728 268.094V280.295L327.009 280.989L328.276 280.302V268.094C330.952 267.803 333.42 266.603 335.211 264.721C337.003 262.84 337.993 260.408 337.994 257.888Z" stroke="#C3D2D8" stroke-width="2" stroke-linejoin="round"/>
                </g>
                <g filter="url(#filter12_b_0:1)">
                    <path d="M73.9976 191.495C73.9975 189.513 73.3851 187.573 72.2341 185.909C71.0831 184.245 69.4426 182.928 67.5099 182.115C65.5773 181.303 63.4349 181.031 61.3407 181.331C59.2464 181.631 57.2896 182.491 55.7056 183.808C54.1217 185.124 52.9782 186.841 52.4128 188.751C51.8473 190.662 51.8841 192.684 52.5185 194.575C53.153 196.467 54.3582 198.146 55.989 199.411C57.6198 200.677 59.6067 201.474 61.7107 201.708V213.903L62.992 214.596L64.2526 213.909V201.708C66.9336 201.421 69.4083 200.222 71.2054 198.339C73.0025 196.456 73.9963 194.02 73.9976 191.495V191.495Z" fill="url(#paint29_radial_0:1)"/>
                    <path d="M73.9976 191.495C73.9975 189.513 73.3851 187.573 72.2341 185.909C71.0831 184.245 69.4426 182.928 67.5099 182.115C65.5773 181.303 63.4349 181.031 61.3407 181.331C59.2464 181.631 57.2896 182.491 55.7056 183.808C54.1217 185.124 52.9782 186.841 52.4128 188.751C51.8473 190.662 51.8841 192.684 52.5185 194.575C53.153 196.467 54.3582 198.146 55.989 199.411C57.6198 200.677 59.6067 201.474 61.7107 201.708V213.903L62.992 214.596L64.2526 213.909V201.708C66.9336 201.421 69.4083 200.222 71.2054 198.339C73.0025 196.456 73.9963 194.02 73.9976 191.495V191.495Z" stroke="#C3D2D8" stroke-width="2" stroke-linejoin="round"/>
                </g>
                <path d="M277.044 245.304L268.137 240.483L310.829 217.376" stroke="#C3D2D8" stroke-linecap="round" stroke-linejoin="round" stroke-dasharray="4 4"/>
                <path d="M99.7629 208.524L92.4628 204.351" stroke="#C3D2D8" stroke-linecap="round" stroke-linejoin="round" stroke-dasharray="4 4"/>
                <path d="M149.215 236.744L117.272 218.51" stroke="#C3D2D8" stroke-linecap="round" stroke-linejoin="round" stroke-dasharray="4 4"/>
                <path d="M266.772 241.319L213.732 273.563L178.79 253.624" stroke="#C3D2D8" stroke-linecap="round" stroke-linejoin="round" stroke-dasharray="4 4"/>
                <path d="M198.827 266.234L156.28 292.102L125.576 275.811" stroke="#C3D2D8" stroke-linecap="round" stroke-linejoin="round" stroke-dasharray="4 4"/>
                <path d="M288.603 207.164L307.484 217.493" stroke="#C3D2D8" stroke-linecap="round" stroke-linejoin="round" stroke-dasharray="4 4"/>
                <path d="M295.869 203.904L314.639 214.175" stroke="#C3D2D8" stroke-linecap="round" stroke-linejoin="round" stroke-dasharray="4 4"/>
                <path d="M285.584 209.38L304.465 219.709" stroke="#C3D2D8" stroke-linecap="round" stroke-linejoin="round" stroke-dasharray="4 4"/>
                <path d="M298.044 201.779L316.55 211.628" stroke="#C3D2D8" stroke-linecap="round" stroke-linejoin="round" stroke-dasharray="4 4"/>
                <path d="M292.614 205.725L311.432 216.022" stroke="#C3D2D8" stroke-linecap="round" stroke-linejoin="round" stroke-dasharray="4 4"/>
                <path d="M255.905 37.353C255.905 32.7718 252.442 30.925 248.169 33.2253L141.451 90.8959C137.205 93.1704 133.742 98.743 133.742 103.324L133.95 171.952C133.95 176.534 137.413 178.374 141.687 176.073L248.411 118.403C252.671 116.103 256.106 110.536 256.092 105.955L255.905 37.353Z" stroke="#C3D2D8" stroke-miterlimit="10"/>
                <path d="M255.407 24.1341C258.433 22.4947 260.892 23.8101 260.906 27.063L261.183 110.841C261.183 114.081 258.752 118.053 255.725 119.692L134.518 185.171C131.498 186.804 129.033 185.495 129.026 182.242L128.769 98.4644C128.769 95.2245 131.207 91.2458 134.234 89.6129L255.407 24.1341Z" fill="url(#paint30_linear_0:1)" stroke="#C3D2D8" stroke-width="2" stroke-linejoin="round"/>
                <path d="M259.306 23.7712L254.673 21.2571C253.675 20.7127 252.297 20.7905 250.773 21.6134L129.587 87.0922C126.56 88.7252 124.115 92.6908 124.122 95.9437L124.378 179.722C124.378 181.335 124.995 182.475 125.978 183.007L130.605 185.528C129.621 184.99 129.012 183.856 129.012 182.242L128.756 98.4644C128.756 95.2244 131.194 91.2458 134.22 89.6129L255.428 24.1341C256.214 23.6665 257.128 23.4233 258.06 23.4343C258.505 23.4496 258.94 23.5652 259.327 23.7712H259.306Z" fill="url(#paint31_linear_0:1)" stroke="#C3D2D8" stroke-width="2" stroke-linejoin="round"/>
                <path d="M256.508 119.297C259.535 117.664 264.424 117.658 267.43 119.297L344.851 161.416C347.863 163.049 347.843 165.706 344.816 167.339L223.609 232.785C220.582 234.418 215.685 234.418 212.679 232.785L135.259 190.666C132.246 189.027 132.267 186.376 135.259 184.743L256.508 119.297Z" fill="url(#paint32_linear_0:1)" stroke="#C3D2D8" stroke-width="2" stroke-linejoin="round"/>
                <path d="M306.757 151.644L258.967 125.654C258.12 125.248 257.182 125.037 256.231 125.037C255.28 125.037 254.342 125.248 253.495 125.654L147.013 183.156C145.503 183.972 145.496 185.301 147.013 186.117L194.803 212.114C195.651 212.517 196.588 212.726 197.539 212.726C198.49 212.726 199.427 212.517 200.275 212.114L306.729 154.612C308.246 153.789 308.26 152.467 306.729 151.644" stroke="#C3D2D8" stroke-width="0.5" stroke-linejoin="round"/>
                <path d="M299.63 185.106L280.611 174.739C279.672 174.291 278.634 174.058 277.581 174.058C276.527 174.058 275.489 174.291 274.55 174.739L238.535 194.178C236.852 195.085 236.845 196.556 238.535 197.463L257.554 207.831C258.492 208.278 259.531 208.511 260.584 208.511C261.637 208.511 262.676 208.278 263.614 207.831L299.63 188.392C301.306 187.484 301.32 186.014 299.63 185.106Z" stroke="#C3D2D8" stroke-width="0.5" stroke-linejoin="round"/>
                <path d="M298.653 197.269L344.837 172.322C346.354 171.499 347.116 170.423 347.116 169.341V164.332C347.116 165.408 346.361 166.49 344.837 167.313L223.63 232.759C220.603 234.392 215.706 234.392 212.7 232.759L135.28 190.64C134.62 190.301 134.046 189.832 133.597 189.266C133.242 188.81 133.046 188.263 133.036 187.698V187.698V192.714C133.036 193.776 133.784 194.839 135.28 195.649L212.7 237.768C215.706 239.407 220.603 239.407 223.63 237.768L277.806 208.524" fill="url(#paint33_linear_0:1)"/>
                <path d="M298.653 197.269L344.837 172.322C346.354 171.499 347.116 170.423 347.116 169.341V164.332C347.116 165.408 346.361 166.49 344.837 167.313L223.63 232.759C220.603 234.392 215.706 234.392 212.7 232.759L135.28 190.64C134.62 190.301 134.046 189.832 133.597 189.266C133.242 188.81 133.046 188.263 133.036 187.698V187.698V192.714C133.036 193.776 133.784 194.839 135.28 195.649L212.7 237.768C215.706 239.407 220.603 239.407 223.63 237.768L277.806 208.524" stroke="#C3D2D8" stroke-width="2" stroke-linejoin="round"/>
                <path d="M301.431 152.5L296.153 155.351C296.019 155.415 295.871 155.448 295.72 155.448C295.57 155.448 295.421 155.415 295.287 155.351L290.044 152.5C289.993 152.482 289.949 152.449 289.917 152.407C289.886 152.365 289.869 152.315 289.869 152.263C289.869 152.212 289.886 152.162 289.917 152.119C289.949 152.077 289.993 152.045 290.044 152.027L295.322 149.176C295.458 149.113 295.607 149.081 295.758 149.081C295.91 149.081 296.059 149.113 296.195 149.176L301.438 152.027C301.489 152.045 301.533 152.077 301.565 152.119C301.596 152.162 301.613 152.212 301.613 152.263C301.613 152.315 301.596 152.365 301.565 152.407C301.533 152.449 301.489 152.482 301.438 152.5M288.95 145.294L294.193 148.145C294.435 148.275 294.429 148.482 294.193 148.612L279.801 156.388C279.666 156.449 279.518 156.48 279.368 156.48C279.218 156.48 279.07 156.449 278.935 156.388L273.692 153.537C273.449 153.4 273.449 153.193 273.692 153.064L288.084 145.288C288.22 145.224 288.369 145.191 288.521 145.191C288.672 145.191 288.822 145.224 288.957 145.288L288.95 145.294ZM232.744 151.275C232.78 151.23 232.825 151.193 232.876 151.165L238.154 148.314C238.289 148.25 238.439 148.217 238.59 148.217C238.742 148.217 238.891 148.25 239.026 148.314L244.276 151.165C244.512 151.295 244.512 151.508 244.276 151.638L238.999 154.489C238.937 154.524 238.869 154.549 238.798 154.56C238.577 154.612 238.343 154.587 238.14 154.489L232.89 151.638C232.847 151.617 232.81 151.588 232.781 151.552C232.753 151.516 232.733 151.475 232.724 151.431C232.724 151.431 232.724 151.431 232.724 151.398C232.724 151.353 232.741 151.31 232.772 151.275H232.744ZM248.938 156.666C248.989 156.684 249.033 156.717 249.065 156.759C249.096 156.801 249.113 156.851 249.113 156.903C249.113 156.954 249.096 157.004 249.065 157.047C249.033 157.089 248.989 157.121 248.938 157.139L243.66 159.99C243.524 160.053 243.375 160.085 243.224 160.085C243.072 160.085 242.923 160.053 242.787 159.99L237.544 157.139C237.493 157.121 237.449 157.089 237.417 157.047C237.386 157.004 237.369 156.954 237.369 156.903C237.369 156.851 237.386 156.801 237.417 156.759C237.449 156.717 237.493 156.684 237.544 156.666L242.822 153.815C242.956 153.751 243.104 153.718 243.255 153.718C243.405 153.718 243.554 153.751 243.688 153.815L248.931 156.666H248.938ZM244.893 152.694L250.171 149.843C250.306 149.779 250.455 149.746 250.607 149.746C250.758 149.746 250.908 149.779 251.043 149.843L256.286 152.694C256.529 152.824 256.522 153.038 256.286 153.167L251.009 156.018C250.875 156.084 250.727 156.118 250.576 156.118C250.425 156.118 250.277 156.084 250.143 156.018L244.9 153.167C244.848 153.151 244.802 153.119 244.77 153.077C244.738 153.036 244.721 152.985 244.721 152.934C244.721 152.882 244.738 152.832 244.77 152.79C244.802 152.749 244.848 152.717 244.9 152.701L244.893 152.694ZM241.589 160.645C241.832 160.775 241.825 160.982 241.589 161.111L236.311 163.963C236.177 164.03 236.027 164.065 235.875 164.065C235.723 164.065 235.573 164.03 235.439 163.963L230.196 161.111C229.953 160.982 229.96 160.775 230.196 160.645L235.473 157.794C235.607 157.73 235.756 157.697 235.906 157.697C236.057 157.697 236.205 157.73 236.339 157.794L241.582 160.645H241.589ZM234.171 164.611C234.414 164.747 234.414 164.954 234.171 165.084L228.894 167.935C228.759 167.998 228.611 168.032 228.461 168.032C228.31 168.032 228.162 167.998 228.028 167.935L222.778 165.084C222.542 164.954 222.542 164.747 222.778 164.617L228.055 161.766C228.189 161.701 228.338 161.667 228.488 161.667C228.639 161.667 228.788 161.701 228.921 161.766L234.164 164.617L234.171 164.611ZM226.816 168.589C226.867 168.607 226.911 168.64 226.943 168.682C226.974 168.724 226.991 168.774 226.991 168.826C226.991 168.877 226.974 168.927 226.943 168.97C226.911 169.012 226.867 169.044 226.816 169.062L221.538 171.913C221.403 171.977 221.253 172.01 221.102 172.01C220.95 172.01 220.801 171.977 220.665 171.913L215.471 169.036C215.419 169.018 215.375 168.986 215.344 168.944C215.312 168.901 215.296 168.851 215.296 168.8C215.296 168.748 215.312 168.698 215.344 168.656C215.375 168.614 215.419 168.581 215.471 168.563L220.748 165.712C220.882 165.651 221.029 165.62 221.178 165.62C221.327 165.62 221.473 165.651 221.607 165.712L226.857 168.563L226.816 168.589ZM219.502 172.535C219.553 172.554 219.597 172.586 219.629 172.628C219.66 172.67 219.677 172.721 219.677 172.772C219.677 172.823 219.66 172.873 219.629 172.916C219.597 172.958 219.553 172.99 219.502 173.008L214.217 175.86C214.082 175.923 213.932 175.957 213.781 175.957C213.629 175.957 213.48 175.923 213.344 175.86L208.101 173.008C208.05 172.99 208.006 172.958 207.974 172.916C207.943 172.873 207.926 172.823 207.926 172.772C207.926 172.721 207.943 172.67 207.974 172.628C208.006 172.586 208.05 172.554 208.101 172.535L213.393 169.684C213.527 169.621 213.675 169.587 213.826 169.587C213.976 169.587 214.125 169.621 214.259 169.684L219.502 172.535V172.535ZM212.153 176.508C212.205 176.526 212.249 176.558 212.28 176.6C212.311 176.643 212.328 176.693 212.328 176.744C212.328 176.795 212.311 176.846 212.28 176.888C212.249 176.93 212.205 176.962 212.153 176.981L206.875 179.832C206.741 179.897 206.591 179.931 206.439 179.931C206.287 179.931 206.138 179.897 206.003 179.832L200.76 176.981C200.707 176.964 200.662 176.933 200.63 176.891C200.598 176.849 200.581 176.799 200.581 176.747C200.581 176.696 200.598 176.646 200.63 176.604C200.662 176.562 200.707 176.531 200.76 176.514L206.044 173.663C206.178 173.599 206.327 173.566 206.477 173.566C206.628 173.566 206.776 173.599 206.91 173.663L212.153 176.514V176.508ZM204.804 180.486C205.047 180.616 205.04 180.83 204.804 180.959L199.527 183.81C199.392 183.873 199.244 183.905 199.094 183.905C198.944 183.905 198.796 183.873 198.661 183.81L193.418 180.959C193.366 180.943 193.32 180.911 193.288 180.87C193.256 180.828 193.239 180.777 193.239 180.726C193.239 180.674 193.256 180.624 193.288 180.582C193.32 180.541 193.366 180.509 193.418 180.493L198.696 177.642C198.831 177.579 198.981 177.547 199.132 177.547C199.283 177.547 199.433 177.579 199.568 177.642L204.811 180.499L204.804 180.486ZM197.463 184.471C197.705 184.601 197.705 184.808 197.463 184.938L192.185 187.789C192.05 187.853 191.9 187.886 191.749 187.886C191.597 187.886 191.448 187.853 191.312 187.789L186.069 184.938C185.834 184.808 185.834 184.601 186.069 184.471L191.347 181.62C191.481 181.556 191.629 181.523 191.78 181.523C191.93 181.523 192.079 181.556 192.213 181.62L197.456 184.471H197.463ZM195.253 187.471L200.538 184.62C200.673 184.557 200.823 184.523 200.974 184.523C201.126 184.523 201.275 184.557 201.411 184.62L206.654 187.471C206.889 187.601 206.889 187.808 206.654 187.944L201.376 190.796C201.242 190.859 201.094 190.893 200.943 190.893C200.793 190.893 200.644 190.859 200.51 190.796L195.267 187.944C195.025 187.808 195.025 187.601 195.267 187.471H195.253ZM202.664 183.94C202.613 183.922 202.569 183.89 202.537 183.847C202.506 183.805 202.489 183.755 202.489 183.703C202.489 183.652 202.506 183.602 202.537 183.56C202.569 183.517 202.613 183.485 202.664 183.467L207.942 180.616C208.077 180.55 208.227 180.516 208.378 180.516C208.53 180.516 208.68 180.55 208.815 180.616L214.058 183.467C214.11 183.483 214.155 183.515 214.187 183.557C214.219 183.598 214.237 183.649 214.237 183.7C214.237 183.752 214.219 183.802 214.187 183.844C214.155 183.886 214.11 183.917 214.058 183.933L208.773 186.785C208.639 186.848 208.491 186.882 208.34 186.882C208.19 186.882 208.042 186.848 207.907 186.785L202.664 183.933V183.94ZM210.089 179.922C209.847 179.793 209.847 179.585 210.089 179.456L215.367 176.605C215.502 176.541 215.652 176.508 215.803 176.508C215.955 176.508 216.104 176.541 216.24 176.605L221.483 179.456C221.718 179.585 221.718 179.793 221.483 179.922L216.205 182.774C216.071 182.837 215.922 182.871 215.772 182.871C215.622 182.871 215.473 182.837 215.339 182.774L210.096 179.922H210.089ZM217.514 175.918C217.463 175.9 217.418 175.867 217.387 175.825C217.356 175.783 217.339 175.733 217.339 175.681C217.339 175.63 217.356 175.58 217.387 175.538C217.418 175.495 217.463 175.463 217.514 175.445L222.799 172.594C222.933 172.53 223.081 172.497 223.231 172.497C223.382 172.497 223.53 172.53 223.664 172.594L228.907 175.445C228.959 175.463 229.003 175.495 229.034 175.538C229.066 175.58 229.082 175.63 229.082 175.681C229.082 175.733 229.066 175.783 229.034 175.825C229.003 175.867 228.959 175.9 228.907 175.918L223.63 178.769C223.494 178.831 223.345 178.864 223.193 178.864C223.042 178.864 222.893 178.831 222.757 178.769L217.514 175.918ZM224.939 171.907C224.887 171.889 224.843 171.856 224.812 171.814C224.781 171.772 224.764 171.722 224.764 171.67C224.764 171.619 224.781 171.569 224.812 171.527C224.843 171.484 224.887 171.452 224.939 171.434L230.216 168.583C230.352 168.519 230.501 168.486 230.653 168.486C230.804 168.486 230.954 168.519 231.089 168.583L236.332 171.434C236.384 171.452 236.428 171.484 236.459 171.527C236.49 171.569 236.507 171.619 236.507 171.67C236.507 171.722 236.49 171.772 236.459 171.814C236.428 171.856 236.384 171.889 236.332 171.907L231.048 174.758C230.913 174.822 230.765 174.855 230.615 174.855C230.464 174.855 230.316 174.822 230.182 174.758L224.939 171.907V171.907ZM232.364 167.896C232.121 167.766 232.121 167.552 232.364 167.429L237.641 164.578C237.776 164.513 237.926 164.479 238.078 164.479C238.229 164.479 238.379 164.513 238.514 164.578L243.757 167.429C243.992 167.552 243.986 167.766 243.757 167.896L238.479 170.747C238.345 170.811 238.197 170.844 238.046 170.844C237.896 170.844 237.748 170.811 237.614 170.747L232.37 167.896H232.364ZM239.788 163.891C239.546 163.755 239.546 163.548 239.788 163.418L245.073 160.567C245.207 160.503 245.355 160.47 245.506 160.47C245.656 160.47 245.805 160.503 245.939 160.567L251.182 163.418C251.234 163.435 251.279 163.466 251.311 163.508C251.343 163.55 251.361 163.6 251.361 163.652C251.361 163.703 251.343 163.753 251.311 163.795C251.279 163.837 251.234 163.868 251.182 163.885L245.904 166.736C245.769 166.801 245.62 166.835 245.468 166.835C245.316 166.835 245.166 166.801 245.031 166.736L239.788 163.885V163.891ZM247.213 159.874C247.162 159.856 247.117 159.823 247.086 159.781C247.055 159.739 247.038 159.689 247.038 159.637C247.038 159.586 247.055 159.536 247.086 159.493C247.117 159.451 247.162 159.419 247.213 159.401L252.491 156.55C252.626 156.486 252.776 156.453 252.927 156.453C253.079 156.453 253.228 156.486 253.364 156.55L258.607 159.401C258.658 159.419 258.702 159.451 258.734 159.493C258.765 159.536 258.782 159.586 258.782 159.637C258.782 159.689 258.765 159.739 258.734 159.781C258.702 159.823 258.658 159.856 258.607 159.874L253.329 162.725C253.195 162.789 253.046 162.822 252.896 162.822C252.746 162.822 252.597 162.789 252.463 162.725L247.22 159.874H247.213ZM254.638 155.863C254.396 155.733 254.402 155.519 254.638 155.39L259.916 152.539C260.049 152.473 260.198 152.439 260.349 152.439C260.499 152.439 260.648 152.473 260.781 152.539L266.031 155.429C266.084 155.445 266.129 155.477 266.161 155.518C266.193 155.56 266.21 155.61 266.21 155.662C266.21 155.713 266.193 155.764 266.161 155.805C266.129 155.847 266.084 155.879 266.031 155.895L260.754 158.746C260.618 158.81 260.469 158.843 260.317 158.843C260.166 158.843 260.016 158.81 259.881 158.746L254.638 155.895V155.863ZM262.063 151.884C261.82 151.755 261.82 151.547 262.063 151.418L267.347 148.567C267.481 148.503 267.63 148.47 267.78 148.47C267.931 148.47 268.079 148.503 268.213 148.567L273.456 151.418C273.508 151.434 273.554 151.465 273.586 151.507C273.618 151.549 273.635 151.599 273.635 151.651C273.635 151.702 273.618 151.753 273.586 151.794C273.554 151.836 273.508 151.868 273.456 151.884L268.172 154.742C268.037 154.803 267.889 154.834 267.739 154.834C267.589 154.834 267.441 154.803 267.306 154.742L262.063 151.884ZM269.494 147.854C269.445 147.832 269.402 147.798 269.371 147.756C269.339 147.714 269.32 147.665 269.314 147.614C269.32 147.564 269.34 147.516 269.372 147.475C269.403 147.434 269.445 147.402 269.494 147.381L273.429 145.255L274.121 144.892L274.329 144.782L274.8 144.53C274.935 144.466 275.085 144.433 275.236 144.433C275.388 144.433 275.537 144.466 275.673 144.53L280.916 147.381C281.096 147.478 281.137 147.62 281.047 147.744C281.009 147.788 280.962 147.826 280.909 147.854L280.438 148.106L280.001 148.34L279.565 148.579L275.631 150.705C275.497 150.769 275.349 150.802 275.198 150.802C275.048 150.802 274.899 150.769 274.765 150.705L269.522 147.854H269.494ZM271.018 145.229L265.734 148.081C265.598 148.144 265.449 148.178 265.297 148.178C265.146 148.178 264.996 148.144 264.861 148.081L259.618 145.229C259.566 145.211 259.522 145.179 259.491 145.137C259.46 145.094 259.443 145.044 259.443 144.993C259.443 144.941 259.46 144.891 259.491 144.849C259.522 144.807 259.566 144.774 259.618 144.756L264.896 141.905C265.031 141.844 265.179 141.813 265.328 141.813C265.478 141.813 265.626 141.844 265.761 141.905L271.004 144.756C271.247 144.892 271.247 145.1 271.004 145.229H271.018ZM263.649 148.728C263.7 148.747 263.745 148.779 263.776 148.821C263.807 148.863 263.824 148.914 263.824 148.965C263.824 149.016 263.807 149.067 263.776 149.109C263.745 149.151 263.7 149.183 263.649 149.202L258.371 152.053C258.236 152.116 258.086 152.15 257.935 152.15C257.783 152.15 257.634 152.116 257.498 152.053L252.255 149.202C252.204 149.183 252.16 149.151 252.128 149.109C252.097 149.067 252.08 149.016 252.08 148.965C252.08 148.914 252.097 148.863 252.128 148.821C252.16 148.779 252.204 148.747 252.255 148.728L257.54 145.877C257.674 145.814 257.822 145.78 257.973 145.78C258.123 145.78 258.272 145.814 258.406 145.877L263.649 148.728ZM258.801 143.778C258.764 143.824 258.717 143.862 258.662 143.888L253.384 146.739C253.25 146.803 253.102 146.836 252.951 146.836C252.801 146.836 252.653 146.803 252.519 146.739L247.275 143.888C247.226 143.866 247.183 143.832 247.152 143.79C247.12 143.748 247.101 143.699 247.095 143.648C247.101 143.598 247.121 143.55 247.153 143.509C247.184 143.469 247.226 143.436 247.275 143.415L252.553 140.564C252.688 140.498 252.838 140.464 252.99 140.467C253.141 140.464 253.292 140.497 253.426 140.564L258.669 143.415C258.722 143.441 258.767 143.479 258.801 143.525C258.83 143.561 258.846 143.606 258.846 143.652C258.846 143.697 258.83 143.742 258.801 143.778V143.778ZM251.487 147.296C251.729 147.426 251.722 147.633 251.487 147.763L246.209 150.614C246.075 150.678 245.926 150.711 245.776 150.711C245.626 150.711 245.477 150.678 245.343 150.614L240.1 147.763C239.858 147.633 239.865 147.426 240.1 147.296L245.378 144.445C245.512 144.378 245.662 144.343 245.814 144.343C245.966 144.343 246.116 144.378 246.25 144.445L251.493 147.296H251.487ZM237.136 155.072C237.371 155.202 237.371 155.409 237.136 155.539L231.851 158.396C231.717 158.457 231.57 158.489 231.422 158.489C231.273 158.489 231.126 158.457 230.992 158.396L225.749 155.539C225.507 155.409 225.507 155.202 225.749 155.072L231.027 152.221C231.162 152.157 231.312 152.124 231.463 152.124C231.615 152.124 231.764 152.157 231.899 152.221L237.149 155.072H237.136ZM229.967 158.96C230.203 159.083 230.196 159.297 229.967 159.427L224.689 162.278C224.555 162.342 224.407 162.375 224.257 162.375C224.106 162.375 223.958 162.342 223.824 162.278L218.581 159.427C218.338 159.297 218.338 159.083 218.581 158.96L223.782 156.077C223.918 156.014 224.067 155.982 224.218 155.982C224.37 155.982 224.519 156.014 224.655 156.077L229.898 158.934L229.967 158.96ZM222.715 162.822C222.896 162.919 222.937 163.062 222.84 163.185C222.806 163.231 222.761 163.269 222.709 163.295L217.431 166.146C217.367 166.177 217.299 166.201 217.23 166.218C217.077 166.252 216.918 166.252 216.766 166.218C216.696 166.201 216.629 166.177 216.565 166.146L211.322 163.295C211.271 163.277 211.226 163.245 211.195 163.202C211.164 163.16 211.147 163.11 211.147 163.059C211.147 163.007 211.164 162.957 211.195 162.915C211.226 162.873 211.271 162.84 211.322 162.822L216.6 159.971C216.735 159.907 216.884 159.874 217.036 159.874C217.188 159.874 217.337 159.907 217.472 159.971L222.715 162.822V162.822ZM215.533 166.71C215.769 166.84 215.769 167.047 215.533 167.177L210.255 170.028C210.121 170.091 209.973 170.125 209.822 170.125C209.672 170.125 209.524 170.091 209.39 170.028L204.147 167.177C203.904 167.047 203.904 166.84 204.147 166.71L209.424 163.859C209.56 163.795 209.709 163.762 209.861 163.762C210.012 163.762 210.162 163.795 210.297 163.859L215.54 166.71H215.533ZM208.358 170.598C208.6 170.728 208.593 170.941 208.358 171.071L203.08 173.922C202.946 173.986 202.797 174.019 202.647 174.019C202.497 174.019 202.348 173.986 202.214 173.922L196.971 171.071C196.92 171.053 196.875 171.021 196.844 170.978C196.813 170.936 196.796 170.886 196.796 170.834C196.796 170.783 196.813 170.733 196.844 170.691C196.875 170.648 196.92 170.616 196.971 170.598L202.249 167.747C202.384 167.683 202.534 167.65 202.685 167.65C202.837 167.65 202.986 167.683 203.121 167.747L208.365 170.598H208.358ZM201.182 174.486C201.425 174.615 201.418 174.829 201.182 174.959L195.904 177.81C195.772 177.874 195.624 177.907 195.475 177.907C195.326 177.907 195.178 177.874 195.046 177.81L189.796 174.959C189.744 174.941 189.7 174.908 189.669 174.866C189.637 174.824 189.621 174.774 189.621 174.722C189.621 174.671 189.637 174.621 189.669 174.579C189.7 174.536 189.744 174.504 189.796 174.486L195.073 171.635C195.209 171.571 195.358 171.538 195.51 171.538C195.661 171.538 195.811 171.571 195.946 171.635L201.189 174.486H201.182ZM194.014 178.374C194.249 178.503 194.242 178.711 194.014 178.84L188.729 181.691C188.596 181.755 188.449 181.788 188.3 181.788C188.15 181.788 188.003 181.755 187.87 181.691L182.627 178.84C182.385 178.711 182.385 178.497 182.627 178.374L187.905 175.523C188.04 175.457 188.189 175.423 188.341 175.423C188.493 175.423 188.643 175.457 188.777 175.523L194.027 178.374H194.014ZM186.845 182.262C186.896 182.28 186.941 182.312 186.972 182.354C187.003 182.397 187.02 182.447 187.02 182.498C187.02 182.55 187.003 182.6 186.972 182.642C186.941 182.684 186.896 182.717 186.845 182.735L181.567 185.586C181.433 185.65 181.285 185.683 181.134 185.683C180.984 185.683 180.836 185.65 180.702 185.586L175.459 182.735C175.407 182.717 175.363 182.684 175.332 182.642C175.3 182.6 175.284 182.55 175.284 182.498C175.284 182.447 175.3 182.397 175.332 182.354C175.363 182.312 175.407 182.28 175.459 182.262L180.743 179.411C180.878 179.347 181.028 179.314 181.179 179.314C181.331 179.314 181.48 179.347 181.616 179.411L186.859 182.262H186.845ZM179.67 186.15C179.722 186.166 179.767 186.197 179.799 186.239C179.831 186.281 179.849 186.331 179.849 186.383C179.849 186.434 179.831 186.485 179.799 186.526C179.767 186.568 179.722 186.6 179.67 186.616L174.392 189.474C174.257 189.535 174.109 189.566 173.959 189.566C173.809 189.566 173.661 189.535 173.526 189.474L168.241 186.532C167.999 186.402 167.999 186.195 168.241 186.065L173.519 183.214C173.653 183.15 173.802 183.117 173.952 183.117C174.103 183.117 174.251 183.15 174.385 183.214L179.628 186.065L179.67 186.15ZM178.7 188.476L183.985 185.618C184.119 185.554 184.267 185.521 184.417 185.521C184.568 185.521 184.716 185.554 184.85 185.618L190.093 188.469C190.145 188.487 190.189 188.52 190.22 188.562C190.252 188.604 190.268 188.654 190.268 188.706C190.268 188.757 190.252 188.807 190.22 188.85C190.189 188.892 190.145 188.924 190.093 188.942L184.809 191.794C184.675 191.857 184.526 191.89 184.376 191.89C184.225 191.89 184.077 191.857 183.943 191.794L178.7 188.942C178.458 188.813 178.464 188.605 178.7 188.476V188.476ZM187.822 191.515L193.099 188.664C193.235 188.6 193.384 188.567 193.536 188.567C193.687 188.567 193.837 188.6 193.972 188.664L199.215 191.515C199.451 191.644 199.451 191.852 199.215 191.981L193.937 194.833C193.803 194.895 193.655 194.927 193.505 194.927C193.354 194.927 193.206 194.895 193.072 194.833L187.829 191.981C187.586 191.845 187.586 191.638 187.829 191.508L187.822 191.515ZM198.973 193.452L204.25 190.601C204.386 190.537 204.535 190.504 204.687 190.504C204.838 190.504 204.988 190.537 205.123 190.601L210.366 193.452C210.418 193.47 210.462 193.503 210.493 193.545C210.524 193.587 210.541 193.637 210.541 193.689C210.541 193.74 210.524 193.79 210.493 193.833C210.462 193.875 210.418 193.907 210.366 193.925L205.088 196.777C204.954 196.84 204.806 196.873 204.656 196.873C204.505 196.873 204.357 196.84 204.223 196.777L198.98 193.925C198.928 193.907 198.884 193.875 198.853 193.833C198.821 193.79 198.805 193.74 198.805 193.689C198.805 193.637 198.821 193.587 198.853 193.545C198.884 193.503 198.928 193.47 198.98 193.452H198.973ZM206.453 189.888C206.401 189.87 206.357 189.838 206.326 189.796C206.295 189.753 206.278 189.703 206.278 189.652C206.278 189.601 206.295 189.55 206.326 189.508C206.357 189.466 206.401 189.434 206.453 189.415L211.731 186.564C211.866 186.5 212.015 186.467 212.167 186.467C212.319 186.467 212.468 186.5 212.603 186.564L217.846 189.415C217.898 189.434 217.942 189.466 217.973 189.508C218.005 189.55 218.021 189.601 218.021 189.652C218.021 189.703 218.005 189.753 217.973 189.796C217.942 189.838 217.898 189.87 217.846 189.888L212.569 192.74C212.435 192.803 212.286 192.837 212.136 192.837C211.985 192.837 211.837 192.803 211.703 192.74L206.46 189.888H206.453ZM213.933 185.852C213.691 185.722 213.691 185.508 213.933 185.385L219.218 182.534C219.352 182.467 219.502 182.432 219.654 182.432C219.806 182.432 219.956 182.467 220.09 182.534L225.334 185.385C225.569 185.508 225.569 185.722 225.334 185.852L220.056 188.703C219.922 188.766 219.773 188.8 219.623 188.8C219.472 188.8 219.324 188.766 219.19 188.703L213.947 185.852H213.933ZM221.413 181.815C221.361 181.798 221.316 181.767 221.284 181.725C221.252 181.683 221.234 181.633 221.234 181.581C221.234 181.53 221.252 181.48 221.284 181.438C221.316 181.396 221.361 181.365 221.413 181.348L226.691 178.497C226.825 178.43 226.975 178.395 227.127 178.395C227.28 178.395 227.429 178.43 227.564 178.497L232.786 181.348C233.028 181.478 233.022 181.685 232.786 181.815L227.508 184.666C227.375 184.729 227.228 184.763 227.079 184.763C226.93 184.763 226.782 184.729 226.649 184.666L221.399 181.815H221.413ZM228.873 177.778C228.63 177.648 228.63 177.441 228.873 177.311L234.15 174.46C234.286 174.396 234.435 174.363 234.587 174.363C234.738 174.363 234.888 174.396 235.023 174.46L240.266 177.311C240.502 177.441 240.502 177.648 240.266 177.778L234.989 180.635C234.853 180.696 234.706 180.728 234.556 180.728C234.406 180.728 234.258 180.696 234.123 180.635L228.88 177.778H228.873ZM236.353 173.747C236.111 173.611 236.111 173.404 236.353 173.274L241.631 170.423C241.766 170.359 241.915 170.326 242.067 170.326C242.219 170.326 242.368 170.359 242.503 170.423L247.746 173.274C247.982 173.404 247.982 173.611 247.746 173.747L242.469 176.598C242.335 176.662 242.186 176.695 242.036 176.695C241.885 176.695 241.737 176.662 241.603 176.598L236.36 173.747H236.353ZM243.799 169.684C243.744 169.658 243.697 169.62 243.66 169.574C243.57 169.451 243.618 169.308 243.792 169.211L249.076 166.36C249.21 166.293 249.361 166.26 249.513 166.263C249.664 166.261 249.814 166.295 249.949 166.36L255.192 169.211C255.243 169.229 255.288 169.262 255.319 169.304C255.35 169.346 255.367 169.396 255.367 169.448C255.367 169.499 255.35 169.549 255.319 169.592C255.288 169.634 255.243 169.666 255.192 169.684L249.914 172.535C249.85 172.569 249.779 172.594 249.707 172.607C249.631 172.617 249.554 172.617 249.478 172.607C249.328 172.609 249.18 172.576 249.049 172.51L243.799 169.684ZM251.265 165.647C251.214 165.629 251.169 165.597 251.138 165.555C251.107 165.512 251.09 165.462 251.09 165.411C251.09 165.359 251.107 165.309 251.138 165.267C251.169 165.225 251.214 165.192 251.265 165.174L256.543 162.323C256.678 162.259 256.827 162.226 256.979 162.226C257.131 162.226 257.28 162.259 257.415 162.323L262.665 165.174C262.901 165.304 262.901 165.518 262.665 165.647L257.388 168.498C257.255 168.562 257.108 168.595 256.958 168.595C256.809 168.595 256.662 168.562 256.529 168.498L251.279 165.647H251.265ZM258.752 161.61C258.7 161.594 258.655 161.563 258.622 161.521C258.59 161.479 258.573 161.429 258.573 161.377C258.573 161.326 258.59 161.275 258.622 161.234C258.655 161.192 258.7 161.16 258.752 161.144L264.03 158.293C264.165 158.227 264.314 158.193 264.466 158.193C264.618 158.193 264.768 158.227 264.902 158.293L270.146 161.144C270.381 161.267 270.381 161.481 270.146 161.61L264.868 164.462C264.734 164.525 264.585 164.559 264.435 164.559C264.285 164.559 264.136 164.525 264.002 164.462L258.759 161.61H258.752ZM266.232 157.573C265.99 157.444 265.99 157.237 266.232 157.107L271.51 154.256C271.645 154.19 271.794 154.156 271.946 154.156C272.098 154.156 272.248 154.19 272.383 154.256L277.626 157.107C277.861 157.237 277.854 157.444 277.626 157.573L272.348 160.425C272.214 160.488 272.066 160.522 271.915 160.522C271.765 160.522 271.616 160.488 271.482 160.425L266.239 157.573H266.232ZM273.858 137.201C274.008 137.198 274.155 137.232 274.287 137.298L286.886 144.147C286.935 144.168 286.977 144.201 287.009 144.242C287.04 144.283 287.06 144.33 287.066 144.381C287.061 144.432 287.04 144.482 287.008 144.524C286.975 144.566 286.93 144.6 286.879 144.62L282.987 146.72C282.855 146.786 282.707 146.82 282.557 146.817C282.407 146.82 282.259 146.787 282.128 146.72L275.638 143.195C275.504 143.131 275.355 143.098 275.205 143.098C275.055 143.098 274.906 143.131 274.772 143.195L273.075 144.108C272.94 144.172 272.79 144.205 272.639 144.205C272.487 144.205 272.338 144.172 272.203 144.108L266.96 141.257C266.907 141.241 266.862 141.209 266.83 141.168C266.798 141.126 266.781 141.075 266.781 141.024C266.781 140.972 266.798 140.922 266.83 140.88C266.862 140.839 266.907 140.807 266.96 140.791L273.422 137.298C273.556 137.231 273.706 137.198 273.858 137.201V137.201ZM266.468 133.183C266.62 133.18 266.77 133.214 266.904 133.281L272.147 136.132C272.197 136.154 272.239 136.187 272.271 136.229C272.302 136.271 272.322 136.32 272.327 136.371C272.321 136.422 272.301 136.471 272.268 136.512C272.235 136.553 272.191 136.585 272.14 136.605L260.567 142.858C260.433 142.922 260.284 142.955 260.134 142.955C259.983 142.955 259.835 142.922 259.701 142.858L254.458 140.007C254.406 139.989 254.362 139.956 254.331 139.914C254.3 139.872 254.283 139.822 254.283 139.77C254.283 139.719 254.3 139.669 254.331 139.626C254.362 139.584 254.406 139.552 254.458 139.534L266.031 133.281C266.166 133.214 266.316 133.181 266.468 133.183ZM251.487 131.123L256.764 128.272C256.899 128.206 257.049 128.172 257.201 128.172C257.352 128.172 257.502 128.206 257.637 128.272L262.88 131.123C263.122 131.259 263.122 131.466 262.88 131.596L257.595 134.447C257.461 134.511 257.313 134.544 257.163 134.544C257.012 134.544 256.864 134.511 256.73 134.447L251.487 131.596C251.434 131.579 251.389 131.548 251.357 131.506C251.325 131.464 251.308 131.414 251.308 131.363C251.308 131.311 251.325 131.261 251.357 131.219C251.389 131.177 251.434 131.146 251.487 131.129V131.123ZM243.501 135.438L248.778 132.587C248.913 132.526 249.061 132.495 249.211 132.495C249.361 132.495 249.509 132.526 249.644 132.587L254.887 135.438C255.13 135.574 255.13 135.782 254.887 135.911L249.61 138.763C249.474 138.826 249.325 138.86 249.173 138.86C249.022 138.86 248.872 138.826 248.737 138.763L243.494 135.911C243.442 135.893 243.398 135.861 243.367 135.819C243.336 135.776 243.319 135.726 243.319 135.675C243.319 135.623 243.336 135.573 243.367 135.531C243.398 135.489 243.442 135.456 243.494 135.438H243.501ZM235.501 139.76L240.779 136.909C240.914 136.844 241.063 136.81 241.215 136.81C241.367 136.81 241.517 136.844 241.651 136.909L246.895 139.76C247.137 139.896 247.137 140.104 246.895 140.233L241.61 143.085C241.476 143.148 241.327 143.182 241.177 143.182C241.027 143.182 240.878 143.148 240.744 143.085L235.501 140.233C235.449 140.217 235.404 140.186 235.371 140.144C235.339 140.102 235.322 140.052 235.322 140C235.322 139.949 235.339 139.898 235.371 139.857C235.404 139.815 235.449 139.783 235.501 139.767V139.76ZM227.515 144.076L232.793 141.225C232.928 141.164 233.076 141.132 233.226 141.132C233.376 141.132 233.524 141.164 233.659 141.225L238.902 144.076C239.144 144.212 239.144 144.419 238.902 144.549L233.624 147.4C233.49 147.464 233.342 147.497 233.191 147.497C233.041 147.497 232.892 147.464 232.758 147.4L227.515 144.549C227.464 144.531 227.42 144.499 227.388 144.456C227.357 144.414 227.34 144.364 227.34 144.312C227.34 144.261 227.357 144.211 227.388 144.169C227.42 144.126 227.464 144.094 227.515 144.076V144.076ZM219.37 148.482L224.648 145.631C224.782 145.567 224.93 145.534 225.081 145.534C225.231 145.534 225.379 145.567 225.514 145.631L230.757 148.482C230.808 148.5 230.852 148.533 230.884 148.575C230.915 148.617 230.932 148.667 230.932 148.719C230.932 148.77 230.915 148.82 230.884 148.863C230.852 148.905 230.808 148.937 230.757 148.955L225.479 151.806C225.344 151.87 225.194 151.903 225.043 151.903C224.891 151.903 224.742 151.87 224.606 151.806L219.363 148.955C219.128 148.826 219.128 148.618 219.363 148.489L219.37 148.482ZM211.37 152.798L216.655 149.947C216.789 149.886 216.936 149.854 217.085 149.854C217.233 149.854 217.38 149.886 217.514 149.947L222.757 152.798C222.999 152.934 222.999 153.141 222.757 153.271L217.472 156.122C217.338 156.186 217.19 156.219 217.039 156.219C216.889 156.219 216.741 156.186 216.607 156.122L211.357 153.271C211.121 153.141 211.121 152.934 211.357 152.798H211.37ZM203.371 157.12L208.648 154.269C208.782 154.203 208.931 154.169 209.081 154.169C209.232 154.169 209.381 154.203 209.514 154.269L214.757 157.12C215 157.256 215 157.463 214.757 157.593L209.48 160.444C209.344 160.508 209.195 160.541 209.043 160.541C208.892 160.541 208.742 160.508 208.607 160.444L203.364 157.593C203.128 157.463 203.128 157.256 203.364 157.126L203.371 157.12ZM195.385 161.41L200.663 158.558C200.798 158.498 200.946 158.466 201.096 158.466C201.245 158.466 201.393 158.498 201.528 158.558L206.772 161.41C207.014 161.546 207.014 161.753 206.772 161.883L201.487 164.734C201.352 164.798 201.202 164.831 201.051 164.831C200.899 164.831 200.75 164.798 200.614 164.734L195.385 161.908C195.334 161.89 195.289 161.858 195.258 161.816C195.227 161.774 195.21 161.723 195.21 161.672C195.21 161.621 195.227 161.57 195.258 161.528C195.289 161.486 195.334 161.454 195.385 161.435V161.41ZM187.261 165.796L192.538 162.945C192.672 162.882 192.821 162.848 192.971 162.848C193.122 162.848 193.27 162.882 193.404 162.945L198.654 165.796C198.706 165.814 198.75 165.847 198.781 165.889C198.812 165.931 198.829 165.982 198.829 166.033C198.829 166.084 198.812 166.134 198.781 166.177C198.75 166.219 198.706 166.251 198.654 166.269L193.376 169.121C193.242 169.184 193.094 169.218 192.944 169.218C192.793 169.218 192.645 169.184 192.511 169.121L187.261 166.269C187.208 166.253 187.163 166.222 187.131 166.18C187.099 166.138 187.082 166.088 187.082 166.036C187.082 165.985 187.099 165.934 187.131 165.893C187.163 165.851 187.208 165.819 187.261 165.803V165.796ZM179.275 170.112L184.553 167.261C184.688 167.2 184.836 167.168 184.985 167.168C185.135 167.168 185.283 167.2 185.418 167.261L190.661 170.112C190.713 170.13 190.757 170.162 190.788 170.205C190.82 170.247 190.836 170.297 190.836 170.348C190.836 170.4 190.82 170.45 190.788 170.492C190.757 170.535 190.713 170.567 190.661 170.585L185.384 173.436C185.248 173.5 185.099 173.533 184.947 173.533C184.796 173.533 184.646 173.5 184.511 173.436L179.268 170.585C179.025 170.455 179.032 170.248 179.268 170.112H179.275ZM171.275 174.434L176.553 171.583C176.686 171.518 176.835 171.484 176.986 171.484C177.136 171.484 177.285 171.518 177.419 171.583L182.669 174.434C182.72 174.452 182.764 174.484 182.796 174.527C182.827 174.569 182.844 174.619 182.844 174.671C182.844 174.722 182.827 174.772 182.796 174.814C182.764 174.857 182.72 174.889 182.669 174.907L177.391 177.758C177.257 177.822 177.108 177.855 176.958 177.855C176.808 177.855 176.659 177.822 176.525 177.758L171.275 174.907C171.223 174.891 171.178 174.859 171.146 174.817C171.113 174.775 171.096 174.725 171.096 174.674C171.096 174.622 171.113 174.572 171.146 174.53C171.178 174.488 171.223 174.457 171.275 174.441V174.434ZM163.296 178.756L168.574 175.905C168.708 175.844 168.855 175.813 169.003 175.813C169.152 175.813 169.299 175.844 169.433 175.905L174.683 178.756C174.734 178.774 174.778 178.807 174.81 178.849C174.841 178.891 174.858 178.941 174.858 178.993C174.858 179.044 174.841 179.094 174.81 179.136C174.778 179.179 174.734 179.211 174.683 179.229L169.405 182.08C169.27 182.144 169.12 182.177 168.969 182.177C168.817 182.177 168.668 182.144 168.532 182.08L163.289 179.229C163.047 179.1 163.054 178.886 163.289 178.756H163.296ZM157.056 188.268L151.813 185.417C151.761 185.401 151.715 185.369 151.683 185.328C151.651 185.286 151.634 185.236 151.634 185.184C151.634 185.133 151.651 185.082 151.683 185.041C151.715 184.999 151.761 184.967 151.813 184.951L157.09 182.1C157.225 182.036 157.373 182.003 157.523 182.003C157.674 182.003 157.822 182.036 157.956 182.1L163.199 184.951C163.442 185.08 163.442 185.288 163.199 185.417L157.922 188.268C157.787 188.334 157.637 188.368 157.485 188.368C157.333 188.368 157.184 188.334 157.049 188.268H157.056ZM166.295 193.284L161.045 190.433C160.994 190.415 160.95 190.382 160.918 190.34C160.887 190.298 160.87 190.248 160.87 190.196C160.87 190.145 160.887 190.095 160.918 190.052C160.95 190.01 160.994 189.978 161.045 189.96L166.323 187.109C166.458 187.046 166.606 187.014 166.756 187.014C166.906 187.014 167.054 187.046 167.189 187.109L172.432 189.96C172.674 190.089 172.667 190.297 172.432 190.426L167.154 193.277C167.02 193.341 166.872 193.374 166.721 193.374C166.571 193.374 166.422 193.341 166.288 193.277L166.295 193.284ZM173.672 197.295L168.422 194.444C168.186 194.314 168.193 194.1 168.422 193.971L176.56 189.577C176.695 189.512 176.844 189.478 176.996 189.478C177.148 189.478 177.298 189.512 177.432 189.577L182.676 192.429C182.918 192.558 182.911 192.772 182.676 192.902L174.537 197.301C174.402 197.365 174.253 197.398 174.101 197.398C173.949 197.398 173.8 197.365 173.665 197.301L173.672 197.295ZM181.02 201.299L175.77 198.448C175.528 198.319 175.535 198.105 175.77 197.975L185.765 192.578C185.9 192.514 186.049 192.481 186.201 192.481C186.352 192.481 186.502 192.514 186.637 192.578L191.88 195.429C191.932 195.447 191.976 195.479 192.007 195.521C192.039 195.564 192.055 195.614 192.055 195.665C192.055 195.717 192.039 195.767 192.007 195.809C191.976 195.851 191.932 195.884 191.88 195.902L181.886 201.299C181.752 201.363 181.604 201.396 181.453 201.396C181.303 201.396 181.154 201.363 181.02 201.299V201.299ZM188.39 205.323L183.147 202.472C183.095 202.454 183.051 202.422 183.02 202.38C182.988 202.337 182.972 202.287 182.972 202.236C182.972 202.184 182.988 202.134 183.02 202.092C183.051 202.05 183.095 202.017 183.147 201.999L196.805 194.619C196.94 194.555 197.09 194.522 197.241 194.522C197.393 194.522 197.542 194.555 197.678 194.619L202.921 197.47C203.163 197.599 203.156 197.813 202.921 197.943L189.255 205.323C189.121 205.387 188.973 205.42 188.822 205.42C188.672 205.42 188.524 205.387 188.39 205.323V205.323ZM204.915 204.714L196.5 209.25C196.365 209.314 196.215 209.347 196.064 209.347C195.912 209.347 195.763 209.314 195.627 209.25L190.384 206.399C190.333 206.381 190.289 206.349 190.257 206.306C190.226 206.264 190.209 206.214 190.209 206.163C190.209 206.111 190.226 206.061 190.257 206.019C190.289 205.976 190.333 205.944 190.384 205.926L198.8 201.39C198.935 201.326 199.084 201.293 199.236 201.293C199.387 201.293 199.537 201.326 199.672 201.39L204.915 204.241C204.967 204.259 205.011 204.292 205.042 204.334C205.074 204.376 205.09 204.426 205.09 204.478C205.09 204.529 205.074 204.579 205.042 204.622C205.011 204.664 204.967 204.696 204.915 204.714V204.714ZM212.236 200.755L206.959 203.606C206.823 203.67 206.674 203.703 206.522 203.703C206.371 203.703 206.221 203.67 206.086 203.606L200.843 200.755C200.791 200.737 200.747 200.705 200.716 200.662C200.685 200.62 200.668 200.57 200.668 200.519C200.668 200.467 200.685 200.417 200.716 200.375C200.747 200.333 200.791 200.3 200.843 200.282L206.127 197.431C206.261 197.367 206.41 197.334 206.56 197.334C206.711 197.334 206.859 197.367 206.993 197.431L212.236 200.282C212.288 200.299 212.334 200.33 212.366 200.372C212.398 200.414 212.415 200.464 212.415 200.515C212.415 200.567 212.398 200.617 212.366 200.659C212.334 200.701 212.288 200.732 212.236 200.749V200.755ZM219.626 196.725L214.349 199.576C214.215 199.64 214.066 199.673 213.916 199.673C213.765 199.673 213.617 199.64 213.483 199.576L208.24 196.725C208.188 196.707 208.144 196.674 208.113 196.632C208.082 196.59 208.065 196.54 208.065 196.488C208.065 196.437 208.082 196.387 208.113 196.344C208.144 196.302 208.188 196.27 208.24 196.252L213.518 193.401C213.653 193.337 213.802 193.303 213.954 193.303C214.105 193.303 214.255 193.337 214.39 193.401L219.633 196.252C219.685 196.27 219.729 196.302 219.76 196.344C219.792 196.387 219.808 196.437 219.808 196.488C219.808 196.54 219.792 196.59 219.76 196.632C219.729 196.674 219.685 196.707 219.633 196.725H219.626ZM226.989 192.753L221.704 195.604C221.57 195.667 221.422 195.701 221.271 195.701C221.121 195.701 220.973 195.667 220.838 195.604L215.595 192.753C215.544 192.734 215.5 192.702 215.468 192.66C215.437 192.618 215.42 192.567 215.42 192.516C215.42 192.465 215.437 192.414 215.468 192.372C215.5 192.33 215.544 192.298 215.595 192.28L220.873 189.428C221.007 189.365 221.156 189.331 221.306 189.331C221.456 189.331 221.605 189.365 221.739 189.428L226.982 192.28C227.034 192.296 227.079 192.327 227.111 192.369C227.144 192.411 227.161 192.461 227.161 192.513C227.161 192.564 227.144 192.614 227.111 192.656C227.079 192.698 227.034 192.73 226.982 192.746L226.989 192.753ZM271.191 168.868L228.997 191.657C228.863 191.721 228.715 191.754 228.565 191.754C228.414 191.754 228.266 191.721 228.132 191.657L222.889 188.806C222.837 188.788 222.793 188.756 222.762 188.714C222.73 188.671 222.714 188.621 222.714 188.57C222.714 188.518 222.73 188.468 222.762 188.426C222.793 188.384 222.837 188.351 222.889 188.333L265.083 165.544C265.218 165.48 265.367 165.447 265.519 165.447C265.67 165.447 265.82 165.48 265.955 165.544L271.198 168.395C271.434 168.524 271.434 168.732 271.198 168.868H271.191ZM278.962 164.669L273.685 167.52C273.551 167.584 273.402 167.617 273.252 167.617C273.101 167.617 272.953 167.584 272.819 167.52L267.576 164.669C267.525 164.651 267.48 164.618 267.449 164.576C267.418 164.534 267.401 164.484 267.401 164.432C267.401 164.381 267.418 164.331 267.449 164.289C267.48 164.246 267.525 164.214 267.576 164.196L272.854 161.345C272.989 161.282 273.139 161.25 273.29 161.25C273.441 161.25 273.591 161.282 273.726 161.345L278.969 164.196C279.205 164.325 279.205 164.533 278.969 164.662L278.962 164.669ZM286.463 160.613L281.186 163.464C281.051 163.525 280.903 163.556 280.753 163.556C280.603 163.556 280.455 163.525 280.32 163.464L275.077 160.613C275.026 160.594 274.981 160.562 274.95 160.52C274.919 160.478 274.902 160.427 274.902 160.376C274.902 160.325 274.919 160.274 274.95 160.232C274.981 160.19 275.026 160.158 275.077 160.139L280.355 157.288C280.49 157.225 280.639 157.191 280.791 157.191C280.943 157.191 281.092 157.225 281.227 157.288L286.47 160.139C286.713 160.269 286.706 160.476 286.47 160.613H286.463ZM293.958 156.569L288.68 159.42C288.616 159.451 288.548 159.475 288.479 159.492C288.401 159.498 288.322 159.498 288.243 159.492C288.092 159.494 287.941 159.461 287.807 159.394L282.564 156.543C282.513 156.525 282.468 156.493 282.437 156.45C282.406 156.408 282.389 156.358 282.389 156.307C282.389 156.255 282.406 156.205 282.437 156.163C282.468 156.121 282.513 156.088 282.564 156.07L287.842 153.219C287.976 153.155 288.124 153.122 288.275 153.122C288.425 153.122 288.573 153.155 288.708 153.219L293.951 156.07C294.004 156.098 294.051 156.136 294.089 156.18C294.172 156.303 294.131 156.446 293.951 156.543L293.958 156.569Z" stroke="#C3D2D8" stroke-width="0.5" stroke-linejoin="bevel"/>
                <path d="M129.497 86.9756L134.096 89.438" stroke="#C3D2D8" stroke-linejoin="round"/>
                <path d="M124.24 96.1964L128.839 98.6588" stroke="#C3D2D8" stroke-linejoin="round"/>
                <path d="M223.803 232.999V237.917" stroke="#C3D2D8" stroke-linejoin="round"/>
                <path d="M213.947 233.614V237.917" stroke="#C3D2D8" stroke-linejoin="round"/>
                <path d="M344.726 167.216V172.134" stroke="#C3D2D8" stroke-linejoin="round"/>
                <path d="M135.079 190.575V195.494" stroke="#C3D2D8" stroke-linejoin="round"/>
                <path d="M298.652 197.023L281.877 206.367L277.521 204.014L294.296 194.671L298.652 197.023Z" stroke="#C3D2D8" stroke-width="2" stroke-linejoin="round"/>
                <path d="M298.653 196.965L298.647 201.442L281.871 210.838L281.878 206.367L298.653 196.965Z" fill="#FFF0F9" fill-opacity="0.41" stroke="#C3D2D8" stroke-width="2" stroke-linejoin="round"/>
                <path d="M281.878 206.367L281.871 210.838L277.515 208.486L277.522 204.015L281.878 206.367Z" fill="#9593A8" stroke="#C3D2D8" stroke-width="2" stroke-linejoin="round"/>
                <path d="M146.507 128.336V118.364L155.788 113.349V123.328L146.507 128.336ZM156.003 112.694L146.21 117.969C146.139 118.013 146.081 118.071 146.039 118.14C145.997 118.208 145.972 118.285 145.967 118.364V128.868C145.967 129.01 146.085 129.069 146.216 128.997L155.989 123.723C156.059 123.678 156.117 123.62 156.159 123.551C156.201 123.483 156.226 123.406 156.232 123.328V112.817C156.232 112.675 156.121 112.616 155.982 112.694" fill="#A7B3C2"/>
                <path d="M191.499 94.583L162.901 110.031C162.83 110.075 162.771 110.135 162.729 110.205C162.687 110.275 162.663 110.353 162.659 110.433C162.659 110.575 162.77 110.634 162.908 110.556L191.506 95.1143C191.577 95.0708 191.636 95.0123 191.678 94.9437C191.72 94.875 191.744 94.7981 191.749 94.719C191.749 94.57 191.631 94.5117 191.499 94.583" fill="#A7B3C2"/>
                <path d="M191.513 98.7689L162.915 114.217C162.843 114.259 162.783 114.317 162.741 114.386C162.698 114.455 162.675 114.533 162.673 114.612C162.673 114.761 162.784 114.82 162.915 114.748L191.513 99.3003C191.584 99.2564 191.642 99.1979 191.684 99.1293C191.726 99.0607 191.751 98.9839 191.756 98.905C191.756 98.756 191.645 98.6977 191.513 98.7689" fill="#A7B3C2"/>
                <path d="M191.527 102.942L162.929 118.39C162.856 118.432 162.796 118.49 162.752 118.559C162.709 118.628 162.684 118.705 162.68 118.785C162.68 118.934 162.791 118.993 162.929 118.915L191.527 103.473C191.598 103.428 191.656 103.368 191.698 103.299C191.74 103.229 191.764 103.151 191.769 103.072C191.769 102.923 191.659 102.871 191.527 102.942Z" fill="#A7B3C2"/>
                <path d="M146.556 144.795V134.823L155.837 129.807V139.78L146.549 144.795H146.556ZM156.045 129.146L146.279 134.421C146.206 134.465 146.146 134.524 146.103 134.594C146.059 134.664 146.034 134.742 146.029 134.823L146.064 145.32C146.064 145.469 146.175 145.527 146.313 145.456L156.079 140.182C156.152 140.138 156.212 140.079 156.255 140.009C156.299 139.939 156.324 139.86 156.329 139.78L156.294 129.276C156.294 129.133 156.183 129.069 156.045 129.146Z" fill="#A7B3C2"/>
                <path d="M191.548 111.042L162.957 126.49C162.884 126.533 162.823 126.592 162.78 126.662C162.737 126.732 162.712 126.811 162.708 126.892C162.708 127.034 162.818 127.092 162.957 127.015L191.555 111.567C191.625 111.524 191.683 111.467 191.726 111.399C191.768 111.332 191.792 111.256 191.797 111.178C191.797 111.029 191.686 110.971 191.548 111.042" fill="#A7B3C2"/>
                <path d="M191.562 115.254L162.964 130.695C162.893 130.74 162.835 130.8 162.793 130.87C162.751 130.939 162.726 131.017 162.721 131.097C162.721 131.239 162.832 131.298 162.971 131.226L191.569 115.779C191.639 115.735 191.697 115.676 191.739 115.608C191.781 115.539 191.806 115.462 191.811 115.383C191.816 115.355 191.811 115.325 191.797 115.299C191.783 115.273 191.761 115.252 191.734 115.238C191.707 115.224 191.676 115.218 191.645 115.22C191.614 115.223 191.585 115.235 191.562 115.254" fill="#A7B3C2"/>
                <path d="M191.576 119.407L162.978 134.855C162.905 134.899 162.845 134.958 162.803 135.028C162.761 135.098 162.737 135.177 162.735 135.257C162.735 135.399 162.846 135.458 162.978 135.387L191.576 119.939C191.647 119.895 191.706 119.837 191.748 119.768C191.79 119.7 191.814 119.622 191.818 119.543C191.818 119.394 191.707 119.336 191.576 119.407" fill="#A7B3C2"/>
                <path d="M146.611 161.261L146.577 151.288L155.858 146.273V156.252L146.611 161.261ZM156.1 145.618L146.334 150.893C146.261 150.936 146.201 150.995 146.157 151.065C146.114 151.135 146.089 151.214 146.085 151.295L146.119 161.792C146.119 161.941 146.23 161.993 146.369 161.921L156.135 156.647C156.207 156.604 156.267 156.546 156.31 156.477C156.353 156.409 156.379 156.331 156.384 156.252L156.349 145.709C156.349 145.56 156.239 145.502 156.1 145.579" fill="#A7B3C2"/>
                <path d="M191.603 127.501L163.005 142.949C162.933 142.991 162.873 143.049 162.83 143.118C162.787 143.187 162.761 143.264 162.756 143.344C162.756 143.486 162.867 143.551 163.005 143.473L191.603 128.025C191.674 127.982 191.733 127.923 191.775 127.855C191.817 127.786 191.841 127.709 191.846 127.63C191.846 127.488 191.735 127.429 191.603 127.501Z" fill="#A7B3C2"/>
                <path d="M191.617 131.687L163.019 147.128C162.948 147.171 162.888 147.229 162.844 147.298C162.801 147.367 162.776 147.444 162.77 147.523C162.77 147.672 162.881 147.731 163.019 147.659L191.617 132.211C191.687 132.168 191.746 132.109 191.788 132.04C191.83 131.972 191.854 131.895 191.86 131.816C191.86 131.674 191.749 131.609 191.617 131.687Z" fill="#A7B3C2"/>
                <path d="M191.624 135.866L163.026 151.314C162.956 151.358 162.897 151.416 162.855 151.485C162.813 151.554 162.789 151.63 162.784 151.709C162.784 151.858 162.895 151.917 163.033 151.839L191.631 136.397C191.702 136.352 191.76 136.292 191.802 136.223C191.844 136.153 191.868 136.075 191.873 135.996C191.873 135.853 191.756 135.795 191.624 135.866Z" fill="#A7B3C2"/>
                <path d="M140.453 170.047L140.696 169.918L140.453 170.047ZM140.668 169.684L140.502 116.407L196.839 85.9519L196.998 139.229L140.668 169.684ZM197.081 85.3168L140.287 116.005C140.216 116.051 140.157 116.11 140.114 116.18C140.068 116.246 140.041 116.322 140.038 116.401L140.204 170.216C140.2 170.243 140.205 170.271 140.217 170.296C140.229 170.321 140.248 170.343 140.273 170.358C140.3 170.374 140.331 170.382 140.363 170.382C140.395 170.382 140.426 170.374 140.453 170.358L197.247 139.67C197.32 139.626 197.38 139.566 197.42 139.495C197.462 139.428 197.486 139.352 197.49 139.274L197.33 85.4918C197.333 85.4628 197.328 85.4337 197.314 85.4075C197.301 85.3813 197.28 85.3589 197.254 85.3427C197.228 85.3291 197.198 85.322 197.168 85.322C197.137 85.322 197.108 85.3291 197.081 85.3427" fill="#A7B3C2"/>
                <path d="M140.267 108.016L140.509 107.886L140.267 108.016ZM140.509 107.62V98.756L248.169 40.5864V49.4509L140.509 107.62V107.62ZM248.404 39.9255L140.232 98.3607C140.161 98.4035 140.102 98.4612 140.059 98.5292C140.015 98.5976 139.991 98.676 139.99 98.756V108.152C139.988 108.18 139.993 108.208 140.005 108.234C140.017 108.26 140.036 108.283 140.059 108.301C140.086 108.316 140.117 108.324 140.149 108.324C140.181 108.324 140.212 108.316 140.239 108.301L248.439 49.8526C248.512 49.8091 248.571 49.7489 248.612 49.6777C248.657 49.6119 248.681 49.5355 248.681 49.4573V40.0616C248.684 40.0326 248.679 40.0035 248.665 39.9773C248.652 39.9511 248.631 39.9287 248.605 39.9125C248.579 39.8983 248.549 39.8908 248.519 39.8908C248.488 39.8908 248.458 39.8983 248.432 39.9125" fill="#A7B3C2"/>
                <path d="M202.256 136.637L202.505 136.501L202.256 136.637ZM202.505 136.235L202.311 82.9841L233.021 66.4021L233.181 119.679L202.477 136.261L202.505 136.235ZM233.292 65.7412L202.089 82.5888C202.018 82.6315 201.959 82.6892 201.916 82.7573C201.871 82.8254 201.847 82.9039 201.847 82.9841L202.006 136.767C202.002 136.795 202.007 136.824 202.021 136.849C202.035 136.874 202.056 136.895 202.082 136.909C202.108 136.924 202.138 136.932 202.169 136.932C202.2 136.932 202.229 136.924 202.256 136.909L233.458 120.062C233.53 120.021 233.59 119.963 233.631 119.893C233.673 119.826 233.696 119.751 233.7 119.673L233.534 65.8902C233.538 65.8618 233.534 65.8329 233.522 65.8066C233.51 65.7803 233.49 65.7577 233.465 65.7412C233.438 65.7276 233.408 65.7205 233.378 65.7205C233.348 65.7205 233.318 65.7276 233.292 65.7412" fill="#A7B3C2"/>
                <path d="M238.147 117.275L238.396 117.139L238.147 117.275ZM238.396 116.874L238.237 63.5964L250.011 57.2397L250.171 110.517L238.396 116.874ZM250.247 56.6111L237.987 63.24C237.915 63.2811 237.855 63.3391 237.814 63.4085C237.77 63.4746 237.746 63.5508 237.745 63.6288L237.904 117.411C237.902 117.44 237.907 117.468 237.919 117.494C237.931 117.52 237.95 117.543 237.974 117.561C237.999 117.576 238.029 117.584 238.06 117.584C238.091 117.584 238.121 117.576 238.147 117.561L250.413 110.938C250.485 110.897 250.545 110.839 250.586 110.77C250.628 110.703 250.652 110.627 250.655 110.549L250.489 56.7666C250.491 56.7393 250.486 56.7119 250.474 56.687C250.462 56.6621 250.443 56.6404 250.42 56.6241C250.394 56.6099 250.364 56.6024 250.333 56.6024C250.303 56.6024 250.273 56.6099 250.247 56.6241" fill="#A7B3C2"/>
                <path d="M226.012 75.9405L206.127 86.6841C206.055 86.7279 205.994 86.7871 205.951 86.8569C205.908 86.9268 205.883 87.0052 205.878 87.0858C205.878 87.2348 205.989 87.2867 206.127 87.2154L226.012 76.4718C226.084 76.429 226.144 76.3709 226.188 76.3022C226.231 76.2335 226.256 76.1562 226.262 76.0766C226.262 75.9275 226.151 75.8692 226.012 75.9405" fill="#A7B3C2"/>
                <path d="M229.323 78.351L206.155 90.87C206.083 90.9128 206.023 90.971 205.98 91.0397C205.936 91.1084 205.911 91.1857 205.906 91.2653C205.906 91.4143 206.017 91.4727 206.155 91.4014L229.323 78.8823C229.394 78.8388 229.452 78.7803 229.494 78.7117C229.537 78.643 229.561 78.5661 229.565 78.4871C229.565 78.338 229.455 78.2797 229.323 78.351" fill="#A7B3C2"/>
                <path d="M226.04 84.8697L206.155 95.6133C206.083 95.6561 206.023 95.7142 205.98 95.7829C205.936 95.8516 205.911 95.9289 205.906 96.0085C205.906 96.1576 206.017 96.2159 206.155 96.1381L226.04 85.401C226.112 85.3572 226.173 85.298 226.216 85.2281C226.259 85.1583 226.285 85.0799 226.289 84.9993C226.289 84.8567 226.178 84.7984 226.04 84.8697Z" fill="#A7B3C2"/>
                <path d="M229.323 87.2802L206.148 99.7992C206.077 99.8428 206.019 99.9012 205.977 99.9698C205.934 100.039 205.91 100.115 205.906 100.194C205.906 100.337 206.017 100.395 206.155 100.324L229.323 87.805C229.394 87.7615 229.452 87.7031 229.494 87.6344C229.537 87.5658 229.561 87.4888 229.565 87.4098C229.565 87.2672 229.455 87.2089 229.323 87.2802Z" fill="#A7B3C2"/>
                <path d="M246.638 64.7887L240.585 68.0286C240.515 68.0725 240.456 68.131 240.414 68.1996C240.372 68.2682 240.347 68.345 240.342 68.4239C240.342 68.5729 240.453 68.6248 240.585 68.5535L246.645 65.3136C246.717 65.2712 246.777 65.2131 246.819 65.1442C246.861 65.0752 246.885 64.9977 246.888 64.9183C246.888 64.7757 246.777 64.7174 246.638 64.7887Z" fill="#A7B3C2"/>
                <path d="M247.677 68.4304L240.619 72.247C240.548 72.2893 240.488 72.3475 240.446 72.4164C240.403 72.4853 240.38 72.5628 240.377 72.6423C240.377 72.7913 240.488 72.8496 240.619 72.7783L247.677 68.9617C247.749 68.9198 247.809 68.8617 247.852 68.7927C247.894 68.7237 247.917 68.646 247.919 68.5664C247.919 68.4174 247.809 68.3591 247.677 68.4304Z" fill="#A7B3C2"/>
                <path d="M246.687 73.7179L240.633 76.9578C240.563 77.0003 240.505 77.0576 240.463 77.1252C240.42 77.1927 240.396 77.2685 240.391 77.3466C240.391 77.4956 240.502 77.5539 240.633 77.4826L246.694 74.2103C246.765 74.1658 246.824 74.1062 246.866 74.0365C246.908 73.9667 246.932 73.8886 246.936 73.8086C246.936 73.666 246.825 73.6077 246.687 73.6855" fill="#A7B3C2"/>
                <path d="M247.705 77.3596L240.647 81.1697C240.576 81.211 240.516 81.2681 240.474 81.3358C240.432 81.4036 240.408 81.4801 240.405 81.5585C240.405 81.7075 240.515 81.7659 240.647 81.6946L247.705 77.8779C247.777 77.8356 247.836 77.7775 247.879 77.7085C247.921 77.6396 247.944 77.5621 247.947 77.4827C247.947 77.3401 247.836 77.2818 247.705 77.3531" fill="#A7B3C2"/>
                <path d="M226.123 112.765L206.238 123.502C206.166 123.546 206.105 123.606 206.062 123.675C206.019 123.745 205.994 123.824 205.989 123.904C205.989 124.047 206.1 124.105 206.238 124.034L226.123 113.31C226.195 113.267 226.255 113.209 226.299 113.14C226.342 113.071 226.367 112.994 226.373 112.914C226.373 112.765 226.262 112.707 226.123 112.785" fill="#A7B3C2"/>
                <path d="M229.42 115.169L206.252 127.689C206.179 127.732 206.118 127.791 206.075 127.861C206.032 127.931 206.007 128.01 206.003 128.09C206.003 128.233 206.113 128.291 206.252 128.213L229.42 115.701C229.491 115.658 229.55 115.599 229.592 115.531C229.634 115.462 229.658 115.385 229.662 115.306C229.662 115.156 229.551 115.098 229.42 115.169" fill="#A7B3C2"/>
                <path d="M91.984 318.912C91.984 321.312 91.84 323.388 91.552 325.14C91.264 326.892 90.952 328.38 90.616 329.604C90.424 330.3 90.208 330.948 89.968 331.548C89.752 332.148 89.524 332.688 89.284 333.168H84.064C84.856 331.848 85.444 330.48 85.828 329.064C86.236 327.648 86.512 326.292 86.656 324.996C86.824 323.7 86.896 322.524 86.872 321.468C86.848 320.412 86.812 319.572 86.764 318.948H70.924V314.88H91.984V318.912ZM68.44 339.756V335.4H94.792V339.756H68.44ZM113.783 325.608V329.28H98.1948V320.244H108.671V318.156H98.1948V314.484H113.063V323.124H102.623V325.608H113.783ZM122.819 312.72V329.676H118.211V312.72H122.819ZM122.963 332.052V343.032H101.075V332.052H122.963ZM118.859 335.832H105.251V339.216H118.859V335.832ZM145.551 312.36C146.127 312.36 146.751 312.468 147.423 312.684C148.095 312.876 148.719 313.188 149.295 313.62C149.871 314.028 150.339 314.532 150.699 315.132C151.083 315.732 151.275 316.428 151.275 317.22V319.488C151.275 320.208 151.119 320.856 150.807 321.432C150.519 322.008 150.099 322.5 149.547 322.908C149.019 323.292 148.383 323.592 147.639 323.808C146.919 324 146.127 324.096 145.263 324.096H135.327C134.607 324.096 133.899 323.988 133.203 323.772C132.531 323.532 131.919 323.22 131.367 322.836C130.839 322.428 130.407 321.972 130.071 321.468C129.759 320.94 129.603 320.376 129.603 319.776V316.932C129.603 316.188 129.771 315.54 130.107 314.988C130.467 314.412 130.911 313.932 131.439 313.548C131.991 313.164 132.579 312.876 133.203 312.684C133.851 312.468 134.463 312.36 135.039 312.36H145.551ZM145.479 335.328V333.672H129.855V330.792H150.591V338.784H134.103V340.26H150.951V343.392H129.855V335.328H145.479ZM126.615 329.244V325.5H153.975V329.244H126.615ZM144.687 320.64C145.407 320.64 145.959 320.4 146.343 319.92C146.751 319.44 146.955 318.924 146.955 318.372C146.955 317.796 146.751 317.268 146.343 316.788C145.959 316.308 145.407 316.068 144.687 316.068H136.155C135.459 316.068 134.907 316.308 134.499 316.788C134.115 317.268 133.923 317.796 133.923 318.372C133.923 318.924 134.115 319.44 134.499 319.92C134.907 320.4 135.459 320.64 136.155 320.64H144.687ZM172.26 343.32V332.304H177.156V334.572H190.08V332.304H194.76V343.32H172.26ZM190.08 339.792V337.812H177.156V339.792H190.08ZM188.568 324.096V327.624H179.676V330.972H175.14V327.624H168.372V324.096H188.568ZM190.008 312.756H194.796V330.936H190.008V312.756ZM181.332 312.864C181.74 313.608 182.148 314.328 182.556 315.024C182.964 315.72 183.396 316.44 183.852 317.184C184.332 317.904 184.848 318.672 185.4 319.488C185.952 320.304 186.564 321.204 187.236 322.188H182.088C181.728 321.588 181.416 321.084 181.152 320.676C180.912 320.244 180.672 319.848 180.432 319.488C180.192 319.104 179.94 318.72 179.676 318.336C179.436 317.928 179.136 317.448 178.776 316.896C178.464 317.4 178.188 317.844 177.948 318.228C177.708 318.588 177.456 318.948 177.192 319.308C176.952 319.668 176.664 320.076 176.328 320.532C176.016 320.964 175.62 321.516 175.14 322.188H169.992C171.024 320.796 171.924 319.536 172.692 318.408C173.484 317.28 174.144 316.296 174.672 315.456C174.984 314.976 175.272 314.52 175.536 314.088C175.8 313.656 176.04 313.248 176.256 312.864H181.332ZM212.463 319.632C212.463 321.264 212.199 322.86 211.671 324.42C211.167 325.956 210.507 327.42 209.691 328.812C208.899 330.18 208.011 331.464 207.027 332.664C206.043 333.864 205.071 334.944 204.111 335.904C203.151 336.84 202.263 337.644 201.447 338.316C200.655 338.964 200.031 339.456 199.575 339.792V333.744C200.751 332.712 201.807 331.62 202.743 330.468C203.679 329.292 204.483 328.116 205.155 326.94C205.827 325.74 206.343 324.564 206.703 323.412C207.087 322.26 207.315 321.156 207.387 320.1H198.567V315.456H212.463V319.632ZM220.203 312.72V343.032H215.955V328.884H211.887V324.096H215.955V312.72H220.203ZM226.719 343.032H222.471V312.72H226.719V343.032ZM269.908 328.884H242.188V325.032H253.528V323.16H251.008C250.288 323.16 249.58 323.052 248.884 322.836C248.212 322.596 247.6 322.284 247.048 321.9C246.52 321.492 246.088 321.036 245.752 320.532C245.44 320.004 245.284 319.44 245.284 318.84V316.932C245.284 316.188 245.452 315.54 245.788 314.988C246.148 314.412 246.592 313.932 247.12 313.548C247.672 313.164 248.26 312.876 248.884 312.684C249.532 312.468 250.144 312.36 250.72 312.36H261.232C261.808 312.36 262.432 312.468 263.104 312.684C263.776 312.876 264.4 313.188 264.976 313.62C265.552 314.028 266.02 314.532 266.38 315.132C266.764 315.732 266.956 316.428 266.956 317.22V318.552C266.956 319.272 266.8 319.92 266.488 320.496C266.2 321.072 265.78 321.564 265.228 321.972C264.7 322.356 264.064 322.656 263.32 322.872C262.6 323.064 261.808 323.16 260.944 323.16H258.136V325.032H269.908V328.884ZM245.572 335.148H262.492V333.636H245.572V330.684H267.568V338.532H250.216V340.008H267.568V343.392H245.572V335.148ZM260.368 319.704C261.088 319.704 261.64 319.548 262.024 319.236C262.432 318.9 262.636 318.456 262.636 317.904C262.636 317.328 262.432 316.884 262.024 316.572C261.64 316.236 261.088 316.068 260.368 316.068H251.836C251.14 316.068 250.588 316.236 250.18 316.572C249.796 316.884 249.604 317.328 249.604 317.904C249.604 318.456 249.796 318.9 250.18 319.236C250.588 319.548 251.14 319.704 251.836 319.704H260.368ZM289.334 326.868H278.354V331.908H289.334V335.724H273.746V322.62H285.122V318.876H273.314V314.628H289.334V326.868ZM293.51 343.104V312.792H298.226V343.104H293.51ZM305.939 332.952H310.187V338.388H327.359V342.636H305.939V332.952ZM305.939 313.512H310.187V319.776H326.999V323.88H305.939V313.512ZM302.015 330.72V326.832H330.203V330.72H302.015ZM365.532 332.772C366.828 332.772 367.908 333.096 368.772 333.744C369.66 334.368 370.104 335.34 370.104 336.66V339.072C370.104 340.248 369.732 341.196 368.988 341.916C368.244 342.66 367.224 343.032 365.928 343.032H352.356C350.916 343.032 349.848 342.636 349.152 341.844C348.48 341.076 348.144 340.08 348.144 338.856V336.912C348.144 335.544 348.6 334.512 349.512 333.816C350.424 333.12 351.528 332.772 352.824 332.772H365.532ZM360.564 329.568H345.336V314.34H349.98V319.02H355.884V314.34H360.564V329.568ZM369.384 324.456V330.864H365.208V312.756H369.384V319.956H373.632V324.456H369.384ZM354.336 336.588C354 336.588 353.724 336.636 353.508 336.732C353.292 336.804 353.124 336.912 353.004 337.056C352.908 337.176 352.836 337.308 352.788 337.452C352.764 337.596 352.752 337.728 352.752 337.848V338.424C352.752 338.952 352.932 339.276 353.292 339.396C353.652 339.516 354.072 339.576 354.552 339.576H364.308C364.74 339.576 365.1 339.492 365.388 339.324C365.7 339.18 365.856 338.928 365.856 338.568V337.92C365.856 337.56 365.748 337.248 365.532 336.984C365.316 336.72 364.896 336.588 364.272 336.588H354.336ZM355.884 322.836H349.98V325.788H355.884V322.836ZM391.568 313.62V328.848H376.34V313.62H380.984V317.508H386.888V313.62H391.568ZM386.888 324.96V321.54H380.984V324.96H386.888ZM403.34 312.792V329.568H398.48V323.34H393.224V319.164H398.48V312.792H403.34ZM381.596 343.104V331.44H386.744V333.6H398.264V331.44H403.34V343.104H381.596ZM398.264 339.468V337.236H386.744V339.468H398.264ZM426.232 313.116C427.816 313.116 429.076 313.536 430.012 314.376C430.972 315.216 431.452 316.356 431.452 317.796V320.136C431.452 321.384 430.96 322.44 429.976 323.304C429.016 324.168 427.552 324.6 425.584 324.6H416.152C415.216 324.6 414.4 324.48 413.704 324.24C413.008 324 412.42 323.676 411.94 323.268C411.46 322.86 411.1 322.392 410.86 321.864C410.62 321.336 410.5 320.784 410.5 320.208V317.472C410.5 316.152 410.98 315.096 411.94 314.304C412.9 313.512 414.172 313.116 415.756 313.116H426.232ZM410.68 332.88H415.108V338.568H431.272V342.708H410.68V332.88ZM407.116 330.972V327.12H434.836V330.972H407.116ZM425.08 321.324C425.704 321.324 426.22 321.132 426.628 320.748C427.06 320.364 427.276 319.788 427.276 319.02C427.276 318.42 427.06 317.904 426.628 317.472C426.22 317.016 425.704 316.788 425.08 316.788H416.8C416.152 316.788 415.6 317.016 415.144 317.472C414.712 317.904 414.496 318.42 414.496 319.02C414.496 319.596 414.7 320.124 415.108 320.604C415.54 321.084 416.104 321.324 416.8 321.324H425.08Z" fill="#878787"/>
                <defs>
                    <filter id="filter0_f_0:1" x="0.0405884" y="0.475464" width="470.959" height="387.601" filterUnits="userSpaceOnUse" color-interpolation-filters="sRGB">
                        <feFlood flood-opacity="0" result="BackgroundImageFix"/>
                        <feBlend mode="normal" in="SourceGraphic" in2="BackgroundImageFix" result="shape"/>
                        <feGaussianBlur stdDeviation="28.5" result="effect1_foregroundBlur_0:1"/>
                    </filter>
                    <filter id="filter1_f_0:1" x="63.9266" y="109.813" width="297.923" height="211.598" filterUnits="userSpaceOnUse" color-interpolation-filters="sRGB">
                        <feFlood flood-opacity="0" result="BackgroundImageFix"/>
                        <feBlend mode="normal" in="SourceGraphic" in2="BackgroundImageFix" result="shape"/>
                        <feGaussianBlur stdDeviation="22" result="effect1_foregroundBlur_0:1"/>
                    </filter>
                    <filter id="filter2_f_0:1" x="206.219" y="106.748" width="151.948" height="114.218" filterUnits="userSpaceOnUse" color-interpolation-filters="sRGB">
                        <feFlood flood-opacity="0" result="BackgroundImageFix"/>
                        <feBlend mode="normal" in="SourceGraphic" in2="BackgroundImageFix" result="shape"/>
                        <feGaussianBlur stdDeviation="22" result="effect1_foregroundBlur_0:1"/>
                    </filter>
                    <filter id="filter3_f_0:1" x="273.18" y="66.23" width="129.851" height="105.365" filterUnits="userSpaceOnUse" color-interpolation-filters="sRGB">
                        <feFlood flood-opacity="0" result="BackgroundImageFix"/>
                        <feBlend mode="normal" in="SourceGraphic" in2="BackgroundImageFix" result="shape"/>
                        <feGaussianBlur stdDeviation="22" result="effect1_foregroundBlur_0:1"/>
                    </filter>
                    <filter id="filter4_f_0:1" x="305.991" y="135.69" width="129.851" height="105.365" filterUnits="userSpaceOnUse" color-interpolation-filters="sRGB">
                        <feFlood flood-opacity="0" result="BackgroundImageFix"/>
                        <feBlend mode="normal" in="SourceGraphic" in2="BackgroundImageFix" result="shape"/>
                        <feGaussianBlur stdDeviation="22" result="effect1_foregroundBlur_0:1"/>
                    </filter>
                    <filter id="filter5_f_0:1" x="252.422" y="255.202" width="129.851" height="105.365" filterUnits="userSpaceOnUse" color-interpolation-filters="sRGB">
                        <feFlood flood-opacity="0" result="BackgroundImageFix"/>
                        <feBlend mode="normal" in="SourceGraphic" in2="BackgroundImageFix" result="shape"/>
                        <feGaussianBlur stdDeviation="22" result="effect1_foregroundBlur_0:1"/>
                    </filter>
                    <filter id="filter6_f_0:1" x="82.3409" y="250.095" width="129.851" height="105.365" filterUnits="userSpaceOnUse" color-interpolation-filters="sRGB">
                        <feFlood flood-opacity="0" result="BackgroundImageFix"/>
                        <feBlend mode="normal" in="SourceGraphic" in2="BackgroundImageFix" result="shape"/>
                        <feGaussianBlur stdDeviation="22" result="effect1_foregroundBlur_0:1"/>
                    </filter>
                    <filter id="filter7_f_0:1" x="8.0141" y="196.638" width="129.851" height="105.365" filterUnits="userSpaceOnUse" color-interpolation-filters="sRGB">
                        <feFlood flood-opacity="0" result="BackgroundImageFix"/>
                        <feBlend mode="normal" in="SourceGraphic" in2="BackgroundImageFix" result="shape"/>
                        <feGaussianBlur stdDeviation="22" result="effect1_foregroundBlur_0:1"/>
                    </filter>
                    <filter id="filter8_f_0:1" x="208.563" y="246.35" width="113.11" height="98.5552" filterUnits="userSpaceOnUse" color-interpolation-filters="sRGB">
                        <feFlood flood-opacity="0" result="BackgroundImageFix"/>
                        <feBlend mode="normal" in="SourceGraphic" in2="BackgroundImageFix" result="shape"/>
                        <feGaussianBlur stdDeviation="22" result="effect1_foregroundBlur_0:1"/>
                    </filter>
                    <filter id="filter9_b_0:1" x="413.016" y="128.484" width="27.9835" height="39.3861" filterUnits="userSpaceOnUse" color-interpolation-filters="sRGB">
                        <feFlood flood-opacity="0" result="BackgroundImageFix"/>
                        <feGaussianBlur in="BackgroundImage" stdDeviation="1"/>
                        <feComposite in2="SourceAlpha" operator="in" result="effect1_backgroundBlur_0:1"/>
                        <feBlend mode="normal" in="SourceGraphic" in2="effect1_backgroundBlur_0:1" result="shape"/>
                    </filter>
                    <filter id="filter10_b_0:1" x="332.231" y="246.816" width="16.474" height="32.7797" filterUnits="userSpaceOnUse" color-interpolation-filters="sRGB">
                        <feFlood flood-opacity="0" result="BackgroundImageFix"/>
                        <feGaussianBlur in="BackgroundImage" stdDeviation="1"/>
                        <feComposite in2="SourceAlpha" operator="in" result="effect1_backgroundBlur_0:1"/>
                        <feBlend mode="normal" in="SourceGraphic" in2="effect1_backgroundBlur_0:1" result="shape"/>
                    </filter>
                    <filter id="filter11_b_0:1" x="313.01" y="244.596" width="27.9836" height="39.3925" filterUnits="userSpaceOnUse" color-interpolation-filters="sRGB">
                        <feFlood flood-opacity="0" result="BackgroundImageFix"/>
                        <feGaussianBlur in="BackgroundImage" stdDeviation="1"/>
                        <feComposite in2="SourceAlpha" operator="in" result="effect1_backgroundBlur_0:1"/>
                        <feBlend mode="normal" in="SourceGraphic" in2="effect1_backgroundBlur_0:1" result="shape"/>
                    </filter>
                    <filter id="filter12_b_0:1" x="49.0141" y="178.212" width="27.9835" height="39.3838" filterUnits="userSpaceOnUse" color-interpolation-filters="sRGB">
                        <feFlood flood-opacity="0" result="BackgroundImageFix"/>
                        <feGaussianBlur in="BackgroundImage" stdDeviation="1"/>
                        <feComposite in2="SourceAlpha" operator="in" result="effect1_backgroundBlur_0:1"/>
                        <feBlend mode="normal" in="SourceGraphic" in2="effect1_backgroundBlur_0:1" result="shape"/>
                    </filter>
                    <linearGradient id="paint0_linear_0:1" x1="364.388" y1="129.468" x2="395.656" y2="141.031" gradientUnits="userSpaceOnUse">
                        <stop stop-color="#DADAF9"/>
                        <stop offset="1" stop-color="#FFF0F9" stop-opacity="0.56"/>
                    </linearGradient>
                    <linearGradient id="paint1_linear_0:1" x1="145.43" y1="268.449" x2="172.447" y2="278.439" gradientUnits="userSpaceOnUse">
                        <stop stop-color="#DADAF9"/>
                        <stop offset="1" stop-color="#FFF0F9" stop-opacity="0.56"/>
                    </linearGradient>
                    <linearGradient id="paint2_linear_0:1" x1="276.546" y1="101.056" x2="318.018" y2="123.987" gradientUnits="userSpaceOnUse">
                        <stop stop-color="#DADAF9"/>
                        <stop offset="1" stop-color="#FFF0F9" stop-opacity="0.56"/>
                    </linearGradient>
                    <linearGradient id="paint3_linear_0:1" x1="285.131" y1="85.4681" x2="316.852" y2="97.1855" gradientUnits="userSpaceOnUse">
                        <stop stop-color="#DADAF9"/>
                        <stop offset="1" stop-color="#FFF0F9" stop-opacity="0.56"/>
                    </linearGradient>
                    <linearGradient id="paint4_linear_0:1" x1="341.414" y1="243.104" x2="367.048" y2="265.552" gradientUnits="userSpaceOnUse">
                        <stop stop-color="#DADAF9"/>
                        <stop offset="1" stop-color="#FFF0F9" stop-opacity="0.56"/>
                    </linearGradient>
                    <linearGradient id="paint5_linear_0:1" x1="64.4726" y1="172.897" x2="94.3606" y2="179.415" gradientUnits="userSpaceOnUse">
                        <stop stop-color="#DADAF9"/>
                        <stop offset="1" stop-color="#FFF0F9" stop-opacity="0.56"/>
                    </linearGradient>
                    <linearGradient id="paint6_linear_0:1" x1="380.014" y1="103.61" x2="398.51" y2="110.446" gradientUnits="userSpaceOnUse">
                        <stop stop-color="#DADAF9"/>
                        <stop offset="1" stop-color="#FFF0F9" stop-opacity="0.56"/>
                    </linearGradient>
                    <linearGradient id="paint7_linear_0:1" x1="106.155" y1="293.009" x2="128.476" y2="301.253" gradientUnits="userSpaceOnUse">
                        <stop stop-color="#DADAF9"/>
                        <stop offset="1" stop-color="#FFF0F9" stop-opacity="0.56"/>
                    </linearGradient>
                    <linearGradient id="paint8_linear_0:1" x1="260.795" y1="282.569" x2="277.433" y2="288.716" gradientUnits="userSpaceOnUse">
                        <stop stop-color="#DADAF9"/>
                        <stop offset="1" stop-color="#FFF0F9" stop-opacity="0.56"/>
                    </linearGradient>
                    <radialGradient id="paint9_radial_0:1" cx="0" cy="0" r="1" gradientUnits="userSpaceOnUse" gradientTransform="translate(408.646 180.024) rotate(103.859) scale(24.0209 14.5737)">
                        <stop stop-color="#FFF0F9" stop-opacity="0.54"/>
                        <stop offset="1" stop-color="#DADAF9"/>
                    </radialGradient>
                    <radialGradient id="paint10_radial_0:1" cx="0" cy="0" r="1" gradientUnits="userSpaceOnUse" gradientTransform="translate(325.93 296.364) rotate(98.8101) scale(18.9301 7.47465)">
                        <stop stop-color="#FFF0F9" stop-opacity="0.54"/>
                        <stop offset="1" stop-color="#DADAF9"/>
                    </radialGradient>
                    <radialGradient id="paint11_radial_0:1" cx="0" cy="0" r="1" gradientUnits="userSpaceOnUse" gradientTransform="translate(316.678 296.138) rotate(103.857) scale(24.0253 14.5739)">
                        <stop stop-color="#FFF0F9" stop-opacity="0.54"/>
                        <stop offset="1" stop-color="#DADAF9"/>
                    </radialGradient>
                    <radialGradient id="paint12_radial_0:1" cx="0" cy="0" r="1" gradientUnits="userSpaceOnUse" gradientTransform="translate(73.9026 229.752) rotate(103.86) scale(24.0193 14.5737)">
                        <stop stop-color="#FFF0F9" stop-opacity="0.54"/>
                        <stop offset="1" stop-color="#DADAF9"/>
                    </radialGradient>
                    <linearGradient id="paint13_linear_0:1" x1="-49.7668" y1="22.8942" x2="233.147" y2="10.3796" gradientUnits="userSpaceOnUse">
                        <stop stop-color="#DADAF9"/>
                        <stop offset="1" stop-color="#FFF0F9" stop-opacity="0.47"/>
                    </linearGradient>
                    <linearGradient id="paint14_linear_0:1" x1="123.759" y1="83.0873" x2="251.712" y2="104.126" gradientUnits="userSpaceOnUse">
                        <stop stop-color="#DADAF9"/>
                        <stop offset="1" stop-color="#FFF0F9" stop-opacity="0.56"/>
                    </linearGradient>
                    <linearGradient id="paint15_linear_0:1" x1="214.227" y1="265.834" x2="239.792" y2="172.927" gradientUnits="userSpaceOnUse">
                        <stop stop-color="#DADAF9"/>
                        <stop offset="1" stop-color="#FFF0F9" stop-opacity="0.51"/>
                    </linearGradient>
                    <linearGradient id="paint16_linear_0:1" x1="131.61" y1="213.558" x2="288.121" y2="303.393" gradientUnits="userSpaceOnUse">
                        <stop stop-color="#DADAF9"/>
                        <stop offset="1" stop-color="#FFF0F9" stop-opacity="0.56"/>
                    </linearGradient>
                    <linearGradient id="paint17_linear_0:1" x1="385.139" y1="90.9923" x2="418.409" y2="104.372" gradientUnits="userSpaceOnUse">
                        <stop stop-color="#DADAF9"/>
                        <stop offset="1" stop-color="#FFF0F9" stop-opacity="0.56"/>
                    </linearGradient>
                    <linearGradient id="paint18_linear_0:1" x1="147.042" y1="229.974" x2="175.79" y2="241.532" gradientUnits="userSpaceOnUse">
                        <stop stop-color="#DADAF9"/>
                        <stop offset="1" stop-color="#FFF0F9" stop-opacity="0.56"/>
                    </linearGradient>
                    <linearGradient id="paint19_linear_0:1" x1="289.619" y1="62.5805" x2="332.869" y2="88.5842" gradientUnits="userSpaceOnUse">
                        <stop stop-color="#DADAF9"/>
                        <stop offset="1" stop-color="#FFF0F9" stop-opacity="0.56"/>
                    </linearGradient>
                    <linearGradient id="paint20_linear_0:1" x1="298.954" y1="46.9926" x2="332.708" y2="60.5509" gradientUnits="userSpaceOnUse">
                        <stop stop-color="#DADAF9"/>
                        <stop offset="1" stop-color="#FFF0F9" stop-opacity="0.56"/>
                    </linearGradient>
                    <linearGradient id="paint21_linear_0:1" x1="360.157" y1="204.628" x2="385.986" y2="229.224" gradientUnits="userSpaceOnUse">
                        <stop stop-color="#DADAF9"/>
                        <stop offset="1" stop-color="#FFF0F9" stop-opacity="0.56"/>
                    </linearGradient>
                    <linearGradient id="paint22_linear_0:1" x1="59.0084" y1="134.421" x2="91.2418" y2="142.066" gradientUnits="userSpaceOnUse">
                        <stop stop-color="#DADAF9"/>
                        <stop offset="1" stop-color="#FFF0F9" stop-opacity="0.56"/>
                    </linearGradient>
                    <linearGradient id="paint23_linear_0:1" x1="402.13" y1="65.1342" x2="421.812" y2="73.0447" gradientUnits="userSpaceOnUse">
                        <stop stop-color="#DADAF9"/>
                        <stop offset="1" stop-color="#FFF0F9" stop-opacity="0.56"/>
                    </linearGradient>
                    <linearGradient id="paint24_linear_0:1" x1="104.334" y1="254.533" x2="128.085" y2="264.073" gradientUnits="userSpaceOnUse">
                        <stop stop-color="#DADAF9"/>
                        <stop offset="1" stop-color="#FFF0F9" stop-opacity="0.56"/>
                    </linearGradient>
                    <linearGradient id="paint25_linear_0:1" x1="272.49" y1="244.094" x2="290.196" y2="251.207" gradientUnits="userSpaceOnUse">
                        <stop stop-color="#DADAF9"/>
                        <stop offset="1" stop-color="#FFF0F9" stop-opacity="0.56"/>
                    </linearGradient>
                    <radialGradient id="paint26_radial_0:1" cx="0" cy="0" r="1" gradientUnits="userSpaceOnUse" gradientTransform="translate(433.265 141.548) rotate(105.018) scale(24.1463 15.7653)">
                        <stop stop-color="#FFF0F9" stop-opacity="0.54"/>
                        <stop offset="1" stop-color="#DADAF9"/>
                    </radialGradient>
                    <radialGradient id="paint27_radial_0:1" cx="0" cy="0" r="1" gradientUnits="userSpaceOnUse" gradientTransform="translate(343.319 257.888) rotate(99.5666) scale(18.9706 8.11066)">
                        <stop stop-color="#FFF0F9" stop-opacity="0.54"/>
                        <stop offset="1" stop-color="#DADAF9"/>
                    </radialGradient>
                    <radialGradient id="paint28_radial_0:1" cx="0" cy="0" r="1" gradientUnits="userSpaceOnUse" gradientTransform="translate(333.259 257.662) rotate(105.015) scale(24.1507 15.7655)">
                        <stop stop-color="#FFF0F9" stop-opacity="0.54"/>
                        <stop offset="1" stop-color="#DADAF9"/>
                    </radialGradient>
                    <radialGradient id="paint29_radial_0:1" cx="0" cy="0" r="1" gradientUnits="userSpaceOnUse" gradientTransform="translate(69.2626 191.276) rotate(105.019) scale(24.1447 15.7652)">
                        <stop stop-color="#FFF0F9" stop-opacity="0.54"/>
                        <stop offset="1" stop-color="#DADAF9"/>
                    </radialGradient>
                    <linearGradient id="paint30_linear_0:1" x1="-65.2165" y1="-15.5813" x2="242.317" y2="-30.374" gradientUnits="userSpaceOnUse">
                        <stop stop-color="#DADAF9"/>
                        <stop offset="1" stop-color="#FFF0F9" stop-opacity="0.47"/>
                    </linearGradient>
                    <linearGradient id="paint31_linear_0:1" x1="123.477" y1="44.6118" x2="261.949" y2="69.3697" gradientUnits="userSpaceOnUse">
                        <stop stop-color="#DADAF9"/>
                        <stop offset="1" stop-color="#FFF0F9" stop-opacity="0.56"/>
                    </linearGradient>
                    <linearGradient id="paint32_linear_0:1" x1="221.853" y1="227.359" x2="245.621" y2="133.432" gradientUnits="userSpaceOnUse">
                        <stop stop-color="#DADAF9"/>
                        <stop offset="1" stop-color="#FFF0F9" stop-opacity="0.51"/>
                    </linearGradient>
                    <linearGradient id="paint33_linear_0:1" x1="132.014" y1="175.083" x2="294.843" y2="276.713" gradientUnits="userSpaceOnUse">
                        <stop stop-color="#DADAF9"/>
                        <stop offset="1" stop-color="#FFF0F9" stop-opacity="0.56"/>
                    </linearGradient>
                </defs>
            </svg>
            <svg style="display:none;" id="city1" width="500" height="350" viewBox="0 0 778 563" fill="none" xmlns="http://www.w3.org/2000/svg">
                <path d="M611 323L569 299L653 251L695 275L611 323Z" fill="#434242"/>
                <path d="M688 271L695 275L611 323L604 319L688 271Z" fill="#959595"/>
                <path d="M653 251L660 255L576 303L569 299L653 251Z" fill="#959595"/>
                <path d="M658.053 270.819L660.054 271.819L646.053 279.819L644.053 278.819L658.053 270.819Z" fill="#959595"/>
                <path d="M623.053 291.819L625.054 292.819L611.053 300.819L609.053 299.819L623.053 291.819Z" fill="#959595"/>
                <path d="M446 321L488 297L572 345L530 369L446 321Z" fill="#434242"/>
                <path d="M488 393L446 369L572 297L614 321L488 393Z" fill="#434242"/>
                <path d="M446 321L453 317L502 345L495 349L446 321Z" fill="#959595"/>
                <path d="M572 297L579 301L530 329L523 325L572 297Z" fill="#959595"/>
                <path d="M495 341L502 345L453 373L446 369L495 341Z" fill="#959595"/>
                <path d="M607 317L614 321L488 393L481 389L607 317Z" fill="#959595"/>
                <path d="M481 301L488 297L537 325L530 329L481 301Z" fill="#959595"/>
                <path d="M572.053 318.819L574.054 319.819L560.053 327.819L558.053 326.819L572.053 318.819Z" fill="#959595"/>
                <path d="M500.053 361.819L502.054 362.819L488.053 370.819L486.053 369.819L500.053 361.819Z" fill="#959595"/>
                <path d="M480 317L481.5 316L495.5 324L494 325L480 317Z" fill="#959595"/>
                <path d="M194 177L236 153L320 201L278 225L194 177Z" fill="#434242"/>
                <path d="M194 177L201 173L285 221L278 225L194 177Z" fill="#959595"/>
                <path d="M229 157L236 153L320 201L313 205L229 157Z" fill="#959595"/>
                <path d="M230 174L231.5 173L245.5 181L244 182L230 174Z" fill="#959595"/>
                <path d="M270 197L271.5 196L285.5 204L284 205L270 197Z" fill="#959595"/>
                <path d="M278 225L320 201L404 249L362 273L278 225Z" fill="#434242"/>
                <path d="M278 225L285 221L369 269L362 273L278 225Z" fill="#959595"/>
                <path d="M313 205L320 201L404 249L397 253L313 205Z" fill="#959595"/>
                <path d="M314 222L315.5 221L329.5 229L328 230L314 222Z" fill="#959595"/>
                <path d="M354 245L355.5 244L369.5 252L368 253L354 245Z" fill="#959595"/>
                <path d="M362 273L404 249L488 297L446 321L362 273Z" fill="#434242"/>
                <path d="M362 273L369 269L453 317L446 321L362 273Z" fill="#959595"/>
                <path d="M397 253L404 249L488 297L481 301L397 253Z" fill="#959595"/>
                <path d="M398 270L399.5 269L413.5 277L412 278L398 270Z" fill="#959595"/>
                <path d="M438 293L439.5 292L453.5 300L452 301L438 293Z" fill="#959595"/>
                <path d="M694 275L652 251L736 203L778 227L694 275Z" fill="#434242"/>
                <path d="M771 223L778 227L694 275L687 271L771 223Z" fill="#959595"/>
                <path d="M736 203L743 207L659 255L652 251L736 203Z" fill="#959595"/>
                <path d="M741.053 222.819L743.054 223.819L729.053 231.819L727.053 230.819L741.053 222.819Z" fill="#959595"/>
                <path d="M706.053 243.819L708.054 244.819L694.053 252.819L692.053 251.819L706.053 243.819Z" fill="#959595"/>
                <path d="M404 441L362 417L446 369L488 393L404 441Z" fill="#434242"/>
                <path d="M481 389L488 393L404 441L397 437L481 389Z" fill="#959595"/>
                <path d="M446 369L453 373L369 421L362 417L446 369Z" fill="#959595"/>
                <path d="M451.053 388.819L453.054 389.819L439.053 397.819L437.053 396.819L451.053 388.819Z" fill="#959595"/>
                <path d="M416.053 409.819L418.054 410.819L404.053 418.819L402.053 417.819L416.053 409.819Z" fill="#959595"/>
                <path d="M320 489L278 465L362 417L404 441L320 489Z" fill="#434242"/>
                <path d="M397 437L404 441L320 489L313 485L397 437Z" fill="#959595"/>
                <path d="M362 417L369 421L285 469L278 465L362 417Z" fill="#959595"/>
                <path d="M367.053 436.819L369.054 437.819L355.053 445.819L353.053 444.819L367.053 436.819Z" fill="#959595"/>
                <path d="M332.053 457.819L334.054 458.819L320.053 466.819L318.053 465.819L332.053 457.819Z" fill="#959595"/>
                <path d="M240 535L198 511L282 463L324 487L240 535Z" fill="#434242"/>
                <path d="M317 483L324 487L240 535L233 531L317 483Z" fill="#959595"/>
                <path d="M282 463L289 467L205 515L198 511L282 463Z" fill="#959595"/>
                <path d="M287.053 482.819L289.054 483.819L275.053 491.819L273.053 490.819L287.053 482.819Z" fill="#959595"/>
                <path d="M252.053 503.819L254.054 504.819L240.053 512.819L238.053 511.819L252.053 503.819Z" fill="#959595"/>
                <path d="M463 225.215L530.501 263.786V321.644L463 283.072V225.215Z" fill="#C06CD5"/>
                <path d="M530.5 263.786L598.001 225.215V283.072L530.5 321.644V263.786Z" fill="#EBA2FD"/>
                <path d="M530.501 187.246L598.001 225.215L530.501 263.787L463 225.215L530.501 187.246Z" fill="#72D2CC"/>
                <path d="M530.5 293.921L463 255.349V257.157L530.5 295.729V293.921Z" fill="#AB56C0"/>
                <path d="M598.001 255.349L530.501 293.906V295.714L598.001 257.157V255.349Z" fill="#DA83F0"/>
                <path d="M530.501 180.616L580.825 209.545L530.501 237.871L479.875 209.545L530.501 180.616Z" fill="#D876F0"/>
                <path d="M530.501 263.787V237.871L479.875 209.545L463 225.215L530.501 263.787Z" fill="#A74DBD"/>
                <path d="M598.001 225.215L580.824 209.545L530.5 237.871V263.787L598.001 225.215Z" fill="#C564DD"/>
                <path d="M539.541 210.148L540.746 210.75V230.036L539.541 229.434V210.148Z" fill="#A843C3"/>
                <path d="M560.032 198.697L561.238 199.299V218.585L560.032 217.983V198.697Z" fill="#A843C2"/>
                <path d="M540.746 210.75L541.952 210.148V229.434L540.746 230.036V210.75Z" fill="#C75AE3"/>
                <path d="M561.238 199.299L562.443 198.697V217.983L561.238 218.585V199.299Z" fill="#C75AE3"/>
                <path d="M592.577 236.063L601.014 240.583V273.429L592.577 268.608V236.063Z" fill="#D77BEE"/>
                <path d="M601.014 240.583L606.439 237.57V270.115L601.014 273.429V240.583Z" fill="#EBA2FD"/>
                <path d="M592.577 236.063L598.001 233.05L606.438 237.57L601.014 240.884L592.577 236.063Z" fill="#EBA2FD"/>
                <path d="M534.719 206.532L568.168 187.246V206.532L534.719 225.817V206.532Z" fill="#E993FF"/>
                <path d="M530.5 204.121L534.719 206.531V225.817L530.5 223.407V204.121Z" fill="#BA51D5"/>
                <path d="M563.949 184.835L568.168 187.246L534.719 206.532L530.5 204.121L563.949 184.835Z" fill="#D35BF1"/>
                <path d="M517.844 186.643L526.282 191.464V201.107L517.844 196.286V186.643Z" fill="#C06CD5"/>
                <path d="M534.719 177L543.157 181.821L526.282 191.464L517.844 186.643L534.719 177Z" fill="#D876F0"/>
                <path d="M526.282 191.464L543.157 181.821L542.856 191.464L526.282 201.107V191.464Z" fill="#C564DD"/>
                <path d="M470.383 242.69L476.711 246.306V255.949L470.383 252.333V242.69Z" fill="#88339D"/>
                <path d="M471.287 243.215L476.711 246.306V254.744L471.287 251.73V243.215Z" fill="#9B47B0"/>
                <path d="M469.78 269.774L476.108 273.391V283.033L469.78 279.417V269.774Z" fill="#88339D"/>
                <path d="M470.684 270.299L476.108 273.391V281.828L470.684 278.815V270.299Z" fill="#9B47B0"/>
                <path d="M490.271 252.839L496.6 256.455V266.098L490.271 262.482V252.839Z" fill="#88339D"/>
                <path d="M491.175 253.364L496.599 256.455V264.893L491.175 261.879V253.364Z" fill="#9B47B0"/>
                <path d="M489.668 279.923L495.997 283.54V293.183L489.668 289.566V279.923Z" fill="#88339D"/>
                <path d="M490.573 280.448L495.997 283.54V291.977L490.573 288.964V280.448Z" fill="#9B47B0"/>
                <path d="M511.365 264.893L517.693 268.509V278.152L511.365 274.536V264.893Z" fill="#88339D"/>
                <path d="M512.269 265.418L517.694 268.509V276.946L512.269 273.933V265.418Z" fill="#9B47B0"/>
                <path d="M510.763 291.977L517.091 295.593V305.236L510.763 301.62V291.977Z" fill="#88339D"/>
                <path d="M511.667 292.502L517.091 295.593V304.031L511.667 301.017V292.502Z" fill="#9B47B0"/>
                <path d="M540.144 270.277L546.17 266.963V276.606L540.144 279.92V270.277Z" fill="#88339D"/>
                <path d="M540.143 270.277L545.266 267.462V276.003L540.143 278.715V270.277Z" fill="#9B47B0"/>
                <path d="M541.951 296.849L547.978 293.534V303.177L541.951 306.492V296.849Z" fill="#88339D"/>
                <path d="M541.951 296.849L547.074 294.034V302.575L541.951 305.287V296.849Z" fill="#9B47B0"/>
                <path d="M561.989 257.609L568.016 254.294V263.937L561.989 267.252V257.609Z" fill="#88339D"/>
                <path d="M561.989 257.609L567.112 254.793V263.335L561.989 266.047V257.609Z" fill="#9B47B0"/>
                <path d="M564.099 284.01L570.126 280.695V290.338L564.099 293.653V284.01Z" fill="#88339D"/>
                <path d="M564.099 284.01L569.221 281.194V289.735L564.099 292.448V284.01Z" fill="#9B47B0"/>
                <path d="M582.261 246.457L588.288 243.142V252.785L582.261 256.1V246.457Z" fill="#88339D"/>
                <path d="M582.261 246.457L587.384 243.641V252.183L582.261 254.895V246.457Z" fill="#9B47B0"/>
                <path d="M583.336 272.86L589.363 269.545V279.188L583.336 282.503V272.86Z" fill="#88339D"/>
                <path d="M583.336 272.86L588.459 270.045V278.586L583.336 281.298V272.86Z" fill="#9B47B0"/>
                <path d="M273 371.572L323.625 400.501V439.072L273 410.144V371.572Z" fill="#FA70AA"/>
                <path d="M323.626 400.501L374.251 371.572V410.144L323.626 439.072V400.501Z" fill="#FF8DBD"/>
                <path d="M323.626 400.501L332.365 410.144V419.787L323.626 414.965V400.501Z" fill="#DF5C93"/>
                <path d="M332.365 410.144L382.99 381.215V390.858L332.365 419.787V410.144Z" fill="#F279AC"/>
                <path d="M323.626 400.501L374.251 371.572L382.99 381.215L332.365 410.144L323.626 400.501Z" fill="#FF96C1"/>
                <path d="M323.626 333L357.338 352.286L323.889 372.175L289.875 352.286L323.626 333Z" fill="#FFAED0"/>
                <path d="M273 371.572L289.875 352.286L323.625 371.572V400.802L273 371.572Z" fill="#D6578C"/>
                <path d="M323.626 400.802V371.572L357.376 352.286L374.251 371.572L323.626 400.802Z" fill="#ED72A6"/>
                <path d="M325.433 389.351L376.059 358.614V373.079L325.433 403.816V389.351Z" fill="#FFC4DD"/>
                <path d="M323.626 388.447L325.434 389.351V403.815L323.626 402.911V388.447Z" fill="#EFA0CC"/>
                <path d="M374.251 357.71L376.059 358.614L325.434 389.652L323.626 388.748L374.251 357.71Z" fill="#FFAED0"/>
                <path d="M282.672 392.063L289 395.679V405.322L282.672 401.706V392.063Z" fill="#AB2D63"/>
                <path d="M283.576 392.588L289 395.679V404.117L283.576 401.103V392.588Z" fill="#C04080"/>
                <path d="M303.928 403.969L310.257 407.585V417.228L303.928 413.612V403.969Z" fill="#AB2D63"/>
                <path d="M304.832 404.494L310.257 407.585V416.023L304.832 413.009V404.494Z" fill="#C04080"/>
                <path d="M371 315.572L421.625 344.501V383.072L371 354.144V315.572Z" fill="#E26262"/>
                <path d="M421.626 344.501L472.251 315.572V354.144L421.626 383.072V344.501Z" fill="#F77E7E"/>
                <path d="M421.626 344.501L430.365 354.144V363.787L421.626 358.965V344.501Z" fill="#BF4E4E"/>
                <path d="M430.365 354.144L480.99 325.215V334.858L430.365 363.787V354.144Z" fill="#DA6262"/>
                <path d="M421.626 344.501L472.251 315.572L480.99 325.215L430.365 354.144L421.626 344.501Z" fill="#FC9292"/>
                <path d="M421.626 277L455.338 296.286L421.889 316.175L387.875 296.286L421.626 277Z" fill="#FC9292"/>
                <path d="M371 315.572L387.875 296.286L421.625 315.572V344.802L371 315.572Z" fill="#BF4E4E"/>
                <path d="M421.626 344.802V315.572L455.376 296.286L472.251 315.572L421.626 344.802Z" fill="#DA6262"/>
                <path d="M423.433 333.351L474.059 302.614V317.079L423.433 347.816V333.351Z" fill="#FC9E9E"/>
                <path d="M421.626 332.447L423.434 333.351V347.815L421.626 346.911V332.447Z" fill="#E26262"/>
                <path d="M472.251 301.71L474.059 302.614L423.434 333.652L421.626 332.748L472.251 301.71Z" fill="#FC9292"/>
                <path d="M380.672 336.063L387 339.679V349.322L380.672 345.706V336.063Z" fill="#962929"/>
                <path d="M381.576 336.588L387 339.679V348.117L381.576 345.103V336.588Z" fill="#B43E3E"/>
                <path d="M401.928 347.969L408.257 351.585V361.228L401.928 357.612V347.969Z" fill="#962929"/>
                <path d="M402.832 348.494L408.257 351.585V360.023L402.832 357.009V348.494Z" fill="#B43E3E"/>
                <path d="M161 435.572L211.625 464.501V503.072L161 474.144V435.572Z" fill="#35BEB6"/>
                <path d="M211.626 464.501L262.251 435.572V474.144L211.626 503.072V464.501Z" fill="#3BDBD1"/>
                <path d="M211.626 464.501L220.365 474.144V483.787L211.626 478.965V464.501Z" fill="#29948D"/>
                <path d="M220.365 474.144L270.99 445.215V454.858L220.365 483.787V474.144Z" fill="#4CBCB5"/>
                <path d="M211.626 464.501L262.251 435.572L270.99 445.215L220.365 474.144L211.626 464.501Z" fill="#6EE9E2"/>
                <path d="M211.626 397L245.338 416.286L211.889 436.175L177.875 416.286L211.626 397Z" fill="#6EE9E2"/>
                <path d="M161 435.572L177.875 416.286L211.625 435.572V464.802L161 435.572Z" fill="#29948D"/>
                <path d="M211.626 464.802V435.572L245.376 416.286L262.251 435.572L211.626 464.802Z" fill="#4CBCB5"/>
                <path d="M213.433 453.351L264.059 422.614V437.079L213.433 467.816V453.351Z" fill="#73D9D3"/>
                <path d="M211.626 452.447L213.434 453.351V467.815L211.626 466.911V452.447Z" fill="#35BEB6"/>
                <path d="M262.251 421.71L264.059 422.614L213.434 453.652L211.626 452.748L262.251 421.71Z" fill="#6EE9E2"/>
                <path d="M170.672 456.063L177 459.679V469.322L170.672 465.706V456.063Z" fill="#158881"/>
                <path d="M171.576 456.588L177 459.679V468.117L171.576 465.103V456.588Z" fill="#19958D"/>
                <path d="M191.928 467.969L198.257 471.585V481.228L191.928 477.612V467.969Z" fill="#158881"/>
                <path d="M192.832 468.494L198.257 471.585V480.023L192.832 477.009V468.494Z" fill="#19958D"/>
                <path d="M335 113.572L402.501 152.177V248.606L335 210.035V113.572Z" fill="#E26262"/>
                <path d="M402.501 152.144L470.001 113.538V210.034L402.501 248.64V152.144Z" fill="#F77E7E"/>
                <path d="M335 113.572L402.501 75L470.001 113.572L402.501 152.144L335 113.572Z" fill="#FC9292"/>
                <path d="M343.438 113.572L402.501 79.8215L461.564 113.572L402.802 147.322L343.438 113.572Z" fill="#CF7070"/>
                <path d="M402.501 122.913L436.251 103.929V113.572L402.501 132.858V122.913Z" fill="#F87777"/>
                <path d="M368.75 113.572V103.929L402.501 123.215V132.858L368.75 113.572Z" fill="#E26262"/>
                <path d="M368.75 103.929L402.501 84.6429L436.251 103.929L402.501 123.215L368.75 103.929Z" fill="#FC9292"/>
                <path d="M339.219 135.268L345.547 138.884V148.527L339.219 144.911V135.268Z" fill="#962929"/>
                <path d="M340.123 135.793L345.547 138.884V147.322L340.123 144.309V135.793Z" fill="#B43E3E"/>
                <path d="M339.219 154.554L345.547 158.17V167.813L339.219 164.197V154.554Z" fill="#962929"/>
                <path d="M340.123 155.079L345.547 158.17V166.608L340.123 163.594V155.079Z" fill="#B43E3E"/>
                <path d="M339.219 173.84L345.547 177.456V187.099L339.219 183.483V173.84Z" fill="#962929"/>
                <path d="M340.123 174.365L345.547 177.456V185.894L340.123 182.88V174.365Z" fill="#B43E3E"/>
                <path d="M339.219 193.126L345.547 196.742V206.385L339.219 202.769V193.126Z" fill="#962929"/>
                <path d="M340.123 193.651L345.547 196.742V205.18L340.123 202.166V193.651Z" fill="#B43E3E"/>
                <path d="M356.094 144.911L362.422 148.527V158.17L356.094 154.554V144.911Z" fill="#962929"/>
                <path d="M356.998 145.436L362.422 148.527V156.965L356.998 153.952V145.436Z" fill="#B43E3E"/>
                <path d="M356.094 164.197L362.422 167.813V177.456L356.094 173.84V164.197Z" fill="#962929"/>
                <path d="M356.998 164.722L362.422 167.813V176.251L356.998 173.237V164.722Z" fill="#B43E3E"/>
                <path d="M356.094 183.483L362.422 187.099V196.742L356.094 193.126V183.483Z" fill="#962929"/>
                <path d="M356.998 184.008L362.422 187.099V195.537L356.998 192.523V184.008Z" fill="#B43E3E"/>
                <path d="M356.094 202.769L362.422 206.385V216.028L356.094 212.412V202.769Z" fill="#962929"/>
                <path d="M356.998 203.294L362.422 206.385V214.823L356.998 211.809V203.294Z" fill="#B43E3E"/>
                <path d="M372.367 153.952L378.695 157.568V167.211L372.367 163.595V153.952Z" fill="#962929"/>
                <path d="M373.27 154.476L378.695 157.568V166.005L373.27 162.992V154.476Z" fill="#B43E3E"/>
                <path d="M372.367 173.237L378.695 176.854V186.497L372.367 182.88V173.237Z" fill="#962929"/>
                <path d="M373.27 173.762L378.695 176.854V185.291L373.27 182.278V173.762Z" fill="#B43E3E"/>
                <path d="M372.367 192.523L378.695 196.139V205.782L372.367 202.166V192.523Z" fill="#962929"/>
                <path d="M373.27 193.048L378.695 196.139V204.577L373.27 201.564V193.048Z" fill="#B43E3E"/>
                <path d="M372.367 211.809L378.695 215.425V225.068L372.367 221.452V211.809Z" fill="#962929"/>
                <path d="M373.27 212.334L378.695 215.425V223.863L373.27 220.849V212.334Z" fill="#B43E3E"/>
                <path d="M389.242 163.595L395.57 167.211V176.854L389.242 173.238V163.595Z" fill="#962929"/>
                <path d="M390.146 164.119L395.57 167.211V175.648L390.146 172.635V164.119Z" fill="#B43E3E"/>
                <path d="M389.242 182.88L395.57 186.497V196.139L389.242 192.523V182.88Z" fill="#962929"/>
                <path d="M390.146 183.405L395.57 186.497V194.934L390.146 191.921V183.405Z" fill="#B43E3E"/>
                <path d="M389.242 202.166L395.57 205.782V215.425L389.242 211.809V202.166Z" fill="#962929"/>
                <path d="M390.146 202.691L395.57 205.782V214.22L390.146 211.206V202.691Z" fill="#B43E3E"/>
                <path d="M389.242 221.452L395.57 225.068V234.711L389.242 231.095V221.452Z" fill="#962929"/>
                <path d="M390.146 221.977L395.57 225.068V233.506L390.146 230.492V221.977Z" fill="#B43E3E"/>
                <path d="M406.72 169.32L412.746 166.005V175.648L406.72 178.963V169.32Z" fill="#962929"/>
                <path d="M406.72 169.32L411.842 166.504V175.046L406.72 177.758V169.32Z" fill="#B43E3E"/>
                <path d="M409.13 188.606L415.157 185.291V194.934L409.13 198.249V188.606Z" fill="#962929"/>
                <path d="M409.13 188.606L414.253 185.79V194.331L409.13 197.043V188.606Z" fill="#B43E3E"/>
                <path d="M409.13 206.084L415.157 202.769V212.412L409.13 215.727V206.084Z" fill="#962929"/>
                <path d="M409.13 206.084L414.253 203.268V211.809L409.13 214.521V206.084Z" fill="#B43E3E"/>
                <path d="M409.13 224.767L415.157 221.452V231.095L409.13 234.41V224.767Z" fill="#962929"/>
                <path d="M409.13 224.767L414.253 221.951V230.492L409.13 233.204V224.767Z" fill="#B43E3E"/>
                <path d="M423.595 159.677L429.622 156.362V166.005L423.595 169.32V159.677Z" fill="#962929"/>
                <path d="M423.594 159.677L428.717 156.861V165.403L423.594 168.115V159.677Z" fill="#B43E3E"/>
                <path d="M426.006 178.963L432.033 175.648V185.291L426.006 188.606V178.963Z" fill="#962929"/>
                <path d="M426.005 178.963L431.128 176.147V184.688L426.005 187.401V178.963Z" fill="#B43E3E"/>
                <path d="M426.006 196.441L432.033 193.126V202.769L426.006 206.084V196.441Z" fill="#962929"/>
                <path d="M426.005 196.441L431.128 193.625V202.166L426.005 204.878V196.441Z" fill="#B43E3E"/>
                <path d="M426.006 215.124L432.033 211.809V221.452L426.006 224.767V215.124Z" fill="#962929"/>
                <path d="M426.005 215.124L431.128 212.308V220.849L426.005 223.562V215.124Z" fill="#B43E3E"/>
                <path d="M439.868 150.034L445.895 146.719V156.362L439.868 159.677V150.034Z" fill="#962929"/>
                <path d="M439.867 150.034L444.99 147.219V155.76L439.867 158.472V150.034Z" fill="#B43E3E"/>
                <path d="M442.278 169.32L448.305 166.005V175.648L442.278 178.963V169.32Z" fill="#962929"/>
                <path d="M442.277 169.32L447.4 166.504V175.046L442.277 177.758V169.32Z" fill="#B43E3E"/>
                <path d="M442.278 186.798L448.305 183.483V193.126L442.278 196.441V186.798Z" fill="#962929"/>
                <path d="M442.277 186.798L447.4 183.982V192.523L442.277 195.235V186.798Z" fill="#B43E3E"/>
                <path d="M442.278 205.481L448.305 202.166V211.809L442.278 215.124V205.481Z" fill="#962929"/>
                <path d="M442.277 205.481L447.4 202.665V211.207L442.277 213.919V205.481Z" fill="#B43E3E"/>
                <path d="M456.742 140.391L462.769 137.076V146.719L456.742 150.034V140.391Z" fill="#962929"/>
                <path d="M456.742 140.391L461.865 137.576V146.117L456.742 148.829V140.391Z" fill="#B43E3E"/>
                <path d="M459.153 159.677L465.18 156.362V166.005L459.153 169.32V159.677Z" fill="#962929"/>
                <path d="M459.153 159.677L464.276 156.861V165.403L459.153 168.115V159.677Z" fill="#B43E3E"/>
                <path d="M459.153 177.155L465.18 173.84V183.483L459.153 186.798V177.155Z" fill="#962929"/>
                <path d="M459.153 177.155L464.276 174.339V182.88L459.153 185.592V177.155Z" fill="#B43E3E"/>
                <path d="M459.153 195.838L465.18 192.523V202.166L459.153 205.481V195.838Z" fill="#962929"/>
                <path d="M459.153 195.838L464.276 193.022V201.564L459.153 204.276V195.838Z" fill="#B43E3E"/>
                <path d="M335 118.393L402.501 156.965V161.786L335 123.215V118.393Z" fill="#F88080"/>
                <path d="M335 126.228L402.501 164.8V166.608L335 128.036V126.228Z" fill="#F88080"/>
                <path d="M402.501 156.965L470.001 118.393V123.215L402.501 161.786V156.965Z" fill="#FF9F9F"/>
                <path d="M402.501 164.8L470.001 126.228V128.036L402.501 166.608V164.8Z" fill="#FF9F9F"/>
                <path d="M229 180.572L296.501 219.177V315.606L229 277.035V180.572Z" fill="#E26262"/>
                <path d="M296.501 219.144L364.001 180.538V277.034L296.501 315.64V219.144Z" fill="#F77E7E"/>
                <path d="M229 180.572L296.501 142L364.001 180.572L296.501 219.144L229 180.572Z" fill="#FC9292"/>
                <path d="M237.438 180.572L296.501 146.821L355.564 180.572L296.802 214.322L237.438 180.572Z" fill="#CF7070"/>
                <path d="M296.501 189.913L330.251 170.929V180.572L296.501 199.858V189.913Z" fill="#F87777"/>
                <path d="M262.75 180.572V170.929L296.501 190.215V199.858L262.75 180.572Z" fill="#E26262"/>
                <path d="M262.75 170.929L296.501 151.643L330.251 170.929L296.501 190.215L262.75 170.929Z" fill="#FC9292"/>
                <path d="M233.219 202.268L239.547 205.884V215.527L233.219 211.911V202.268Z" fill="#962929"/>
                <path d="M234.123 202.793L239.547 205.884V214.322L234.123 211.309V202.793Z" fill="#B43E3E"/>
                <path d="M233.219 221.554L239.547 225.17V234.813L233.219 231.197V221.554Z" fill="#962929"/>
                <path d="M234.123 222.079L239.547 225.17V233.608L234.123 230.594V222.079Z" fill="#B43E3E"/>
                <path d="M233.219 240.84L239.547 244.456V254.099L233.219 250.483V240.84Z" fill="#962929"/>
                <path d="M234.123 241.365L239.547 244.456V252.894L234.123 249.88V241.365Z" fill="#B43E3E"/>
                <path d="M233.219 260.126L239.547 263.742V273.385L233.219 269.769V260.126Z" fill="#962929"/>
                <path d="M234.123 260.651L239.547 263.742V272.18L234.123 269.166V260.651Z" fill="#B43E3E"/>
                <path d="M250.094 211.911L256.422 215.527V225.17L250.094 221.554V211.911Z" fill="#962929"/>
                <path d="M250.998 212.436L256.422 215.527V223.965L250.998 220.952V212.436Z" fill="#B43E3E"/>
                <path d="M250.094 231.197L256.422 234.813V244.456L250.094 240.84V231.197Z" fill="#962929"/>
                <path d="M250.998 231.722L256.422 234.813V243.251L250.998 240.237V231.722Z" fill="#B43E3E"/>
                <path d="M250.094 250.483L256.422 254.099V263.742L250.094 260.126V250.483Z" fill="#962929"/>
                <path d="M250.998 251.008L256.422 254.099V262.537L250.998 259.523V251.008Z" fill="#B43E3E"/>
                <path d="M250.094 269.769L256.422 273.385V283.028L250.094 279.412V269.769Z" fill="#962929"/>
                <path d="M250.998 270.294L256.422 273.385V281.823L250.998 278.809V270.294Z" fill="#B43E3E"/>
                <path d="M266.367 220.952L272.695 224.568V234.211L266.367 230.595V220.952Z" fill="#962929"/>
                <path d="M267.27 221.476L272.695 224.568V233.005L267.27 229.992V221.476Z" fill="#B43E3E"/>
                <path d="M266.367 240.237L272.695 243.854V253.497L266.367 249.88V240.237Z" fill="#962929"/>
                <path d="M267.27 240.762L272.695 243.854V252.291L267.27 249.278V240.762Z" fill="#B43E3E"/>
                <path d="M266.367 259.523L272.695 263.139V272.782L266.367 269.166V259.523Z" fill="#962929"/>
                <path d="M267.27 260.048L272.695 263.139V271.577L267.27 268.564V260.048Z" fill="#B43E3E"/>
                <path d="M266.367 278.809L272.695 282.425V292.068L266.367 288.452V278.809Z" fill="#962929"/>
                <path d="M267.27 279.334L272.695 282.425V290.863L267.27 287.849V279.334Z" fill="#B43E3E"/>
                <path d="M283.242 230.595L289.57 234.211V243.854L283.242 240.238V230.595Z" fill="#962929"/>
                <path d="M284.146 231.119L289.57 234.211V242.648L284.146 239.635V231.119Z" fill="#B43E3E"/>
                <path d="M283.242 249.88L289.57 253.497V263.139L283.242 259.523V249.88Z" fill="#962929"/>
                <path d="M284.146 250.405L289.57 253.497V261.934L284.146 258.921V250.405Z" fill="#B43E3E"/>
                <path d="M283.242 269.166L289.57 272.782V282.425L283.242 278.809V269.166Z" fill="#962929"/>
                <path d="M284.146 269.691L289.57 272.782V281.22L284.146 278.206V269.691Z" fill="#B43E3E"/>
                <path d="M283.242 288.452L289.57 292.068V301.711L283.242 298.095V288.452Z" fill="#962929"/>
                <path d="M284.146 288.977L289.57 292.068V300.506L284.146 297.492V288.977Z" fill="#B43E3E"/>
                <path d="M300.72 236.32L306.746 233.005V242.648L300.72 245.963V236.32Z" fill="#962929"/>
                <path d="M300.72 236.32L305.842 233.504V242.046L300.72 244.758V236.32Z" fill="#B43E3E"/>
                <path d="M303.13 255.606L309.157 252.291V261.934L303.13 265.249V255.606Z" fill="#962929"/>
                <path d="M303.13 255.606L308.253 252.79V261.331L303.13 264.043V255.606Z" fill="#B43E3E"/>
                <path d="M303.13 273.084L309.157 269.769V279.412L303.13 282.727V273.084Z" fill="#962929"/>
                <path d="M303.13 273.084L308.253 270.268V278.809L303.13 281.521V273.084Z" fill="#B43E3E"/>
                <path d="M303.13 291.767L309.157 288.452V298.095L303.13 301.41V291.767Z" fill="#962929"/>
                <path d="M303.13 291.767L308.253 288.951V297.492L303.13 300.204V291.767Z" fill="#B43E3E"/>
                <path d="M317.595 226.677L323.622 223.362V233.005L317.595 236.32V226.677Z" fill="#962929"/>
                <path d="M317.594 226.677L322.717 223.861V232.403L317.594 235.115V226.677Z" fill="#B43E3E"/>
                <path d="M320.006 245.963L326.033 242.648V252.291L320.006 255.606V245.963Z" fill="#962929"/>
                <path d="M320.005 245.963L325.128 243.147V251.688L320.005 254.401V245.963Z" fill="#B43E3E"/>
                <path d="M320.006 263.441L326.033 260.126V269.769L320.006 273.084V263.441Z" fill="#962929"/>
                <path d="M320.005 263.441L325.128 260.625V269.166L320.005 271.878V263.441Z" fill="#B43E3E"/>
                <path d="M320.006 282.124L326.033 278.809V288.452L320.006 291.767V282.124Z" fill="#962929"/>
                <path d="M320.005 282.124L325.128 279.308V287.849L320.005 290.562V282.124Z" fill="#B43E3E"/>
                <path d="M333.868 217.034L339.895 213.719V223.362L333.868 226.677V217.034Z" fill="#962929"/>
                <path d="M333.867 217.034L338.99 214.219V222.76L333.867 225.472V217.034Z" fill="#B43E3E"/>
                <path d="M336.278 236.32L342.305 233.005V242.648L336.278 245.963V236.32Z" fill="#962929"/>
                <path d="M336.277 236.32L341.4 233.504V242.046L336.277 244.758V236.32Z" fill="#B43E3E"/>
                <path d="M336.278 253.798L342.305 250.483V260.126L336.278 263.441V253.798Z" fill="#962929"/>
                <path d="M336.277 253.798L341.4 250.982V259.523L336.277 262.235V253.798Z" fill="#B43E3E"/>
                <path d="M336.278 272.481L342.305 269.166V278.809L336.278 282.124V272.481Z" fill="#962929"/>
                <path d="M336.277 272.481L341.4 269.665V278.207L336.277 280.919V272.481Z" fill="#B43E3E"/>
                <path d="M350.742 207.391L356.769 204.076V213.719L350.742 217.034V207.391Z" fill="#962929"/>
                <path d="M350.742 207.391L355.865 204.576V213.117L350.742 215.829V207.391Z" fill="#B43E3E"/>
                <path d="M353.153 226.677L359.18 223.362V233.005L353.153 236.32V226.677Z" fill="#962929"/>
                <path d="M353.153 226.677L358.276 223.861V232.403L353.153 235.115V226.677Z" fill="#B43E3E"/>
                <path d="M353.153 244.155L359.18 240.84V250.483L353.153 253.798V244.155Z" fill="#962929"/>
                <path d="M353.153 244.155L358.276 241.339V249.88L353.153 252.592V244.155Z" fill="#B43E3E"/>
                <path d="M353.153 262.838L359.18 259.523V269.166L353.153 272.481V262.838Z" fill="#962929"/>
                <path d="M353.153 262.838L358.276 260.022V268.564L353.153 271.276V262.838Z" fill="#B43E3E"/>
                <path d="M229 185.393L296.501 223.965V228.786L229 190.215V185.393Z" fill="#F88080"/>
                <path d="M229 193.228L296.501 231.8V233.608L229 195.036V193.228Z" fill="#F88080"/>
                <path d="M296.501 223.965L364.001 185.393V190.215L296.501 228.786V223.965Z" fill="#FF9F9F"/>
                <path d="M296.501 231.8L364.001 193.228V195.036L296.501 233.608V231.8Z" fill="#FF9F9F"/>
                <path class= "trees"d="M406 528.5L425 448L441.5 528.5H406Z" fill="#B5EBA2"/>
                <path class= "trees"d="M429 473.5L448 393L464.5 473.5H429Z" fill="#B5EBA2"/>
                <path class= "trees"d="M482 502.5L501 422L517.5 502.5H482Z" fill="#B5EBA2"/>
                <path class= "trees"d="M465 540.5L484 460L500.5 540.5H465Z" fill="#B5EBA2"/>
                <path class= "trees"d="M442 540.5L461 460L477.5 540.5H442Z" fill="#B5EBA2"/>
                <path class= "trees"d="M547 550.5L566 470L582.5 550.5H547Z" fill="#B5EBA2"/>
                <path class= "trees"d="M570 495.5L589 415L605.5 495.5H570Z" fill="#B5EBA2"/>
                <path class= "trees"d="M623 524.5L642 444L658.5 524.5H623Z" fill="#B5EBA2"/>
                <path class= "trees"d="M606 562.5L625 482L641.5 562.5H606Z" fill="#B5EBA2"/>
                <path class= "trees"d="M583 562.5L602 482L618.5 562.5H583Z" fill="#B5EBA2"/>
                <path class= "trees"d="M627 403.5L646 323L662.5 403.5H627Z" fill="#B5EBA2"/>
                <path class= "trees"d="M650 348.5L669 268L685.5 348.5H650Z" fill="#B5EBA2"/>
                <path class= "trees"d="M703 377.5L722 297L738.5 377.5H703Z" fill="#B5EBA2"/>
                <path class= "trees"d="M686 415.5L705 335L721.5 415.5H686Z" fill="#B5EBA2"/>
                <path class= "trees"d="M663 415.5L682 335L698.5 415.5H663Z" fill="#B5EBA2"/>
                <path class= "trees"d="M508 433.5L527 353L543.5 433.5H508Z" fill="#B5EBA2"/>
                <path class= "trees"d="M531 378.5L550 298L566.5 378.5H531Z" fill="#B5EBA2"/>
                <path class= "trees"d="M584 407.5L603 327L619.5 407.5H584Z" fill="#B5EBA2"/>
                <path class= "trees"d="M567 445.5L586 365L602.5 445.5H567Z" fill="#B5EBA2"/>
                <path class= "trees"d="M544 445.5L563 365L579.5 445.5H544Z" fill="#B5EBA2"/>
                <path class="babble" d="M1 39.876C1 29.0222 9.79878 20.2234 20.6526 20.2234V20.2234V48.668H1V39.876Z" fill="#278EFF" stroke="#278EFF" stroke-width="0.805851"/>
                <rect class="babble" x="1" y="48.668" width="19.6526" height="1" fill="#278EFF" stroke="#278EFF" stroke-width="0.805851"/>
                <path class="babble" d="M1 58.4599C1 69.3138 9.79878 78.1126 20.6526 78.1126V78.1126V49.668H1V58.4599Z" fill="#278EFF" stroke="#278EFF" stroke-width="0.805851"/>
                <rect class="babble" x="20.6527" y="20.2234" width="290.877" height="54.0106" fill="#278EFF"/>
                <path class="babble" d="M30.1368 53.947C30.6119 53.947 31.0779 53.8374 31.5347 53.6181C31.9915 53.3988 32.3936 53.0882 32.7408 52.6862C33.0879 52.2659 33.3621 51.7725 33.5631 51.206C33.7823 50.6395 33.892 50.0091 33.892 49.3147V42.7088C33.892 41.9962 33.7732 41.3292 33.5356 40.7079C33.3164 40.0866 32.9874 39.5475 32.5489 39.0907C32.1286 38.6156 31.6169 38.2501 31.0139 37.9943C30.4109 37.7202 29.7256 37.5831 28.9581 37.5831H26.5186C25.7146 37.5831 25.0019 37.711 24.3806 37.9669C23.7593 38.2227 23.2294 38.579 22.7908 39.0359C22.3705 39.4927 22.0416 40.0318 21.8041 40.6531C21.5848 41.2561 21.4751 41.9139 21.4751 42.6266V49.1502C21.4751 50.0274 21.6031 50.7766 21.8589 51.3979C22.1147 52.0009 22.4436 52.4943 22.8457 52.878C23.2659 53.2435 23.7228 53.5176 24.2162 53.7003C24.7095 53.8648 25.2029 53.947 25.6963 53.947H30.1368ZM39.8674 58.8261H36.1944V35.774H39.8674V58.8261ZM27.0668 51.1238C26.3724 51.1238 25.8425 50.9593 25.477 50.6304C25.1298 50.2832 24.9562 49.6619 24.9562 48.7665V42.9555C24.9562 42.6631 25.0111 42.389 25.1207 42.1332C25.2486 41.8591 25.4039 41.6216 25.5867 41.4205C25.7877 41.2013 26.0161 41.0368 26.2719 40.9272C26.5278 40.7992 26.7927 40.7353 27.0668 40.7353H28.4373C28.7114 40.7353 28.9673 40.7992 29.2048 40.9272C29.4607 41.0368 29.6708 41.2013 29.8353 41.4205C30.018 41.6216 30.1642 41.8591 30.2738 42.1332C30.3835 42.389 30.4383 42.6631 30.4383 42.9555V48.7665C30.4383 49.0223 30.3926 49.2964 30.3012 49.5888C30.2281 49.8629 30.1094 50.1187 29.9449 50.3563C29.7804 50.5756 29.5703 50.7583 29.3145 50.9045C29.0769 51.0507 28.7845 51.1238 28.4373 51.1238H27.0668ZM66.4573 37.3638V40.4338C66.4573 42.2611 66.3476 43.8509 66.1284 45.2032C65.9091 46.5371 65.6715 47.6609 65.4157 48.5746C65.105 49.6345 64.767 50.539 64.4015 51.2882H60.427C61.0301 50.2832 61.4778 49.2416 61.7701 48.1635C62.0808 47.0853 62.2909 46.0529 62.4006 45.0661C62.5285 44.0793 62.5833 43.1839 62.565 42.3799C62.5468 41.5759 62.5193 40.9363 62.4828 40.4612H50.4223V37.3638H66.4573ZM68.5953 56.3043H48.531V52.9877H68.5953V56.3043ZM73.4741 45.5321H81.9713V48.3279H70.1026V41.448H78.079V39.8582H70.1026V37.0623H81.4231V43.6408H73.4741V45.5321ZM85.6168 35.7192H89.1253V48.6294H85.6168V35.7192ZM72.5696 50.4385H89.235V58.7986H72.5696V50.4385ZM86.1102 55.8932V53.3166H75.7491V55.8932H86.1102ZM101.946 53.7278C101.397 53.7278 100.867 53.6547 100.356 53.5085C99.8625 53.344 99.4148 53.0882 99.0127 52.741C98.629 52.3755 98.3183 51.8913 98.0808 51.2882C97.8615 50.6852 97.7519 49.9451 97.7519 49.068V42.4073C97.7519 41.6947 97.8158 41.0277 97.9437 40.4064C98.0717 39.7668 98.3092 39.2186 98.6564 38.7618C99.0219 38.3049 99.5153 37.9486 100.137 37.6928C100.776 37.4187 101.589 37.2816 102.576 37.2816H104.413C105.911 37.2816 107.053 37.711 107.839 38.5699C108.643 39.4287 109.045 40.717 109.045 42.4347V48.7665C109.045 49.534 108.935 50.2284 108.716 50.8497C108.497 51.471 108.195 51.9918 107.811 52.4121C107.446 52.8323 107.017 53.1613 106.523 53.3988C106.03 53.6181 105.509 53.7278 104.961 53.7278H101.946ZM116.446 36.0207V58.7986H112.937V46.93H109.977V43.12H112.937V36.0207H116.446ZM104.056 50.9045C104.385 50.9045 104.659 50.8314 104.879 50.6852C105.098 50.5208 105.271 50.3289 105.399 50.1096C105.527 49.872 105.619 49.6162 105.673 49.3421C105.728 49.0497 105.756 48.7665 105.756 48.4924V42.9555C105.756 42.6631 105.737 42.3525 105.701 42.0236C105.683 41.6947 105.619 41.3931 105.509 41.119C105.399 40.8449 105.226 40.6257 104.988 40.4612C104.769 40.2785 104.458 40.1871 104.056 40.1871H102.932C102.512 40.1871 102.183 40.2602 101.946 40.4064C101.708 40.5526 101.516 40.7444 101.37 40.982C101.242 41.2195 101.16 41.4936 101.123 41.8043C101.087 42.0967 101.069 42.389 101.069 42.6814V48.3553C101.069 48.5746 101.059 48.8305 101.041 49.1228C101.023 49.4152 101.059 49.6984 101.151 49.9725C101.242 50.2284 101.416 50.4477 101.672 50.6304C101.927 50.8131 102.329 50.9045 102.878 50.9045H104.056ZM131.248 53.2618V50.4111H128.15V41.5302H131.248V38.378H117.954V53.2618H131.248ZM121.38 50.4111V41.5302H124.724V50.4111H121.38ZM134.263 35.7192H137.909V58.7986H134.263V46.93H130.206V43.0926H134.263V35.7192ZM147.943 40.3241C147.943 41.4388 148.025 42.453 148.19 43.3667C148.354 44.2804 148.61 45.1118 148.957 45.861C149.323 46.6102 149.789 47.2955 150.355 47.9168C150.922 48.5381 151.607 49.1046 152.411 49.6162V53.2618C151.643 53.0059 150.885 52.6496 150.136 52.1928C149.496 51.809 148.793 51.2974 148.025 50.6578C147.258 50.0182 146.554 49.2142 145.915 48.2457C145.257 49.2142 144.544 50.0182 143.777 50.6578C143.009 51.2974 142.306 51.809 141.666 52.1928C140.917 52.6496 140.168 53.0059 139.418 53.2618V49.6162C140.332 48.9949 141.09 48.3553 141.693 47.6975C142.315 47.0396 142.808 46.3361 143.174 45.5869C143.539 44.8194 143.795 43.988 143.941 43.0926C144.106 42.1789 144.188 41.1647 144.188 40.05V37.3364H147.943V40.3241ZM153.891 35.7466H157.071V58.7986H153.891V46.3544H150.794V42.4347H153.891V35.7466ZM162.196 35.7466V58.7986H158.989V35.7466H162.196ZM178.331 36.24C178.751 36.24 179.226 36.3314 179.756 36.5141C180.286 36.6968 180.779 36.9618 181.236 37.309C181.711 37.6379 182.104 38.04 182.415 38.5151C182.725 38.9902 182.881 39.511 182.881 40.0774V41.9688C182.881 42.4804 182.753 42.9647 182.497 43.4215C182.241 43.8601 181.894 44.2438 181.455 44.5727C181.017 44.9017 180.505 45.1575 179.921 45.3402C179.354 45.5229 178.742 45.6143 178.084 45.6143H170.08C169.477 45.6143 168.911 45.5229 168.381 45.3402C167.869 45.1392 167.412 44.8834 167.01 44.5727C166.608 44.2621 166.279 43.8966 166.024 43.4763C165.768 43.056 165.594 42.6266 165.503 42.188V39.8308C165.576 39.3008 165.749 38.8166 166.024 38.378C166.316 37.9394 166.663 37.5648 167.065 37.2542C167.467 36.9253 167.897 36.6786 168.353 36.5141C168.81 36.3314 169.249 36.24 169.669 36.24H178.331ZM184.443 52.7136V56.3317H163.694V52.7136H169.724V46.6285H173.068V52.7136H175.398V46.6285H178.413V52.7136H184.443ZM177.673 42.9555C177.929 42.9555 178.166 42.9098 178.386 42.8185C178.623 42.7088 178.824 42.5718 178.989 42.4073C179.153 42.2246 179.281 42.0236 179.372 41.8043C179.482 41.5667 179.537 41.3292 179.537 41.0916C179.537 40.5982 179.354 40.1688 178.989 39.8033C178.623 39.4379 178.185 39.2551 177.673 39.2551H170.628C170.099 39.2551 169.651 39.4379 169.285 39.8033C168.92 40.1688 168.737 40.5982 168.737 41.0916C168.737 41.5667 168.902 41.9962 169.231 42.3799C169.578 42.7637 170.044 42.9555 170.628 42.9555H177.673ZM200.571 46.2448C200.242 47.195 199.776 48.0081 199.173 48.6843C198.588 49.3421 197.894 49.671 197.09 49.671C196.341 49.671 195.683 49.534 195.116 49.2599C194.568 48.9675 194.066 48.6569 193.609 48.3279C193.152 47.9807 192.704 47.6609 192.266 47.3686C191.845 47.0762 191.379 46.9209 190.868 46.9026C190.319 46.9026 189.735 47.0579 189.113 47.3686C188.492 47.6609 187.99 48.1817 187.606 48.931L186.263 47.1493C186.793 46.126 187.441 45.3311 188.209 44.7646C188.995 44.1798 189.826 43.8692 190.703 43.8327C191.379 43.7961 191.955 43.9149 192.43 44.189C192.923 44.4631 193.38 44.7737 193.801 45.1209C194.239 45.4681 194.687 45.7879 195.144 46.0803C195.601 46.3544 196.158 46.4823 196.816 46.464C197.181 46.4458 197.483 46.3635 197.72 46.2173C197.958 46.0529 198.15 45.861 198.296 45.6417C198.46 45.4224 198.579 45.2032 198.652 44.9839C198.744 44.7463 198.808 44.5453 198.844 44.3809L200.571 46.2448ZM214.021 44.792L210.595 52.6313H207.086L210.951 44.0793C211.061 43.8418 211.134 43.5677 211.171 43.257C211.207 42.9464 211.207 42.6357 211.171 42.3251C211.134 42.0144 211.052 41.7129 210.924 41.4205C210.814 41.1282 210.659 40.8632 210.458 40.6257C209.873 40.0774 209.179 39.8033 208.375 39.8033C207.936 39.8033 207.589 39.8764 207.333 40.0226C207.096 40.1505 206.849 40.3515 206.593 40.6257C206.1 41.1739 205.853 41.8682 205.853 42.7088H202.619C202.619 41.119 203.158 39.7851 204.236 38.7069C205.387 37.6471 206.767 37.1171 208.375 37.1171C209.215 37.1171 210.019 37.2451 210.787 37.5009C211.573 37.7567 212.249 38.1405 212.815 38.6521C213.199 38.9993 213.519 39.4287 213.775 39.9404C214.049 40.4338 214.24 40.9637 214.35 41.5302C214.46 42.0784 214.487 42.6357 214.432 43.2022C214.396 43.7687 214.259 44.2986 214.021 44.792ZM210.485 54.8242V57.9763H206.895V54.8242H210.485Z" fill="white"/>
                <rect class="babble" x="20.6527" y="20.2234" width="290.877" height="54.0106" stroke="#278EFF" stroke-width="0.805851"/>
                <path class="babble" d="M331.183 39.876C331.183 29.0222 322.384 20.2234 311.53 20.2234V20.2234V48.668H331.183V39.876Z" fill="#278EFF" stroke="#278EFF" stroke-width="0.805851"/>
                <rect class="babble" width="19.6526" height="1" transform="matrix(-1 0 0 1 331.183 48.668)" fill="#278EFF" stroke="#278EFF" stroke-width="0.805851"/>
                <path class="babble" fill-rule="evenodd" clip-rule="evenodd" d="M330.826 62.2066C331.06 60.9937 331.183 59.7412 331.183 58.46V49.668H311.53V78.1126C316.289 78.1126 320.653 76.421 324.053 73.6063C327.446 75.8663 332.885 78.0146 339.457 76.8196C337.647 76.0439 330.665 71.3893 330.924 62.0802C330.893 62.1233 330.86 62.1654 330.826 62.2066Z" fill="#278EFF"/>
                <path class="babble" d="M330.826 62.2066L331.137 62.4632L330.43 62.1302L330.826 62.2066ZM331.183 49.668V49.265H331.586V49.668H331.183ZM311.53 49.668H311.127V49.265H311.53V49.668ZM311.53 78.1126V78.5155H311.127V78.1126H311.53ZM324.053 73.6063L323.796 73.2959L324.027 73.1048L324.277 73.271L324.053 73.6063ZM339.457 76.8196L339.616 76.4493L340.847 76.9766L339.529 77.216L339.457 76.8196ZM330.924 62.0801L330.598 61.8432L331.363 60.7917L331.327 62.0913L330.924 62.0801ZM331.586 58.4599C331.586 59.7669 331.46 61.045 331.222 62.2829L330.43 62.1302C330.66 60.9424 330.78 59.7154 330.78 58.4599H331.586ZM331.586 49.668V58.4599H330.78V49.668H331.586ZM311.53 49.265H331.183V50.0709H311.53V49.265ZM311.127 78.1126V49.668H311.933V78.1126H311.127ZM324.31 73.9167C320.84 76.789 316.386 78.5155 311.53 78.5155V77.7096C316.192 77.7096 320.466 76.053 323.796 73.2959L324.31 73.9167ZM339.529 77.216C332.829 78.4343 327.285 76.2432 323.83 73.9416L324.277 73.271C327.607 75.4894 332.942 77.5948 339.385 76.4232L339.529 77.216ZM331.327 62.0913C331.201 66.6347 332.839 70.0349 334.73 72.3982C336.628 74.7713 338.773 76.0878 339.616 76.4493L339.299 77.19C338.332 76.7756 336.081 75.377 334.1 72.9016C332.112 70.4164 330.389 66.8347 330.521 62.069L331.327 62.0913ZM330.515 61.9499C330.544 61.915 330.572 61.8795 330.598 61.8432L331.25 62.3171C331.214 62.3671 331.176 62.4158 331.137 62.4632L330.515 61.9499Z" fill="#278EFF"/>
            </svg>
            <svg style="display:none;" id="city2" width="500" height="350" viewBox="0 0 806 548" fill="none" xmlns="http://www.w3.org/2000/svg">
                <path d="M241.001 288.438V65.2055L306.09 102.411V325.726L241.001 288.438Z" fill="#35BEB6"/>
                <path d="M306.09 325.65V102.411L371.18 65.2055V288.438L306.09 325.65Z" fill="#3BDBD1"/>
                <path d="M311.515 111.325L319.263 107.062V312.467L311.515 316.73V111.325Z" fill="#19958D"/>
                <path d="M327.399 102.411L335.148 98.1478L335.535 303.166L327.787 307.429L327.399 102.411Z" fill="#19958D"/>
                <path d="M343.285 93.4971L351.033 89.234V294.639L343.285 298.902V93.4971Z" fill="#19958D"/>
                <path d="M358.782 84.5834L366.531 80.3203V285.338L358.782 289.601V84.5834Z" fill="#19958D"/>
                <path d="M245.65 79.9327L253.786 84.5834V289.214L245.65 284.563V79.9327Z" fill="#19958D"/>
                <path d="M261.922 89.234L270.059 93.8847V298.515L261.922 293.864V89.234Z" fill="#19958D"/>
                <path d="M278.195 98.148L286.331 102.799V307.816L278.195 303.166V98.148Z" fill="#19958D"/>
                <path d="M293.692 107.062L301.829 111.712V317.118L293.692 312.467L293.692 107.062Z" fill="#19958D"/>
                <path d="M306.09 28L371.18 65.2055L306.09 102.411L241 65.2055L306.09 28Z" fill="#83E6DF"/>
                <path d="M306.09 34.2009L360.332 65.2055L306.09 96.2101L251.849 65.2055L306.09 34.2009Z" fill="#44A39D"/>
                <path d="M306.09 46.6027L327.787 59.0046L306.09 71.4064L284.394 59.0046L306.09 46.6027Z" fill="#6EE9E2"/>
                <path d="M284.394 59.0046L306.09 71.4064V77.6073L284.394 65.2055V59.0046Z" fill="#4EC4BC"/>
                <path d="M306.09 71.4064L327.787 59.0046V65.2055L306.09 77.6073V71.4064Z" fill="#6AD1CB"/>
                <path d="M140 342.026V226.247L207.5 264.819V380.597L140 342.026Z" fill="#C06CD5"/>
                <path d="M207.5 380.597V264.882L275.001 226.247V342.026L207.5 380.597Z" fill="#EBA2FD"/>
                <path d="M140 226.247L207.5 187.675L275.001 226.247L207.5 264.819L140 226.247Z" fill="#D876F0"/>
                <path d="M148.437 226.247L148.437 115.353L207.5 149.103V259.997L148.437 226.247Z" fill="#C06CD5"/>
                <path d="M207.5 259.997L207.5 149.103L266.563 115.353V226.247L207.5 259.997Z" fill="#EBA2FD"/>
                <path d="M148.437 115.353L207.5 81L266.563 115.353L207.5 149.103L148.437 115.353Z" fill="#D876F0"/>
                <path d="M157.779 115.353L207.5 86.4242L258.126 115.353L207.5 144.282L157.779 115.353Z" fill="#4F6DA7"/>
                <path d="M157.779 115.353L207.5 86.4242L258.126 115.353L207.5 144.282L157.779 115.353Z" fill="#A53BB8"/>
                <path d="M190.625 111.134L207.501 101.491L224.376 111.134L207.501 120.777L190.625 111.134Z" fill="#D876F0"/>
                <path d="M190.625 111.134L207.501 120.777V125.599L190.625 115.956V111.134Z" fill="#C06CD5"/>
                <path d="M207.5 120.777L224.375 111.134V115.956L207.5 125.599V120.777Z" fill="#EBA2FD"/>
                <path d="M144.218 233.479L150.547 237.095V343.167L144.218 339.551L144.218 233.479Z" fill="#9B47B0"/>
                <path d="M152.656 122.585L158.984 126.201V227.452L152.656 223.836V122.585Z" fill="#9B47B0"/>
                <path d="M161.094 127.407L167.422 131.023V232.274L161.094 228.658V127.407Z" fill="#9B47B0"/>
                <path d="M169.531 132.228L175.859 135.844V237.095L169.531 233.479V132.228Z" fill="#9B47B0"/>
                <path d="M177.969 137.05L184.297 140.666V241.917L177.969 238.301V137.05Z" fill="#9B47B0"/>
                <path d="M186.406 141.871L192.735 145.487V246.738L186.406 243.122V141.871Z" fill="#9B47B0"/>
                <path d="M194.844 146.693L201.172 150.309V251.56L194.844 247.943V146.693Z" fill="#9B47B0"/>
                <path d="M152.656 238.3L158.984 241.917V347.989L152.656 344.373L152.656 238.3Z" fill="#9B47B0"/>
                <path d="M161.094 243.122L167.422 246.738V352.81L161.094 349.194L161.094 243.122Z" fill="#9B47B0"/>
                <path d="M169.531 247.943L175.859 251.56V357.632L169.531 354.016L169.531 247.943Z" fill="#9B47B0"/>
                <path d="M177.969 252.765L184.297 256.381V362.453L177.969 358.837L177.969 252.765Z" fill="#9B47B0"/>
                <path d="M186.406 257.586L192.735 261.202V367.275L186.406 363.659L186.406 257.586Z" fill="#9B47B0"/>
                <path d="M194.844 262.408L201.172 266.024V372.096L194.844 368.48L194.844 262.408Z" fill="#9B47B0"/>
                <path d="M211.719 267.531L217.746 264.216V370.288L211.719 373.603V267.531Z" fill="#9B47B0"/>
                <path d="M211.719 151.815L217.746 148.501V249.751L211.719 253.066L211.719 151.815Z" fill="#9B47B0"/>
                <path d="M220.157 146.994L226.184 143.679V244.93L220.157 248.245L220.157 146.994Z" fill="#9B47B0"/>
                <path d="M228.594 141.57L234.621 138.255V239.506L228.594 242.821L228.594 141.57Z" fill="#9B47B0"/>
                <path d="M237.032 137.351L243.059 134.036V235.287L237.032 238.602L237.032 137.351Z" fill="#9B47B0"/>
                <path d="M245.47 132.529L251.496 129.215V230.466L245.47 233.78L245.47 132.529Z" fill="#9B47B0"/>
                <path d="M253.907 127.708L259.934 124.393V225.644L253.907 228.959L253.907 127.708Z" fill="#9B47B0"/>
                <path d="M219.554 262.709L225.581 259.394V365.467L219.554 368.782V262.709Z" fill="#9B47B0"/>
                <path d="M227.991 257.888L234.018 254.573V360.645L227.991 363.96V257.888Z" fill="#9B47B0"/>
                <path d="M236.429 253.066L242.456 249.751V355.824L236.429 359.139V253.066Z" fill="#9B47B0"/>
                <path d="M244.867 248.245L250.893 244.93V351.002L244.867 354.317V248.245Z" fill="#9B47B0"/>
                <path d="M253.907 243.423L259.934 240.109V346.181L253.907 349.496V243.423Z" fill="#9B47B0"/>
                <path d="M262.345 238.602L268.372 235.287V341.359L262.345 344.674V238.602Z" fill="#9B47B0"/>
                <path d="M361 344.026V228.247L428.5 266.819V382.597L361 344.026Z" fill="#4D70B5"/>
                <path d="M428.5 382.597V266.882L496.001 228.247V344.026L428.5 382.597Z" fill="#5C85D4"/>
                <path d="M361 228.247L428.5 189.675L496.001 228.247L428.5 266.819L361 228.247Z" fill="#749EEC"/>
                <path d="M369.437 228.247L369.437 117.353L428.5 151.103V261.997L369.437 228.247Z" fill="#4D70B5"/>
                <path d="M428.5 261.997L428.5 151.103L487.563 117.353V228.247L428.5 261.997Z" fill="#5C85D3"/>
                <path d="M369.437 117.353L428.5 83L487.563 117.353L428.5 151.103L369.437 117.353Z" fill="#749EEC"/>
                <path d="M378.779 117.353L428.5 88.4242L479.126 117.353L428.5 146.282L378.779 117.353Z" fill="#4166AC"/>
                <path d="M378.779 117.353L428.5 88.4242L479.126 117.353L428.5 146.282L378.779 117.353Z" fill="#345799"/>
                <path d="M411.625 113.134L428.501 103.491L445.376 113.134L428.501 122.777L411.625 113.134Z" fill="#749EEC"/>
                <path d="M411.625 113.134L428.501 122.777V127.599L411.625 117.956V113.134Z" fill="#5F7CBA"/>
                <path d="M428.5 122.777L445.375 113.134V117.956L428.5 127.599V122.777Z" fill="#688CD4"/>
                <path d="M365.218 235.479L371.547 239.095V345.167L365.218 341.551L365.218 235.479Z" fill="#415C9C"/>
                <path d="M373.656 124.585L379.984 128.201V229.452L373.656 225.836V124.585Z" fill="#415C9C"/>
                <path d="M382.094 129.407L388.422 133.023V234.274L382.094 230.658V129.407Z" fill="#415C9C"/>
                <path d="M390.531 134.228L396.859 137.844V239.095L390.531 235.479V134.228Z" fill="#415C9C"/>
                <path d="M398.969 139.05L405.297 142.666V243.917L398.969 240.301V139.05Z" fill="#415C9C"/>
                <path d="M407.406 143.871L413.735 147.487V248.738L407.406 245.122V143.871Z" fill="#415C9C"/>
                <path d="M415.844 148.693L422.172 152.309V253.56L415.844 249.943V148.693Z" fill="#415C9C"/>
                <path d="M373.656 240.3L379.984 243.917V349.989L373.656 346.373L373.656 240.3Z" fill="#415C9C"/>
                <path d="M382.094 245.122L388.422 248.738V354.81L382.094 351.194L382.094 245.122Z" fill="#415C9C"/>
                <path d="M390.531 249.943L396.859 253.56V359.632L390.531 356.016L390.531 249.943Z" fill="#415C9C"/>
                <path d="M398.969 254.765L405.297 258.381V364.453L398.969 360.837L398.969 254.765Z" fill="#415C9C"/>
                <path d="M407.406 259.586L413.735 263.202V369.275L407.406 365.659L407.406 259.586Z" fill="#415C9C"/>
                <path d="M415.844 264.408L422.172 268.024V374.096L415.844 370.48L415.844 264.408Z" fill="#415C9C"/>
                <path d="M432.719 269.531L438.746 266.216V372.288L432.719 375.603V269.531Z" fill="#435E9D"/>
                <path d="M432.719 153.815L438.746 150.501V251.751L432.719 255.066L432.719 153.815Z" fill="#435E9D"/>
                <path d="M441.157 148.994L447.184 145.679V246.93L441.157 250.245L441.157 148.994Z" fill="#435E9D"/>
                <path d="M449.594 143.57L455.621 140.255V241.506L449.594 244.821L449.594 143.57Z" fill="#435E9D"/>
                <path d="M458.032 139.351L464.059 136.036V237.287L458.032 240.602L458.032 139.351Z" fill="#435E9D"/>
                <path d="M466.47 134.529L472.496 131.215V232.466L466.47 235.78L466.47 134.529Z" fill="#435E9D"/>
                <path d="M474.907 129.708L480.934 126.393V227.644L474.907 230.959L474.907 129.708Z" fill="#435E9D"/>
                <path d="M440.554 264.709L446.581 261.394V367.467L440.554 370.782V264.709Z" fill="#435E9D"/>
                <path d="M448.991 259.888L455.018 256.573V362.645L448.991 365.96V259.888Z" fill="#435E9D"/>
                <path d="M457.429 255.066L463.456 251.751V357.824L457.429 361.139V255.066Z" fill="#435E9D"/>
                <path d="M465.867 250.245L471.893 246.93V353.002L465.867 356.317V250.245Z" fill="#435E9D"/>
                <path d="M474.907 245.423L480.934 242.109V348.181L474.907 351.496V245.423Z" fill="#435E9D"/>
                <path d="M483.345 240.602L489.372 237.287V343.359L483.345 346.674V240.602Z" fill="#435E9D"/>
                <path d="M261.001 392.438V169.206L326.09 206.411V429.726L261.001 392.438Z" fill="#91D08A"/>
                <path d="M326.09 429.65V206.411L391.18 169.206V392.438L326.09 429.65Z" fill="#A5E09F"/>
                <path d="M331.515 215.325L339.263 211.062V416.467L331.515 420.73V215.325Z" fill="#68A961"/>
                <path d="M347.399 206.411L355.148 202.148L355.535 407.166L347.787 411.429L347.399 206.411Z" fill="#68A961"/>
                <path d="M363.285 197.497L371.033 193.234V398.639L363.285 402.902V197.497Z" fill="#68A961"/>
                <path d="M378.782 188.583L386.531 184.32V389.338L378.782 393.601V188.583Z" fill="#68A961"/>
                <path d="M265.65 183.933L273.786 188.583V393.214L265.65 388.563V183.933Z" fill="#68A961"/>
                <path d="M281.922 193.234L290.059 197.885V402.515L281.922 397.864V193.234Z" fill="#68A961"/>
                <path d="M298.195 202.148L306.331 206.799V411.816L298.195 407.166V202.148Z" fill="#68A961"/>
                <path d="M313.692 211.062L321.829 215.712V421.118L313.692 416.467L313.692 211.062Z" fill="#68A961"/>
                <path d="M326.09 132L391.18 169.205L326.09 206.411L261 169.205L326.09 132Z" fill="#D0F6CC"/>
                <path d="M326.09 138.201L380.332 169.205L326.09 200.21L271.849 169.205L326.09 138.201Z" fill="#76B76E"/>
                <path d="M326.09 150.603L347.787 163.005L326.09 175.406L304.394 163.005L326.09 150.603Z" fill="#D0F5CC"/>
                <path d="M304.394 163.005L326.09 175.406V181.607L304.394 169.205V163.005Z" fill="#91D08A"/>
                <path d="M326.09 175.406L347.787 163.005V169.205L326.09 181.607V175.406Z" fill="#A5E09F"/>
                <path d="M21 332L63 308L147 356L105 380L21 332Z" fill="#434242"/>
                <path d="M63 356L21 332L105 284L147 308L63 356Z" fill="#434242"/>
                <path d="M21 332L28 328L112 376L105 380L21 332Z" fill="#959595"/>
                <path d="M140 304L147 308L98 336L91 332L140 304Z" fill="#959595"/>
                <path d="M105 284L112 288L28 336L21 332L105 284Z" fill="#959595"/>
                <path d="M91 332L98 328L147 356L140 360L91 332Z" fill="#959595"/>
                <path d="M109.053 304.819L111.054 305.819L97.0535 313.819L95.0535 312.819L109.053 304.819Z" fill="#959595"/>
                <path d="M93 349L94.5 348L108.5 356L107 357L93 349Z" fill="#959595"/>
                <path d="M483 452L525 428L609 476L567 500L483 452Z" fill="#434242"/>
                <path d="M483 452L490 448L574 496L567 500L483 452Z" fill="#959595"/>
                <path d="M518 432L525 428L609 476L602 480L518 432Z" fill="#959595"/>
                <path d="M519 449L520.5 448L534.5 456L533 457L519 449Z" fill="#959595"/>
                <path d="M559 472L560.5 471L574.5 479L573 480L559 472Z" fill="#959595"/>
                <path d="M567 500L609 476L693 524L651 548L567 500Z" fill="#434242"/>
                <path d="M567 500L574 496L658 544L651 548L567 500Z" fill="#959595"/>
                <path d="M602 480L609 476L693 524L686 528L602 480Z" fill="#959595"/>
                <path d="M603 497L604.5 496L618.5 504L617 505L603 497Z" fill="#959595"/>
                <path d="M643 520L644.5 519L658.5 527L657 528L643 520Z" fill="#959595"/>
                <path d="M231 452L273 428L357 476L315 500L231 452Z" fill="#434242"/>
                <path d="M315 500L273 476L357 428L399 452L315 500Z" fill="#434242"/>
                <path d="M231 452L238 448L322 496L315 500L231 452Z" fill="#959595"/>
                <path d="M392 448L399 452L322 496L315 492L392 448Z" fill="#959595"/>
                <path d="M357 428L364 432L315 460L308 456L357 428Z" fill="#959595"/>
                <path d="M266 432L273 428L322 456L315 460L266 432Z" fill="#959595"/>
                <path d="M357.053 451.819L359.054 452.819L345.053 460.819L343.053 459.819L357.053 451.819Z" fill="#959595"/>
                <path d="M271 450L272.5 449L286.5 457L285 458L271 450Z" fill="#959595"/>
                <path d="M105 380L147 356L273 428L231 452L105 380Z" fill="#434242"/>
                <path d="M147 452L105 428L189 380L231 404L147 452Z" fill="#434242"/>
                <path d="M105 380L112 376L161 404L154 408L105 380Z" fill="#959595"/>
                <path d="M182 424L189 420L238 448L231 452L182 424Z" fill="#959595"/>
                <path d="M189 420L196 424L147 452L140 448L189 420Z" fill="#959595"/>
                <path d="M154 400L161 404L112 432L105 428L154 400Z" fill="#959595"/>
                <path d="M140 360L147 356L273 428L266 432L140 360Z" fill="#959595"/>
                <path d="M142 378L143.5 377L157.5 385L156 386L142 378Z" fill="#959595"/>
                <path d="M159.053 420.819L161.054 421.819L147.053 429.819L145.053 428.819L159.053 420.819Z" fill="#959595"/>
                <path d="M222 424L223.5 423L237.5 431L236 432L222 424Z" fill="#959595"/>
                <path d="M483 308L525 284L609 332L567 356L483 308Z" fill="#434242"/>
                <path d="M525 380L483 356L567 308L609 332L525 380Z" fill="#434242"/>
                <path d="M483 308L490 304L539 332L532 336L483 308Z" fill="#959595"/>
                <path d="M602 328L609 332L525 380L518 376L602 328Z" fill="#959595"/>
                <path d="M532 328L539 332L490 360L483 356L532 328Z" fill="#959595"/>
                <path d="M518 288L525 284L609 332L602 336L518 288Z" fill="#959595"/>
                <path d="M537.053 347.819L539.054 348.819L525.053 356.819L523.053 355.819L537.053 347.819Z" fill="#959595"/>
                <path d="M517 303L518.5 302L532.5 310L531 311L517 303Z" fill="#959595"/>
                <path d="M399 404L441 380L525 428L483 452L399 404Z" fill="#434242"/>
                <path d="M399 452L357 428L483 356L525 380L399 452Z" fill="#434242"/>
                <path d="M434 424L441 420L490 448L483 452L434 424Z" fill="#959595"/>
                <path d="M518 376L525 380L476 408L469 404L518 376Z" fill="#959595"/>
                <path d="M441 420L448 424L399 452L392 448L441 420Z" fill="#959595"/>
                <path d="M483 356L490 360L364 432L357 428L483 356Z" fill="#959595"/>
                <path d="M469 404L476 400L525 428L518 432L469 404Z" fill="#959595"/>
                <path d="M483.053 377.819L485.054 378.819L471.053 386.819L469.053 385.819L483.053 377.819Z" fill="#959595"/>
                <path d="M411.053 420.819L413.054 421.819L399.053 429.819L397.053 428.819L411.053 420.819Z" fill="#959595"/>
                <path d="M474 424L475.5 423L489.5 431L488 432L474 424Z" fill="#959595"/>
                <path d="M64 500L22 476L106 428L148 452L64 500Z" fill="#434242"/>
                <path d="M141 448L148 452L64 500L57 496L141 448Z" fill="#959595"/>
                <path d="M106 428L113 432L29 480L22 476L106 428Z" fill="#959595"/>
                <path d="M111.053 447.819L113.054 448.819L99.0535 456.819L97.0535 455.819L111.053 447.819Z" fill="#959595"/>
                <path d="M76.0535 468.819L78.0535 469.819L64.0535 477.819L62.0535 476.819L76.0535 468.819Z" fill="#959595"/>
                <path d="M5.14984e-05 315.572L67.5006 354.177V450.606L5.14984e-05 412.035V315.572Z" fill="#E26262"/>
                <path d="M67.5008 354.144L135.001 315.538V412.034L67.5008 450.64V354.144Z" fill="#F77E7E"/>
                <path d="M0 315.572L67.5006 277L135.001 315.572L67.5006 354.144L0 315.572Z" fill="#FC9292"/>
                <path d="M8.43765 315.572L67.5007 281.821L126.564 315.572L67.802 349.322L8.43765 315.572Z" fill="#CF7070"/>
                <path d="M67.5008 324.913L101.251 305.929V315.572L67.5008 334.858V324.913Z" fill="#F87777"/>
                <path d="M33.7504 315.572V305.929L67.5007 325.215V334.858L33.7504 315.572Z" fill="#E26262"/>
                <path d="M33.7504 305.929L67.5007 286.643L101.251 305.929L67.5007 325.215L33.7504 305.929Z" fill="#FC9292"/>
                <path d="M4.21862 337.268L10.5468 340.884V350.527L4.21862 346.911V337.268Z" fill="#962929"/>
                <path d="M5.12287 337.793L10.547 340.884V349.322L5.12287 346.309V337.793Z" fill="#B43E3E"/>
                <path d="M4.21862 356.554L10.5468 360.17V369.813L4.21862 366.197V356.554Z" fill="#962929"/>
                <path d="M5.12287 357.079L10.547 360.17V368.608L5.12287 365.594V357.079Z" fill="#B43E3E"/>
                <path d="M4.21862 375.84L10.5468 379.456V389.099L4.21862 385.483V375.84Z" fill="#962929"/>
                <path d="M5.12287 376.365L10.547 379.456V387.894L5.12287 384.88V376.365Z" fill="#B43E3E"/>
                <path d="M4.21862 395.126L10.5468 398.742V408.385L4.21862 404.769V395.126Z" fill="#962929"/>
                <path d="M5.12287 395.651L10.547 398.742V407.18L5.12287 404.166V395.651Z" fill="#B43E3E"/>
                <path d="M21.0938 346.911L27.422 350.527V360.17L21.0938 356.554V346.911Z" fill="#962929"/>
                <path d="M21.9983 347.436L27.4224 350.527V358.965L21.9983 355.952V347.436Z" fill="#B43E3E"/>
                <path d="M21.0938 366.197L27.422 369.813V379.456L21.0938 375.84V366.197Z" fill="#962929"/>
                <path d="M21.9983 366.722L27.4224 369.813V378.251L21.9983 375.237V366.722Z" fill="#B43E3E"/>
                <path d="M21.0938 385.483L27.422 389.099V398.742L21.0938 395.126V385.483Z" fill="#962929"/>
                <path d="M21.9983 386.008L27.4224 389.099V397.537L21.9983 394.523V386.008Z" fill="#B43E3E"/>
                <path d="M21.0938 404.769L27.422 408.385V418.028L21.0938 414.412V404.769Z" fill="#962929"/>
                <path d="M21.9983 405.294L27.4224 408.385V416.823L21.9983 413.809V405.294Z" fill="#B43E3E"/>
                <path d="M37.3666 355.952L43.6947 359.568V369.211L37.3666 365.595V355.952Z" fill="#962929"/>
                <path d="M38.2703 356.476L43.6945 359.568V368.005L38.2703 364.992V356.476Z" fill="#B43E3E"/>
                <path d="M37.3666 375.237L43.6947 378.854V388.497L37.3666 384.88V375.237Z" fill="#962929"/>
                <path d="M38.2703 375.762L43.6945 378.854V387.291L38.2703 384.278V375.762Z" fill="#B43E3E"/>
                <path d="M37.3666 394.523L43.6947 398.139V407.782L37.3666 404.166V394.523Z" fill="#962929"/>
                <path d="M38.2703 395.048L43.6945 398.139V406.577L38.2703 403.564V395.048Z" fill="#B43E3E"/>
                <path d="M37.3666 413.809L43.6947 417.425V427.068L37.3666 423.452V413.809Z" fill="#962929"/>
                <path d="M38.2703 414.334L43.6945 417.425V425.863L38.2703 422.849V414.334Z" fill="#B43E3E"/>
                <path d="M54.2418 365.595L60.5699 369.211V378.854L54.2418 375.238V365.595Z" fill="#962929"/>
                <path d="M55.1457 366.119L60.5699 369.211V377.648L55.1457 374.635V366.119Z" fill="#B43E3E"/>
                <path d="M54.2418 384.88L60.5699 388.497V398.139L54.2418 394.523V384.88Z" fill="#962929"/>
                <path d="M55.1457 385.405L60.5699 388.497V396.934L55.1457 393.921V385.405Z" fill="#B43E3E"/>
                <path d="M54.2418 404.166L60.5699 407.782V417.425L54.2418 413.809V404.166Z" fill="#962929"/>
                <path d="M55.1457 404.691L60.5699 407.782V416.22L55.1457 413.206V404.691Z" fill="#B43E3E"/>
                <path d="M54.2418 423.452L60.5699 427.068V436.711L54.2418 433.095V423.452Z" fill="#962929"/>
                <path d="M55.1457 423.977L60.5699 427.068V435.506L55.1457 432.492V423.977Z" fill="#B43E3E"/>
                <path d="M71.7196 371.32L77.7464 368.005V377.648L71.7196 380.963V371.32Z" fill="#962929"/>
                <path d="M71.7196 371.32L76.8424 368.504V377.046L71.7196 379.758V371.32Z" fill="#B43E3E"/>
                <path d="M74.1302 390.606L80.157 387.291V396.934L74.1302 400.249V390.606Z" fill="#962929"/>
                <path d="M74.1299 390.606L79.2528 387.79V396.331L74.1299 399.043V390.606Z" fill="#B43E3E"/>
                <path d="M74.1302 408.084L80.157 404.769V414.412L74.1302 417.727V408.084Z" fill="#962929"/>
                <path d="M74.1299 408.084L79.2528 405.268V413.809L74.1299 416.521V408.084Z" fill="#B43E3E"/>
                <path d="M74.1302 426.767L80.157 423.452V433.095L74.1302 436.41V426.767Z" fill="#962929"/>
                <path d="M74.1299 426.767L79.2528 423.951V432.492L74.1299 435.204V426.767Z" fill="#B43E3E"/>
                <path d="M88.5951 361.677L94.6219 358.362V368.005L88.5951 371.32V361.677Z" fill="#962929"/>
                <path d="M88.5945 361.677L93.7173 358.861V367.403L88.5945 370.115V361.677Z" fill="#B43E3E"/>
                <path d="M91.0062 380.963L97.033 377.648V387.291L91.0062 390.606V380.963Z" fill="#962929"/>
                <path d="M91.0053 380.963L96.1282 378.147V386.688L91.0053 389.401V380.963Z" fill="#B43E3E"/>
                <path d="M91.0062 398.441L97.033 395.126V404.769L91.0062 408.084V398.441Z" fill="#962929"/>
                <path d="M91.0053 398.441L96.1282 395.625V404.166L91.0053 406.878V398.441Z" fill="#B43E3E"/>
                <path d="M91.0062 417.124L97.033 413.809V423.452L91.0062 426.767V417.124Z" fill="#962929"/>
                <path d="M91.0053 417.124L96.1282 414.308V422.849L91.0053 425.562V417.124Z" fill="#B43E3E"/>
                <path d="M104.868 352.034L110.894 348.719V358.362L104.868 361.677V352.034Z" fill="#962929"/>
                <path d="M104.867 352.034L109.99 349.219V357.76L104.867 360.472V352.034Z" fill="#B43E3E"/>
                <path d="M107.278 371.32L113.305 368.005V377.648L107.278 380.963V371.32Z" fill="#962929"/>
                <path d="M107.277 371.32L112.4 368.504V377.046L107.277 379.758V371.32Z" fill="#B43E3E"/>
                <path d="M107.278 388.798L113.305 385.483V395.126L107.278 398.441V388.798Z" fill="#962929"/>
                <path d="M107.277 388.798L112.4 385.982V394.523L107.277 397.235V388.798Z" fill="#B43E3E"/>
                <path d="M107.278 407.481L113.305 404.166V413.809L107.278 417.124V407.481Z" fill="#962929"/>
                <path d="M107.277 407.481L112.4 404.665V413.207L107.277 415.919V407.481Z" fill="#B43E3E"/>
                <path d="M121.742 342.391L127.769 339.076V348.719L121.742 352.034V342.391Z" fill="#962929"/>
                <path d="M121.742 342.391L126.865 339.576V348.117L121.742 350.829V342.391Z" fill="#B43E3E"/>
                <path d="M124.153 361.677L130.18 358.362V368.005L124.153 371.32V361.677Z" fill="#962929"/>
                <path d="M124.153 361.677L129.276 358.861V367.403L124.153 370.115V361.677Z" fill="#B43E3E"/>
                <path d="M124.153 379.155L130.18 375.84V385.483L124.153 388.798V379.155Z" fill="#962929"/>
                <path d="M124.153 379.155L129.276 376.339V384.88L124.153 387.592V379.155Z" fill="#B43E3E"/>
                <path d="M124.153 397.838L130.18 394.523V404.166L124.153 407.481V397.838Z" fill="#962929"/>
                <path d="M124.153 397.838L129.276 395.022V403.564L124.153 406.276V397.838Z" fill="#B43E3E"/>
                <path d="M5.14984e-05 320.393L67.5006 358.965V363.786L5.14984e-05 325.215V320.393Z" fill="#F88080"/>
                <path d="M5.14984e-05 328.228L67.5006 366.8V368.608L5.14984e-05 330.036V328.228Z" fill="#F88080"/>
                <path d="M67.5008 358.965L135.001 320.393V325.215L67.5008 363.786V358.965Z" fill="#FF9F9F"/>
                <path d="M67.5008 366.8L135.001 328.228V330.036L67.5008 368.608V366.8Z" fill="#FF9F9F"/>
                <path d="M119 377.572L186.501 416.177V512.606L119 474.035V377.572Z" fill="#E26262"/>
                <path d="M186.501 416.144L254.001 377.538V474.034L186.501 512.64V416.144Z" fill="#F77E7E"/>
                <path d="M119 377.572L186.501 339L254.001 377.572L186.501 416.144L119 377.572Z" fill="#FC9292"/>
                <path d="M127.438 377.572L186.501 343.821L245.564 377.572L186.802 411.322L127.438 377.572Z" fill="#CF7070"/>
                <path d="M186.501 386.913L220.251 367.929V377.572L186.501 396.858V386.913Z" fill="#F87777"/>
                <path d="M152.75 377.572V367.929L186.501 387.215V396.858L152.75 377.572Z" fill="#E26262"/>
                <path d="M152.75 367.929L186.501 348.643L220.251 367.929L186.501 387.215L152.75 367.929Z" fill="#FC9292"/>
                <path d="M123.219 399.268L129.547 402.884V412.527L123.219 408.911V399.268Z" fill="#962929"/>
                <path d="M124.123 399.793L129.547 402.884V411.322L124.123 408.309V399.793Z" fill="#B43E3E"/>
                <path d="M123.219 418.554L129.547 422.17V431.813L123.219 428.197V418.554Z" fill="#962929"/>
                <path d="M124.123 419.079L129.547 422.17V430.608L124.123 427.594V419.079Z" fill="#B43E3E"/>
                <path d="M123.219 437.84L129.547 441.456V451.099L123.219 447.483V437.84Z" fill="#962929"/>
                <path d="M124.123 438.365L129.547 441.456V449.894L124.123 446.88V438.365Z" fill="#B43E3E"/>
                <path d="M123.219 457.126L129.547 460.742V470.385L123.219 466.769V457.126Z" fill="#962929"/>
                <path d="M124.123 457.651L129.547 460.742V469.18L124.123 466.166V457.651Z" fill="#B43E3E"/>
                <path d="M140.094 408.911L146.422 412.527V422.17L140.094 418.554V408.911Z" fill="#962929"/>
                <path d="M140.998 409.436L146.422 412.527V420.965L140.998 417.952V409.436Z" fill="#B43E3E"/>
                <path d="M140.094 428.197L146.422 431.813V441.456L140.094 437.84V428.197Z" fill="#962929"/>
                <path d="M140.998 428.722L146.422 431.813V440.251L140.998 437.237V428.722Z" fill="#B43E3E"/>
                <path d="M140.094 447.483L146.422 451.099V460.742L140.094 457.126V447.483Z" fill="#962929"/>
                <path d="M140.998 448.008L146.422 451.099V459.537L140.998 456.523V448.008Z" fill="#B43E3E"/>
                <path d="M140.094 466.769L146.422 470.385V480.028L140.094 476.412V466.769Z" fill="#962929"/>
                <path d="M140.998 467.294L146.422 470.385V478.823L140.998 475.809V467.294Z" fill="#B43E3E"/>
                <path d="M156.367 417.952L162.695 421.568V431.211L156.367 427.595V417.952Z" fill="#962929"/>
                <path d="M157.27 418.476L162.694 421.568V430.005L157.27 426.992V418.476Z" fill="#B43E3E"/>
                <path d="M156.367 437.237L162.695 440.854V450.497L156.367 446.88V437.237Z" fill="#962929"/>
                <path d="M157.27 437.762L162.694 440.854V449.291L157.27 446.278V437.762Z" fill="#B43E3E"/>
                <path d="M156.367 456.523L162.695 460.139V469.782L156.367 466.166V456.523Z" fill="#962929"/>
                <path d="M157.27 457.048L162.694 460.139V468.577L157.27 465.564V457.048Z" fill="#B43E3E"/>
                <path d="M156.367 475.809L162.695 479.425V489.068L156.367 485.452V475.809Z" fill="#962929"/>
                <path d="M157.27 476.334L162.694 479.425V487.863L157.27 484.849V476.334Z" fill="#B43E3E"/>
                <path d="M173.242 427.595L179.57 431.211V440.854L173.242 437.238V427.595Z" fill="#962929"/>
                <path d="M174.146 428.119L179.57 431.211V439.648L174.146 436.635V428.119Z" fill="#B43E3E"/>
                <path d="M173.242 446.88L179.57 450.497V460.139L173.242 456.523V446.88Z" fill="#962929"/>
                <path d="M174.146 447.405L179.57 450.497V458.934L174.146 455.921V447.405Z" fill="#B43E3E"/>
                <path d="M173.242 466.166L179.57 469.782V479.425L173.242 475.809V466.166Z" fill="#962929"/>
                <path d="M174.146 466.691L179.57 469.782V478.22L174.146 475.206V466.691Z" fill="#B43E3E"/>
                <path d="M173.242 485.452L179.57 489.068V498.711L173.242 495.095V485.452Z" fill="#962929"/>
                <path d="M174.146 485.977L179.57 489.068V497.506L174.146 494.492V485.977Z" fill="#B43E3E"/>
                <path d="M190.72 433.32L196.746 430.005V439.648L190.72 442.963V433.32Z" fill="#962929"/>
                <path d="M190.72 433.32L195.842 430.504V439.046L190.72 441.758V433.32Z" fill="#B43E3E"/>
                <path d="M193.13 452.606L199.157 449.291V458.934L193.13 462.249V452.606Z" fill="#962929"/>
                <path d="M193.13 452.606L198.253 449.79V458.331L193.13 461.043V452.606Z" fill="#B43E3E"/>
                <path d="M193.13 470.084L199.157 466.769V476.412L193.13 479.727V470.084Z" fill="#962929"/>
                <path d="M193.13 470.084L198.253 467.268V475.809L193.13 478.521V470.084Z" fill="#B43E3E"/>
                <path d="M193.13 488.767L199.157 485.452V495.095L193.13 498.41V488.767Z" fill="#962929"/>
                <path d="M193.13 488.767L198.253 485.951V494.492L193.13 497.204V488.767Z" fill="#B43E3E"/>
                <path d="M207.595 423.677L213.622 420.362V430.005L207.595 433.32V423.677Z" fill="#962929"/>
                <path d="M207.594 423.677L212.717 420.861V429.403L207.594 432.115V423.677Z" fill="#B43E3E"/>
                <path d="M210.006 442.963L216.033 439.648V449.291L210.006 452.606V442.963Z" fill="#962929"/>
                <path d="M210.005 442.963L215.128 440.147V448.688L210.005 451.401V442.963Z" fill="#B43E3E"/>
                <path d="M210.006 460.441L216.033 457.126V466.769L210.006 470.084V460.441Z" fill="#962929"/>
                <path d="M210.005 460.441L215.128 457.625V466.166L210.005 468.878V460.441Z" fill="#B43E3E"/>
                <path d="M210.006 479.124L216.033 475.809V485.452L210.006 488.767V479.124Z" fill="#962929"/>
                <path d="M210.005 479.124L215.128 476.308V484.849L210.005 487.562V479.124Z" fill="#B43E3E"/>
                <path d="M223.868 414.034L229.894 410.719V420.362L223.868 423.677V414.034Z" fill="#962929"/>
                <path d="M223.867 414.034L228.99 411.219V419.76L223.867 422.472V414.034Z" fill="#B43E3E"/>
                <path d="M226.278 433.32L232.305 430.005V439.648L226.278 442.963V433.32Z" fill="#962929"/>
                <path d="M226.277 433.32L231.4 430.504V439.046L226.277 441.758V433.32Z" fill="#B43E3E"/>
                <path d="M226.278 450.798L232.305 447.483V457.126L226.278 460.441V450.798Z" fill="#962929"/>
                <path d="M226.277 450.798L231.4 447.982V456.523L226.277 459.235V450.798Z" fill="#B43E3E"/>
                <path d="M226.278 469.481L232.305 466.166V475.809L226.278 479.124V469.481Z" fill="#962929"/>
                <path d="M226.277 469.481L231.4 466.665V475.207L226.277 477.919V469.481Z" fill="#B43E3E"/>
                <path d="M240.742 404.391L246.769 401.076V410.719L240.742 414.034V404.391Z" fill="#962929"/>
                <path d="M240.742 404.391L245.865 401.576V410.117L240.742 412.829V404.391Z" fill="#B43E3E"/>
                <path d="M243.153 423.677L249.18 420.362V430.005L243.153 433.32V423.677Z" fill="#962929"/>
                <path d="M243.153 423.677L248.276 420.861V429.403L243.153 432.115V423.677Z" fill="#B43E3E"/>
                <path d="M243.153 441.155L249.18 437.84V447.483L243.153 450.798V441.155Z" fill="#962929"/>
                <path d="M243.153 441.155L248.276 438.339V446.88L243.153 449.592V441.155Z" fill="#B43E3E"/>
                <path d="M243.153 459.838L249.18 456.523V466.166L243.153 469.481V459.838Z" fill="#962929"/>
                <path d="M243.153 459.838L248.276 457.022V465.564L243.153 468.276V459.838Z" fill="#B43E3E"/>
                <path d="M119 382.393L186.501 420.965V425.786L119 387.215V382.393Z" fill="#F88080"/>
                <path d="M119 390.228L186.501 428.8V430.608L119 392.036V390.228Z" fill="#F88080"/>
                <path d="M186.501 420.965L254.001 382.393V387.215L186.501 425.786V420.965Z" fill="#FF9F9F"/>
                <path d="M186.501 428.8L254.001 390.228V392.036L186.501 430.608V428.8Z" fill="#FF9F9F"/>
                <path d="M539.001 436.438V213.206L604.09 250.411V473.726L539.001 436.438Z" fill="#4D70B5"/>
                <path d="M604.09 473.65V250.411L669.18 213.206V436.438L604.09 473.65Z" fill="#5C85D3"/>
                <path d="M609.515 259.325L617.263 255.062V460.467L609.515 464.73V259.325Z" fill="#435E9D"/>
                <path d="M625.399 250.411L633.148 246.148L633.535 451.166L625.787 455.429L625.399 250.411Z" fill="#435E9D"/>
                <path d="M641.285 241.497L649.033 237.234V442.639L641.285 446.902V241.497Z" fill="#435E9D"/>
                <path d="M656.782 232.583L664.531 228.32V433.338L656.782 437.601V232.583Z" fill="#435E9D"/>
                <path d="M543.65 227.933L551.786 232.583V437.214L543.65 432.563V227.933Z" fill="#435E9D"/>
                <path d="M559.922 237.234L568.059 241.885V446.515L559.922 441.864V237.234Z" fill="#435E9D"/>
                <path d="M576.195 246.148L584.331 250.799V455.816L576.195 451.166V246.148Z" fill="#435E9D"/>
                <path d="M591.692 255.062L599.829 259.712V465.118L591.692 460.467L591.692 255.062Z" fill="#435E9D"/>
                <path d="M604.09 176L669.18 213.205L604.09 250.411L539 213.205L604.09 176Z" fill="#749EEC"/>
                <path d="M604.09 182.201L658.332 213.206L604.09 244.21L549.849 213.206L604.09 182.201Z" fill="#345799"/>
                <path d="M604.09 194.603L625.787 207.005L604.09 219.406L582.394 207.005L604.09 194.603Z" fill="#749EEC"/>
                <path d="M582.394 207.005L604.09 219.406V225.607L582.394 213.205V207.005Z" fill="#5F7CBA"/>
                <path d="M604.09 219.406L625.787 207.005V213.205L604.09 225.607V219.406Z" fill="#688CD4"/>
                <path d="M414.001 502.438V279.206L479.09 316.411V539.726L414.001 502.438Z" fill="#FA70AA"/>
                <path d="M479.09 539.65V316.411L544.18 279.206V502.438L479.09 539.65Z" fill="#FF8DBD"/>
                <path d="M484.515 325.325L492.263 321.062V526.467L484.515 530.73V325.325Z" fill="#C04080"/>
                <path d="M500.399 316.411L508.148 312.148L508.535 517.166L500.787 521.429L500.399 316.411Z" fill="#C04080"/>
                <path d="M516.285 307.497L524.033 303.234V508.639L516.285 512.902V307.497Z" fill="#C04080"/>
                <path d="M531.782 298.583L539.531 294.32V499.338L531.782 503.601V298.583Z" fill="#C04080"/>
                <path d="M418.65 293.933L426.786 298.583V503.214L418.65 498.563V293.933Z" fill="#C04080"/>
                <path d="M434.922 303.234L443.059 307.885V512.515L434.922 507.864V303.234Z" fill="#C04080"/>
                <path d="M451.195 312.148L459.331 316.799V521.816L451.195 517.166V312.148Z" fill="#C04080"/>
                <path d="M466.692 321.062L474.829 325.712V531.118L466.692 526.467L466.692 321.062Z" fill="#C04080"/>
                <path d="M479.09 242L544.18 279.205L479.09 316.411L414 279.205L479.09 242Z" fill="#FFAED0"/>
                <path d="M479.09 248.201L533.332 279.206L479.09 310.21L424.849 279.206L479.09 248.201Z" fill="#D6578C"/>
                <path d="M479.09 260.603L500.787 273.005L479.09 285.406L457.394 273.005L479.09 260.603Z" fill="#FFAED0"/>
                <path d="M457.394 273.005L479.09 285.406V291.607L457.394 279.205V273.005Z" fill="#FA70AA"/>
                <path d="M479.09 285.406L500.787 273.005V279.205L479.09 291.607V285.406Z" fill="#FF8DBD"/>
                <path class="babble2" d="M475.275 41.4878C475.275 30.6339 484.074 21.8351 494.927 21.8351V21.8351V50.2797H475.275V41.4878Z" fill="#2FCC59" stroke="#2FCC59" stroke-width="0.805851"/>
                <rect class="babble2" x="475.275" y="50.2797" width="19.6526" height="1" fill="#2FCC59" stroke="#2FCC59" stroke-width="0.805851"/>
                <path class="babble2" fill-rule="evenodd" clip-rule="evenodd" d="M475.632 63.8185C475.397 62.6056 475.275 61.353 475.275 60.0717V51.2797H494.927V79.7243C490.168 79.7243 485.804 78.0327 482.404 75.218C479.012 77.478 473.572 79.6263 467 78.4314C468.81 77.6556 475.792 73.0011 475.533 63.6919C475.565 63.7351 475.598 63.7773 475.632 63.8185Z" fill="#2FCC59"/>
                <path class="babble2" d="M475.632 63.8185L475.321 64.0752L476.027 63.7421L475.632 63.8185ZM475.275 51.2797V50.8768H474.872V51.2797H475.275ZM494.927 51.2797H495.33V50.8768H494.927V51.2797ZM494.927 79.7243V80.1272H495.33V79.7243H494.927ZM482.404 75.218L482.661 74.9076L482.43 74.7165L482.181 74.8827L482.404 75.218ZM467 78.4314L466.841 78.061L465.611 78.5884L466.928 78.8278L467 78.4314ZM475.533 63.6919L475.859 63.4549L475.095 62.4034L475.131 63.7031L475.533 63.6919ZM474.872 60.0717C474.872 61.3787 474.997 62.6569 475.236 63.8949L476.027 63.7421C475.798 62.5543 475.678 61.3272 475.678 60.0717H474.872ZM474.872 51.2797V60.0717H475.678V51.2797H474.872ZM494.927 50.8768H475.275V51.6826H494.927V50.8768ZM495.33 79.7243V51.2797H494.525V79.7243H495.33ZM482.147 75.5284C485.617 78.4007 490.071 80.1272 494.927 80.1272V79.3214C490.266 79.3214 485.992 77.6648 482.661 74.9076L482.147 75.5284ZM466.928 78.8278C473.628 80.0461 479.173 77.855 482.628 75.5534L482.181 74.8827C478.851 77.1011 473.516 79.2066 467.072 78.035L466.928 78.8278ZM475.131 63.7031C475.257 68.2465 473.618 71.6467 471.728 74.01C469.829 76.3831 467.685 77.6996 466.841 78.061L467.159 78.8017C468.125 78.3874 470.377 76.9887 472.357 74.5134C474.345 72.0281 476.069 68.4465 475.936 63.6807L475.131 63.7031ZM475.942 63.5619C475.913 63.5269 475.886 63.4913 475.859 63.4549L475.208 63.9289C475.244 63.9789 475.282 64.0277 475.321 64.0752L475.942 63.5619Z" fill="#2FCC59"/>
                <rect class="babble2" x="494.927" y="21.8351" width="290.877" height="54.0106" fill="#2FCC59"/>
                <path class="babble2" d="M508.962 42.21H506.44C506.403 43.0689 506.422 43.8637 506.495 44.5947C506.568 45.3074 506.668 45.9561 506.796 46.5408C506.942 47.1256 507.098 47.6464 507.262 48.1032C507.445 48.56 507.637 48.9621 507.838 49.3093C508.295 50.1316 508.815 50.7803 509.4 51.2554V54.572C509.071 54.4076 508.697 54.17 508.276 53.8594C507.874 53.5487 507.472 53.2015 507.07 52.8178C506.668 52.434 506.294 52.032 505.946 51.6117C505.617 51.1914 505.362 50.7894 505.179 50.4057C505.033 50.826 504.841 51.2645 504.603 51.7214C504.384 52.1782 504.156 52.5985 503.918 52.9822C503.644 53.4391 503.352 53.8868 503.041 54.3253H499.56C499.852 54.0878 500.108 53.8319 500.327 53.5578C500.547 53.2655 500.729 53.0005 500.876 52.7629C501.058 52.4888 501.204 52.2147 501.314 51.9406L500.053 50.2412C499.797 50.6798 499.496 51.1275 499.149 51.5843C498.801 52.0411 498.427 52.4706 498.025 52.8726C497.641 53.2563 497.257 53.5944 496.874 53.8868C496.49 54.1791 496.143 54.371 495.832 54.4624V51.365C496.234 51.0361 496.581 50.6524 496.874 50.2138C497.166 49.7752 497.413 49.3184 497.614 48.8433C497.815 48.3499 497.97 47.8474 498.08 47.3357C498.208 46.8058 498.299 46.2941 498.354 45.8007C498.5 44.6678 498.527 43.4709 498.436 42.21H495.75V39.0304H508.962V42.21ZM502.685 48.3499C502.867 47.7286 503.004 47.0982 503.096 46.4586C503.205 45.819 503.278 45.2251 503.315 44.6769C503.352 44.1287 503.37 43.6445 503.37 43.2242C503.388 42.7856 503.397 42.4476 503.397 42.21H501.506C501.469 43.4709 501.515 44.5033 501.643 45.3074C501.771 46.0931 501.908 46.7144 502.054 47.1713C502.237 47.7012 502.447 48.0941 502.685 48.3499ZM514.005 45.0607H517.185V48.5966H514.005V60.4378H510.497V37.6599H514.005V45.0607ZM531.898 42.21H529.377C529.34 43.0689 529.358 43.8637 529.431 44.5947C529.505 45.3074 529.605 45.9561 529.733 46.5408C529.879 47.1256 530.034 47.6464 530.199 48.1032C530.382 48.56 530.574 48.9621 530.775 49.3093C531.231 50.1316 531.752 50.7803 532.337 51.2554V54.572C532.008 54.4076 531.633 54.17 531.213 53.8594C530.811 53.5487 530.409 53.2015 530.007 52.8178C529.605 52.434 529.23 52.032 528.883 51.6117C528.554 51.1914 528.298 50.7894 528.116 50.4057C527.97 50.826 527.778 51.2645 527.54 51.7214C527.321 52.1782 527.092 52.5985 526.855 52.9822C526.581 53.4391 526.288 53.8868 525.978 54.3253H522.497C522.789 54.0878 523.045 53.8319 523.264 53.5578C523.483 53.2655 523.666 53.0005 523.812 52.7629C523.995 52.4888 524.141 52.2147 524.251 51.9406L522.99 50.2412C522.734 50.6798 522.433 51.1275 522.085 51.5843C521.738 52.0411 521.364 52.4706 520.962 52.8726C520.578 53.2563 520.194 53.5944 519.81 53.8868C519.427 54.1791 519.079 54.371 518.769 54.4624V51.365C519.171 51.0361 519.518 50.6524 519.81 50.2138C520.103 49.7752 520.349 49.3184 520.551 48.8433C520.752 48.3499 520.907 47.8474 521.016 47.3357C521.144 46.8058 521.236 46.2941 521.291 45.8007C521.437 44.6678 521.464 43.4709 521.373 42.21H518.687V39.0304H531.898V42.21ZM525.621 48.3499C525.804 47.7286 525.941 47.0982 526.033 46.4586C526.142 45.819 526.215 45.2251 526.252 44.6769C526.288 44.1287 526.307 43.6445 526.307 43.2242C526.325 42.7856 526.334 42.4476 526.334 42.21H524.443C524.406 43.4709 524.452 44.5033 524.58 45.3074C524.708 46.0931 524.845 46.7144 524.991 47.1713C525.174 47.7012 525.384 48.0941 525.621 48.3499ZM536.942 45.0607H540.121V48.5966H536.942V60.4378H533.433V37.6599H536.942V45.0607ZM561.384 38.2629V41.3877H556.477C556.733 42.1004 557.117 42.7582 557.628 43.3612C558.14 43.9643 558.652 44.485 559.163 44.9236C559.766 45.4353 560.406 45.9012 561.082 46.3215V49.6656C560.278 49.428 559.52 49.0443 558.807 48.5144C558.094 47.9661 557.473 47.4179 556.943 46.8697C556.322 46.2302 555.737 45.5358 555.189 44.7866C554.732 45.6454 554.147 46.3764 553.435 46.9794C552.722 47.5824 552.018 48.0849 551.324 48.4869C550.52 48.9621 549.67 49.3549 548.775 49.6656V46.4586C549.561 46.0931 550.237 45.682 550.803 45.2251C551.388 44.7683 551.872 44.3114 552.256 43.8546C552.658 43.3978 552.978 42.9592 553.215 42.5389C553.453 42.1004 553.636 41.7166 553.764 41.3877H548.446V38.2629H561.384ZM569.881 42.1826V45.417H566.729V49.693H563.248V37.331H566.729V42.1826H569.881ZM550.639 60.849V54.6542H563.083V53.3934H550.639V51.1731H566.893V57.0938H554.12V58.2724H567.112V60.849H550.639ZM589.309 38.9756V42.0455C589.309 43.8729 589.199 45.4627 588.98 46.8149C588.761 48.1489 588.523 49.2727 588.268 50.1864C587.957 51.2462 587.619 52.1508 587.253 52.9H583.279C583.882 51.895 584.33 50.8534 584.622 49.7752C584.933 48.6971 585.143 47.6646 585.252 46.6779C585.38 45.6911 585.435 44.7957 585.417 43.9917C585.399 43.1876 585.371 42.5481 585.335 42.0729H573.274V38.9756H589.309ZM591.447 57.9161H571.383V54.5994H591.447V57.9161ZM592.954 38.7837V42.0181H601.945V44.8688H593.283V54.8461H605.152V51.9406H596.792V48.1032H605.152V38.7837H592.954ZM611.922 60.4652H608.332V37.3858H611.922V60.4652ZM618.719 38.4548H622.145C622.401 39.2588 622.748 40.1451 623.187 41.1136C623.625 42.0638 624.091 43.014 624.585 43.9643C625.078 44.9145 625.571 45.8281 626.065 46.7053C626.558 47.5824 626.997 48.3316 627.38 48.9529H623.351C623.095 48.5326 622.803 48.0027 622.474 47.3631C622.145 46.7053 621.825 46.0748 621.515 45.4718C621.167 44.7591 620.811 44.0191 620.446 43.2516C620.08 44.1104 619.696 45.0241 619.294 45.9926C618.892 46.9428 618.308 47.9844 617.54 49.1174H613.429C614.306 47.9661 615.073 46.7692 615.731 45.5266C616.389 44.2658 616.937 43.1145 617.376 42.0729C617.887 40.8486 618.335 39.6426 618.719 38.4548ZM628.833 37.3584H632.534V51.9955H628.833V37.3584ZM632.698 60.3556H616.279V52.5711H619.733V57.176H632.698V60.3556ZM637.733 43.0323V52.0503H646.313V55.5588H634.197V39.8253H645.764V43.0323H637.733ZM654.481 45.0607V48.5692H651.329V60.4104H647.82V37.6325H651.329V45.0607H654.481ZM682.87 37.3584V43.8272H686.269V47.3631H682.87V60.4378H679.032V56.2989H662.806V53.0919H668.041V49.8026H667.822C667.31 49.8026 666.817 49.7021 666.342 49.5011C665.866 49.3001 665.446 49.026 665.081 48.6788C664.733 48.3133 664.45 47.8931 664.231 47.4179C664.03 46.9428 663.929 46.4403 663.929 45.9104V42.0455C663.929 41.5156 664.03 41.0222 664.231 40.5654C664.45 40.0903 664.733 39.6883 665.081 39.3593C665.446 39.0121 665.866 38.738 666.342 38.537C666.817 38.336 667.31 38.2355 667.822 38.2355H671.549C672.207 38.2355 672.783 38.3543 673.276 38.5918C673.77 38.8111 674.181 39.1126 674.51 39.4964C674.839 39.8619 675.085 40.2913 675.25 40.7847C675.433 41.278 675.524 41.7897 675.524 42.3196V45.9104C675.524 46.4403 675.423 46.9428 675.222 47.4179C675.021 47.8931 674.747 48.3133 674.4 48.6788C674.071 49.026 673.678 49.3001 673.222 49.5011C672.765 49.7021 672.28 49.8026 671.769 49.8026H671.577V53.0919H679.032V37.3584H682.87ZM672.207 42.813C672.207 42.3379 672.052 41.945 671.741 41.6344C671.431 41.3237 671.038 41.1684 670.563 41.1684H669C668.543 41.1684 668.132 41.3237 667.767 41.6344C667.42 41.945 667.246 42.3379 667.246 42.813V45.1703C667.246 45.6454 667.42 46.0383 667.767 46.3489C668.132 46.6596 668.543 46.8149 669 46.8149H670.563C671.038 46.8149 671.431 46.6596 671.741 46.3489C672.052 46.0383 672.207 45.6454 672.207 45.1703V42.813ZM697.669 41.5247H713.321V44.485C713.321 46.2576 713.229 47.7651 713.046 49.0077C712.864 50.2503 712.663 51.2828 712.443 52.1051C712.188 53.0553 711.895 53.8319 711.566 54.435H707.921C708.14 53.9964 708.314 53.5944 708.442 53.2289C708.569 52.8634 708.67 52.5071 708.743 52.1599C708.834 51.7944 708.908 51.429 708.962 51.0635C709.035 50.6798 709.109 50.2686 709.182 49.83H699.204V47.089H709.511C709.529 46.7236 709.538 46.422 709.538 46.1845C709.556 45.9287 709.565 45.7094 709.565 45.5266C709.565 45.3439 709.565 45.1794 709.565 45.0333C709.565 44.8688 709.556 44.6952 709.538 44.5125H697.669V41.5247ZM720.82 41.5247H736.472V44.485C736.472 46.2576 736.38 47.7651 736.197 49.0077C736.015 50.2503 735.814 51.2828 735.594 52.1051C735.339 53.0553 735.046 53.8319 734.717 54.435H731.072C731.291 53.9964 731.465 53.5944 731.592 53.2289C731.72 52.8634 731.821 52.5071 731.894 52.1599C731.985 51.7944 732.058 51.429 732.113 51.0635C732.186 50.6798 732.259 50.2686 732.333 49.83H722.355V47.089H732.661C732.68 46.7236 732.689 46.422 732.689 46.1845C732.707 45.9287 732.716 45.7094 732.716 45.5266C732.716 45.3439 732.716 45.1794 732.716 45.0333C732.716 44.8688 732.707 44.6952 732.689 44.5125H720.82V41.5247Z" fill="white"/>
                <rect class="babble2" x="494.927" y="21.8351" width="290.877" height="54.0106" stroke="#2FCC59" stroke-width="0.805851"/>
                <path class="babble2" d="M805.457 41.4878C805.457 30.6339 796.659 21.8351 785.805 21.8351V21.8351V50.2797H805.457V41.4878Z" fill="#2FCC59" stroke="#2FCC59" stroke-width="0.805851"/>
                <rect class="babble2" width="19.6526" height="1" transform="matrix(-1 0 0 1 805.457 50.2797)" fill="#2FCC59" stroke="#2FCC59" stroke-width="0.805851"/>
                <path class="babble2" d="M805.457 60.0717C805.457 70.9255 796.659 79.7243 785.805 79.7243V79.7243V51.2797H805.457V60.0717Z" fill="#2FCC59" stroke="#2FCC59" stroke-width="0.805851"/>
            </svg>
        </div>
    </div>
    <div class="container " id="container" style="display: grid;grid-template-columns: repeat(5,1fr);grid-gap:1rem;justify-content: space-around;flex-wrap: nowrap">
        <c:forEach var="cardVOlist" items="${cardVOlist}">
            <div class="flip-card">
                <div class="flip-card-inner" id="${cardVOlist.no_painting}" style="border-radius: 5px;">
                    <div class="ui card flip-card-front" style="height: 100%; margin: 0 auto;">
                        <div class="content"
                             style=" display: flex; flex-direction: row; justify-content: space-evenly; align-items: center;">
                            <img src="${cardVOlist.avatarimg}"
                                 style="border-radius: 50%; width: 3em;height: 3em;object-fit: cover;">
                            <span style="font-size: 1.5em;">${cardVOlist.nickname}</span>
                        </div>
                        <div class="image">
                            <img src="${cardVOlist.paintingmimg}" onclick="buypainting(${cardVOlist.no_painting});"
                                 style="object-fit: cover; height: 250px">
                        </div>
                        <div class="content" style="display: flex;justify-content: center;">
                            <span style="font-size: 1.5em">${cardVOlist.pname}</span><span></span>
                        </div>
                        <div class="extra content">
                            <div class="ui large transparent left icon input" style="display: flex;">
                                <i class="pencil alternate icon"></i>
                                <input type="text" maxlength="20" size="20" id="input${cardVOlist.no_painting}"
                                       placeholder="글자수 20글자 내 작성" style="font-size: 0.8em;font-family:'Gowun Dodum',sans-serif;font-weight:bold;"/>
                            </div>
                            <button class="ui blue icon button"
                                    onclick="addComment('input' + ${cardVOlist.no_painting})"
                                    style="float: right; font-size: 0.8em;font-family:'Gowun Dodum',sans-serif;">Add
                            </button>
                        </div>
                        <div class="ui bottom attached button collapsible" onclick="flipCard(${cardVOlist.no_painting})">
                            <i class="add icon"></i>
                            <span><i class="comment icon"></i>${cardVOlist.commentNumber}</span>
                        </div>
                    </div>
                    <div class="ui comments flip-card-back" style="display: flex;user-select: auto;margin: 0;flex-direction: column;justify-content: space-between;">
                        <div>
                            <c:forEach var="commentVOList" items="${cardVOlist.commentVOList}">
                                <div style=" background-color:var(--color-albescent-white)">
                                    <h5 class="ui header" style="user-select: auto; margin: 10px;">
                                        <div style="display: flex;align-items: center;justify-content: space-between;">
                                            <img src="${commentVOList.avatarimg}" style="border-radius: 50%; height:40px; width:40px;object-fit: cover;">
                                            <span class="author" style="margin-left: 10px; font-size: 1.5em">${commentVOList.author}</span>
                                            <button class="ui red icon button" onclick="reply_delete(${commentVOList.no_comment})" style="font-size: 0.5em;">X</button>
                                        </div>
                                        <div class="text" style="margin: 10px;">${commentVOList.comments}</div>
                                    </h5>
                                </div>
                            </c:forEach>
                        </div>
                        <div class="ui button bottom attached collapsible"
                             onclick="closeCard(${cardVOlist.no_painting})" id="close_btn">
                            <i class="large close icon icon"></i>
                        </div>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
    <div class="container" id="container_page" style="display: flex;justify-content: center;margin-top:30px;padding-bottom: 30px;">
        <div>
            <div class="ui animated button" tabindex="0" style="color:var(--color-white);background-color: var(--color-chathams-blue);">
                <div class="visible content">Perv</div>
                <div class="hidden content"><i class="left arrow icon"></i></div>
            </div>
            <c:forEach var="i" begin="1" end="${pageNum}">
                <div class="ui animated button" tabindex="0" style="color:var(--color-white);background-color: var(--color-chathams-blue);">
                    <div class="visible content" onclick="pagination(${i})">${i}</div>
                    <div class="hidden content" onclick="pagination(${i})">${i}</div>
                </div>
            </c:forEach>
            <div class="ui animated button" tabindex="0" style="color:var(--color-white);background-color: var(--color-chathams-blue);">
                <div class="visible content">Next</div>
                <div class="hidden content"><i class="right arrow icon"></i></div>
            </div>
            <br>
        </div>
    </div>
</div>
<jsp:include page="../header_footer/footer.jsp"></jsp:include>
</body>
<script>
    function reply_delete(num) {
        $(() => {
            $.ajax({
                url: "/reply_delete",
                data: "num=" + num,
                success: function (result) {
                    if(result){
                        alert('본인의 댓글만 삭제 가능합니다.')
                    }
                    else{
                        alert('댓글이 삭제되었습니다.');
                        document.location.href = "/buy";
                    }
                }
            });
        });
    }
    $('#art_girl').css('visibility', 'hidden');
    $('#city1').css('visibility', 'hidden');
    $('#city2').css('visibility', 'hidden');
    $('#looking_boy').transition('pulse','2000ms').transition('vertical flip','500ms',function () {
        $('.babble').css('visibility', 'hidden');
        $('#city1').transition('fly left','1500ms',function () {
            $('.babble').css('visibility','visible')
            $('.babble').transition('jiggle','3000ms',function () {
                $('#city1').transition('fly left','1500ms',function () {
                    $('#city2').transition('fly left','1500ms',function () {
                        $('.babble2').css('visibility','visible')
                        $('.babble2').transition('jiggle','3000ms').transition('clear queue');
                    }).transition('clear queue');
                }).transition('clear queue');
            }).transition('clear queue');
        })
        $('.trees').transition('jiggle','1500ms');
    })
</script>
</html>