package project.personal.lhinfo.dto.SubLeaseNoticeDetail;

public class dsSbdDongAhfl {                    // 단지 내 상가 동별 이미지정보
    public String CMN_AHFL_NM;                  // 첨부파일명
    public String AHFL_URL;                     // 다운로드
    public String DNG_HS_NO;                    // 상가명
    public String SBD_LGO_NM;                   // 단지명
    public String LS_SPL_INF_UPL_FL_DS_CD_NM;   // 파일구분명

    @Override
    public String toString() {
        return "dsSbdDongAhfl{" +
                "CMN_AHFL_NM='" + CMN_AHFL_NM + '\'' +
                ", AHFL_URL='" + AHFL_URL + '\'' +
                ", DNG_HS_NO='" + DNG_HS_NO + '\'' +
                ", SBD_LGO_NM='" + SBD_LGO_NM + '\'' +
                ", LS_SPL_INF_UPL_FL_DS_CD_NM='" + LS_SPL_INF_UPL_FL_DS_CD_NM + '\'' +
                '}';
    }
}
