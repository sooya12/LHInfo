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
                    <span>
                        LH공사에서 관리하는 공공임대주택의 단지 정보 제공<br><br>
                        임대주택 단지의 지역명, 공급유형, 단지명, 총 세대수, 전용면적, 세대수, 임대보증금, 월임대료, 최초 입주년월 정보 조회가 가능합니다.<br>
                        지역과 공급유형에 따른 조회를 하실 수 있습니다.
                    </span>
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
                            <p>분양임대 공고문 조회</p>
                        </header>
                    </div>
                    <div class="noticeContent">
                        <span>
                            LH에서 관리하는 공지사항, 채용공고, 분양임대주택 공고 등 각종 공고 정보를 제공<br><br>
                            분양임대 공고문의 공고유형, 공고명, 지역, 공고게시일 정보 조회가 가능합니다.<br>
                            공고명을 클릭하시면 위치와 상권 정보를 포함한 상세 정보를 조회하실 수 있습니다.
                        </span>
                    </div>
                    <div class="noticeList">
                        <ul>
                            <c:forEach var="subLeaseNotice" items="${subLeaseNoticeList}" varStatus="idx">
                                <li><i class="fal fa-newspaper"></i> ${subLeaseNotice.PAN_NM}</li>

                                <script type="text/javascript">
                                    $(document).ready(function() {
                                        const line = $("#subLeaseNoticeArea li:eq('${idx.count - 1}')");

                                        const submitForm = makeForm("${subLeaseNotice.AIS_TP_CD}", "${subLeaseNotice.SPL_INF_TP_CD}", "${subLeaseNotice.PAN_ID}", "${subLeaseNotice.UPP_AIS_TP_CD}", "${subLeaseNotice.CCR_CNNT_SYS_DS_CD}");
                                        document.body.appendChild(submitForm);

                                        $(line).click(function () {
                                            sessionStorage.setItem("noticeName", "${subLeaseNotice.PAN_NM}");
                                            sessionStorage.setItem("noticeType", "${subLeaseNotice.UPP_AIS_TP_NM}");
                                            sessionStorage.setItem("noticeDetailType", "${subLeaseNotice.AIS_TP_CD_NM}");
                                            sessionStorage.setItem("locationName", "${subLeaseNotice.CNP_CD_NM}");
                                            sessionStorage.setItem("noticeStatus", "${subLeaseNotice.PAN_SS}");
                                            submitForm.submit();
                                        });
                                    });
                                </script>
                            </c:forEach>
                        </ul>
                    </div>
                </div>
            </div>
            <div id="LHNoticeArea">
                <div class="LHNoticeArea">
                    <div class="noticeTitle">
                        <header>
                            <p>LH 청약센터 공고문 조회</p>
                        </header>
                    </div>
                    <div class="noticeContent">
                        <span>
                            LH 청약센터 공지사항 정보를 제공<br><br>
                            LH 청약센터 공지사항의 유형, 제목, 공고 게시일 정보 조회가 가능합니다.<br>
                            공고 게시일과 검색어(제목/내용)에 따른 조회를 하실 수 있습니다.
                        </span>
                    </div>
                    <div class="noticeList">
                        <ul>
                            <c:forEach var="lhNotice" items="${lhNoticeList}" varStatus="idx">
                                <li><i class="fal fa-newspaper"></i> ${lhNotice.BBS_TL}</li>

                                <script type="text/javascript">
                                    $(document).ready(function() {
                                       const line = $("#LHNoticeArea li:eq('${idx.count - 1}')");

                                       $(line).click(function() {
                                           let url = "${lhNotice.LINK_URL}";
                                           url = url.replace("http", "https");

                                           window.open(url);
                                       });
                                    });
                                </script>
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
<script>
    $("#leaseComplexSelectArea .form-button button").hover(function() {
        $(this).css("background-color", "#996C66");
        $(this).css("color", "#ffffff");
    });

    $("#leaseComplexSelectArea .form-button button").mouseout(function() {
        $(this).css("background-color", "#000000");
        $(this).css("color", "#ffffff");
    });

    $(".noticeList li").hover(function() {
        $(this).css("cursor", "pointer");
        $(this).css("color", "#000000");
    });

    $("#subLeaseNoticeArea .noticeList li").mouseout(function() {
        $(this).css("color", "#73746E");
    });

    $("#lhNoticeArea .noticeList li").mouseout(function() {
        $(this).css("color", "#957767");
    });

    function makeForm(a, s, p, u, c) {
        const form = document.createElement("form");
        form.setAttribute("action", "/subleasenotice/detail");
        form.setAttribute("method", "get");
        document.charset = "UTF-8";

        const AIS_TP_CD = document.createElement("input");
        AIS_TP_CD.setAttribute("type", "hidden");
        AIS_TP_CD.setAttribute("name", "AIS_TP_CD");
        AIS_TP_CD.setAttribute("value", a);
        form.appendChild(AIS_TP_CD);

        const SPL_INF_TP_CD = document.createElement("input");
        SPL_INF_TP_CD.setAttribute("type", "hidden");
        SPL_INF_TP_CD.setAttribute("name", "SPL_INF_TP_CD");
        SPL_INF_TP_CD.setAttribute("value", s);
        form.appendChild(SPL_INF_TP_CD);

        const PAN_ID = document.createElement("input");
        PAN_ID.setAttribute("type", "hidden");
        PAN_ID.setAttribute("name", "PAN_ID");
        PAN_ID.setAttribute("value", p);
        form.appendChild(PAN_ID);

        const UPP_AIS_TP_CD = document.createElement("input");
        UPP_AIS_TP_CD.setAttribute("type", "hidden");
        UPP_AIS_TP_CD.setAttribute("name", "UPP_AIS_TP_CD");
        UPP_AIS_TP_CD.setAttribute("value", u);
        form.appendChild(UPP_AIS_TP_CD);

        const CCR_CNNT_SYS_DS_CD = document.createElement("input");
        CCR_CNNT_SYS_DS_CD.setAttribute("type", "hidden");
        CCR_CNNT_SYS_DS_CD.setAttribute("name", "CCR_CNNT_SYS_DS_CD");
        CCR_CNNT_SYS_DS_CD.setAttribute("value", c);
        form.appendChild(CCR_CNNT_SYS_DS_CD);

        return form;
    }
</script>
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
        color: #996C66;
    }

    #leaseComplexSelectArea .form-button {
        height: 40px;
        float: left;
        margin-left: 10px;
        margin-right: 10px;
    }

    #leaseComplexSelectArea .form-button button {
        background-color: #000000;
        color: #ffffff;
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