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
        <div id="mainArea">
            <div id="leaseComplexArea">
                <div id="leaseComplexTitle">
                    <header>
                        <p>임대단지 조회</p>
                    </header>
                </div>
                <div id="leaseComplexContent">
                    <span>LH공사에서 관리하는 공공임대주택의 단지 정보 제공</span>
                </div>
                <div id="leaseComplexSelectArea">
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
                        <div class="form-button">
                            <button type="submit" class="btn btn-basic" id="inquiryButton">임대단지 조회</button>
                        </div>
                    </form>
                </div>
            </div>
            <div id="subLeaseNoticeArea">
                <div class="subLeaseNoticeArea">
                    <div class="noticeTitle">
                        <header>
                            <p>최신 분양임대 공고문</p>
                        </header>
                    </div>
                    <div class="noticeContent">
                        <span>LH에서 관리하는 공지사항, 채용공고, 분양임대주택 공고 등 각종 공고 정보를 제공</span>
                    </div>
                    <div class="noticeList">
                        <ul>
                            <c:forEach var="subLeaseNotice" items="${subLeaseNoticeList}">
                                <li><i class="fal fa-newspaper"></i> ${subLeaseNotice.PAN_NM}</li>
                            </c:forEach>
                        </ul>
                    </div>
                </div>
            </div>
            <div id="LHNoticeArea">
                <div class="LHNoticeArea">
                    <div class="noticeTitle">
                        <header>
                            <p>최신 LH 청약센터 공고문</p>
                        </header>
                    </div>
                    <div class="noticeContent">
                        <span>LH 청약센터 공지사항 정보를 제공</span>
                    </div>
                    <div class="noticeList">
                        <ul>
                            <c:forEach var="lhNotice" items="${lhNoticeList}">
                                <li><i class="fal fa-newspaper"></i> ${lhNotice.BBS_TL}</li>
                            </c:forEach>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <jsp:include page="footer.jsp"/>
    </div>
</body>
</html>
<style>
    #mainArea {
        width: 100%;
        min-height: 850px;
        margin: 0 auto;
    }

    #leaseComplexArea {
        border-bottom: 3px solid #996C66;
        width: 100%;
        min-height: 250px;
        margin: 0 auto;
        color: #996C66;
    }

    #leaseComplexTitle, .noticeTitle {
        width: 90%;
        min-height: auto;
        float: none;
        margin: 0 auto;
    }

    #leaseComplexContent, .noticeContent {
        width: 90%;
        height: auto;
        float: none;
        margin: 0 auto;
        margin-bottom: 40px;
        text-align: center;
    }

    #leaseComplexSelectArea {
        width: 90%;
        height: auto;
        margin: 0 auto;
    }

    #leaseComplexSelectForm {
        width: 100%;
        height: auto;
        margin: 0 auto;
        display: flex;
        align-items: center;
        justify-content: center;
    }

    .form-group {
        height: 40px;
        float: left;
        margin: 0;
    }

    #leaseComplexSelectArea label {
        float: left;
        padding: 6px 12px 6px 12px;
    }

    #leaseComplexSelectArea select {
        float: left;
        width: auto;
    }

    #leaseComplexSelectArea .form-button {
        height: 40px;
        float: left;
        margin-left: 10px;
        margin-right: 10px;
    }

    .subLeaseNoticeArea {
        border-bottom: 3px solid #73746E;
        width: 100%;
        min-height: 300px;
        margin: 0 auto;
        color: #73746E;
    }

    .LHNoticeArea {
        border-bottom: 3px solid #957767;
        width: 100%;
        min-height: 300px;
        margin: 0 auto;
        color: #957767;
    }

    .noticeList {
        margin: 0 auto;
        text-align: center;
    }

    .noticeList li {
        white-space: nowrap;
        overflow: hidden;
        text-overflow: ellipsis;
        margin-bottom: 5px;
    }

    #mainArea header {
        margin: 10px auto;
        font-size: max(2vw, 20px);
        font-weight: bold;
        text-align: center;
    }

    #footer-backgroundArea {
        margin: 0;
    }
</style>