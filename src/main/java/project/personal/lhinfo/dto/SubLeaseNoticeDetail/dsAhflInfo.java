package project.personal.lhinfo.dto.SubLeaseNoticeDetail;

public class dsAhflInfo {               // 첨부파일 정보
    public String CMN_AHFL_NM;          // 첨부파일명
    public String AHFL_URL;             // 다운로드
    public String SL_PAN_AHFL_DS_CD_NM; // 파일구분명

    @Override
    public String toString() {
        return "dsAhflInfo{" +
                "CMN_AHFL_NM='" + CMN_AHFL_NM + '\'' +
                ", AHFL_URL='" + AHFL_URL + '\'' +
                ", SL_PAN_AHFL_DS_CD_NM='" + SL_PAN_AHFL_DS_CD_NM + '\'' +
                '}';
    }
}
