<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% String conPath = request.getContextPath(); %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>그림드림 | 공지사항</title>
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
        function modal() {
            document.getElementById("modaldiv")
        }
    </script>
    <script type="text/javascript">
        let status = undefined; //0~4 까지 질문 종류
        let beforeBtn = undefined;
        let actived = 0;
        showModal = function () {
            $('.ui.modal').modal('show');
        };
        requestQA = function () {
            $(() => {
                if (category == undefined) return;
                let question = document.getElementById("question").value;
                let status = 0;
                $.ajax({
                    url: "/ajax_request_QA",
                    data: "question=" + question + "&category=" + category + "&status=" + status,
                    success: function (result) {
                        document.location.href = "/notice_question";
                    }
                });
            });
        };
        selectedBtn = function (number) {
            $(() => {
                category = number
                $("#active" + number).css('color', 'white');
                $("#active" + number).css('background-color', '#c0c1c2');
            });
        };

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

<main class="has_bg_harp" style="height:auto;">
    <div class="ui modal">
        <div class="header" style="text-align:center;font-family: 'Gowun Dodum';">질문 사항</div>
        <div class="ui form">
            <div class="field">
                <div class="five ui buttons">
                    <button class="ui button" id="active0" onclick="selectedBtn(0)" class="btn" style="font-family: 'Gowun Dodum';">
                        운영 정책
                    </button>
                    <button class="ui button" id="active1" onclick="selectedBtn(1)" class="btn" style="font-family: 'Gowun Dodum';">
                        구매/판매
                    </button>
                    <button class="ui button" id="active2" onclick="selectedBtn(2)" class="btn" style="font-family: 'Gowun Dodum';">
                        가격 정책
                    </button>
                    <button class="ui button" id="active3" onclick="selectedBtn(3)" class="btn" style="font-family: 'Gowun Dodum';">
                        계정 인증
                    </button>
                    <button class="ui button" id="active4" onclick="selectedBtn(4)" class="btn" style="font-family: 'Gowun Dodum';">
                        그 외 질문
                    </button>
                </div>
                <textarea id="question" style="font-family:'Gowun Dodum'"></textarea>
            </div>
        </div>
        <div class="actions" style="background-color: #95afc0">
            <div class="ui positive right labeled icon button"
                 style="font-family: 'Gowun Dodum';background-color: var(--color-metallic-blue)"
                 onclick="requestQA()">올리기<i class="checkmark icon"></i>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="has_flex_column" style="grid-column:1/3; gap:40px;padding-top: 30px; background-color: #a2b0b36e;">
            <div class="ui vertical animated button" tabindex="0">
                <div class="hidden content"><a href="/notice">공지사항</a></div>
                <div class="visible content">
                    <i class="red bullhorn icon"></i>
                </div>
            </div>
            <div class="ui vertical animated button" tabindex="0">
                <div class="hidden content"><a href="/notice_question">질문과답변</a></div>
                <div class="visible content">
                    <i class="comments outline icon"></i>
                </div>
            </div>
        </div>
        <div style="grid-column: 3/13;display: flex;flex-direction: column;justify-content: space-between;align-items: center;justify-content: space-between;">
            <div>
                <div style="display: flex; width: 100%;justify-content: flex-end; align-items: center;padding: 25px 0">
                    <div style="color:var(--color-chathams-blue);font-size:var(--font-size-xll);padding-top: 30px;padding-bottom: 25px; padding-right: 24%;">
                        질문과 답변
                    </div>
                    <div tabindex="0" onclick="showModal()">
                        <button class="ui primary basic button"
                                style="font-size:1.2em;font-family:'Gowun Dodum';font-weight: bold;width:120px">질문하기
                        </button>
                    </div>
                </div>
                <div style="display:grid;grid-template-columns:repeat(3,1fr);grid-gap:1rem;width:100%;padding-top: 10px;padding-bottom: 30px">
                    <c:forEach var="QaVOlist" items="${QaVOlist}">
                        <div class="ui card" style="height: 100%; margin: 0 auto;">
                            <div class="content">
                                <div class="header" style="font-family: 'Gowun Dodum', sans-serif;font-size: 1.5em">${QaVOlist.category}</div>
                            </div>
                            <div class="content">
                                <div style="font-size: 1.2em">작성자 : ${QaVOlist.nickname}<br/>${QaVOlist.content}</div>
                            </div>
                            <div class="content" style="font-size: 1.2em">답변내용 : <br/>${QaVOlist.answer}</div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
    </div>
</main>
<jsp:include page="../header_footer/footer.jsp"></jsp:include>
</body>
</html>