<%--
  Created by IntelliJ IDEA.
  User: hyeonsu
  Date: 2021-01-18
  Time: 오후 1:30
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
    <title>회원가입</title>
</head>
<body>
    <div class="container">
        <div id="home-titleArea">
            <p>분양임대 정보 제공 서비스</p>
        </div>
        <div class="registration-form">
            <header>
                <h1>회원가입</h1>
                <p>회원 정보를 입력해주세요</p>
            </header>
            <form id="signupForm" action="/account/" method="post">
                <div class="input-section identify-section">
                    <input name="identify" class="identify" type="text" placeholder="아이디를 입력해주세요" autocomplete="off"/>
                    <div class="animated-button">
                        <span class="icon-id-card">
                            <i class="far fa-id-card-alt"></i>
                        </span>
                        <span class="next-button identify">
                            <i class="fa fa-arrow-up"></i>
                        </span>
                    </div>
                </div>
                <div class="input-section password-section folded">
                    <input name="password" class="password" type="password" placeholder="비밀번호를 입력해주세요"/>
                    <div class="animated-button">
                        <span class="icon-lock">
                            <i class="fa fa-lock"></i>
                        </span>
                        <span class="next-button password">
                            <i class="fa fa-arrow-up"></i>
                        </span>
                    </div>
                </div>
                <div class="input-section repeat-password-section folded">
                    <input class="repeat-password" type="password" placeholder="비밀번호를 한 번 더 입력해주세요"/>
                    <div class="animated-button">
                        <span class="icon-repeat-lock">
                            <i class="fa fa-lock"></i>
                        </span>
                        <span class="next-button repeat-password">
                            <i class="fa fa-paper-plane"></i>
                        </span>
                    </div>
                </div>
                <div class="input-section name-section folded">
                    <input name="name" class="name" type="text" placeholder="이름을 입력해주세요"/>
                    <div class="animated-button">
                        <span class="icon-user-edit">
                            <i class="far fa-user-edit"></i>
                        </span>
                        <span class="next-button name">
                            <i class="fa fa-paper-plane"></i>
                        </span>
                    </div>
                </div>
                <div class="input-section email-section folded">
                    <input name="email" class="email" type="email" placeholder="이메일을 입력해주세요" autocomplete="off"/>
                    <div class="animated-button">
                        <span class="icon-paper-plane">
                            <i class="fa fa-envelope-o"></i>
                        </span>
                        <span class="next-button email">
                            <i class="fa fa-arrow-up"></i>
                        </span>
                    </div>
                </div>
                <div class="success">
                    <p>회원가입 완료</p>
                </div>
            </form>
        </div>
    </div>
</body>
</html>
<script>
    $('.identify').on("change keyup paste", function() {
        if ($(this).val()) {
            $('.icon-id-card').addClass("next");
        } else {
            $('.icon-id-card').removeClass("next");
        }
    });

    $('.next-button').hover(function(){
        $(this).css('cursor', 'pointer');
    });

    $('.next-button.identify').click(function(){
        $('.identify-section').addClass("fold-up");
        $('.password-section').removeClass("folded");
    });

    $('.password').on("change keyup paste", function(){
        if($(this).val()){
            $('.icon-lock').addClass("next");
        } else {
            $('.icon-lock').removeClass("next");
        }
    });

    $('.next-button').hover(function(){
        $(this).css('cursor', 'pointer');
    });

    $('.next-button.password').click(function(){
        $('.password-section').addClass("fold-up");
        $('.repeat-password-section').removeClass("folded");
    });

    $('.repeat-password').on("change keyup paste", function(){
        if($(this).val() && $(this).val().length >= $(".password").val().length){
            if($(this).val() == $(".password").val()) {
                $('.icon-repeat-lock').addClass("next");
            } else {
                $(this).val("");
            }
            // $('.icon-repeat-lock').addClass("next");
        } else {
            $('.icon-repeat-lock').removeClass("next");
        }
    });

    $('.next-button.repeat-password').click(function(){
        $('.repeat-password-section').addClass("fold-up");
        $('.name-section').removeClass("folded");
    });

    $('.name').on("change keyup paste", function() {
        if ($(this).val()) {
            $('.icon-user-edit').addClass("next");
        } else {
            $('.icon-user-edit').removeClass("next");
        }
    });

    $('.next-button.name').click(function(){
        $('.name-section').addClass("fold-up");
        $('.email-section').removeClass("folded");
    });

    $('.email').on("change keyup paste", function() {
        if ($(this).val()) {
            $('.icon-paper-plane').addClass("next");
        } else {
            $('.icon-paper-plane').removeClass("next");
        }
    });

    $('.next-button').hover(function(){
        $(this).css('cursor', 'pointer');
    });

    $('.next-button.email').click(function(){
        $('.email-section').addClass("fold-up");
        $('.success').css("marginTop", 0);

        setTimeout(function() {
            $("#signupForm").submit();
        }, 1000);
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

    .registration-form {
        width: 400px;
        position: absolute;
        left: 50%;
        transform: translate(-50%, 0%);
        top: 40%;
        background: transparent;
    }
    .registration-form header {
        position: relative;
        z-index: 6;
        background: white;
        padding: 20px 40px;
        border-radius: 15px 15px 0 0;
    }
    .registration-form header h1 {
        font-weight: 900;
        letter-spacing: 1.5px;
        color: #094D74;
        font-size: 23px;
        text-transform: uppercase;
        margin: 0;
    }
    .registration-form header p {
        word-spacing: 0px;
        color: #9CB9D1;
        font-size: 17px;
        margin: 0;
        margin-top: 5px;
    }
    .registration-form form {
        position: relative;
    }
    .registration-form .input-section {
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
    .registration-form .input-section.folded {
        width: 95%;
        margin-top: 10px;
        left: 50%;
        transform: translate(-50%, 0);
        z-index: 4;
    }
    .registration-form .input-section.folded input {
        background-color: #9CB9D1;
    }
    .registration-form .input-section.folded span {
        background-color: #9CB9D1;
    }
    .registration-form .input-section.folded + .folded {
        width: 90%;
        margin-top: 20px;
        left: 50%;
        transform: translate(-50%, 0);
        z-index: 3;
    }
    .registration-form .input-section.folded + .folded input {
        background-color: #094D74;
    }
    .registration-form .input-section.folded + .folded span {
        background-color: #094D74;
    }

    .registration-form .input-section.folded + .folded + .folded {
        width: 90%;
        margin-top: 20px;
        left: 50%;
        transform: translate(-50%, 0);
        z-index: 2;
    }
    .registration-form .input-section.folded + .folded + .folded input {
        background-color: #e1bcef;
    }
    .registration-form .input-section.folded + .folded + .folded span {
        background-color: #e1bcef;
    }

    .registration-form .input-section.folded + .folded + .folded + .folded {
        width: 90%;
        margin-top: 20px;
        left: 50%;
        transform: translate(-50%, 0);
        z-index: 1;
    }
    .registration-form .input-section.folded + .folded + .folded + .folded  input {
        background-color: #094D74;
    }
    .registration-form .input-section.folded + .folded + .folded + .folded  span {
        background-color: #094D74;
    }

    .registration-form .input-section.fold-up {
        margin-top: -75px;
    }
    .registration-form form input {
        background: white;
        color: #8f8fd6;
        width: 80%;
        border: 0;
        padding: 20px 40px;
        margin: 0;
    }
    .registration-form form input:focus {
        outline: none;
    }
    .registration-form form input::-moz-placeholder {
        color: #8f8fd6;
        font-weight: 100;
    }
    .registration-form form input:-ms-input-placeholder {
        color: #8f8fd6;
        font-weight: 100;
    }
    .registration-form form input::placeholder {
        color: #8f8fd6;
        font-weight: 100;
    }

    .animated-button {
        width: 20%;
        background-color: #d4d4ff;
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
        color: #9999f8;
    }
    .animated-button .next-button {
        background: transparent;
        color: #9999f8;
        font-weight: 100;
        width: 100%;
        border: 0;
    }

    .next {
        margin-top: -75px;
    }

    .success {
        width: 100%;
        position: absolute;
        display: flex;
        align-items: center;
        left: 50%;
        transform: translate(-50%, 0);
        height: 75px;
        border-radius: 0 0 15px 15px;
        overflow: hidden;
        z-index: 0;
        box-shadow: 0px 0px 100px rgba(0, 0, 0, 0.2);
        transition: all 0.2s ease-in;
        background: #759CD8;
        margin-top: -75px;
    }
    .success p {
        color: white;
        font-weight: 900;
        letter-spacing: 2px;
        font-size: 18px;
        width: 100%;
        text-align: center;
    }
</style>