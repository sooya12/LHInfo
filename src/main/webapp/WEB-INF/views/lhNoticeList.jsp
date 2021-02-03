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
    <link rel="stylesheet" href="/resources/main.css">
    <title>청약센터 공지사항 조회</title>
</head>
<body>
    <div class="container">
        <jsp:include page="header.jsp"/>
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
                        <c:when test="${noticeList.size() < 1}">
                            <tr>
                                <td colspan="7" id="noInfomation">해당 공고사항 조회 정보가 없습니다.</td>
                            </tr>
                        </c:when>
                        <c:otherwise>
                            <c:forEach var="notice" items="${noticeList}" varStatus="idx">
                                <tr>
                                    <td><c:out value="${notice.RNUM}"/></td>
                                    <td><c:out value="${notice.BBS_SN}"/></td>
                                    <td><c:out value="${notice.BBS_TL}"/></td>
                                    <td><c:out value="${notice.AIS_TP_CD_NM}"/></td>
                                    <td><c:out value="${notice.BBS_WOU_DTTM}"/></td>
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
                                                let link = "${notice.LINK_URL}";
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

</script>
<style>
    #noticeArea {
        width: 70%;
        margin: 20px auto;
        margin-top: 50px;
        text-align: center;
    }

    #noticeArea table {
        width: 100%;
        margin: 0 auto;
        font-size: min(max(10px, 1vw), 14px);
    }

    #noInfomation {
        text-align: center;
    }
</style>