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
    <%@ include file="/resources/main.html" %>
    <link rel="stylesheet" href="/resources/main.css">
    <title>임대단지 조회</title>
</head>
<body>
    <div class="container">
        <jsp:include page="header.jsp"/>
        <div id="titleArea">
            <header>
                <p>임대단지 조회</p>
            </header>
        </div>
        <div id="leaseComplexContent">
            <span>
                LH공사에서 관리하는 공공임대주택의 단지 정보 제공<br><br>
                임대주택 단지의 지역명, 공급유형, 단지명, 총 세대수, 전용면적, 세대수, 임대보증금, 월임대료, 최초 입주년월 정보 조회가 가능합니다.<br>
                지역과 공급유형에 따른 조회를 하실 수 있습니다.
            </span>
        </div>
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
                <input type="hidden" id="selPage" name="page">
                <div class="form-button">
                    <button type="button" class="btn btn-basic" id="inquiryButton">임대단지 조회</button>
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
        <div id="paginationArea">
        </div>
        <jsp:include page="footer.jsp"/>
    </div>
</body>
</html>
<script>
    $(document).ready(function () {
        if(${currentValue.location != ""}) {
            $("#selLocation option[value=${currentValue.location}]").attr("selected", true);
        } else {
            $("#selLocation option[value=00]").attr("selected", true);
        }

        if(${currentValue.supplyType != ""}) {
            $("#selSupplyType option[value=${currentValue.supplyType}]").attr("selected", true);
        } else {
            $("#selSupplyType option[value=00]").attr("selected", true);
        }

        $("#selPage option[value=${currentValue.page}]").attr("selected", true);
    });

    var dataSourceArr = [1];
    var allCnt = "${totalCnt}";
    for(var i = 2; i <= allCnt; i++) {
        dataSourceArr.push(i);
    }

    $("#paginationArea").pagination({
        dataSource: dataSourceArr,
        pageSize: 50,
        pageNumber: ${currentValue.page},
        callback: function(data, pagination) {
            if("${currentValue.page}" != pagination.pageNumber) {
                $("#selPage").val(pagination.pageNumber);
                $("#leaseComplexSelectForm").submit();
            }
        }
    });

    $("#inquiryButton").click(function() {
        $.ajax({
            type: "POST",
            async: false,
            url: "/account/createAccountLookup",
            data: {accountid: "<%=request.getSession().getAttribute("accountId")%>",
                    type1: document.querySelector("#selLocation").options[document.querySelector("#selLocation").selectedIndex].text,
                    type2: document.querySelector("#selSupplyType").options[document.querySelector("#selSupplyType").selectedIndex].text,
                    category: "임대단지",
                    // url: "http://localhost:8080/leasecomplex?location=" + $("#selLocation").val() + "&supplyType=" + $("#selSupplyType").val() + "&page=1"
                    url: "http://3.35.55.54/leasecomplex?location=" + $("#selLocation").val() + "&supplyType=" + $("#selSupplyType").val() + "&page=1"
            },
            dataType: "text",
            success: function(data) {
                if(data == "success") {
                    $("#leaseComplexSelectForm").submit();
                } else if(data == "fail") {
                    $("#inquiryButton").click();
                }
            },
            error: function(err) {
                console.log(err);
            }
        });
    });

</script>
<style>
    #titleArea {
        width: 70%;
        margin: 10px auto;
        margin-top: 50px;
        text-align: center;
        color: #996C66;
    }

    #titleArea p {
        font-size: min(max(3vw, 20px), 40px);
        font-weight: bold;
    }

    #leaseComplexContent {
        width: 90%;
        height: auto;
        float: none;
        margin: 0 auto;
        margin-bottom: 40px;
        text-align: center;
        color: #996C66;
    }

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
    }

    #selectBoxArea label {
        float: left;
        padding: 6px 12px 6px 12px;
        color: #996C66;
    }

    #selectBoxArea select {
        float: left;
        width: auto;
    }

    #selectBoxArea .form-button {
        float: right;
    }

    #inquiryButton {
        background-color: #996C66;
        color: #ffffff;
    }

    #leaseComplexListArea {
        width: 70%;
        margin: 20px auto;
        text-align: center;
    }

    #leaseComplexListArea table {
        width: 100%;
        margin: 0 auto;
        font-size: min(max(12px, 1vw), 14px);
    }

    #noInfomation {
        text-align: center;
    }

    #paginationArea .paginationjs {
        width: fit-content;
        margin: 0 auto;
        font-family: "MapoPeacefull";
    }

</style>