<%--
  Created by IntelliJ IDEA.
  User: hyeonsu
  Date: 2021-01-26
  Time: 오후 4:33
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
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f71a931fcbbd7c297a88e94cacd0b2e4&libraries=services,clusterer,drawing"></script>
    <title>분양임대 공고문 조회</title>
</head>
<body>
    <div class="container">
        <jsp:include page="header.jsp"/>
        <jsp:include page="menu.jsp"/>
        <div id="detailArea">
            <div id="title">
                <header>
                    <p id="noticeName"></p>
                </header>
                <p><span class="label" id="noticeStatus"></span></p>
                <div class="infoArea">
                    <table class="infoTable" id="noticeInfo">
                        <tr><th>지역</th><td></td></tr>
                        <tr><th>공고유형</th><td></td></tr>
                        <tr><th>세부유형</th><td></td></tr>
                    </table>
                </div>
            </div>
            <div id="map" style="width: 500px; height: 400px;"></div>
            <script>
                var geocoder = new kakao.maps.services.Geocoder();

                var callback = function(result, status) {
                    if (status === kakao.maps.services.Status.OK) {
                        var x = result[0].x;
                        var y = result[0].y;

                        var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
                        var options = { //지도를 생성할 때 필요한 기본 옵션
                            center: new kakao.maps.LatLng(y, x), //지도의 중심좌표.
                            level: 5 //지도의 레벨(확대, 축소 정도)
                        };

                        var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴

                        var markerPosition = new kakao.maps.LatLng(y, x);

                        var marker = new kakao.maps.Marker({
                            position: markerPosition
                        });

                        marker.setMap(map);
                    }
                };

                var receptionAddr = "${detail.dsCtrtPlc.get(0).CTRT_PLC_ADR}";
                var complexAddr;
                if("${detail.dsSbd.get(0).LCT_ARA_ADR}" == "") {
                    complexAddr = "${detail.dsSbd.get(0).LGDN_ADR}";
                } else {
                    complexAddr = "${detail.dsSbd.get(0).LCT_ARA_ADR}";
                }

                if(receptionAddr == "" && complexAddr == "") {
                    $("#map").remove();
                }

                if(complexAddr != "") {
                    geocoder.addressSearch(complexAddr, callback);
                } else if(receptionAddr != "") {
                    geocoder.addressSearch(receptionAddr, callback);
                }
            </script>
            <c:if test="${detail.dsSbd.size() > 0}">
                <div id="complex">
                    <header>
                        <p><i class="fas fa-home-lg"></i></i> 단지 정보</p>
                    </header>
                    <div class="infoArea">
                        <c:forEach var="complex" items="${detail.dsSbd}" varStatus="idx">
                            <table class="infoTable">
                                <tr><th>${detail.dsSbdNm.get(0).LCC_NT_NM          }</th><td>${complex.LCC_NT_NM          }</td></tr>
                                <tr><th>${detail.dsSbdNm.get(0).SBD_NM             }</th><td>${complex.SBD_NM             }</td></tr>
                                <tr><th>${detail.dsSbdNm.get(0).SBD_LGO_NM         }</th><td>${complex.SBD_LGO_NM         }</td></tr>
                                <tr><th>${detail.dsSbdNm.get(0).BZDT_NM            }</th><td>${complex.BZDT_NM            }</td></tr>
                                <tr><th>${detail.dsSbdNm.get(0).LGDN_ADR           }</th><td>${complex.LGDN_ADR           }</td></tr>
                                <tr><th>${detail.dsSbdNm.get(0).LGDN_DTL_ADR       }</th><td>${complex.LGDN_DTL_ADR       }</td></tr>
                                <tr><th>${detail.dsSbdNm.get(0).LCT_ARA_ADR        }</th><td>${complex.LCT_ARA_ADR        }</td></tr>
                                <tr><th>${detail.dsSbdNm.get(0).LCT_ARA_DTL_ADR    }</th><td>${complex.LCT_ARA_DTL_ADR    }</td></tr>
                                <tr><th>${detail.dsSbdNm.get(0).SBD_INF_CTS        }</th><td>${complex.SBD_INF_CTS        }</td></tr>
                                <tr><th>${detail.dsSbdNm.get(0).MVIN_XPC_YM        }</th><td>${complex.MVIN_XPC_YM        }</td></tr>
                                <tr><th>${detail.dsSbdNm.get(0).MSH_XPC_CTS        }</th><td>${complex.MSH_XPC_CTS        }</td></tr>
                                <tr><th>${detail.dsSbdNm.get(0).DDO_AR             }</th><td>${complex.DDO_AR             }</td></tr>
                                <tr><th>${detail.dsSbdNm.get(0).MIN_MAX_RSDN_DDO_AR}</th><td>${complex.MIN_MAX_RSDN_DDO_AR}</td></tr>
                                <tr><th>${detail.dsSbdNm.get(0).HSH_CNT            }</th><td>${complex.HSH_CNT            }</td></tr>
                                <tr><th>${detail.dsSbdNm.get(0).SUM_TOT_HSH_CNT    }</th><td>${complex.SUM_TOT_HSH_CNT    }</td></tr>
                                <tr><th>${detail.dsSbdNm.get(0).HTN_FMLA_DESC      }</th><td>${complex.HTN_FMLA_DESC      }</td></tr>
                                <tr><th>${detail.dsSbdNm.get(0).HTN_FMLA_DS_CD_NM  }</th><td>${complex.HTN_FMLA_DS_CD_NM  }</td></tr>
                                <tr><th>${detail.dsSbdNm.get(0).TFFC_FCL_CTS       }</th><td>${complex.TFFC_FCL_CTS       }</td></tr>
                                <tr><th>${detail.dsSbdNm.get(0).EDC_FCL_CTS        }</th><td>${complex.EDC_FCL_CTS        }</td></tr>
                                <tr><th>${detail.dsSbdNm.get(0).CVN_FCL_CTS        }</th><td>${complex.CVN_FCL_CTS        }</td></tr>
                                <tr><th>${detail.dsSbdNm.get(0).IDT_FCL_CTS        }</th><td>${complex.IDT_FCL_CTS        }</td></tr>
                                <tr><th>${detail.dsSbdNm.get(0).SC_AR              }</th><td>${complex.SC_AR              }</td></tr>
                                <tr><th>${detail.dsSbdNm.get(0).SPL_INF_GUD_FCTS   }</th><td>${complex.SPL_INF_GUD_FCTS   }</td></tr>
                            </table>
                        </c:forEach>
                    </div>
                </div>
            </c:if>
            <c:if test="${detail.dsSbdAhfl.size() > 0}">
                <div id="complexAttachment">
                    <header>
                        <p><i class="far fa-paperclip"></i> 단지 첨부 정보</p>
                    </header>
                    <div class="infoArea">
                        <c:forEach var="attachment" items="${detail.dsSbdAhfl}" varStatus="idx">
                            <table class="infoTable attachTable">
                                <tr><th>${detail.dsSbdAhflNm.get(0).LCC_NT_NM                 }</th><td>${attachment.LCC_NT_NM                 }</td></tr>
                                <tr><th>${detail.dsSbdAhflNm.get(0).BZDT_NM                   }</th><td>${attachment.BZDT_NM                   }</td></tr>
                                <tr><th>${detail.dsSbdAhflNm.get(0).CMN_AHFL_NM               }</th><td>${attachment.CMN_AHFL_NM               }</td></tr>
                                <tr><th>${detail.dsSbdAhflNm.get(0).AHFL_URL                  }</th><td class="ahfl_url">${attachment.AHFL_URL }</td></tr>
                                <tr><th>${detail.dsSbdAhflNm.get(0).LS_SPL_INF_UPL_FL_DS_CD_NM}</th><td>${attachment.LS_SPL_INF_UPL_FL_DS_CD_NM}</td></tr>
                                <tr><th>${detail.dsSbdAhflNm.get(0).SL_PAN_AHFL_DS_CD_NM      }</th><td>${attachment.SL_PAN_AHFL_DS_CD_NM      }</td></tr>
                            </table>
                        </c:forEach>
                    </div>
                </div>
            </c:if>
            <c:if test="${detail.dsSbdDong.size() > 0}">
                <div id="complexStore">
                    <header>
                        <p><i class="far fa-store"></i> 단지 상가 정보</p>
                    </header>
                    <div class="infoArea">
                        <c:forEach var="store" items="${detail.dsSbdDong}" varStatus="idx">
                            <table class="infoTable">
                                <tr><th>${detail.dsSbdDongNm.get(0).SBD_LGO_NM   }</th><td>${store.SBD_LGO_NM   }</td></tr>
                                <tr><th>${detail.dsSbdDongNm.get(0).DNG_HS_NO    }</th><td>${store.DNG_HS_NO    }</td></tr>
                                <tr><th>${detail.dsSbdDongNm.get(0).CTRT_AR      }</th><td>${store.CTRT_AR      }</td></tr>
                                <tr><th>${detail.dsSbdDongNm.get(0).MSH_DT       }</th><td>${store.MSH_DT       }</td></tr>
                                <tr><th>${detail.dsSbdDongNm.get(0).HO_ADM_NO_CNT}</th><td>${store.HO_ADM_NO_CNT}</td></tr>
                            </table>
                        </c:forEach>
                    </div>
                </div>
            </c:if>
            <c:if test="${detail.dsSbdDongAhfl.size() > 0}">
                <div id="complexStoreImage">
                    <header>
                        <p><i class="far fa-store"></i> 단지 상가 사진 정보</p>
                    </header>
                    <div class="infoArea">
                        <c:forEach var="dongAttach" items="${detail.dsSbdDongAhfl}" varStatus="idx">
                            <table class="infoTable attachTable">
                                <tr><th>${detail.dsSbdDongAhflNm.get(0).SBD_LGO_NM                }</th><td>${dongAttach.SBD_LGO_NM                }</td></tr>
                                <tr><th>${detail.dsSbdDongAhflNm.get(0).DNG_HS_NO                 }</th><td>${dongAttach.DNG_HS_NO                 }</td></tr>
                                <tr><th>${detail.dsSbdDongAhflNm.get(0).CMN_AHFL_NM               }</th><td>${dongAttach.CMN_AHFL_NM               }</td></tr>
                                <tr><th>${detail.dsSbdDongAhflNm.get(0).AHFL_URL                  }</th><td class="ahfl_url">${dongAttach.AHFL_URL }</td></tr>
                                <tr><th>${detail.dsSbdDongAhflNm.get(0).LS_SPL_INF_UPL_FL_DS_CD_NM}</th><td>${dongAttach.LS_SPL_INF_UPL_FL_DS_CD_NM}</td></tr>
                            </table>
                        </c:forEach>
                    </div>
                </div>
            </c:if>
            <c:if test="${detail.dsSplScdl.size() > 0}">
                <div id="supply">
                    <header>
                        <p><i class="fas fa-clipboard-list"></i> 공급 정보</p>
                    </header>
                    <div class="infoArea">
                        <c:forEach var="supply" items="${detail.dsSplScdl}" varStatus="idx">
                            <table class="infoTable">
                                <tr><th>${detail.dsSplScdlNm.get(0).SBD_LGO_NM           }</th><td>${supply.SBD_LGO_NM           }</td></tr>
                                <tr><th>${detail.dsSplScdlNm.get(0).RQS_SCD_3            }</th><td>${supply.RQS_SCD_3            }</td></tr>
                                <tr><th>${detail.dsSplScdlNm.get(0).ACP_DTTM             }</th><td>${supply.ACP_DTTM             }</td></tr>
                                <tr><th>${detail.dsSplScdlNm.get(0).ACP_ST_DTTM          }</th><td>${supply.ACP_ST_DTTM          }</td></tr>
                                <tr><th>${detail.dsSplScdlNm.get(0).ACP_ED_DTTM          }</th><td>${supply.ACP_ED_DTTM          }</td></tr>
                                <tr><th>${detail.dsSplScdlNm.get(0).RMK                  }</th><td>${supply.RMK                  }</td></tr>
                                <tr><th>${detail.dsSplScdlNm.get(0).SBSC_ACP_ST_DT       }</th><td>${supply.SBSC_ACP_ST_DT       }</td></tr>
                                <tr><th>${detail.dsSplScdlNm.get(0).SBSC_ACP_CLSG_DT     }</th><td>${supply.SBSC_ACP_CLSG_DT     }</td></tr>
                                <tr><th>${detail.dsSplScdlNm.get(0).UST_ACP_CLSG_DTTM    }</th><td>${supply.UST_ACP_CLSG_DTTM    }</td></tr>
                                <tr><th>${detail.dsSplScdlNm.get(0).UST_ACP_ST_DTTM      }</th><td>${supply.UST_ACP_ST_DTTM      }</td></tr>
                                <tr><th>${detail.dsSplScdlNm.get(0).PPR_ACP_ST_DT        }</th><td>${supply.PPR_ACP_ST_DT        }</td></tr>
                                <tr><th>${detail.dsSplScdlNm.get(0).PPR_ACP_CLSG_DT      }</th><td>${supply.PPR_ACP_CLSG_DT      }</td></tr>
                                <tr><th>${detail.dsSplScdlNm.get(0).PPR_SBM_OPE_ANC_DT   }</th><td>${supply.PPR_SBM_OPE_ANC_DT   }</td></tr>
                                <tr><th>${detail.dsSplScdlNm.get(0).OPB_ED_SCD_2         }</th><td>${supply.OPB_ED_SCD_2         }</td></tr>
                                <tr><th>${detail.dsSplScdlNm.get(0).PZWR_ANC_DT          }</th><td>${supply.PZWR_ANC_DT          }</td></tr>
                                <tr><th>${detail.dsSplScdlNm.get(0).PZWR_PPR_SBM_ED_DT   }</th><td>${supply.PZWR_PPR_SBM_ED_DT   }</td></tr>
                                <tr><th>${detail.dsSplScdlNm.get(0).PZWR_PPR_SBM_ST_DT   }</th><td>${supply.PZWR_PPR_SBM_ST_DT   }</td></tr>
                                <tr><th>${detail.dsSplScdlNm.get(0).CTRT_ST_DT           }</th><td>${supply.CTRT_ST_DT           }</td></tr>
                                <tr><th>${detail.dsSplScdlNm.get(0).CTRT_ED_DT           }</th><td>${supply.CTRT_ED_DT           }</td></tr>
                                <tr><th>${detail.dsSplScdlNm.get(0).LTR_DTTM             }</th><td>${supply.LTR_DTTM             }</td></tr>
                                <tr><th>${detail.dsSplScdlNm.get(0).HS_SBSC_ACP_TRG_CD_NM}</th><td>${supply.HS_SBSC_ACP_TRG_CD_NM}</td></tr>
                                <tr><th>${detail.dsSplScdlNm.get(0).HS_VIE_ST_DT         }</th><td>${supply.HS_VIE_ST_DT         }</td></tr>
                                <tr><th>${detail.dsSplScdlNm.get(0).HS_VIE_ED_DT         }</th><td>${supply.HS_VIE_ED_DT         }</td></tr>
                                <tr><th>${detail.dsSplScdlNm.get(0).SPL_SCD_GUD_FCTS     }</th><td>${supply.SPL_SCD_GUD_FCTS     }</td></tr>
                            </table>
                        </c:forEach>
                    </div>
                </div>
            </c:if>
            <c:if test="${detail.dsSplScdl01.size() > 0}">
                <div id="supply_bidding">
                    <header>
                        <p><i class="fas fa-clipboard-list"></i> 공급-입찰 정보</p>
                    </header>
                    <div class="infoArea">
                        <c:forEach var="supply01" items="${detail.dsSplScdl01}" varStatus="idx">
                            <table class="infoTable">
                                <tr><th>${detail.dsSplScdl01Nm.get(0).RQS_DTTM       }</th><td>${supply01.RQS_DTTM       }</td></tr>
                                <tr><th>${detail.dsSplScdl01Nm.get(0).CLSG_DTTM      }</th><td>${supply01.CLSG_DTTM      }</td></tr>
                                <tr><th>${detail.dsSplScdl01Nm.get(0).RNK            }</th><td>${supply01.RNK            }</td></tr>
                                <tr><th>${detail.dsSplScdl01Nm.get(0).OPB_DTTM       }</th><td>${supply01.OPB_DTTM       }</td></tr>
                                <tr><th>${detail.dsSplScdl01Nm.get(0).OPB_RSL_NT_DTTM}</th><td>${supply01.OPB_RSL_NT_DTTM}</td></tr>
                                <tr><th>${detail.dsSplScdl01Nm.get(0).CTRT_ST_DT     }</th><td>${supply01.CTRT_ST_DT     }</td></tr>
                                <tr><th>${detail.dsSplScdl01Nm.get(0).CTRT_ED_DT     }</th><td>${supply01.CTRT_ED_DT     }</td></tr>
                            </table>
                        </c:forEach>
                    </div>
                </div>
            </c:if>
            <c:if test="${detail.dsSplScdl02.size() > 0}">
                <div id="supply_raffle">
                    <header>
                        <p><i class="fas fa-clipboard-list"></i> 공급-추첨 정보</p>
                    </header>
                    <div class="infoArea">
                        <c:forEach var="supply02" items="${detail.dsSplScdl02}" varStatus="idx">
                            <table class="infoTable">
                                <tr><th>${detail.dsSplScdl02Nm.get(0).RQS_DTTM    }</th><td>${supply02.RQS_DTTM    }</td></tr>
                                <tr><th>${detail.dsSplScdl02Nm.get(0).CLSG_DTTM   }</th><td>${supply02.CLSG_DTTM   }</td></tr>
                                <tr><th>${detail.dsSplScdl02Nm.get(0).LTR_DTTM    }</th><td>${supply02.LTR_DTTM    }</td></tr>
                                <tr><th>${detail.dsSplScdl02Nm.get(0).RNK         }</th><td>${supply02.RNK         }</td></tr>
                                <tr><th>${detail.dsSplScdl02Nm.get(0).PZWR_NT_DTTM}</th><td>${supply02.PZWR_NT_DTTM}</td></tr>
                                <tr><th>${detail.dsSplScdl02Nm.get(0).CTRT_ST_DT  }</th><td>${supply02.CTRT_ST_DT  }</td></tr>
                                <tr><th>${detail.dsSplScdl02Nm.get(0).CTRT_ED_DT  }</th><td>${supply02.CTRT_ED_DT  }</td></tr>
                            </table>
                        </c:forEach>
                    </div>
                </div>
            </c:if>
            <c:if test="${detail.dsEtcList.size() > 0}">
                <div id="apply_qualification">
                    <header>
                        <p><i class="fal fa-id-card"></i> 신청자격 정보</p>
                    </header>
                    <div class="infoArea">
                        <c:forEach var="apply" items="${detail.dsEtcList}" varStatus="idx">
                            <table class="infoTable">
                                <tr><th>${detail.dsEtcListNm.get(0).PAN_ETC_INF_CD_NM}</th><td>${apply.PAN_ETC_INF_CD_NM}</td></tr>
                                <tr><th>${detail.dsEtcListNm.get(0).ETC_CTS          }</th><td>${apply.ETC_CTS          }</td></tr>
                            </table>
                        </c:forEach>
                    </div>
                </div>
            </c:if>
            <c:if test="${detail.dsCtrtPlc.size() > 0}">
                <div id="reception">
                    <header>
                        <p><i class="fad fa-building"></i> 접수처 정보</p>
                    </header>
                    <div class="infoArea">
                        <c:forEach var="reception" items="${detail.dsCtrtPlc}" varStatus="idx">
                            <table class="infoTable">
                                <tr><th>${detail.dsCtrtPlcNm.get(0).CTRT_PLC_ADR    }</th><td>${reception.CTRT_PLC_ADR    }</td></tr>
                                <tr><th>${detail.dsCtrtPlcNm.get(0).CTRT_PLC_DTL_ADR}</th><td>${reception.CTRT_PLC_DTL_ADR}</td></tr>
                                <tr><th>${detail.dsCtrtPlcNm.get(0).SIL_OFC_TLNO    }</th><td>${reception.SIL_OFC_TLNO    }</td></tr>
                                <tr><th>${detail.dsCtrtPlcNm.get(0).SIL_OFC_GUD_FCTS}</th><td>${reception.SIL_OFC_GUD_FCTS}</td></tr>
                                <tr><th>${detail.dsCtrtPlcNm.get(0).SIL_OFC_DT      }</th><td>${reception.SIL_OFC_DT      }</td></tr>
                                <tr><th>${detail.dsCtrtPlcNm.get(0).SIL_OFC_OPEN_DT }</th><td>${reception.SIL_OFC_OPEN_DT }</td></tr>
                                <tr><th>${detail.dsCtrtPlcNm.get(0).SIL_OFC_BCLS_DT }</th><td>${reception.SIL_OFC_BCLS_DT }</td></tr>
                                <tr><th>${detail.dsCtrtPlcNm.get(0).TSK_ST_DTTM     }</th><td>${reception.TSK_ST_DTTM     }</td></tr>
                                <tr><th>${detail.dsCtrtPlcNm.get(0).TSK_ED_DTTM     }</th><td>${reception.TSK_ED_DTTM     }</td></tr>
                                <tr><th>${detail.dsCtrtPlcNm.get(0).TSK_SCD_CTS     }</th><td>${reception.TSK_SCD_CTS     }</td></tr>
                                <tr><th>${detail.dsCtrtPlcNm.get(0).PAN_DTL_CTS     }</th><td>${reception.PAN_DTL_CTS     }</td></tr>
                            </table>
                        </c:forEach>
                    </div>
                </div>
            </c:if>
            <c:if test="${detail.dsEtcInfo.size() > 0}">
                <div id="etc">
                    <header>
                        <p><i class="fad fa-info-circle"></i> 기타 정보</p>
                    </header>
                    <div class="infoArea">
                        <c:forEach var="etc" items="${detail.dsEtcInfo}" varStatus="idx">
                            <table class="infoTable">
                                <tr><th>${detail.dsEtcInfoNm.get(0).ETC_CTS          }</th><td>${etc.ETC_CTS          }</td></tr>
                                <tr><th>${detail.dsEtcInfoNm.get(0).CRC_RSN          }</th><td>${etc.CRC_RSN          }</td></tr>
                                <tr><th>${detail.dsEtcInfoNm.get(0).CTRT_PS_PPR_CTS  }</th><td>${etc.CTRT_PS_PPR_CTS  }</td></tr>
                                <tr><th>${detail.dsEtcInfoNm.get(0).MBZ_PSB_BZTP_CTS }</th><td>${etc.MBZ_PSB_BZTP_CTS }</td></tr>
                                <tr><th>${detail.dsEtcInfoNm.get(0).RQS_QF_CTS       }</th><td>${etc.RQS_QF_CTS       }</td></tr>
                                <tr><th>${detail.dsEtcInfoNm.get(0).RQS_PS_PPR_CTS   }</th><td>${etc.RQS_PS_PPR_CTS   }</td></tr>
                                <tr><th>${detail.dsEtcInfoNm.get(0).ATTN_FCTS        }</th><td>${etc.ATTN_FCTS        }</td></tr>
                                <tr><th>${detail.dsEtcInfoNm.get(0).PAN_DTL_CTS      }</th><td>${etc.PAN_DTL_CTS      }</td></tr>
                                <tr><th>${detail.dsEtcInfoNm.get(0).MSH_SLC_MD_CTS   }</th><td>${etc.MSH_SLC_MD_CTS   }</td></tr>
                                <tr><th>${detail.dsEtcInfoNm.get(0).LSTR_CTS         }</th><td>${etc.LSTR_CTS         }</td></tr>
                                <tr><th>${detail.dsEtcInfoNm.get(0).ETC_CTS2         }</th><td>${etc.ETC_CTS2         }</td></tr>
                                <tr><th>${detail.dsEtcInfoNm.get(0).CAU_FCTS         }</th><td>${etc.CAU_FCTS         }</td></tr>
                                <tr><th>${detail.dsEtcInfoNm.get(0).ARAG_RCR_HSH_CTS }</th><td>${etc.ARAG_RCR_HSH_CTS }</td></tr>
                                <tr><th>${detail.dsEtcInfoNm.get(0).LSC_CTS          }</th><td>${etc.LSC_CTS          }</td></tr>
                                <tr><th>${detail.dsEtcInfoNm.get(0).SPL_HO_CNT_CTS   }</th><td>${etc.SPL_HO_CNT_CTS   }</td></tr>
                                <tr><th>${detail.dsEtcInfoNm.get(0).SPPT_LMT_AMT_CTS }</th><td>${etc.SPPT_LMT_AMT_CTS }</td></tr>
                                <tr><th>${detail.dsEtcInfoNm.get(0).TRG_HS_CTS       }</th><td>${etc.TRG_HS_CTS       }</td></tr>
                                <tr><th>${detail.dsEtcInfoNm.get(0).ETC_CTS3         }</th><td>${etc.ETC_CTS3         }</td></tr>
                                <tr><th>${detail.dsEtcInfoNm.get(0).ETC_FCTS         }</th><td>${etc.ETC_FCTS         }</td></tr>
                                <tr><th>${detail.dsEtcInfoNm.get(0).PAN_ETC_INF_CD_NM}</th><td>${etc.PAN_ETC_INF_CD_NM}</td></tr>
                            </table>
                        </c:forEach>
                    </div>
                </div>
            </c:if>
            <c:if test="${detail.dsAhflInfo.size() > 0}">
                <div id="attachment">
                    <header>
                        <p><i class="fas fa-paperclip"></i> 첨부 정보</p>
                    </header>
                    <div class="infoArea">
                        <c:forEach var="attachment" items="${detail.dsAhflInfo}" varStatus="idx">
                            <table class="infoTable attachTable">
                                <tr><th>${detail.dsAhflInfoNm.get(0).CMN_AHFL_NM         }</th><td>${attachment.CMN_AHFL_NM              }</td></tr>
                                <tr><th>${detail.dsAhflInfoNm.get(0).AHFL_URL            }</th><td class="ahfl_url">${attachment.AHFL_URL}</td></tr>
                                <tr><th>${detail.dsAhflInfoNm.get(0).SL_PAN_AHFL_DS_CD_NM}</th><td>${attachment.SL_PAN_AHFL_DS_CD_NM     }</td></tr>
                            </table>
                        </c:forEach>
                    </div>
                </div>
            </c:if>
        </div>
        <jsp:include page="footer.jsp"/>
    </div>
    <script type="text/javascript">
        const tmp = document.getElementsByTagName("td").length;

        for (let i = 0; i < tmp; i++) {
            let str = document.getElementsByTagName("td")[i].innerText;
            str = str.replaceAll(" o", "\r\n o").replaceAll("※", "\r\n ※").replaceAll("ㅇ", "\r\n ㅇ").replaceAll(" *", "\r\n\r\n *").replaceAll(" -", "\r\n -");
            document.getElementsByTagName("td")[i].innerText = str;

            if(document.getElementsByTagName("th")[i].innerText != "") {
                document.getElementsByTagName("tr")[i].setAttribute("style", "border-bottom: 1px solid #CDC4B3;");
                document.getElementsByTagName("th")[i].setAttribute("style", "padding: 10px 0 10px 0;");
                document.getElementsByTagName("td")[i].setAttribute("style", "padding: 10px 0 10px 0;");
            }
        }

        $(".ahfl_url").hover(function() {
            $(this).css("cursor", "pointer");
            $(this).css("color", "#759CD8");
        });

        $(".ahfl_url").mouseout(function() {
            $(this).css("color", "#000000");
        })

        $(".ahfl_url").click(function() {
            let url = $(this).html();
            window.open(url);
        });
    </script>
</body>
</html>
<script>
    $(document).ready(function() {
        $("#noticeName").html(sessionStorage.getItem("noticeName"));
        $("#noticeInfo tr:eq(1) td:eq(0)").html(sessionStorage.getItem("noticeType"));
        $("#noticeInfo tr:eq(2) td:eq(0)").html(sessionStorage.getItem("noticeDetailType"));
        $("#noticeInfo tr:eq(0) td:eq(0)").html(sessionStorage.getItem("locationName"));
        $("#noticeStatus").html(sessionStorage.getItem("noticeStatus"));

        switch (sessionStorage.getItem("noticeStatus")) {
            case "공고중":
                $(".label").addClass("label-primary");
                break;
            case "접수중":
                $(".label").addClass("label-danger");
                break;
            case "접수마감":
                $(".label").addClass("label-default");
                break;
            case "상담요청":
                $(".label").addClass("label-warning");
                break;
            case "정정공고중":
                $(".label").addClass("label-info");
                break;
        };
    });
</script>
<style>
    #detailArea {
        width: 70%;
        height: auto;
        text-align: center;
        margin: 20px auto;
    }

    #detailArea div {
        width: 100%;
        height: auto;
        /*border: #6F362D 1px solid;*/
        margin: 30px auto;
    }

    #detailArea header {
        color: #6F362D;
        font-size: large;
    }

    #title header {
        margin: 10px auto;
    }

    #noticeName {
        color: #4E211F;
        font-size: x-large;
    }

    #detailArea .infoArea {
        width: 100%;
        margin: 0 auto;
        border: #6F362D 1px solid;
    }

    #detailArea table {
        width: 90%;
        margin: 10px auto;
        font-size: max(1vw, 13px);
        padding: 10px;
    }

    #detailArea th {
        width: 30%;
    }

    #detailArea td {
        width: 70%;
        padding-left: 20px;
    }

    .attachTable {
        border: 1px solid #CDC4B3;
        border-collapse: collapse;
    }
</style>