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
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <link rel="stylesheet" href="/resources/main.css">
    <link rel="stylesheet" href="/resources/subleasenotice-datepicker.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/paginationjs/2.1.5/pagination.min.js" integrity="sha512-1zzZ0ynR2KXnFskJ1C2s+7TIEewmkB2y+5o/+ahF7mwNj9n3PnzARpqalvtjSbUETwx6yuxP5AJXZCpnjEJkQw==" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/paginationjs/2.1.5/pagination.css" integrity="sha512-QmxybGIvkSI8+CGxkt5JAcGOKIzHDqBMs/hdemwisj4EeGLMXxCm9h8YgoCwIvndnuN1NdZxT4pdsesLXSaKaA==" crossorigin="anonymous" />
    <title>분양임대 공고문 조회</title>
</head>
<body>
<div class="container">
    <jsp:include page="header.jsp"/>
    <div id="titleArea">
        <header>
            <p>분양임대 공고문 조회</p>
        </header>
    </div>
    <div id="selectBoxArea">
        <form id="subLeaseNoticeSearchForm" action="/subleasenotice/list" method="get">
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
<%--                <div class="form-group">--%>
<%--                    <label for="selPage">페이지 </label>--%>
<%--                    <select class="form-control" id="selPage" name="page">--%>
<%--                        <c:forEach begin="1" end="${pageCnt}" varStatus="idx">--%>
<%--                            <option value="${idx.count}">${idx.count}</option>--%>
<%--                        </c:forEach>--%>
<%--                    </select>--%>
<%--                </div>--%>
            </div>
            <div class="selectFormLine">
                <div>
                    <label for="inputNoticeName">공고명 </label>
                    <input type="text" class="form-control" id="inputNoticeName" name="noticeName"/>
                </div>
            </div>
            <div class="selectFormLine">
                <div>
                    <label for="datepicker-start-start">공고게시시작일 </label>
                    <input type="text" class="form-control" id="datepicker-start-start" name="startDate" autocomplete="off"/>
                </div>
                <div>
                    <label for="datepicker-start-end">공고게시종료일 </label>
                    <input type="text" class="form-control" id="datepicker-start-end" name="endDate" autocomplete="off"/>
                </div>
                <div class="form-button">
                    <button type="button" class="btn btn-basic" id="resetStartDate">초기화</button>
                </div>
            </div>
            <div class="selectFormLine">
                <div>
                    <label for="datepicker-end-start">공고마감시작일 </label>
                    <input type="text" class="form-control" id="datepicker-end-start" name="endStartDate" autocomplete="off"/>
                </div>
                <div>
                    <label for="datepicker-end-end">공고마감종료일 </label>
                    <input type="text" class="form-control" id="datepicker-end-end" name="endEndDate" autocomplete="off"/>
                </div>
                <div class="form-button">
                    <button type="button" class="btn btn-basic" id="resetEndDate">초기화</button>
                </div>
                <input type="hidden" id="selPage" name="page">
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
                        <td colspan="8" id="noInfomation">해당 공고문 조회 정보가 없습니다.</td>
                    </tr>
                </c:when>
                <c:otherwise>
                    <c:forEach var="subLeaseNotice" items="${subLeaseNoticeList}" varStatus="idx">
                        <tr>
                            <td>${subLeaseNotice.RNUM}</td>
                            <td>${subLeaseNotice.CNP_CD_NM}</td>
                            <td>${subLeaseNotice.PAN_NM}</td>
                            <td>${subLeaseNotice.UPP_AIS_TP_NM}</td>
                            <td>${subLeaseNotice.AIS_TP_CD_NM}</td>
                            <td>${subLeaseNotice.PAN_NT_ST_DT}</td>
                            <td>${subLeaseNotice.CLSG_DT}</td>
                            <td>${subLeaseNotice.PAN_SS}</td>

                            <script type="text/javascript">
                                $(document).ready(function () {
                                    const line = $("#subLeaseNoticeTable tr:eq(${idx.count}) td:eq(2)");

                                    const submitForm = makeForm("${subLeaseNotice.AIS_TP_CD}", "${subLeaseNotice.SPL_INF_TP_CD}", "${subLeaseNotice.PAN_ID}", "${subLeaseNotice.UPP_AIS_TP_CD}", "${subLeaseNotice.CCR_CNNT_SYS_DS_CD}");
                                    document.body.appendChild(submitForm);

                                    $(line).hover(function() {
                                        $(this).css("cursor", "pointer");
                                        $(this).css("color", "#759CD8");
                                    });

                                    $(line).mouseout(function() {
                                        $(this).css("color", "#000000");
                                    });

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
                        </tr>
                    </c:forEach>
                </c:otherwise>
            </c:choose>
            </tbody>
        </table>
    </div>
    <div id="paginationArea"></div>
    <jsp:include page="footer.jsp"/>
</div>
</body>
</html>
<script>
    $(document).ready(function () {
        if (${currentValue.location != ""}) {
            $("#selLocation option[value=${currentValue.location}]").attr("selected", true);
        }

        if (${currentValue.noticeType != ""}) {
            $("#selNoticeType option[value=${currentValue.noticeType}]").attr("selected", true);
        }

        if (${currentValue.noticeStatusType != ""}) {
            $("#selNoticeStatusType option[value=${currentValue.noticeStatusType}]").attr("selected", true);
        }

        $("#selPage option[value=${currentValue.page}]").attr("selected", true);
        $("#inputNoticeName").val("${currentValue.noticeName}");

        $("#datepicker-start-start").val("${currentValue.startDate}");
        $("#datepicker-start-end").val("${currentValue.endDate}");

        $("#datepicker-end-start").val("${currentValue.endStartDate}");
        $("#datepicker-end-end").val("${currentValue.endEndDate}");

        $("#datepicker-start-start, #datepicker-start-end, #datepicker-end-start, #datepicker-end-end").datepicker({
            changeMonth: true,
            changeYear: true,
            autoSize: true,
            dayNamesMin: ["일", "월", "화", "수", "목", "금", "토"],
            monthNamesShort: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
            showAnim: "slideDown",
            dateFormat: "yymmdd",
            hideIfNoPrevNext: true,
        });

        $("#datepicker-start-start").datepicker("option", "maxDate", $("#datepicker-start-end").val());
        $("#datepicker-start-start").datepicker("option", "onClose", function(selectedDate) {
            $("#datepicker-start-end").datepicker("option", "minDate", selectedDate);
        });

        $("#datepicker-start-end").datepicker("option", "maxDate", "0");
        $("#datepicker-start-end").datepicker("option", "minDate", $("#datepicker-start-start").val());
        $("#datepicker-start-end").datepicker("option", "onClose", function(selectedDate) {
            $("#datepicker-start-start").datepicker("option", "maxDate", selectedDate);
        });

        $("#datepicker-end-start").datepicker("option", "maxDate", $("#datepicker-end-end").val());
        $("#datepicker-end-start").datepicker("option", "onClose", function(selectedDate) {
            $("#datepicker-end-end").datepicker("option", "minDate", selectedDate);
        });

        $("#datepicker-end-end").datepicker("option", "maxDate", "0");
        $("#datepicker-end-end").datepicker("option", "minDate", $("#datepicker-end-start").val());
        $("#datepicker-end-end").datepicker("option", "onClose", function(selectedDate) {
            $("#datepicker-end-start").datepicker("option", "maxDate", selectedDate);
        });
    });

    $("#resetStartDate").click(function() {
       $("#datepicker-start-start").val("");
       $("#datepicker-start-end").val("");
    });

    $("#resetEndDate").click(function() {
        $("#datepicker-end-start").val("");
        $("#datepicker-end-end").val("");
    });

    var dataSourceArr = [];
    var allCnt = (${subLeaseNoticeList.size() > 0} ? ${subLeaseNoticeList.get(0).ALL_CNT} : 1);
    for (var i = 0; i < allCnt; i++) {
        dataSourceArr.push(i);
    }

    $("#paginationArea").pagination({
        dataSource: dataSourceArr,
        pageSize: 50,
        pageNumber: ${currentValue.page},
        callback: function(data, pagination) {
            if("${currentValue.page}" != pagination.pageNumber) {
                $("#selPage").val(pagination.pageNumber);
                $("#subLeaseNoticeSearchForm").submit();
            }
        }
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
    #titleArea {
        width: 70%;
        margin: 10px auto;
        margin-top: 50px;
        text-align: center;
        color: #73746E;
    }

    #titleArea p {
        font-size: min(max(3vw, 20px), 40px);
        font-weight: bold;
    }

    #selectBoxArea {
        width: 70%;
        height: auto;
        text-align: center;
        margin: 20px auto;
        margin-top: 50px;
    }

    .selectFormLine {
        width: 100%;
        height: auto;
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
        height: auto;
    }

    #selectBoxArea label {
        float: left;
        padding: 6px 12px 6px 12px;
        color: #73746E;
    }

    #selectBoxArea select {
        float: left;
        width: auto;
    }

    #selectBoxArea .form-button #inquiryButton {
        float: right;
    }

    .selectFormLine {
        float: left;
    }

    .selectFormLine .form-control {
        width: min(70%, 600px);
        float: left;
    }

    .selectFormLine #datepicker-start-start, #datepicker-start-end, #datepicker-end-start, #datepicker-end-end {
        width: 110px;
        float: left;
    }

    #resetStartDate, #resetEndDate {
        float: left;
        margin-left: 10px;
        color: #73746E;
    }

    #inquiryButton {
        background-color: #73746E;
        color: #ffffff;
    }

    #subLeaseNoticeArea {
        width: 70%;
        margin: 20px auto;
        text-align: center;
    }

    #subLeaseNoticeArea table {
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
