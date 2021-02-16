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
    <%@ include file="/resources/main.html" %>
    <link rel="stylesheet" href="/resources/main.css">
    <title>Header</title>
</head>
<body>
    <div id="header-backgroundArea">
        <div id="header-titleArea">
            <p onclick="location.href='/home'">분양임대 정보 제공 서비스</p>
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
                            <li><a href="/"><i class="fas fa-user-check"></i> 로그인</a></li>
                            <li><a href="/"><i class="fas fa-user-plus"></i> 회원가입</a></li>
                        </ul>
                    </c:when>
                    <c:otherwise>
                        <ul class="nav navbar-nav navbar-right">
                            <li><a id="accountName" aria-disabled="true"><i class="far fa-laugh-wink"></i> ${account.name}</a></li>
                            <li><a href="/account/signout"><i class="fad fa-user-times"></i> 로그아웃</a></li>
                        </ul>
                    </c:otherwise>
                </c:choose>
            </div>
        </nav>
    </div>
    <div id="move-top">
        <i class="fad fa-arrow-circle-up"></i>
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

    $("#move-top i").hover(function() {
        $(this).css("cursor", "pointer");
    });

    $("#move-top i").click(function() {
        window.scrollTo(0, 0);
    });

</script>
<style>
    body {
        width: 100%;
        height: auto;
    }

    #header-backgroundArea {
        width: 100%;
        min-height: 500px;
        max-height: 775px;
        background-image: url('/resources/img/jack-prommel-T2wAe8qXy4w-unsplash_cut.jpg');
        background-size: cover;
        background-position: top;
    }

    #header-titleArea {
        width: 100%;
        min-height: 449px;
        text-align: center;
        color: #000000;
        text-shadow: 0 0 10px #eeeeee;
        margin: 0 auto;
        display: flex;
        align-items: center;
        justify-content: center;
    }

    #header-titleArea p {
        margin: 0;
        font-size: 50px;
        font-weight: bold;
        float: none;
    }

    nav, .navbar {
        margin: 0;
    }

    #move-top {
        width: 95%;
        position: fixed;
        bottom: 140px;
        margin: 10px;
    }

    #move-top i {
        font-size: x-large;
        float: right;
    }

    #accountName {
        color: #ffffff;
    }

</style>
