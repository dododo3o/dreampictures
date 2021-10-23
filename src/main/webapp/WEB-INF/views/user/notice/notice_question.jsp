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
        function modal() {
            document.getElementById("modaldiv")
        }
    </script>
    <script type="text/javascript">
        let status = undefined; //0~4 까지 질문 종류
        showModal = function () {
            $('.ui.modal').modal('show');
        };
        requestQA = function () {
            $(() => {
                if (status == undefined) return;
                let question = document.getElementById("question").value;
                $.ajax({
                    url: "/ajax_request_QA",
                    data: "question=" + question + "&status=" + status,
                    success: function (result) {
                        document.location.href = "/notice_question";
                    }
                });
            });
        };
        selectedBtn = function (number) {
            $(() => {
                status = number
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
<main class="has_bg_harp" style="height: auto">
    <div class="ui modal">
        <div class="header">질문 사항</div>
        <div class="ui form">
            <div class="field">
                <div class="five ui buttons">
                    <button class="ui button" onclick="selectedBtn(0)">운영 정책</button>
                    <button class="ui button" onclick="selectedBtn(1)">구매/판매</button>
                    <button class="ui button" onclick="selectedBtn(2)">가격 정책</button>
                    <button class="ui button" onclick="selectedBtn(3)">계정 인증</button>
                    <button class="ui button" onclick="selectedBtn(4)">그 외 질문</button>
                </div>
                <textarea id="question"></textarea>
            </div>
        </div>
        <div class="actions" style="background-color: #95afc0">
            <div class="ui positive right labeled icon button" style="background-color: var(--color-metallic-blue)"
                 onclick="requestQA()">
                올리기
                <i class="checkmark icon"></i>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="has_flex_column" style="grid-column:1/3; gap:40px;padding-top: 30px; background-color: #a2b0b36e">
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
        <div style="grid-column: 3/13;display: flex;flex-direction: column;justify-content: space-between;align-items: center;justify-content: space-evenly;">
            <!-- 추가요소 있으면 이 안에 넣기-->

            <div style="display: flex; width: 100%;justify-content: flex-end; align-items: center">
                <div style="font-family:'BMHANNAPro';color:var(--color-chathams-blue);font-size:var(--font-size-xll);padding-top: 30px;
    padding-bottom: 25px; padding-right: 31%;">질문과 답변
                </div>
                <div tabindex="0" onclick="showModal()">
                    <button class="ui button" style="font-family: 'BMHANNAPro';">질문하기</button>
                </div>
            </div>
            <div style="display:grid;grid-template-columns:repeat(3,1fr);grid-gap:1rem;width:100%;">
                <c:forEach var="QaVOlist" items="${QaVOlist}">
                    <div class="ui card" style="height: 100%; margin: 0 auto;">
                        <div class="content">
                            <div class="header" style="font-size: 1.5em">${QaVOlist.category}</div>
                        </div>
                        <div class="content">
                            <div style="font-size: 1.3em">작성자 : ${QaVOlist.nickname}<br/>${QaVOlist.content}
                            </div>
                        </div>
                        <div class="content" style="font-size: 1.3em">답변내용 : <br/>${QaVOlist.answer}</div>
                    </div>
                </c:forEach>
            </div>
            <div>
                <div class="container"
                     style="display: flex;justify-content: center;margin-top:30px;padding-bottom: 30px;">
                    <div style="margin-right: 40px;">
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
                            <div class="hidden content"><i class="right arrow icon"></i></div>
                        </div>
                        <br>
                    </div>
                </div>
            </div>
        </div>
    </div>
</main>
<jsp:include page="../header_footer/footer.jsp"></jsp:include>
</body>
</html>