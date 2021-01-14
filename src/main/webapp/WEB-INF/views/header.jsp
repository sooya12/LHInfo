<%--
  Created by IntelliJ IDEA.
  User: hyeonsu
  Date: 2021-01-14
  Time: 오전 11:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Header</title>
</head>
<body>
    <div id="header-backgroundArea">
        <div id="header-titleArea">
            <p>분양임대 정보 제공 서비스</p>
        </div>
    </div>
</body>
</html>

<style>
    body {
        width: 100%;
    }

    #header-backgroundArea {
        width: 100%;
        height: 300px;
        /*background-color: black;*/
        background: url('/resources/img/lichtraum-1560788_1920.jpg') no-repeat right center;
    }

    #header-titleArea {
        width: 100%;
        height: 100%;
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
