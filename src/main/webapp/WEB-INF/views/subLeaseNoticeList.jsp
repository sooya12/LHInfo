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
    <%@ include file="/resources/main.html" %>
    <link rel="stylesheet" href="/resources/main.css"/>
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
        <div class="noticeContent">
            <span>
                LH에서 관리하는 공지사항, 채용공고, 분양임대주택 공고 등 각종 공고 정보를 제공<br><br>
                분양임대 공고문의 공고유형, 공고명, 지역, 공고게시일 정보 조회가 가능합니다.<br>
                공고명을 클릭하시면 위치와 상권 정보를 포함한 상세 정보를 조회하실 수 있습니다.
            </span>
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
                        <button type="button" class="btn btn-basic" id="inquiryButton">공고문 조회</button>
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
                                <form class="submitForm" action="/subleasenotice/detail" method="get">
                                    <input type="hidden" name="AIS_TP_CD" value="${subLeaseNotice.AIS_TP_CD}"/>
                                    <input type="hidden" name="SPL_INF_TP_CD" value="${subLeaseNotice.SPL_INF_TP_CD}"/>
                                    <input type="hidden" name="PAN_ID" value="${subLeaseNotice.PAN_ID}"/>
                                    <input type="hidden" name="UPP_AIS_TP_CD" value="${subLeaseNotice.UPP_AIS_TP_CD}"/>
                                    <input type="hidden" name="CCR_CNNT_SYS_DS_CD" value="${subLeaseNotice.CCR_CNNT_SYS_DS_CD}"/>
                                </form>
                                <script type="text/javascript">
                                    $(document).ready(function () {
                                        const line = $("#subLeaseNoticeTable tr:eq(${idx.count}) td:eq(2)");

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
                                            $(".submitForm").submit();
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

        $("#datepicker-start-end").datepicker("option", "maxDate", "0");

        $("#datepicker-start-start").datepicker("option", "maxDate", $("#datepicker-start-end").datepicker("option", "maxDate"));
        $("#datepicker-start-start").datepicker("option", "onClose", function(selectedDate) {
            $("#datepicker-start-end").datepicker("option", "minDate", selectedDate);
        })

        $("#datepicker-start-end").datepicker("option", "minDate", $("#datepicker-start-start").val());
        $("#datepicker-start-end").datepicker("option", "onClose", function(selectedDate) {
            $("#datepicker-start-start").datepicker("option", "maxDate", selectedDate);
        });

        $("#datepicker-end-start").datepicker("option", "maxDate", $("#datepicker-end-end").val());
        $("#datepicker-end-start").datepicker("option", "onClose", function(selectedDate) {
            $("#datepicker-end-end").datepicker("option", "minDate", selectedDate);
        });

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

    var dataSourceArr = [1];
    var allCnt = "${totalCnt}";
    for (var i = 2; i <= allCnt; i++) {
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

    $("#inquiryButton").click(function() {
        $.ajax({
            type: "POST",
            async: false,
            url: "/account/createAccountLookup",
            data: {accountid: "<%=request.getSession().getAttribute("accountId")%>",
                type1: document.querySelector("#selLocation").options[document.querySelector("#selLocation").selectedIndex].text,
                type2: document.querySelector("#selNoticeType").options[document.querySelector("#selNoticeType").selectedIndex].text,
                category: "분양임대",
                url: "http://localhost:8080/subleasenotice/list?location=" + $("#selLocation").val() + "&noticeType=" + $("#selNoticeType").val() + "&page=1"
            },
            dataType: "text",
            success: function(data) {
                if(data == "success") {
                    $("#subLeaseNoticeSearchForm").submit();
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
        color: #73746E;
    }

    #titleArea p {
        font-size: min(max(3vw, 20px), 40px);
        font-weight: bold;
    }

    .noticeContent {
        width: 90%;
        height: auto;
        float: none;
        margin: 0 auto;
        margin-bottom: 40px;
        text-align: center;
        color: #73746E;
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

    .ui-datepicker {
        font-family: "MapoPeacefull";
    }

    .ui-datepicker-header {
        background-color: #73746E;
    }

    select.ui-datepicker-month, select.ui-datepicker-year {
        font-family: "MapoPeacefull";
    }

    .ui-datepicker-calendar > tbody tr td a.ui-state-default {
        background-color: #ffffff;
        color: #73746E;
    }

    .ui-datepicker-calendar > tbody tr td a.ui-state-highlight {
        background-color: #73746E;
        border: #73746E;
        color: #3a3b38;
    }

    .ui-datepicker-calendar > tbody tr td a.ui-state-active {
        background-color: #3a3b38;
        border: #3a3b38;
        color: #ffffff;
    }

    #paginationArea .paginationjs {
        width: fit-content;
        margin: 0 auto;
        font-family: "MapoPeacefull";
    }

</style>
