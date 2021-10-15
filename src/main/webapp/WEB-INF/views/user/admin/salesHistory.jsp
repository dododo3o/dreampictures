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
    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.2.13/semantic.min.css">
    <script src="https://kit.fontawesome.com/b14e6f064f.js" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script src="https://code.jquery.com/jquery-3.1.1.min.js" integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8=" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.2.13/semantic.js"></script>
</head>
<body>
<jsp:include page="../header_footer/header_admin.jsp"></jsp:include>
<div class="has_bg_harp">
    <div class="container">
        <div style="grid-column:1/9;display: flex;flex-direction: column; gap:20px; justify-content: center; margin-top: 70px;">
            <div class="has_chathams-blue" style="font-size: 42px;">기간별 판매내역</div>
            <form action="">
                <div style="display: flex;margin-bottom: 50px" class="has_flex_space">
                    <select class="has_width_full" style="margin-right: 30px;">
                        <option value="" disabled selected>기간설정</option>
                        <option value="1week">1주</option>
                        <option value="1month">1개월</option>
                        <option value="3month">3개월</option>
                        <option value="6month">6개월</option>
                        <option value="1year">1년</option>
                    </select>
                    <button class='button is_notification' onclick="searchOk">검색</button>
                </div>
            </form>

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



        </div>
    </div>
    <div class="container" style="display: grid;grid-template-columns:repeat(4,1fr);grid-gap:1rem;">
        <c:forEach var="cardVOlist" items="${cardVOlist}">
            <a href="/buy_picture/${cardVOlist.no_painting}">
                <div class="card has_flex_space_bt_cl has_shadow">
                    <div><img src="${cardVOlist.paintingmimg}" alt="" class="is_img_object-fit has_board_top_radius"></div>
                    <div class="card_history" style="width: 100%;">
                        <img src="${cardVOlist.avatarimg}" alt="" style="border-radius: 50%; width: 65px">
                        <span style="font-size: 1.3em">${cardVOlist.nickname}</span>
                    </div>
                    <div style="margin-bottom: 20px; font-size: 1.5em;">${cardVOlist.pname}</div>
                </div>
            </a>
        </c:forEach>
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