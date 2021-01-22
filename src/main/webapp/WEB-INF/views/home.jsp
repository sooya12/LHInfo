<%--
  Created by IntelliJ IDEA.
  User: hyeonsu
  Date: 2021-01-20
  Time: 오전 11:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="/resources/main.css">
    <title>분양임대 정보 제공 서비스</title>
</head>
<body>
    <div class="container">
        <jsp:include page="header.jsp"/>
        <jsp:include page="menu.jsp"/>
        <div id="mainArea">
            Home!
            <c:out value="${account.name}"/>
        </div>
        <jsp:include page="footer.jsp"/>
    </div>
</body>
</html>
<style>
    #mainArea {
        width: 70%;
        height: 500px;
        margin: 0 auto;
    }
</style>