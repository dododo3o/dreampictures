<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
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
</head>
<body>
<jsp:include page="../header_footer/header_not_login.jsp"></jsp:include>
<div class="has_bg_harp">
    <div class="container">
        <div style="grid-column:1/9;display: flex;flex-direction: column; gap:20px; justify-content: center; margin-top: 70px;">
            <div class="has_chathams-blue" style="font-size: 42px;">그림드림의 당신만의 그림찾기</div>
            <form action="" >
                <div  style="display: flex;" class="has_flex_space">
                    <input type="text" class="has_width_full"
                           placeholder="검색어를 입력해주세요." />
                    <button class='button is_notification'>선택완료</button>
                </div>
            </form>
            <div>
                <select class="has_width_half" style="margin-right: 90px;">
                    <option value="" disabled selected>화풍</option>
                    <option value="유화">유화</option>
                    <option value="수채화">수채화</option>
                    <option value="아크릴화">아크릴화</option>
                    <option value="펜화">펜화</option>
                    <option value="연필화">연필화</option>
                    <option value="파스텔화">파스텔화</option>
                    <option value="크레용화">크레용화</option>
                    <option value="과슈화">과슈화</option>
                </select>
                <select class="has_width_half">
                    <option value="" disabled selected>테마</option>
                    <option value="유화">유화</option>
                    <option value="수채화">수채화</option>
                    <option value="아크릴화">아크릴화</option>
                    <option value="펜화">펜화</option>
                    <option value="연필화">연필화</option>
                    <option value="파스텔화">파스텔화</option>
                    <option value="크레용화">크레용화</option>
                    <option value="과슈화">과슈화</option>
                </select>
            </div>
            <div style= "display: flex;justify-content: space-between;grid-column:1/9;">
                <div><span class="has_chathams-blue">너비<br></span><input type="range" class="width_slider" name="img_width" min="1" max="100" value="50"/></div>
                <div><span class="has_chathams-blue">높이<br></span><input type="range" class="width_slider" name="img_width" min="1" max="100" value="50"/></div>
                <div><span class="has_chathams-blue">가격<br></span><input type="range" class="width_slider" name="img_width" min="1" max="100" value="50"/></div>
                <div class="checkbox" style="display: flex;">
                    <input type="checkbox" style="margin-right:10px;"><label style="color: var(--color-chathams-blue);">거래완료 안보기</label>
                </div>
            </div>
        </div>
    </div>
    <div class="container" style="display: grid;grid-template-columns:repeat(4,1fr);grid-gap:1rem;">
        <div class="card has_flex_space_bt_cl has_shadow">
            <div class="card_img"></div>
            <div class="card_history">
                <div class="card_img_avatar"></div>
                <div>
                    <div>Jenny Kim</div>
                    <div>bitcamp University</div>
                </div>
            </div>
            <span>Darth Vader</span>
        </div>
        <div class="card has_flex_space_bt_cl has_shadow">
            <div class="card_img"></div>
            <div class="card_history">
                <div class="card_img_avatar"></div>
                <div>
                    <div>Jenny Kim</div>
                    <div>bitcamp University</div>
                </div>
            </div>
            <span>Darth Vader</span>
        </div>
        <div class="card has_flex_space_bt_cl has_shadow">
            <div class="card_img"></div>
            <div class="card_history">
                <div class="card_img_avatar"></div>
                <div>
                    <div>Jenny Kim</div>
                    <div>bitcamp University</div>
                </div>
            </div>
            <span>Darth Vader</span>
        </div>
        <div class="card has_flex_space_bt_cl has_shadow">
            <div class="card_img"></div>
            <div class="card_history">
                <div class="card_img_avatar"></div>
                <div>
                    <div>Jenny Kim</div>
                    <div>bitcamp University</div>
                </div>
            </div>
            <span>Darth Vader</span>
        </div>
        <div class="card has_flex_space_bt_cl has_shadow">
            <div class="card_img"></div>
            <div class="card_history">
                <div class="card_img_avatar"></div>
                <div>
                    <div>Jenny Kim</div>
                    <div>bitcamp University</div>
                </div>
            </div>
            <span>Darth Vader</span>
        </div>
        <div class="card has_flex_space_bt_cl has_shadow">
            <div class="card_img"></div>
            <div class="card_history">
                <div class="card_img_avatar"></div>
                <div>
                    <div>Jenny Kim</div>
                    <div>bitcamp University</div>
                </div>
            </div>
            <span>Darth Vader</span>
        </div>
        <div class="card has_flex_space_bt_cl has_shadow">
            <div class="card_img"></div>
            <div class="card_history">
                <div class="card_img_avatar"></div>
                <div>
                    <div>Jenny Kim</div>
                    <div>bitcamp University</div>
                </div>
            </div>
            <span>Darth Vader</span>
        </div>
        <div class="card has_flex_space_bt_cl has_shadow">
            <div class="card_img"></div>
            <div class="card_history">
                <div class="card_img_avatar"></div>
                <div>
                    <div>Jenny Kim</div>
                    <div>bitcamp University</div>
                </div>
            </div>
            <span>Darth Vader</span>
        </div>
        <div class="card has_flex_space_bt_cl has_shadow">
            <div class="card_img"></div>
            <div class="card_history">
                <div class="card_img_avatar"></div>
                <div>
                    <div>Jenny Kim</div>
                    <div>bitcamp University</div>
                </div>
            </div>
            <span>Darth Vader</span>
        </div>
        <div class="card has_flex_space_bt_cl has_shadow">
            <div class="card_img"></div>
            <div class="card_history">
                <div class="card_img_avatar"></div>
                <div>
                    <div>Jenny Kim</div>
                    <div>bitcamp University</div>
                </div>
            </div>
            <span>Darth Vader</span>
        </div>
        <div class="card has_flex_space_bt_cl has_shadow">
            <div class="card_img"></div>
            <div class="card_history">
                <div class="card_img_avatar"></div>
                <div>
                    <div>Jenny Kim</div>
                    <div>bitcamp University</div>
                </div>
            </div>
            <span>Darth Vader</span>
        </div>
        <div class="card has_flex_space_bt_cl has_shadow">
            <div class="card_img"></div>
            <div class="card_history">
                <div class="card_img_avatar"></div>
                <div>
                    <div>Jenny Kim</div>
                    <div>bitcamp University</div>
                </div>
            </div>
            <span>Darth Vader</span>
        </div>
        <div class="card has_flex_space_bt_cl has_shadow">
            <div class="card_img"></div>
            <div class="card_history">
                <div class="card_img_avatar"></div>
                <div>
                    <div>Jenny Kim</div>
                    <div>bitcamp University</div>
                </div>
            </div>
            <span>Darth Vader</span>
        </div>
        <div class="card has_flex_space_bt_cl has_shadow">
            <div class="card_img"></div>
            <div class="card_history">
                <div class="card_img_avatar"></div>
                <div>
                    <div>Jenny Kim</div>
                    <div>bitcamp University</div>
                </div>
            </div>
            <span>Darth Vader</span>
        </div>
        <div class="card has_flex_space_bt_cl has_shadow">
            <div class="card_img"></div>
            <div class="card_history">
                <div class="card_img_avatar"></div>
                <div>
                    <div>Jenny Kim</div>
                    <div>bitcamp University</div>
                </div>
            </div>
            <span>Darth Vader</span>
        </div>
        <div class="card has_flex_space_bt_cl has_shadow">
            <div class="card_img"></div>
            <div class="card_history">
                <div class="card_img_avatar"></div>
                <div>
                    <div>Jenny Kim</div>
                    <div>bitcamp University</div>
                </div>
            </div>
            <span>Darth Vader</span>
        </div>
    </div>
    <div class="container" style="display: flex;justify-content: center;margin-top:30px;padding-bottom: 30px;
">
        <div>
            <button class='button is_pagination'>
                <i class="fas fa-arrow-left"></i>
            </button>
            <button class='button is_pagination'>1</button>
            <button class='button is_pagination'>2</button>
            <button class='button is_pagination'>3</button>
            <button class='button is_pagination'>4</button>
            <button class='button is_pagination'>5</button>
            <button class='button is_pagination'>6</button>
            <button class='button is_pagination'>7</button>
            <button class='button is_pagination'>8</button>
            <button class='button is_pagination'>9</button>
            <button class='button is_pagination'>10</button>
            <button class='button is_pagination'>
                <i class="fas fa-arrow-right"></i>
            </button>
            <br>
        </div>
    </div>
</div>
<jsp:include page="../header_footer/footer.jsp"></jsp:include>
</body>
</html>