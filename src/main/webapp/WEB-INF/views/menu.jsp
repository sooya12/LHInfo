<%--
  Created by IntelliJ IDEA.
  User: hyeonsu
  Date: 2021-01-22
  Time: 오후 4:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="/resources/main.css">
    <title>목록</title>
</head>
<body>
    <div class="menu-container">
        <header>
            <p><i class="fas fa-folders"></i></p>
        </header>
        <ul id="menuContentArea">
            <li>
                <span onclick="location.href='/leasecomplex'">
                    <i class="fad fa-folder-open"></i> 임대단지
                </span>
            </li>
            <li>
                <span onclick="location.href='/subleasenotice/list'">
                    <i class="fad fa-folder-open"></i> 분양임대 공고문
                </span>
            </li>
            <li>
                <span onclick="location.href='#'">
                    <i class="fad fa-folder-open"></i> 청약센터 공고문
                </span>
            </li>
        </ul>
    </div>
</body>
</html>
<script>
    $("#menuContentArea li span").hover(function() {
        $(this).css("cursor", "pointer");
        $(this).css("color", "#6F362D");
    });

    $("#menuContentArea li span").mouseout(function() {
        $(this).css("color", "#000000");
    });
</script>
<style>
    .menu-container {
        width: min(max(10%, 100px), 200px);
        height: 280px;
        margin: 20px auto;
        float: left;
        background-color: #CDC4B3;
    }

    header p {
        font-size: 1.5vw;
        font-weight: bold;
        text-align: center;
        margin: 10px auto;
    }

    #menuContentArea {
        list-style: none;
        font-size: 1vw;
        text-align: center;
        padding: 0;
    }

    #menuContentArea li {
        padding-top: 40px;
    }
</style>