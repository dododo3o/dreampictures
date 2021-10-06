<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<header class="has_bg_white">
    <div class="container">
        <div class="is_logo">
            <a href="/">
                <div class="is_logos">
                    <i class="fas fa-palette fg-lg"></i>
                    <div>
                        <div>
                            <span>그</span><span class="has_albescent-white">림</span>
                        </div>
                        <div>
                            <span class="has_albescent-white">드</span><span>림</span>
                        </div>
                    </div>
                </div>
            </a>
        </div>
        <div class="navigation">
            <a href='/sell' class='anchor'>Seller</a>
            <a href='/buy' class='anchor'>Buyer</a>
            <a href='' class='anchor'>Contact</a>
            <a href='/login' class='anchor has_aqua-island' id="mainMenu_login">Login</a>
            <button class='button is_primary'><a href="register1">Sign in</a></button>
        </div>
    </div>
</header>
</body>
</html>