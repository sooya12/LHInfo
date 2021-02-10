<%--
  Created by IntelliJ IDEA.
  User: hyeonsu
  Date: 2021-02-01
  Time: 오후 3:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
    <link rel="stylesheet" href="/resources/lhnotice-datepicker.css">
    <title>청약센터 공지사항 조회</title>
</head>
<body>
    <div class="container">
        <jsp:include page="header.jsp"/>
        <div id="titleArea">
            <header>
                <p>청약센터 공고문 조회</p>
            </header>
        </div>
        <div id="selectBoxArea">
            <form id="lhNoticeSearchForm" action="/lhnotice" method="get">
                <div class="selectFormLine">
                    <div class="form-group">
                        <label for="selNoticeType">공고유형 </label>
                        <select class="form-control" id="selNoticeType" name="noticeType">
                            <c:forEach var="noticeType" items="${noticeTypeList}">
                                <option value="${noticeType.code}">${noticeType.info}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="selSearchType">검색범위 </label>
                        <select class="form-control" id="selSearchType" name="searchType">
                            <option value="제목">제목</option>
                            <option value="내용">내용</option>
                        </select>
                    </div>
                    <div id="searchContentArea">
                        <input type="text" class="form-control" id="searchContent" name="searchContent"/>
                    </div>
                </div>
                <div class="selectFormLine">
                    <div>
                        <label for="datepicker-start">시작일 </label>
                        <input type="text" class="form-control" id="datepicker-start" name="startDate" autocomplete="off"/>
                    </div>
                    <div>
                        <label for="datepicker-end">종료일 </label>
                        <input type="text" class="form-control" id="datepicker-end" name="endDate" autocomplete="off"/>
                    </div>
                    <div class="form-button">
                        <button type="submit" class="btn btn-basic" id="inquiryButton">공고문 조회</button>
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
            </form>
        </div>
        <div id="noticeArea">
            <table class="table table-condensed" id="lhNoticeTable">
                <thead>
                    <tr>
                        <th>순번</th>
                        <th>번호</th>
                        <th>제목</th>
                        <th>유형</th>
                        <th>게시일</th>
                    </tr>
                </thead>
                <tbody>
                    <c:choose>
                        <c:when test="${lhnoticeList.size() < 1}">
                            <tr>
                                <td colspan="7" id="noInfomation">해당 공고사항 조회 정보가 없습니다.</td>
                            </tr>
                        </c:when>
                        <c:otherwise>
                            <c:forEach var="lhnotice" items="${lhnoticeList}" varStatus="idx">
                                <tr>
                                    <td><c:out value="${lhnotice.RNUM}"/></td>
                                    <td><c:out value="${lhnotice.BBS_SN}"/></td>
                                    <td><c:out value="${lhnotice.BBS_TL}"/></td>
                                    <td><c:out value="${lhnotice.AIS_TP_CD_NM}"/></td>
                                    <td><c:out value="${lhnotice.BBS_WOU_DTTM}"/></td>
                                    <script type="text/javascript">
                                        $(document).ready(function() {
                                            const line = $("#lhNoticeTable tr:eq(${idx.count}) td:eq(2)");

                                            $(line).hover(function() {
                                                $(this).css("cursor", "pointer");
                                                $(this).css("color", "#759CD8");
                                            });

                                            $(line).mouseout(function() {
                                                $(this).css("color", "#000000");
                                            });

                                            $(line).click(function() {
                                                let link = "${lhnotice.LINK_URL}";
                                                link = link.replace("http", "https");
                                                window.open(link);
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
        <jsp:include page="footer.jsp"/>
    </div>
</body>
</html>
<script>
    $(document).ready(function() {
        if (${currentValue.noticeType != ""}) {
            $("#selNoticeType option[value=${currentValue.noticeType}]").attr("selected", true);
        }

        if(${currentValue.searchType != ""}) {
            $("#selSearchType option[value=${currentValue.searchType}").attr("selected", true);
        }

        $("#searchContent").val("${currentValue.searchContent}");

        $("#selPage option[value=${currentValue.page}]").attr("selected", true);

        $("#datepicker-start").val("${currentValue.startDate}");
        $("#datepicker-end").val("${currentValue.endDate}");

        $("#datepicker-start, #datepicker-end").datepicker({
            changeMonth: true,
            changeYear: true,
            autoSize: true,
            dayNamesMin: ["일", "월", "화", "수", "목", "금", "토"],
            monthNamesShort: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
            showAnim: "slideDown",
            dateFormat: "yy-mm-dd",
            hideIfNoPrevNext: true,
        });

        $("#datepicker-start").datepicker("option", "maxDate", $("#datepicker-end").val());
        $("#datepicker-start").datepicker("option", "onClose", function(selectedDate) {
            $("#datepicker-end").datepicker("option", "minDate", selectedDate);
        });

        $("#datepicker-end").datepicker("option", "maxDate", "0");
        $("#datepicker-end").datepicker("option", "minDate", $("#datepicker-start").val());
        $("#datepicker-end").datepicker("option", "onClose", function(selectedDate) {
            $("#datepicker-start").datepicker("option", "maxDate", selectedDate);
        });
    });
</script>
<style>
    #titleArea {
        width: 70%;
        margin: 10px auto;
        margin-top: 50px;
        text-align: center;
        color: #957767;
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
        color: #957767;
    }

    #selectBoxArea select {
        float: left;
        width: auto;
    }

    #selectBoxArea .form-button {
        float: right;
    }

    #searchContent {
        margin-left: 6px;
    }

    #inquiryButton {
        background-color: #957767;
        color: #ffffff;
    }

    .selectFormLine {
        float: left;
    }

    .selectFormLine .form-control {
        width: min(50%, 600px);
        float: left;
    }

    .selectFormLine #searchContent {
        width: min(20%, 400px);
        float: left;
    }

    .selectFormLine #datepicker-start, .selectFormLine #datepicker-end {
        width: 110px;
        float: left;
    }

    #noticeArea {
        width: 70%;
        margin: 20px auto;
        margin-top: 50px;
        text-align: center;
    }

    #noticeArea table {
        width: 100%;
        margin: 0 auto;
        font-size: min(max(12px, 1vw), 14px);
    }

    #noInfomation {
        text-align: center;
    }

</style>