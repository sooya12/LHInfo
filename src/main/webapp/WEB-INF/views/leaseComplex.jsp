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
            <form id="leaseComplexSelectForm" action="/leasecomplex" method="get">
                <div class="form-group">
                    <label for="selLocation">지역 </label>
                    <select class="form-control" id="selLocation" name="location">
                      <c:forEach var="location" items="${locationList}">
                            <option value="${location.code}">${location.info}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="form-group">
                    <label for="selSupplyType">공급유형 </label>
                    <select class="form-control" id="selSupplyType" name="supplyType">
                        <c:forEach var="supplyType" items="${supplyTypeList}">
                            <option value="${supplyType.code}">${supplyType.info}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="form-group">
                    <label for="selPage">페이지 </label>
                    <select class="form-control" id="selPage" name="page">
                        <c:forEach begin="1" end="${pageCnt}" varStatus="idx">
                            <option value="${idx.count}">${idx.count}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="form-button">
                    <button type="submit" class="btn btn-basic" id="inquiryButton">임대단지 조회</button>
                </div>
            </form>
        </div>
        <div id="leaseComplexListArea">
            <table class="table table-condensed" id="leaseComplexTable">
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
                    </tr>
                </thead>
                <tbody>
                    <c:choose>
                        <c:when test="${leaseComplexList.size() < 1}">
                            <tr>
                                <td colspan="11" id="noInfomation">해당 임대단지 조회 정보가 없습니다.</td>
                            </tr>
                        </c:when>
                        <c:otherwise>
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
                                <script type="text/javascript">
                                    $(document).ready(function () {
                                        const regexp = /\B(?=(\d{3})+(?!\d))/g;

                                        const rfe = $("#leaseComplexTable tr:eq(${idx.count}) td:eq(5)");
                                        rfe.html(rfe.html().replace(regexp, ','));

                                        const ls_gmy = $("#leaseComplexTable tr:eq(${idx.count}) td:eq(9)");
                                        ls_gmy.html(ls_gmy.html().replace(regexp, ','));
                                    });
                                </script>
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
    $(document).ready(function () {
        $("#selLocation option[value=${currentValue.location}]").attr("selected", true);
        $("#selSupplyType option[value=${currentValue.supplyType}]").attr("selected", true);
        $("#selPage option[value=${currentValue.page}]").attr("selected", true);
    });
</script>
<style>
    #selectBoxArea {
        width: 70%;
        height: 50px;
        text-align: center;
        margin: 20px auto;
        margin-top: 50px;
    }

    .form-group {
        height: 40px;
        float: left;
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
        font-size: min(max(10px, 1vw), 14px);
    }

    #noInfomation {
        text-align: center;
    }

</style>