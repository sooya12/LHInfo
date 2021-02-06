package project.personal.lhinfo.dto.SubLeaseNoticeDetail;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class dsEtcInfoNm {              // 기타 정보
    public String ETC_CTS;              // 기타사항
    public String CRC_RSN;              // 정정/취소사유
    public String CTRT_PS_PPR_CTS;      // 계약시구비서류
    public String MBZ_PSB_BZTP_CTS;     // 영업가능업종
    public String RQS_QF_CTS;           // 신청자격
    public String RQS_PS_PPR_CTS;       // 신청시구비서류
    public String ATTN_FCTS;            // 유의사항
    public String PAN_DTL_CTS;          // 공고내용
    public String MSH_SLC_MD_CTS;       // 입점자선정방법
    public String LSTR_CTS;             // 임대기간
    public String ETC_CTS2;             // 기타사항
    public String CAU_FCTS;             // 주의사항
    public String ARAG_RCR_HSH_CTS;     // 모집지역
    public String LSC_CTS;              // 임대조건
    public String ETC_CTS3;             // 공동생활가정운영기관
    public String ETC_FCTS;             // 기타사항
    public String PAN_ETC_INF_CD_NM;    // 기타정보구분
    public String SPL_HO_CNT_CTS;       // 공급호수
    public String SPPT_LMT_AMT_CTS;     // 지원한도액
    public String TRG_HS_CTS;           // 대상주택

    @Override
    public String toString() {
        return "dsEtcInfoNm{" +
                "ETC_CTS='" + ETC_CTS + '\'' +
                ", CRC_RSN='" + CRC_RSN + '\'' +
                ", CTRT_PS_PPR_CTS='" + CTRT_PS_PPR_CTS + '\'' +
                ", MBZ_PSB_BZTP_CTS='" + MBZ_PSB_BZTP_CTS + '\'' +
                ", RQS_QF_CTS='" + RQS_QF_CTS + '\'' +
                ", RQS_PS_PPR_CTS='" + RQS_PS_PPR_CTS + '\'' +
                ", ATTN_FCTS='" + ATTN_FCTS + '\'' +
                ", PAN_DTL_CTS='" + PAN_DTL_CTS + '\'' +
                ", MSH_SLC_MD_CTS='" + MSH_SLC_MD_CTS + '\'' +
                ", LSTR_CTS='" + LSTR_CTS + '\'' +
                ", ETC_CTS2='" + ETC_CTS2 + '\'' +
                ", CAU_FCTS='" + CAU_FCTS + '\'' +
                ", ARAG_RCR_HSH_CTS='" + ARAG_RCR_HSH_CTS + '\'' +
                ", LSC_CTS='" + LSC_CTS + '\'' +
                ", ETC_CTS3='" + ETC_CTS3 + '\'' +
                ", ETC_FCTS='" + ETC_FCTS + '\'' +
                ", PAN_ETC_INF_CD_NM='" + PAN_ETC_INF_CD_NM + '\'' +
                ", SPL_HO_CNT_CTS='" + SPL_HO_CNT_CTS + '\'' +
                ", SPPT_LMT_AMT_CTS='" + SPPT_LMT_AMT_CTS + '\'' +
                ", TRG_HS_CTS='" + TRG_HS_CTS + '\'' +
                '}';
    }
}
