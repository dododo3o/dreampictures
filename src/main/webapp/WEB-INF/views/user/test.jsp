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

        function nextBtn_condition() {
            var pname = $("#pnameVal").val();
            var height = $("#heightVal").val();
            var width = $("#widthVal").val();
            var price = $("#priceVal").val();
            var calVal = $("#cal").val();
            var content = $("#contentVal").val();
            var img = $("#image_section").val();

            var f = document.form;

            if (pname != '' && height != '' && width != '' && price != '' && calVal != '' && content != '' && img != '' && f.style.value !== '' && f.theme.value !== '') {
                document.getElementById('frm').submit();
            } else {
                $("#point").css("display", "block");
            }
        }
    </script>
    <style>

        .container {
            margin: 20px;
            width: 500px;
            height: 500px;
            perspective: 1000px;
        }

        .card {
            transition: transform 2s;
            transform-style: preserve-3d;
            cursor: pointer;
        }

        .front, .back {
            position: absolute;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            backface-visibility: hidden;
        }

        .front {
            border: 2px solid black;
            background: url("http://placehold.it/250x250");
        }

        .back {
            border: 2px solid black;
            background: url("http://placehold.it/100x100");
            transform: rotateY(180deg);
        }
    </style>
    <script>
        function flip(event) {
            var element = event.currentTarget;
            if (element.className === "card") {
                if (element.style.transform == "rotateY(180deg)") {
                    element.style.transform = "rotateY(0deg)";
                } else {
                    element.style.transform = "rotateY(180deg)";
                }
            }
        };
    </script>
</head>

<div class="container">
    <div class="card" onclick="flip(event)">
        <c:forEach var="cardVOlist" items="${cardVOlist}">
            <div class="front">

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
                    </div>
                    <div class="ui bottom attached button collapsible" onclick="flip(event, ${cardVOlist.no_painting})"
                         id="">
                        <i class="add icon"></i>
                        <span><i class="comment icon"></i>${cardVOlist.commentNumber}</span>
                    </div>
                </div>
            </div>
        </c:forEach>
        <div class="back">
            <c:forEach var="commentVOList" items="${cardVOlist.commentVOList}">
                <div class="">
                    <h5 class="ui header" style="user-select: auto; margin: 10px;">
                        <div style="display: flex;align-items: center;justify-content: space-between;">
                            <img src="${commentVOList.avatarimg}"
                                 style="border-radius: 50%; height:40px; width:40px;object-fit: cover;">
                            <span class="author"
                                  style="margin-left: 10px; font-size: 1.5em">${commentVOList.author}</span>
                            <button class="ui red icon button" onclick="" style="font-size: 0.5em">X
                            </button>
                        </div>
                        <div class="text" style="margin: 10px;">${commentVOList.comments}</div>
                    </h5>
                </div>
            </c:forEach>
            <div class="ui bottom attached button collapsible" onclick="closeCard(${cardVOlist.no_painting})"
                 id="close_btn">
                <i class="large close icon icon"></i>
            </div>
        </div>
    </div>
</div>

</html>