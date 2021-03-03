<%--
  Created by IntelliJ IDEA.
  User: hyeonsu
  Date: 2021-03-03
  Time: 오전 11:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <%@ include file="/resources/main.html" %>
    <link rel="stylesheet" href="/resources/main.css">
    <title>회원 목록</title>
</head>
<body>
    <div class="container">
        <jsp:include page="header.jsp"/>
        <div id="titleArea">
            <header>
                <p>회원 목록</p>
            </header>
        </div>
        <div id="infoArea">
            <span>
                분양임대 정보 제공 서비스에 가입 회원 목록
            </span>
        </div>
        <div id="accountInfoListArea">
            <table class="table table-condensed" id="accountInfoTable">
                <thead>
                    <tr>
                        <th>회원번호</th>
                        <th>회원ID</th>
                        <th>회원이름</th>
                        <th>회원Email</th>
                    </tr>
                </thead>
                <tbody>
                    <c:choose>
                        <c:when test="${accountInfoList.size() < 1}">
                            <tr>
                                <td colspan="4" id="noInfomation">가입한 회원이 없습니다.</td>
                            </tr>
                        </c:when>
                        <c:otherwise>
                            <c:forEach var="accountInfo" items="${accountInfoList}">
                                <tr>
                                    <td><c:out value="${accountInfo.id}"/></td>
                                    <td><c:out value="${accountInfo.identify}"/></td>
                                    <td><c:out value="${accountInfo.name}"/></td>
                                    <td><c:out value="${accountInfo.email}"/></td>
                                </tr>
                            </c:forEach>
                        </c:otherwise>
                    </c:choose>
                </tbody>
            </table>
        </div>
        <jsp:include page="footer.jsp"/>
    </div>
</body>
</html>
<script>

</script>
<style>
    #titleArea {
        width: 70%;
        margin: 10px auto;
        margin-top: 50px;
        text-align: center;
        color: #4E211F;
    }

    #titleArea p {
        font-size: min(max(3vw, 20px), 40px);
        font-weight: bold;
    }

    #infoArea {
        width: 90%;
        height: auto;
        float: none;
        margin: 0 auto;
        margin-bottom: 40px;
        text-align: center;
        color: #4E211F;
    }

    #infoArea span {
        font-size: 14px;
    }

    #accountInfoListArea {
        width: 70%;
        margin: 20px auto;
        text-align: center;
    }

    #accountInfoListArea table {
        width: 100%;
        margin: 0 auto;
        font-size: min(max(12px, 1vw), 14px);
    }

    #noInfomation {
        text-align: center;
    }
</style>