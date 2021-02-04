package project.personal.lhinfo.dto.SubLeaseNoticeDetail;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class dsSplScdlNm {                  // 공급 정보
    public String SBSC_ACP_CLSG_DT;         // 접수기간종료일
    public String PPR_SBM_OPE_ANC_DT;       // 서류제출대상자발표일
    public String CTRT_ST_DT;               // 계약기간시작일
    public String SBD_LGO_NM;               // 단지명
    public String PPR_ACP_ST_DT;            // 서류접수기간시작일
    public String SBSC_ACP_ST_DT;           // 접수기간시작일
    public String PPR_ACP_CLSG_DT;          // 서류접수기간종료일
    public String PZWR_ANC_DT;              // 당첨자발표일
    public String CTRT_ED_DT;               // 계약기간종료일
    public String ACP_ED_DTTM;              // 신청종료일시
    public String ACP_ST_DTTM;              // 신청시작일시
    public String LTR_DTTM;                 // 추첨일시
    public String HS_VIE_ED_DT;             // 주택열람기간종료일
    public String HS_VIE_ST_DT;             // 주택열람기간시작일
    public String HS_SBSC_ACP_TRG_CD_NM;    // 구분
    public String SPL_SCD_GUD_FCTS;         // 공급일정안내사항
    public String ACP_DTTM;                 // 신청일시
    public String PZWR_PPR_SBM_ED_DT;       // 당첨자서류제출기간종료일
    public String RMK;                      // 신청방법
    public String PZWR_PPR_SBM_ST_DT;       // 당첨자서류제출기간시작일
    public String OPB_ED_SCD_2;             // 결과발표일시
    public String RQS_SCD_3;                // 신청일시
    public String UST_ACP_CLSG_DTTM;        // 접수기간종료일
    public String UST_ACP_ST_DTTM;          // 접수기간시작일

    @Override
    public String toString() {
        return "dsSplScdlNm{" +
                "SBSC_ACP_CLSG_DT='" + SBSC_ACP_CLSG_DT + '\'' +
                ", PPR_SBM_OPE_ANC_DT='" + PPR_SBM_OPE_ANC_DT + '\'' +
                ", CTRT_ST_DT='" + CTRT_ST_DT + '\'' +
                ", SBD_LGO_NM='" + SBD_LGO_NM + '\'' +
                ", PPR_ACP_ST_DT='" + PPR_ACP_ST_DT + '\'' +
                ", SBSC_ACP_ST_DT='" + SBSC_ACP_ST_DT + '\'' +
                ", PPR_ACP_CLSG_DT='" + PPR_ACP_CLSG_DT + '\'' +
                ", PZWR_ANC_DT='" + PZWR_ANC_DT + '\'' +
                ", CTRT_ED_DT='" + CTRT_ED_DT + '\'' +
                ", ACP_ED_DTTM='" + ACP_ED_DTTM + '\'' +
                ", ACP_ST_DTTM='" + ACP_ST_DTTM + '\'' +
                ", LTR_DTTM='" + LTR_DTTM + '\'' +
                ", HS_VIE_ED_DT='" + HS_VIE_ED_DT + '\'' +
                ", HS_VIE_ST_DT='" + HS_VIE_ST_DT + '\'' +
                ", HS_SBSC_ACP_TRG_CD_NM='" + HS_SBSC_ACP_TRG_CD_NM + '\'' +
                ", SPL_SCD_GUD_FCTS='" + SPL_SCD_GUD_FCTS + '\'' +
                ", ACP_DTTM='" + ACP_DTTM + '\'' +
                ", PZWR_PPR_SBM_ED_DT='" + PZWR_PPR_SBM_ED_DT + '\'' +
                ", RMK='" + RMK + '\'' +
                ", PZWR_PPR_SBM_ST_DT='" + PZWR_PPR_SBM_ST_DT + '\'' +
                ", OPB_ED_SCD_2='" + OPB_ED_SCD_2 + '\'' +
                ", RQS_SCD_3='" + RQS_SCD_3 + '\'' +
                ", UST_ACP_CLSG_DTTM='" + UST_ACP_CLSG_DTTM + '\'' +
                ", UST_ACP_ST_DTTM='" + UST_ACP_ST_DTTM + '\'' +
                '}';
    }
}
