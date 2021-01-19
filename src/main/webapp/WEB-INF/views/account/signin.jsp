<%--
  Created by IntelliJ IDEA.
  User: hyeonsu
  Date: 2021-01-18
  Time: 오후 1:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="/resources/main.css"/>
    <script src="https://kit.fontawesome.com/8962e3bb2c.js" crossorigin="anonymous"></script>
    <title>로그인</title>
</head>
<body>
    <div class="container">
        <div id="home-titleArea">
            <p>분양임대 정보 제공 서비스</p>
        </div>
        <div class="signin-form">
            <header>
                <h1>로그인</h1>
                <p>아이디와 비밀번호를 입력해주세요</p>
            </header>
            <form id="signinForm" action="/account/" method="get">
                <div class="input-section identify-section">
                    <input class="identify" type="text" placeholder="아이디"/>
                    <input class="password" type="password" placeholder="비밀번호" autocomplete="off"/>
                    <div class="animated-button">
                        <span class="icon-id-card">
                            <i class="fas fa-door-closed"></i>
                        </span>
                        <span class="next-button login">
                            <i class="fas fa-door-open"></i>
                        </span>
                    </div>
                </div>
                <input id="accountId" type="hidden" name="id"/>
            </form>
        </div>
    </div>
</body>
</html>
<script>
    $(".password").on("change keyup paste", function() {
        if($(this).val() && $(".identify").val()) {
            $(".icon-id-card").addClass("next");
        } else {
            $(".icon-id-card").removeClass("next");
        }
    });

    $(".identify").on("change keyup paste", function() {
        if($(this).val() && $(".password").val()) {
            $(".icon-id-card").addClass("next");
        } else {
            $(".icon-id-card").removeClass("next");
        }
    });

    $(".next-button").hover(function() {
        $(this).css("cursor", "pointer");
    });

    $(".next-button").click(function() {
       $.ajax({
           type: "POST",
           async: false,
           url: "/account/checkExistence",
           data: {identify: $(".identify").val(), password: $(".password").val()},
           dataType: "text",
           success: function(data) {
               if(data != "re-enter") {
                   $("#accountId").val(data);
                   $("#signinForm").submit();
               } else if(data == "re-enter") {
                   $(".icon-id-card").removeClass("next");
                   $(".signin-form p").text("틀렸습니다. 다시 입력해주세요.");
               }
           }
       });
    });
</script>
<style>
    body {
        width: 90%;
        height: 500px;
        background: url("/resources/img/lichtraum-1560788_1920.jpg") no-repeat center center;
    }

    #home-titleArea {
        width: 100%;
        height: 70%;
        text-align: center;
        color: black;
        margin: 0 auto;
        display: flex;
        align-items: center;
        justify-content: center;
    }

    #home-titleArea p {
        margin: 0;
        font-size: max(3vw, 40px);
        font-weight: bold;
    }

    .signin-form {
        width: 400px;
        position: absolute;
        left: 50%;
        transform: translate(-50%, 0%);
        top: 40%;
        background: transparent;
    }

    .signin-form header {
        position: relative;
        z-index: 6;
        background: white;
        padding: 20px 30px;
        border-radius: 15px 15px 0 0;
    }

    .signin-form header h1 {
        font-weight: 900;
        letter-spacing: 1.5px;
        color: #2c1112;
        font-size: 23px;
        text-transform: uppercase;
        margin: 0;
    }

    .signin-form header p {
        word-spacing: 0px;
        color: #D58D57;
        font-size: 17px;
        margin: 0;
        margin-top: 5px;
    }

    .signin-form form {
        position: relative;
    }

    .signin-form .input-section {
        width: 100%;
        position: absolute;
        display: flex;
        left: 50%;
        transform: translate(-50%, 0);
        height: 75px;
        border-radius: 0 0 15px 15px;
        overflow: hidden;
        z-index: 5;
        box-shadow: 0px 0px 100px rgba(238, 240, 246, 0.2);
        transition: all 0.2s ease-in;
    }

    .signin-form form input {
        background: white;
        color: #6F362D;
        width: 80%;
        border: 0;
        padding: 20px 30px;
        margin: 0;
    }

    .signin-form form input:focus {
        outline: none;
    }

    .signin-form form input::-moz-placeholder {
        color: #6F362D;
        font-weight: 100;
    }

    .signin-form form input:-ms-input-placeholder {
        color: #6F362D;
        font-weight: 100;
    }

    .signin-form form input::placeholder {
        color: #6F362D;
        font-weight: 100;
    }

    .animated-button {
        width: 50%;
        background-color: #D58D57;
    }

    .animated-button span {
        display: flex;
        flex-direction: row;
        justify-content: space-around;
        align-items: center;
        line-height: 75px;
        text-align: center;
        height: 75px;
        transition: all 0.2s ease-in;
    }

    .animated-button span i {
        font-size: 25px;
        color: #4E211F;
    }

    .animated-button .next-button {
        background: transparent;
        color: #4E211F;
        font-weight: 100;
        width: 100%;
        border: 0;
    }

    .next {
        margin-top: -75px;
    }

</style>