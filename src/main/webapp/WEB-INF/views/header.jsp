<%--
  Created by IntelliJ IDEA.
  User: hyeonsu
  Date: 2021-01-14
  Time: 오전 11:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <script src="https://kit.fontawesome.com/8962e3bb2c.js" crossorigin="anonymous"></script>
    <title>Header</title>
</head>
<body>
    <div id="header-backgroundArea">
        <div id="header-titleArea">
            <p>분양임대 정보 제공 서비스 <i class="fal fa-person-sign"></i> </p>
        </div>
        <div id="accountArea">
            <%--<c:choose>
                <c:when test=""></c:when>
                <c:otherwise></c:otherwise>
            </c:choose>--%>
            <div class="account-button" onclick="location.href='/account/signup'">
                <i class="fas fa-user-plus"></i> 회원가입
            </div>
            <div class="account-button" onclick="location.href='/account/signin'">
                <i class="fas fa-user-check"></i> 로그인
            </div>
        </div>
    </div>
</body>
</html>
<script>
</script>
<style>
    body {
        width: 100%;
    }

    #header-backgroundArea {
        width: 100%;
        height: 300px;
        background: url('/resources/img/lichtraum-1560788_1920.jpg') no-repeat right center;
    }

    #header-titleArea {
        width: 100%;
        height: 90%;
        text-align: center;
        color: black;
        margin: 0 auto;
        display: flex;
        align-items: center;
        justify-content: center;
    }

    #header-titleArea p {
        margin: 0;
        font-size: 50px;
        font-weight: bold;
    }

    #accountArea {
        width: 100%;
        height: 10%;
        text-align: right;
        vertical-align: center;
    }

    .account-button {
        width: max(5%, 80px);
        height: 100%;
        margin-right: 1%;
        float: right;
        cursor: pointer;
    }
</style>
