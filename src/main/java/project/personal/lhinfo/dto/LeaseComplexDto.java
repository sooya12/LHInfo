package project.personal.lhinfo.dto;

import lombok.*;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class LeaseComplexDto {
    public String DDO_AR;       // 전용면적
    public String RFE;          // 월임대료
    public String SUM_HSH_CNT;  // 총세대수
    public String RNUM;         // 순번
    public String SBD_LGO_NM;   // 단지명
    public String MVIN_XPC_YM;  // 최초입주년월
    public String ARA_NM;       // 지역명
    public String HSH_CNT;      // 세대수
    public String ALL_CNT;      // 전체건수
    public String AIS_TP_CD_NM; // 공급유형명
    public String LS_GMY;       // 임대보증금

    @Override
    public String toString() {
        return "LeaseComplexDto{" +
                "DDO_AR='" + DDO_AR + '\'' +
                ", RFE='" + RFE + '\'' +
                ", SUM_HSH_CNT='" + SUM_HSH_CNT + '\'' +
                ", RNUM='" + RNUM + '\'' +
                ", SBD_LGO_NM='" + SBD_LGO_NM + '\'' +
                ", MVIN_XPC_YM='" + MVIN_XPC_YM + '\'' +
                ", ARA_NM='" + ARA_NM + '\'' +
                ", HSH_CNT='" + HSH_CNT + '\'' +
                ", ALL_CNT='" + ALL_CNT + '\'' +
                ", AIS_TP_CD_NM='" + AIS_TP_CD_NM + '\'' +
                ", LS_GMY='" + LS_GMY + '\'' +
                '}';
    }
}
