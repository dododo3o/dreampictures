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
        showCommentModal = function () {
            $('.ui.tiny.modal').modal('show');
        };
        addComment = function (no_painting) {
            $(() => {
                let text = document.getElementById(no_painting).value;
                let no_paint = no_painting;
                $.ajax({
                    url: "/ajax_comment_add",
                    data: "comment=" + text + "&no_painting=" + no_paint,
                    success: function (result) {
                        document.location.href = "/buy";
                    }
                });
            });
        };
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
    <div class="container" id="container"
         style="display: grid;grid-template-columns: repeat(5,1fr);grid-gap:1rem;justify-content: space-around;">
        <c:forEach var="cardVOlist" items="${cardVOlist}">
            <div class="ui card" style="height: 100%; margin: 0 auto;">
                <div class="content"
                     style=" display: flex; flex-direction: row; justify-content: space-evenly; align-items: center;">
                    <img src="${cardVOlist.avatarimg}"
                         style="border-radius: 50%; width: 3em;height: 3em;object-fit: cover;">
                    <span style="font-size: 2em;">${cardVOlist.nickname}</span>
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
                        <input type="text" maxlength="20" size="20" id="${cardVOlist.no_painting}"
                               placeholder="글자수 20글자 내 작성"
                               style="font-size: 0.8em"/>
                    </div>
                    <button class="ui blue icon button" onclick="addComment(${cardVOlist.no_painting})"
                            style="float: right; font-size: 0.8em;">Add
                    </button>
                    <button class="ui blue icon button" onclick="showCommentModal()"
                            style="float: right; font-size: 0.8em;">zxc
                    </button>
                </div>
                <div class="ui bottom attached button collapsible">
                    <i class="add icon"></i>
                    <span><i class="comment icon"></i>${cardVOlist.commentNumber}</span>
                </div>
                <div class="comments_css" style="background-color: white">
                    <div class="ui comments">
                        <c:forEach var="commentVOList" items="${cardVOlist.commentVOList}">
                            <h5 class="ui header" style="user-select: auto; margin: 10px;">
                                <div style="display: flex;align-items: center;justify-content: space-between;">
                                    <img src="${commentVOList.avatarimg}"
                                         style="border-radius: 50%; height:40px; width:40px;object-fit: cover;">
                                    <span class="author"
                                          style="margin-left: 10px; font-size: 1.5em">${commentVOList.author}</span>
                                    <button class="ui red icon button" onclick="" style="font-size: 0.5em">X</button>
                                </div>
                                <div class="text" style="margin: 10px;">${commentVOList.comments}</div>
                            </h5>
                        </c:forEach>
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
<script>
    var coll = document.getElementsByClassName("collapsible");
    var i;

    for (i = 0; i < coll.length; i++) {
        coll[i].addEventListener("click", function () {
            this.classList.toggle("active");
            var content = this.nextElementSibling;
            if (content.style.maxHeight) {
                content.style.maxHeight = null;
            } else {
                content.style.maxHeight = content.scrollHeight + "px";
            }
        });
    }
</script>
<jsp:include page="../header_footer/footer.jsp"></jsp:include>
</body>
</html>