package project.personal.lhinfo.dto.SubLeaseNoticeDetail;

public class dsCtrtPlcNm {            // 접수처 정보
    public String TSK_ST_DTTM;      // 운영기간시작일시
    public String SIL_OFC_TLNO;     // 전화번호
    public String TSK_ED_DTTM;      // 운영기간종료일시
    public String SIL_OFC_GUD_FCTS; // 접수처안내사항
    public String CTRT_PLC_ADR;     // 접수처소재지주소
    public String CTRT_PLC_DTL_ADR; // 접수처소재지상세주소
    public String PAN_DTL_CTS;      // 공고내용
    public String SIL_OFC_OPEN_DT;  // 운영기간시작일시
    public String SIL_OFC_BCLS_DT;  // 운영기간종료일시
    public String SIL_OFC_DT;       // 운영기간
    public String TSK_SCD_CTS;      // 일정내용

    @Override
    public String toString() {
        return "dsCtrtPlcNm{" +
                "TSK_ST_DTTM='" + TSK_ST_DTTM + '\'' +
                ", SIL_OFC_TLNO='" + SIL_OFC_TLNO + '\'' +
                ", TSK_ED_DTTM='" + TSK_ED_DTTM + '\'' +
                ", SIL_OFC_GUD_FCTS='" + SIL_OFC_GUD_FCTS + '\'' +
                ", CTRT_PLC_ADR='" + CTRT_PLC_ADR + '\'' +
                ", CTRT_PLC_DTL_ADR='" + CTRT_PLC_DTL_ADR + '\'' +
                ", PAN_DTL_CTS='" + PAN_DTL_CTS + '\'' +
                ", SIL_OFC_OPEN_DT='" + SIL_OFC_OPEN_DT + '\'' +
                ", SIL_OFC_BCLS_DT='" + SIL_OFC_BCLS_DT + '\'' +
                ", SIL_OFC_DT='" + SIL_OFC_DT + '\'' +
                ", TSK_SCD_CTS='" + TSK_SCD_CTS + '\'' +
                '}';
    }
}
