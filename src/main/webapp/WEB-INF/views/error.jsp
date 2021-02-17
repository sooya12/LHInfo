<%--
  Created by IntelliJ IDEA.
  User: hyeonsu
  Date: 2021-02-06
  Time: 오후 5:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <%@ include file="/resources/main.html" %>
    <link rel="stylesheet" href="/resources/main.css">
    <title>오류</title>
</head>
<body>
    <div class="container">
        <jsp:include page="header.jsp"/>
        <div id="titleArea">
            <header>
                <p>처리 중 오류가 발생하였습니다</p>
            </header>
        </div>
        <div id="messageArea">
            <p></p>
        </div>
        <script type="text/javascript">
            function start(cnt) {
                if(cnt < 4) {
                    setTimeout(function() {
                        if (cnt == 0) {
                            $("#messageArea p").text("3초 뒤 홈 화면으로 이동합니다");
                            cnt = cnt + 1;
                            start(cnt);
                        } else if (cnt == 1) {
                            $("#messageArea p").text("2초 뒤 홈 화면으로 이동합니다");
                            cnt = cnt + 1;
                            start(cnt);
                        } else if (cnt == 2) {
                            $("#messageArea p").text("1초 뒤 홈 화면으로 이동합니다");
                            cnt = cnt + 1;
                            start(cnt);
                        } else {
                            location.replace("/home");
                        }
                    }, 1000);
                }
            }

            $(document).ready(function() {
                start(0);
            });
        </script>
    </div>
</body>
</html>
<style>
    #titleArea {
        width: 70%;
        margin: 10px auto;
        margin-top: 50px;
        text-align: center;
        color: #000000;
    }

    #titleArea p {
        font-size: min(max(3vw, 20px), 40px);
        font-weight: bold;
    }

    #messageArea {
        width: 70%;
        height: 100px;
        text-align: center;
        margin: 20px auto;
        margin-top: 50px;
    }
</style>