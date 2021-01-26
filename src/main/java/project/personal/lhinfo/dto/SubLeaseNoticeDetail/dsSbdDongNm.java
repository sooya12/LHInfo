package project.personal.lhinfo.dto.SubLeaseNoticeDetail;

public class dsSbdDongNm {          // 단지내상가동정보
    public String HO_ADM_NO_CNT;    // 상가전체호수
    public String MSH_DT;           // 상가입점시기
    public String DNG_HS_NO;        // 상가명
    public String SBD_LGO_NM;       // 단지명
    public String CTRT_AR;          // 상가면적

    @Override
    public String toString() {
        return "dsSbdDongNm{" +
                "HO_ADM_NO_CNT='" + HO_ADM_NO_CNT + '\'' +
                ", MSH_DT='" + MSH_DT + '\'' +
                ", DNG_HS_NO='" + DNG_HS_NO + '\'' +
                ", SBD_LGO_NM='" + SBD_LGO_NM + '\'' +
                ", CTRT_AR='" + CTRT_AR + '\'' +
                '}';
    }
}
