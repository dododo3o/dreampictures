<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
            location.href = "http://localhost:8080/buy_picture/" + num;
        }

        showModal = function () {
            $(() => {
                let pname = document.getElementById("pname").value;
                let style = document.getElementById("style").value;
                let theme = document.getElementById("theme").value;
                let width = document.getElementById("width").value;
                let height = document.getElementById("height").value;
                let price = document.getElementById("price").value;
                let status = document.getElementById("status").checked == true ? 1 : 0;
                $.ajax({
                    url: "/ajax_picture_finder",
                    data: "pname=" + pname + "&style=" + style + "&theme=" + theme + "&width=" + width + "&height=" + height + "&price=" + price + "&status=" + status,
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
                alert(text);
                alert(real_no);
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
<body>
<% if (session.getAttribute("logStatus") == "Y") { %>
<jsp:include page="../header_footer/header_login.jsp">
    <jsp:param name="user" value="${user}"/>
</jsp:include>
<% } %>
<% if (session.getAttribute("logStatus") == null) { %>
<jsp:include page="../header_footer/header_not_login.jsp"></jsp:include>
<% } %>
<div class="has_bg_harp">
    <div class="ui tiny modal" id="commentModal">
        <div class="ui comments">
            <div class="comment">
                <a class="avatar">
                    <img src="">
                </a>
                <div class="content">
                    <a class="author">z</a>
                    <div class="metadata">
                        <div class="date">c</div>
                    </div>
                    <div class="text">h</div>
                </div>
            </div>
        </div>
    </div>
    <div class="container">
        <div style="grid-column:1/9;display: flex;flex-direction: column; gap:20px; justify-content: center; margin-top: 70px;">
            <div class="has_chathams-blue" style="font-size: 42px;font-family: 'Gowun Dodum';font-weight: bold">그림드림의
                당신만의 그림찾기
            </div>
            <form action="">
                <div style="display: flex;" class="has_flex_space ">
                    <input type="text" class="has_width_full input_select" id="pname" placeholder="검색어를 입력해주세요."/>
                </div>
            </form>
            <button class=" ui blue icon button has_width_full" onclick="showModal()"
                    style="font-family: 'Gowun Dodum'"><i class="search icon"></i>찾기
            </button>
            <div style="display: flex; gap: 90px;">
                <select style="font-family: 'Gowun Dodum'; font-size: 1.5em;" class="input_select has_width_half"
                        style="margin-right: 90px;" id="style">
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
                <select style="font-family: 'Gowun Dodum'; font-size: 1.5em;" class="input_select has_width_half"
                        id="theme">
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
                <div class="checkbox" style="display: flex;">
                    <input type="checkbox" id="status" style="margin-right:10px;"><label
                        style="color: var(--color-chathams-blue);">거래완료 안보기</label>
                </div>
            </div>
        </div>
    </div>
    <div class="container " id="container"
         style="display: grid;grid-template-columns: repeat(5,1fr);grid-gap:1rem;justify-content: space-around;flex-wrap: nowrap">
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
                                       placeholder="글자수 20글자 내 작성"
                                       style="font-size: 0.8em;font-family:'Gowun Dodum',sans-serif;font-weight:bold;"/>
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
                    <div class="ui comments flip-card-back"
                         style="display: flex;user-select: auto;margin: 0;flex-direction: column;justify-content: space-between;">
                        <div>
                            <c:forEach var="commentVOList" items="${cardVOlist.commentVOList}">
                                <div style=" background-color:var(--color-albescent-white)">
                                    <h5 class="ui header" style="user-select: auto; margin: 10px;">
                                        <div style="display: flex;align-items: center;justify-content: space-between;">
                                            <img src="${commentVOList.avatarimg}"
                                                 style="border-radius: 50%; height:40px; width:40px;object-fit: cover;">
                                            <span class="author"
                                                  style="margin-left: 10px; font-size: 1.5em">${commentVOList.author}</span>
                                            <button class="ui red icon button"
                                                    onclick="reply_delete(${commentVOList.no_comment})"
                                                    style="font-size: 0.5em;">X
                                            </button>
                                        </div>
                                        <div class="text"
                                             style="margin: 10px;">${commentVOList.comments}</div>
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
    <div class="container" style="display: flex;justify-content: center;margin-top:30px;padding-bottom: 30px;">
        <div>
            <div class="ui animated button" tabindex="0"
                 style="color:var(--color-white);background-color: var(--color-chathams-blue);">
                <div class="visible content">Perv</div>
                <div class="hidden content">
                    <i class="left arrow icon"></i>
                </div>
            </div>
            <c:forEach var="i" begin="1" end="${pageNum}">
                <div class="ui animated button" tabindex="0"
                     style="color:var(--color-white);background-color: var(--color-chathams-blue);">
                    <div class="visible content">${i}</div>
                    <div class="hidden content">${i}</div>
                </div>
            </c:forEach>
            <div class="ui animated button" tabindex="0"
                 style="color:var(--color-white);background-color: var(--color-chathams-blue);">
                <div class="visible content">Next</div>
                <div class="hidden content">
                    <i class="right arrow icon"></i>
                </div>
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
                    alert('댓글이 삭제되었습니다.');
                    document.location.href = "/buy";
                }
            });
        });
    }
</script>
</html>