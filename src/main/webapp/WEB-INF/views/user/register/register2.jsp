<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% String conPath = request.getContextPath(); %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>그림드림 | 회원가입</title>
    <link rel="stylesheet" href="/resources/css/dreampicturesytle.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">
    <script src="https://kit.fontawesome.com/b14e6f064f.js" crossorigin="anonymous"></script>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e3b7b3147ef30d454b9901f4af5c27b4&libraries=services"></script>
    <script
            src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"
            integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ=="
            crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script>
        let nicknameChecked = false;

        //닉네임 중복확인=====================
        verifyNick = function () {
            var nickVal = $("#nickname").val();
            // 검증에 사용할 정규식 변수 regExp에 저장
            if (nickVal == '') {
                alert('닉네임을 작성해주세요.');
            } else {
                $(() => {
                    let nickname = document.getElementById("nickname").value;
                    $.ajax({
                        url: "/ajax_nickname_check",
                        data: "nickname=" + nickname,
                        success: function (result) {
                            if (result == 'Y') {
                                document.getElementById("nick_btn").innerText = "인증완료";
                                // document.getElementById("email").setAttribute("disabled", true);
                                document.getElementById("nick_btn").setAttribute("disabled", true);
                                document.getElementById("nick_btn").style = "background-color:gray";
                                emailChecked = true;
                                alert('인증되었습니다 !')
                                // if (emailChecked && telChecked) document.getElementById("next_btn").removeAttribute("disabled");
                            } else {
                                alert('중복된 닉네임입니다 !')
                            }
                        }
                    });
                });
            }
        };

        var mapContainer = document.getElementById('map'), // 지도를 표시할 div
            mapOption = {
                center: new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
                level: 5 // 지도의 확대 레벨
            };
        var map = new daum.maps.Map(mapContainer, mapOption);
        var geocoder = new daum.maps.services.Geocoder();
        var marker = new daum.maps.Marker({
            position: new daum.maps.LatLng(37.537187, 127.005476),
            map: map
        });

        function sample5_execDaumPostcode() {
            new daum.Postcode({
                oncomplete: function (data) {
                    var addr = data.address; // 최종 주소 변수
                    document.getElementById("sample5_address").value = addr;
                    geocoder.addressSearch(data.address, function (results, status) {
                        if (status === daum.maps.services.Status.OK) {
                            var result = results[0]; //첫번째 결과의 값을 활용
                            var coords = new daum.maps.LatLng(result.y, result.x);
                            mapContainer.style.display = "block";
                            map.relayout();
                            map.setCenter(coords);
                            marker.setPosition(coords)
                        }
                    });
                }
            }).open();
        }

        function setThumbnail(event) {
            var reader = new FileReader();
            reader.onload = function (event) {
                var ex_img = document.getElementById("image_section");
                if (ex_img !== null) {
                    ex_img.parentNode.removeChild(ex_img);
                }
                var img = document.createElement("img");
                img.id = "image_section";
                img.className = "avatar_img";
                img.setAttribute("src", event.target.result);
                document.querySelector("div#preview_image").appendChild(img);
                $("#default_img").css("display", "none");
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
            var addrVal = $("#sample5_address").val();
            var detailAddrVal = $("#detailAddr").val();
            var nickVal = $("#nickname").val();
            if (addrVal != '' && detailAddrVal != '' && nickVal != '') {
                document.getElementById('frm').submit();
            } else {
                ("정보를 모두 작성해주세요 !")
            }
        }
    </script>
</head>
<body oncontextmenu="return false" onselectstart="return false">
<jsp:include page="../header_footer/header_not_login.jsp"></jsp:include>
<main class="has_bg_harp" style="height: 100%">
    <div class="container">
        <div class="contents" style="grid-column: 5/9; margin-top: 50px;">
            <form action="<%=conPath%>/register_success" method="post" onsubmit="return false"
                  enctype="multipart/form-data" id="frm">
                <div style="display: flex;font-weight: bold; user-select: auto;flex-direction: column;align-items: center;">
                    <div class="title" style="margin-bottom: 35px;">회원 가입</div>
                    <div class="has_flex_left">주소 *<input type="text" class="has_width_full input_select" name="addr"
                                                          id="sample5_address" style="font-family: 'Gowun Dodum';"
                                                          placeholder="주소" onclick="sample5_execDaumPostcode()"/></div>
                    <br/>
                    <div class="has_flex_left">상세주소 *<input type="text" class="has_width_full input_select"
                                                            id="detailAddr" name="detailAddr"
                                                            style="font-family: 'Gowun Dodum';" placeholder="상세주소"/>
                    </div>
                    <br/>
                    <div class="has_flex_left">닉네임 등록 * <input type="text" name="nickname" id="nickname"
                                                               class="has_width_full input_select"
                                                               style="font-family: 'Gowun Dodum';"
                                                               placeholder="닉네임 등록"/></div>
                    <br/>
                    <div>
                        <button id="nick_btn" class="button is_primary" onclick="verifyNick()"
                                style="margin-top: 10px;margin-bottom: 10px;font-family: 'Gowun Dodum';background-color: #1678c2;">인증 확인
                        </button>
                    </div>
                    <br/>
                    <div class="has_flex_center" id="image_container;">
                        <div id="preview_image"><img src="/resources/css/photo/darth.jpg" class="avatar_img"
                                                     id="default_img" style="margin: 0 auto; display: inline;"/></div>
                    </div>
                    <div style="margin-top: 10px">이미지등록<input type="file" id="image" onchange="setThumbnail(event);"
                                                              name="filename"
                                                              style="margin-left: 100px;margin-top: 10px"/></div>
                    <div>
                        <input type="submit" onclick="nextBtn_condition()"
                               class='input_select is_login has_shadow has_flex_center has_width_full'
                               style="margin-top:20px;font-family: 'Gowun Dodum';background-color: white" value="가입 완료">
                    </div>
                    <div style="display: none"><input type="text" id="url" name="url"></div>
                </div>
            </form>
        </div>
    </div>
</main>
<jsp:include page="../header_footer/footer.jsp"></jsp:include>
</body>
</html>