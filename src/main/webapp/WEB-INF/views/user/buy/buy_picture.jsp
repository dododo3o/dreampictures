<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% String conPath = request.getContextPath(); %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>그림드림 | 구매</title>
    <link rel="stylesheet" href="/resources/css/dreampicturesytle.css">
    <!--고운돋움 글씨체 -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">
    <script src="https://kit.fontawesome.com/b14e6f064f.js" crossorigin="anonymous"></script>
    <script type="text/javascript">
        let reportNum;
        showModal = function () {
            $('.ui.mini.modal').modal('show');
        };
        report = function () {
            var obj_length = document.getElementsByName("report").length;
            for (var i = 0; i < obj_length; i++) {
                if (document.getElementsByName("report")[i].checked == true) {
                    reportNum = document.getElementsByName("report")[i].value;
                }
            }
            $(() => {
                $.ajax({
                    url: "/ajax_report",
                    data: "reportNum=" + reportNum + "&no_painting=" +<c:out value="${paintingVO.no_painting}"/>,
                    success: function (result) {
                        if (result == "not_login") alert("로그인 후 이용해주세요.")
                        else if (result == "overlap") alert("신고는 한 작품에 하나만 가능합니다.")
                        else {
                            alert("정상적으로 신고 되었습니다.")
                            document.location.href = "/buy";
                        }
                    }
                });
            });
        }
        cart = function () {
            $(() => {
                $.ajax({
                    url: "/ajax_cart_add",
                    data: "no_painting=" +<c:out value="${paintingVO.no_painting}"/>,
                    success: function (result) {
                        if (result == "not_login") alert("로그인 후 이용해주세요.")
                        else if (result == "has_already") alert("이미 장바구니에 담겨져 있습니다.")
                        else {
                            alert("정상적으로 장바구니에 담겨졌습니다.")
                            document.location.href = "/buy";
                        }
                    }
                });
            });
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
<main class="has_bg_harp" style="height: 100%">
    <div class="container">
        <div style="display:flex;grid-column: 1/13; background-color: #F3F7F7;">
            <div class="has_flex_column" style="width: 40%;justify-content: center; gap:50px; ">
                <a class="ui red ribbon label">아티스트</a>
                <div class="has_flex_column ">
                    <div class="has_between" style="display: flex; height: 35px; justify-content: space-around;">
                        <h2 class="ui header" style="font-family: 'Gowun Dodum'">
                            <img src="${paintingVO.avatarimg}"
                                 style="border-radius: 50%; width: 3em;height: 3em;object-fit: cover;"><c:out value="${paintingVO.nickname}"/>
                        </h2>
                        <div class="ui vertical red animated button" tabindex="0" onclick="showModal()">
                            <div class="hidden content" style="user-select: auto;">신고하기</div>
                            <div class="visible content" style="user-select: auto;"><i class="exclamation circle icon" style="user-select: auto;"></i>
                            </div>
                        </div>
                    </div>
                </div>
                <a class="ui blue ribbon label">그림 제목</a>
                <span style="font-size: 40px; margin: 0 auto;font-family: 'Gowun Dodum'"><c:out
                        value="${paintingVO.pname}"/></span>
                <a class="ui teal ribbon label">그림 설명</a>
                <div style="padding-left: 35px;padding-right: 35px; font-size: 20px;line-height:30px;"><c:out
                        value="${paintingVO.exp}"/></div>
                <div style="padding-left: 20px;">등록일 : <c:out value="${paintingVO.writedate}"/></div>
                <div class="has_evenly" style="display: flex;">
                    <div class="ui animated button" tabindex="0" id="prev_btn" style="width: 200px;">
                        <div class="hidden content" style="user-select: auto;"><a href="/buy">이전페이지</a></div>
                        <div class=" visible content" style="user-select: auto;">
                            <i class="black left arrow icon" style="user-select: auto;"></i>
                        </div>
                    </div>
                    <div class="ui animated button" tabindex="0"
                         style="background-color: var(--color-middle-blue-green); width: 200px;" onclick="cart()">
                        <div class="hidden content" style="user-select: auto;">장바구니</div>
                        <div class=" visible content" style="user-select: auto;">
                            <i class="black shopping cart icon" style="user-select: auto;"></i>
                        </div>
                    </div>
                    <div class="ui vertical animated button" tabindex="0" id="shop_btn" style="width: 200px;">
                        <div class="hidden content" style="user-select: auto;"><a
                                href="/buy_payment/<c:out value="${paintingVO.no_painting}"/>">바로구매</a></div>
                        <div class="visible content" style="user-select: auto;">
                            <i class="black money bill alternate outline icon" style="user-select: auto;"></i>
                        </div>
                    </div>
                </div>
                </a>
            </div>
            <div class="has_flex_center" style="width: 60%;">
                <div style="width: 80%; height: 80%;">
                    <img src="<c:out value="${paintingVO.paintingimg}"/>"
                         style="object-fit: cover; width: 100%; height: 100%;">
                </div>
            </div>
        </div>
    </div>
    </div>
    <div class="ui mini modal">
        <div class="header">신고 내역</div>
        <div class="ui form">
            <div class="grouped fields">
                <label class="ui red large label" style="display: block;text-align: center;">어떤 사유 인가요?</label>
                <div class="field" style="text-align: center">
                    <div class="ui radio checkbox">
                        <input type="radio" name="report" checked="checked" value="1">
                        <label>그림이 맞지 않아요!</label>
                    </div>
                </div>
                <div class="field" style="text-align: center">
                    <div class="ui radio checkbox">
                        <input type="radio" name="report" value="2">
                        <label>그림이 적절치 않아요!</label>
                    </div>
                </div>
                <div class="field" style="text-align: center">
                    <div class="ui radio checkbox">
                        <input type="radio" name="report" value="3">
                        <label>작가가 악성유저에요!</label>
                    </div>
                </div>
                <div class="field" style="text-align: center">
                    <div class="ui radio checkbox">
                        <input type="radio" name="report" value="4">
                        <label>그 외 사유에요!</label>
                    </div>
                </div>
            </div>
        </div>
        <div class="actions" style="background-color: #95afc0">
            <div class="ui positive right labeled icon button"
                 style="font-family: 'Gowun Dodum';background-color: var(--color-metallic-blue)"
                 onclick="report()">올리기<i class="checkmark icon"></i></div>
        </div>
    </div>
</main>
<jsp:include page="../header_footer/footer.jsp"></jsp:include>
</body>
</html>