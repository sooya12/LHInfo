<%--
  Created by IntelliJ IDEA.
  User: hyeonsu
  Date: 2021-01-14
  Time: 오후 5:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Footer</title>
</head>
<body>
    <div id="footer-backgroundArea">
        <div id="footer-infoArea">
            <span>
                분양임대 정보 제공 서비스 <br/>
                [개발자] 아이티센 Programming 교육생 최현수 <br/>
            </span>
        </div>
    </div>
</body>
</html>

<style>
    body {
        width: 100%;
    }

    #footer-backgroundArea {
        width: 100%;
        height: 100px;
        background: #D9C2AD;
        bottom: 0;
    }

    #footer-infoArea {
        width: 100%;
        height: 100%;
        text-align: center;
        color: black;
        margin: 0 auto;
        display: flex;
        align-items: center;
        justify-content: center;
    }

    #infoArea span {
        margin: 0;
        font-size: 10px;
    }
</style>