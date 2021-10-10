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
    <script
            src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"
            integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ=="
            crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script>
        let emailChecked = false;
        let telChecked = false;

        verifyEmail = function () {
            var emailVal = $("#email").val();
            // 검증에 사용할 정규식 변수 regExp에 저장
            var regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;

            if (emailVal.match(regExp) == null) {
                alert('이메일 형식에 맞게 작성해주세요.');
            } else {
                $(() => {
                    let email = document.getElementById("email").value;
                    $.ajax({
                        url: "/ajax_email_check",
                        data: "email=" + email,
                        success: function (result) {
                            if (result == 'Y') {
                                document.getElementById("email_btn").innerText = "인증완료";
                                // document.getElementById("email").setAttribute("disabled", true);
                                document.getElementById("email_btn").setAttribute("disabled", true);
                                document.getElementById("email_btn").style = "background-color:gray";
                                emailChecked = true;
                                alert('인증되었습니다!')
                                // if (emailChecked && telChecked) document.getElementById("next_btn").removeAttribute("disabled");
                            }
                        }
                    });
                });
            }
        };

        //연락처 형식 검증
        verifyTel = function () {
            var telVal = $("#tel").val();
            var telRegExp = /^[A-Za-z0-9]{6,12}$/;
            // 검증에 사용할 정규식 변수 regExp에 저장
            if (telVal.match(telRegExp) == null) {
                alert('휴대폰 번호 형식에 맞게 작성해주세요.');
            } else {
                $(() => {
                    let tel = document.getElementById("tel").value;
                    $.ajax({
                        url: "/ajax_tel_check",
                        data: "tel=" + tel,
                        success: function (result) {
                            if (result == 'Y') {
                                document.getElementById("tel_btn").innerText = "인증완료";
                                // document.getElementById("tel").setAttribute("disabled", true);
                                document.getElementById("tel_btn").setAttribute("disabled", true);
                                document.getElementById("tel_btn").style = "background-color:gray";
                                telChecked = true;
                                alert("인증되었습니다!")
                                // if (emailChecked && telChecked) document.getElementById("next_btn").removeAttribute("disabled");
                            }
                        }
                    });
                });
            }
        };

        function passwordCheck() {
            var pwd1 = $("#pwd").val();
            var pwd2 = $("#pwdChk").val();
            var pwdRegExp = /^(?=.*[a-zA-Z])((?=.*\d)|(?=.*\W)).{6,20}$/;

            if (pwd1 !== '' && pwd2 === '') {

            } else if (pwd1 !== "" || pwd2 !== "") {
                if (pwd1 === pwd2) {
                    if (pwd1.match(pwdRegExp) == null) {
                        alert("비밀번호 형식에 맞추어 입력해주세요.");
                    } else {
                        $("#alert-success").css('display', 'inline-block');
                        $("#alert-danger").css('display', 'none');
                    }
                } else {
                    alert(" 비밀번호를 재확인해주세요.");
                    $("#alert-success").css('display', 'none');
                    $("#alert-danger").css('display', 'inline-block');
                }
            }

        }

        //=====================다음 단계 버튼을 활성 시킬 조건들======================
        //인증하기가 모두 완료 되어야 함
        //비밀번호가 일치해야함
        function nextBtn_condition() {
            var pwd1 = $("#pwd").val();
            var pwd2 = $("#pwdChk").val();
            var pwdRegExp = /^(?=.*[a-zA-Z])((?=.*\d)|(?=.*\W)).{6,20}$/;
            if (telChecked === true && emailChecked === true && pwd1 === pwd2 && pwd2.match(pwdRegExp) != null) {
                document.getElementById('frm').submit();
            } else {
                alert('모든 인증을 완료해주세요.')
            }
        }
    </script>
</head>
<body>
<jsp:include page="../header_footer/header_not_login.jsp"></jsp:include>
<main class="has_bg_harp">
    <div class="container">
        <div class="contents" style="grid-column: 5/9; margin-top: 50px; gap:30px; ">
            <form action="<%=conPath%>/register2" method="post" onsubmit="return false" id="frm">
                <div style="display: flex;user-select: auto;flex-direction: column;align-items: center;justify-content: space-evenly;height: 650px;">
                    <div class="title">회원 가입</div>
                    <div class="has_flex_left">이메일 *<input type="text" class="is_login_input  has_width_full"
                                                           name="email" id="email" required="required"
                                                           placeholder="이메일"/></div>
                    <button id="email_btn" class='button is_primary' onclick="verifyEmail()">인증하기</button>
                    <div class="has_flex_left">
                        <div>비밀번호 *<span class="has_chathams-blue">(6~20 영문 대소문자, 숫자, 특수문자 꼭포함하여  6~20자)</span>
                        </div>
                        <input type="password" class="pw is_login_input has_width_full" id="pwd" name="pwd" placeholder="비밀번호"
                               required="required"/>
                    </div>
                    <div class="has_flex_left">
                        <div id="pwdTextChange">
                            <div>
                                비밀번호 확인 *
                                <span class="has_chathams-blue" id="alert-success"
                                      style="display: none;">비밀번호가 일치합니다.</span>
                                <span class="has_chathams-blue" id="alert-danger"
                                      style="display: none; font-weight: bold; ">비밀번호가 일치하지 않습니다.</span>
                            </div>
                        </div>
                        <input type="password" class="pw is_login_input has_width_full" id="pwdChk"
                               placeholder="비밀번호 확인"
                               required="required"
                               pattern="^(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*[!@#$%^&*()_-+=[]{}~?:;`|/]).{6,20}$"
                               onfocusout="passwordCheck()"
                        />
                    </div>
                    <div class="has_flex_left">
                        <div>연락처 *<span class="has_chathams-blue">([-] 하이픈 생략)</span></div>
                        <input type="text" class="is_login_input  has_width_full" name="tel" id="tel"
                               required="required" placeholder="핸드폰 번호"/>
                    </div>
                    <button id="tel_btn" class='button is_primary' onclick="verifyTel()">인증하기</button>

                    <input type="submit" onclick="nextBtn_condition()" id="submit_btn"
                           class='button is_login has_shadow has_flex_center has_width_full' value="다음 단계">

                </div>
            </form>
        </div>
    </div>
</main>
<jsp:include page="../header_footer/footer.jsp"></jsp:include>
</body>
</html>