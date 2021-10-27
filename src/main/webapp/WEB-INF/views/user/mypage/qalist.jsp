<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% String conPath = request.getContextPath(); %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>그림드림 | 마이페이지</title>
    <link rel="stylesheet" href="/resources/css/dreampicturesytle.css">
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
        showModal = function () {
            $(() => {
                $.ajax({
                    url: "/ajax_picture_finder",
                    data: "",
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
    </script>
</head>
<body oncontextmenu="return false" onselectstart="return false">
<jsp:include page="../header_footer/header_login.jsp"></jsp:include>
<main class="has_bg_harp" style="height: 100%">
    <div id="container" class="container">
        <div class="has_flex_column" style="grid-column:1/3; gap:40px;padding-top: 30px;background-color: #a2b0b36e">
            <div class="ui vertical animated button" tabindex="0" onclick="showModal()">
                <div class="hidden content"><a href="/mypage/+${user}">My Page</a></div>
                <div class="visible content">
                    <i class="red user circle icon"></i>
                </div>
            </div>
            <div class="ui vertical animated button" tabindex="0" onclick="showModal()">
                <div class="hidden content"><a href="/buylist">구매내역</a></div>
                <div class="visible content">
                    <i class="orange shipping fast icon"></i>
                </div>
            </div>
            <div class="ui vertical animated button" tabindex="0" onclick="showModal()">
                <div class="hidden content"><a href="/selllist">전시내역</a></div>
                <div class="visible content">
                    <i class="orange shipping fast icon"></i>
                </div>
            </div>
            <div class="ui vertical animated button" tabindex="0" onclick="showModal()">
                <div class="hidden content"><a href="/cart">장바구니</a></div>
                <div class="visible content">
                    <i class="yellow shopping cart icon"></i>
                </div>
            </div>
            <div class="ui vertical animated button" tabindex="0" onclick="showModal()">
                <div class="hidden content"><a href="/qalist">질문내역</a></div>
                <div class="visible content">
                    <i class="green comments outline icon"></i>
                </div>
            </div>
            <div class="ui vertical animated button" tabindex="0" onclick="showModal()">
                <div class="hidden content"><a href="/charge">포인트 입출금</a></div>
                <div class="visible content">
                    <i class="blue money bill alternate outline icon"></i>
                </div>
            </div>
        </div>
        <div style="grid-column: 3/13;display: flex;flex-direction: column;justify-content: space-between;align-items: center;justify-content: space-between;">
            <!-- 추가요소 있으면 이 안에 넣기-->
            <div>
                <div style="color:var(--color-chathams-blue);font-size:var(--font-size-xll);padding-top:60px;padding-bottom: 100px;text-align: center;">
                    질문내역
                </div>
                <div style="display:grid;grid-template-columns:repeat(4,1fr);grid-gap:1rem;width:100%;">
                    <c:forEach var="QaVOlist" items="${QaVOlist}">
                        <div class="ui card" style=" height: 100%;margin: 0 auto;">
                            <div class="content">
                                <div class="header"
                                     style="font-family: 'Gowun Dodum', sans-serif;font-size: 1.5em">${QaVOlist.category}</div>
                            </div>
                            <div class="content">
                                <div style="font-size: 1.3em">작성자 : ${QaVOlist.nickname}<br/>${QaVOlist.content}
                                </div>
                                <div class="content" style="font-size: 1.3em">답변내용 : <br/>${QaVOlist.answer}</div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
    </div>
    </div>
</main>
<jsp:include page="../header_footer/footer.jsp"></jsp:include>
</body>
</html>