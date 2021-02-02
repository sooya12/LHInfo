<%--
  Created by IntelliJ IDEA.
  User: hyeonsu
  Date: 2021-01-14
  Time: 오전 11:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <script src="https://kit.fontawesome.com/8962e3bb2c.js" crossorigin="anonymous"></script>
    <title>Header</title>
</head>
<body>
    <div id="header-backgroundArea">
        <div id="header-titleArea">
            <p onclick="location.href='/'">분양임대 정보 제공 서비스</p>
        </div>
        <nav class="navbar navbar-inverse">
            <div class="container-fluid">
                <div class="navbar-header">
                    <a class="navbar-brand" href="/home"><i class="fas fa-home-lg"></i></a>
                </div>
                <ul id="menu" class="nav navbar-nav">
                    <li><a href="/leasecomplex">임대단지</a></li>
                    <li><a href="/subleasenotice/list">분양임대 공고문</a></li>
                    <li><a href="/lhnotice">청약센터 공고문</a></li>
                </ul>
                <c:choose>
                    <c:when test="${account == null}">
                        <ul class="nav navbar-nav navbar-right">
                            <li><a href="/account/signin"><i class="fas fa-user-check"></i> 로그인</a></li>
                            <li><a href="/account/signup"><i class="fas fa-user-plus"></i> 회원가입</a></li>
                        </ul>
                    </c:when>
                    <c:otherwise>
                        <ul class="nav navbar-nav navbar-right">
                            <li><a href="/account/signout"><i class="fad fa-user-times"></i> 로그아웃</a></li>
                        </ul>
                    </c:otherwise>
                </c:choose>
            </div>
        </nav>
    </div>
</body>
</html>
<script>
    $("#header-titleArea p").hover(function() {
        $(this).css("cursor", "pointer");
    });

    $(document).ready(function() {
        const uri = "<%=request.getRequestURI()%>";

        if(uri.indexOf("leaseComplex") >= 0) {
            $("li:eq(0)").addClass("active");
        } else if(uri.indexOf("subLeaseNotice") >= 0) {
            $("li:eq(1)").addClass("active");
        } else if(uri.indexOf("lhNotice") >= 0) {
            $("li:eq(2)").addClass("active");
        } else if(uri.indexOf("home") >= 0) {
            $(".navbar-brand").css("color", "#ffffff");
        }
    });

</script>
<style>
    body {
        width: 100%;
    }

    #header-backgroundArea {
        width: 100%;
        height: 250px;
        background: url('/resources/img/lichtraum-1560788_1920.jpg') no-repeat right center;
    }

    #header-titleArea {
        width: 100%;
        height: 85%;
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

</style>
