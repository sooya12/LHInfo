<%--
  Created by IntelliJ IDEA.
  User: hyeonsu
  Date: 2021-01-12
  Time: 오전 10:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="/resources/main.css">
    <title>임대단지 조회</title>
</head>
<body>
    <div class="container">
        <jsp:include page="header.jsp"/>
        <div id="selectBoxArea">
            <form>
                <div class="form-group">
                    <label for="selLocation">지역 </label>
                    <select class="form-control" id="selLocation">
                      <c:forEach var="location" items="${locationList}">
                            <option><c:out value="${location.info} (${location.code})"/></option>
                        </c:forEach>
                    </select>
                </div>
                <div class="form-group">
                    <label for="selSupplyType">공급유형 </label>
                    <select class="form-control" id="selSupplyType">
                        <c:forEach var="supplyType" items="${supplyTypeList}">
                            <option><c:out value="${supplyType.info} (${supplyType.code})"/></option>
                        </c:forEach>
                    </select>
                </div>
                <div class="form-button">
                    <button type="button" class="btn btn-basic">임대단지 조회</button>
                </div>
            </form>
        </div>
        <div id="leaseComplexListArea">
            <table class="table table-condensed">
                <thead>
                    <tr>
                        <th>순번</th>
                        <th>지역명</th>
                        <th>공급유형명</th>
                        <th>단지명</th>
                        <th>전용면적</th>
                        <th>월임대료</th>
                        <th>총세대수</th>
                        <th>세대수</th>
                        <th>최초입주년월</th>
                        <th>임대보증금</th>
                        <th>전체건수</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="leaseComplex" items="${leaseComplexList}" varStatus="idx">
                        <tr>
                            <td><c:out value="${leaseComplex.RNUM}"/></td>
                            <td><c:out value="${leaseComplex.ARA_NM}"/></td>
                            <td><c:out value="${leaseComplex.AIS_TP_CD_NM}"/></td>
                            <td><c:out value="${leaseComplex.SBD_LGO_NM}"/></td>
                            <td><c:out value="${leaseComplex.DDO_AR}"/></td>
                            <td><c:out value="${leaseComplex.RFE}"/></td>
                            <td><c:out value="${leaseComplex.SUM_HSH_CNT}"/></td>
                            <td><c:out value="${leaseComplex.HSH_CNT}"/></td>
                            <td><c:out value="${leaseComplex.MVIN_XPC_YM}"/></td>
                            <td><c:out value="${leaseComplex.LS_GMY}"/></td>
                            <td><c:out value="${leaseComplex.ALL_CNT}"/></td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
        <jsp:include page="footer.jsp"/>
    </div>
</body>
</html>

<style>
    #selectBoxArea {
        width: 70%;
        height: 50px;
        text-align: center;
        margin: 20px auto;
    }

    #selectBoxArea form {
        width: 100%;
        height: 100%;
        border-bottom: solid darkgrey 1px;
    }

    #selectBoxArea label {
        float: left;
        padding: 6px 12px 6px 12px;
    }

    #selectBoxArea select {
        float: left;
        width: auto;
    }

    #selectBoxArea .form-button {
        float: right;
    }

    #leaseComplexListArea {
        width: 70%;
        margin: 20px auto;
        text-align: center;
    }

    #leaseComplexListArea table {
        width: 100%;
        margin: 0 auto;
        font-size: min(1vw, 14px);
    }

</style>