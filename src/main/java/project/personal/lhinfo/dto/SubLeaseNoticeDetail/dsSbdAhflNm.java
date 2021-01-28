package project.personal.lhinfo.dto.SubLeaseNoticeDetail;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class dsSbdAhflNm {                      // 단지 첨부파일 정보
    public String LCC_NT_NM;                    // 단지명
    public String CMN_AHFL_NM;                  // 첨부파일명
    public String AHFL_URL;                     // 다운로드
    public String LS_SPL_INF_UPL_FL_DS_CD_NM;   // 파일구분명
    public String SL_PAN_AHFL_DS_CD_NM;         // 파일구분명
    public String BZDT_NM;                      // 단지명

    @Override
    public String toString() {
        return "dsSbdAhflNm{" +
                "LCC_NT_NM='" + LCC_NT_NM + '\'' +
                ", CMN_AHFL_NM='" + CMN_AHFL_NM + '\'' +
                ", AHFL_URL='" + AHFL_URL + '\'' +
                ", LS_SPL_INF_UPL_FL_DS_CD_NM='" + LS_SPL_INF_UPL_FL_DS_CD_NM + '\'' +
                ", SL_PAN_AHFL_DS_CD_NM='" + SL_PAN_AHFL_DS_CD_NM + '\'' +
                ", BZDT_NM='" + BZDT_NM + '\'' +
                '}';
    }
}
