package project.personal.lhinfo.dto.SubLeaseNoticeDetail;

public class dsEtcList {                // 신청자격 정보
    public String PAN_ETC_INF_CD_NM;    // 신청자격구분
    public String ETC_CTS;              // 신청자격세부자격요건

    @Override
    public String toString() {
        return "dsEtcList{" +
                "PAN_ETC_INF_CD_NM='" + PAN_ETC_INF_CD_NM + '\'' +
                ", ETC_CTS='" + ETC_CTS + '\'' +
                '}';
    }
}
