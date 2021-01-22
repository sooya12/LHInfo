<%--
  Created by IntelliJ IDEA.
  User: hyeonsu
  Date: 2021-01-20
  Time: 오후 3:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="/resources/main.css">
    <title>분양임대 공고문 조회</title>
</head>
<body>
    <div class="container">
        <jsp:include page="header.jsp"/>
        <jsp:include page="menu.jsp"/>
        <div id="selectBoxArea">
            <form id="subLeaseNoticeSelectForm" action="/subleasenotice/list" method="get">
                <div class="selectFormLine">
                    <div class="form-group">
                        <label for="selLocation">지역 </label>
                        <select class="form-control" id="selLocation" name="location">
                            <c:forEach var="location" items="${locationList}">
                                <option value="${location.code}">${location.info}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="selNoticeType">공고유형 </label>
                        <select class="form-control" id="selNoticeType" name="noticeType">
                            <c:forEach var="noticeType" items="${noticeTypeList}">
                                <option value="${noticeType.code}">${noticeType.info}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="selNoticeStatusType">공고상태 </label>
                        <select class="form-control" id="selNoticeStatusType" name="noticeStatusType">
                            <c:forEach var="noticeStatusType" items="${noticeStatusTypeList}">
                                <option value="${noticeStatusType.code}">${noticeStatusType.code}</option>
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
                </div>
                <div class="selectFormLine">
                    <div>
                        <label for="inputNoticeName">공고명 </label>
                        <input type="text" class="form-control" id="inputNoticeName" name="noticeName"/>
                    </div>
                    <div class="form-button">
                        <button type="submit" class="btn btn-basic" id="inquiryButton">공고문 조회</button>
                    </div>
                </div>
            </form>
        </div>
        <div id="subLeaseNoticeArea">
            <table class="table table-condensed" id="subLeaseNoticeTable">
                <thead>
                    <tr>
                        <th>순번</th>
                        <th>지역명</th>
                        <th>공고명</th>
                        <th>유형명</th>
                        <th>세부유형명</th>
                        <th>공고게시일</th>
                        <th>공고마감일</th>
                        <th>공고상태</th>
                    </tr>
                </thead>
                <tbody>
                    <c:choose>
                        <c:when test="${subLeaseNoticeList.size() < 1}">
                            <tr>
                                <td colspan="8" id="noInfomation">해당 임대단지 조회 정보가 없습니다.</td>
                            </tr>
                        </c:when>
                        <c:otherwise>
                            <c:forEach var="subLeaseNotice" items="${subLeaseNoticeList}">
                                <tr>
                                    <td>${subLeaseNotice.RNUM}</td>
                                    <td>${subLeaseNotice.CNP_CD_NM}</td>
                                    <td>${subLeaseNotice.PAN_NM}</td>
                                    <td>${subLeaseNotice.UPP_AIS_TP_NM}</td>
                                    <td>${subLeaseNotice.AIS_TP_CD_NM}</td>
                                    <td>${subLeaseNotice.PAN_NT_ST_DT}</td>
                                    <td>${subLeaseNotice.CLSG_DT}</td>
                                    <td>${subLeaseNotice.PAN_SS}</td>
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
    $(document).ready(function() {
        if(${currentValue.location != ""}) {
            $("#selLocation option[value=${currentValue.location}]").attr("selected", true);
        }

        if(${currentValue.noticeType != ""}) {
            $("#selNoticeType option[value=${currentValue.noticeType}]").attr("selected", true);
        }

        if(${currentValue.noticeStatusType != ""}) {
            $("#selNoticeStatusType option[value=${currentValue.noticeStatusType}]").attr("selected", true);
        }

        $("#selPage option[value=${currentValue.page}]").attr("selected", true);
        $("#inputNoticeName").val("${currentValue.noticeName}");
    })
</script>
<style>
    #selectBoxArea {
        width: 70%;
        height: 100px;
        text-align: center;
        margin: 20px auto;
    }

    .selectFormLine {
        width: 100%;
        height: 40px;
        margin: 5px auto;
        text-align: center;
        float: none;
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

    .selectFormLine {
        float: left;
    }

    .selectFormLine .form-control {
        width: min(70%, 600px);
        float: left;
    }

    #subLeaseNoticeArea {
        width: 70%;
        margin: 20px auto;
        text-align: center;
    }

    #subLeaseNoticeArea table {
        width: 100%;
        margin: 0 auto;
        font-size: min(max(10px, 1vw), 14px);
    }

    #noInfomation {
        text-align: center;
    }

</style>
