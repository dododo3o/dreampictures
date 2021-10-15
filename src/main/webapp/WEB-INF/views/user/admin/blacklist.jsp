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
        <div style="grid-column:1/9;display: flex;flex-direction: column; gap:20px; justify-content: center; margin-top: 70px;margin-bottom: 70px;">
            <div class="has_chathams-blue" style="font-size: 42px;">회원 블랙리스트</div>
            <div>
                <select class="has_width_half" style="margin-right: 90px;">
                    <option>검색조건</option>
                    <option value="아이디">아이디</option>
                    <option value="닉네임">닉네임</option>
                </select>
            </div>
            <form action="" >
                <div  style="display: flex;" class="has_flex_space">
                    <input type="text" class="has_width_full"
                           placeholder="검색어를 입력해주세요." />
                    <button class='button is_notification'>검색</button>
                </div>
            </form>
        </div>
    </div>
    <div class="container" style="display: grid;grid-template-columns:repeat(4,1fr);grid-gap:1rem;">

<div class="has_bg_pink is_buyer-card">
    <div class="is_buyer-card-img"></div>
    <ul>
        <li style="margin-top:35px;" class="has_font-xl has_white">Lim hyunhae</li>
        <li style="margin-top:25px;" class="has_font-lg has_white">bitcamp@gmail.com</li>
        <li style="margin-top:10px;" class="has_font-base has_white">010-1234-1234</li>
        <li style="margin-top:10px;" class="has_white">서울 마포구 백범로1길 10</li>
    </ul>
    <button class="button" style="margin-top:30px; width:185px; height:30px;">신고 내역</button>
</div>
<div class="has_bg_pink is_buyer-card">
    <div class="is_buyer-card-img"></div>
    <ul>
        <li style="margin-top:35px;" class="has_font-xl has_white">Lim hyunhae</li>
        <li style="margin-top:25px;" class="has_font-lg has_white">bitcamp@gmail.com</li>
        <li style="margin-top:10px;" class="has_font-base has_white">010-1234-1234</li>
        <li style="margin-top:10px;" class="has_white">서울 마포구 백범로1길 10</li>
    </ul>
    <button class="button" style="margin-top:30px; width:185px; height:30px;">신고 내역</button>
</div>
<div class="has_bg_pink is_buyer-card">
    <div class="is_buyer-card-img"></div>
    <ul>
        <li style="margin-top:35px;" class="has_font-xl has_white">Lim hyunhae</li>
        <li style="margin-top:25px;" class="has_font-lg has_white">bitcamp@gmail.com</li>
        <li style="margin-top:10px;" class="has_font-base has_white">010-1234-1234</li>
        <li style="margin-top:10px;" class="has_white">서울 마포구 백범로1길 10</li>
    </ul>
    <button class="button" style="margin-top:30px; width:185px; height:30px;">신고 내역</button>
</div>
<div class="has_bg_pink is_buyer-card">
    <div class="is_buyer-card-img"></div>
    <ul>
        <li style="margin-top:35px;" class="has_font-xl has_white">Lim hyunhae</li>
        <li style="margin-top:25px;" class="has_font-lg has_white">bitcamp@gmail.com</li>
        <li style="margin-top:10px;" class="has_font-base has_white">010-1234-1234</li>
        <li style="margin-top:10px;" class="has_white">서울 마포구 백범로1길 10</li>
    </ul>
    <button class="button" style="margin-top:30px; width:185px; height:30px;">신고 내역</button>
</div>
<div class="has_bg_pink is_buyer-card">
    <div class="is_buyer-card-img"></div>
    <ul>
        <li style="margin-top:35px;" class="has_font-xl has_white">Lim hyunhae</li>
        <li style="margin-top:25px;" class="has_font-lg has_white">bitcamp@gmail.com</li>
        <li style="margin-top:10px;" class="has_font-base has_white">010-1234-1234</li>
        <li style="margin-top:10px;" class="has_white">서울 마포구 백범로1길 10</li>
    </ul>
    <button class="button" style="margin-top:30px; width:185px; height:30px;">신고 내역</button>
</div>
<div class="has_bg_pink is_buyer-card">
    <div class="is_buyer-card-img"></div>
    <ul>
        <li style="margin-top:35px;" class="has_font-xl has_white">Lim hyunhae</li>
        <li style="margin-top:25px;" class="has_font-lg has_white">bitcamp@gmail.com</li>
        <li style="margin-top:10px;" class="has_font-base has_white">010-1234-1234</li>
        <li style="margin-top:10px;" class="has_white">서울 마포구 백범로1길 10</li>
    </ul>
    <button class="button" style="margin-top:30px; width:185px; height:30px;">신고 내역</button>
</div>
<div class="has_bg_pink is_buyer-card">
    <div class="is_buyer-card-img"></div>
    <ul>
        <li style="margin-top:35px;" class="has_font-xl has_white">Lim hyunhae</li>
        <li style="margin-top:25px;" class="has_font-lg has_white">bitcamp@gmail.com</li>
        <li style="margin-top:10px;" class="has_font-base has_white">010-1234-1234</li>
        <li style="margin-top:10px;" class="has_white">서울 마포구 백범로1길 10</li>
    </ul>
    <button class="button" style="margin-top:30px; width:185px; height:30px;">신고 내역</button>
</div>
<div class="has_bg_pink is_buyer-card">
    <div class="is_buyer-card-img"></div>
    <ul>
        <li style="margin-top:35px;" class="has_font-xl has_white">Lim hyunhae</li>
        <li style="margin-top:25px;" class="has_font-lg has_white">bitcamp@gmail.com</li>
        <li style="margin-top:10px;" class="hs_font-base has_white">010-1234-1234</li>
                <li style="margin-top:10px;" class="has_white">서울 마포구 백범로1길 10</li>
            </ul>
            <button class="button" style="margin-top:30px; width:185px; height:30px;">신고 내역</button>
        </div>
        <div class="has_bg_pink is_buyer-card">
            <div class="is_buyer-card-img"></div>
            <ul>
                <li style="margin-top:35px;" class="has_font-xl has_white">Lim hyunhae</li>
                <li style="margin-top:25px;" class="has_font-lg has_white">bitcamp@gmail.com</li>
                <li style="margin-top:10px;" class="has_font-base has_white">010-1234-1234</li>
                <li style="margin-top:10px;" class="has_white">서울 마포구 백범로1길 10</li>
            </ul>
            <button class="button" style="margin-top:30px; width:185px; height:30px;">신고 내역</button>
        </div>
        <div class="has_bg_pink is_buyer-card">
            <div class="is_buyer-card-img"></div>
            <ul>
                <li style="margin-top:35px;" class="has_font-xl has_white">Lim hyunhae</li>
                <li style="margin-top:25px;" class="has_font-lg has_white">bitcamp@gmail.com</li>
                <li style="margin-top:10px;" class="has_font-base has_white">010-1234-1234</li>
                <li style="margin-top:10px;" class="has_white">서울 마포구 백범로1길 10</li>
            </ul>
            <button class="button" style="margin-top:30px; width:185px; height:30px;">신고 내역</button>
        </div>
        <div class="has_bg_pink is_buyer-card">
            <div class="is_buyer-card-img"></div>
            <ul>
                <li style="margin-top:35px;" class="has_font-xl has_white">Lim hyunhae</li>
                <li style="margin-top:25px;" class="has_font-lg has_white">bitcamp@gmail.com</li>
                <li style="margin-top:10px;" class="has_font-base has_white">010-1234-1234</li>
                <li style="margin-top:10px;" class="has_white">서울 마포구 백범로1길 10</li>
            </ul>
            <button class="button" style="margin-top:30px; width:185px; height:30px;">신고 내역</button>
        </div>
        <div class="has_bg_pink is_buyer-card">
            <div class="is_buyer-card-img"></div>
            <ul>
                <li style="margin-top:35px;" class="has_font-xl has_white">Lim hyunhae</li>
                <li style="margin-top:25px;" class="has_font-lg has_white">bitcamp@gmail.com</li>
                <li style="margin-top:10px;" class="has_font-base has_white">010-1234-1234</li>
                <li style="margin-top:10px;" class="has_white">서울 마포구 백범로1길 10</li>
            </ul>
            <button class="button" style="margin-top:30px; width:185px; height:30px;">신고 내역</button>
        </div>
        <div class="has_bg_pink is_buyer-card">
            <div class="is_buyer-card-img"></div>
            <ul>
                <li style="margin-top:35px;" class="has_font-xl has_white">Lim hyunhae</li>
                <li style="margin-top:25px;" class="has_font-lg has_white">bitcamp@gmail.com</li>
                <li style="margin-top:10px;" class="has_font-base has_white">010-1234-1234</li>
                <li style="margin-top:10px;" class="has_white">서울 마포구 백범로1길 10</li>
            </ul>
            <button class="button" style="margin-top:30px; width:185px; height:30px;">신고 내역</button>
        </div>
        <div class="has_bg_pink is_buyer-card">
            <div class="is_buyer-card-img"></div>
            <ul>
                <li style="margin-top:35px;" class="has_font-xl has_white">Lim hyunhae</li>
                <li style="margin-top:25px;" class="has_font-lg has_white">bitcamp@gmail.com</li>
                <li style="margin-top:10px;" class="has_font-base has_white">010-1234-1234</li>
                <li style="margin-top:10px;" class="has_white">서울 마포구 백범로1길 10</li>
            </ul>
            <button class="button" style="margin-top:30px; width:185px; height:30px;">신고 내역</button>
        </div>
        <div class="has_bg_pink is_buyer-card">
            <div class="is_buyer-card-img"></div>
            <ul>
                <li style="margin-top:35px;" class="has_font-xl has_white">Lim hyunhae</li>
                <li style="margin-top:25px;" class="has_font-lg has_white">bitcamp@gmail.com</li>
                <li style="margin-top:10px;" class="has_font-base has_white">010-1234-1234</li>
                <li style="margin-top:10px;" class="has_white">서울 마포구 백범로1길 10</li>
            </ul>
            <button class="button" style="margin-top:30px; width:185px; height:30px;">신고 내역</button>
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
<footer class="has_bg_river-bed">
    <div class="container">
        <div class="is_logo">
            <a href="">
                <div class="is_logos"><i class="fas fa-palette fg-lg"></i>
                    <div>
                        <div><span>그</span><span class="has_albescent-white">림</span></div>
                        <div><span class="has_albescent-white">드</span><span>림</span></div>
                    </div>
                </div>
            </a>
        </div>
        <div class="has_flex_space" style="grid-column: 3/5">
            <a href="#" class="has_aqua-island">회사 소개</a>
            <a href="#" class="has_albescent-white">팀원 소개</a>
        </div>
        <div class="has_flex_space" style="grid-column: 10/12">
            <a href="#" class="has_white has_font-xl"><i class="fab fa-youtube"></i></a>
            <a href="#" class="has_white has_font-xl"><i class="fab fa-facebook-square"></i></a>
            <a href="#" class="has_white has_font-xl"><i class="fab fa-instagram-square"></i></a>
        </div>
    </div>



<jsp:include page="../header_footer/footer.jsp"></jsp:include>
</body>
</html>