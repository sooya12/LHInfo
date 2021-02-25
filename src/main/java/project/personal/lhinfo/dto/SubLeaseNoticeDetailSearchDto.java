package project.personal.lhinfo.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class SubLeaseNoticeDetailSearchDto {
    public String AIS_TP_CD;            // 매물유형코드
    public String SPL_INF_TP_CD;        // 공급정보구분코드
    public String PAN_ID;               // 공고 ID
    public String UPP_AIS_TP_CD;        // 상위매물유형코드
    public String CCR_CNNT_SYS_DS_CD;   // 고객센터연계시스템구분코드

    @Override
    public String toString() {
        return "SubLeaseNoticeDetailDto{" +
                "AIS_TP_CD='" + AIS_TP_CD + '\'' +
                ", SPL_INF_TP_CD='" + SPL_INF_TP_CD + '\'' +
                ", PAN_ID='" + PAN_ID + '\'' +
                ", UPP_AIS_TP_CD='" + UPP_AIS_TP_CD + '\'' +
                ", CCR_CNNT_SYS_DS_CD='" + CCR_CNNT_SYS_DS_CD + '\'' +
                '}';
    }
}
