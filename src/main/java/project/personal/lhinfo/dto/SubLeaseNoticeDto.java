package project.personal.lhinfo.dto;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class SubLeaseNoticeDto {
    public String PAN_SS;               // 공고상태
    public String RNUM;                 // 순번
    public String PAN_NT_ST_DT;         // 공고게시일
    public String AIS_TP_CD;            // 매물유형코드 - 상세정보 API 요청 항목
    public String SPL_INF_TP_CD;        // 공급정보구분코드 - 상세정보 API 요청 항목
    public String CNP_CD_NM;            // 지역명
    public String PAN_ID;               // 공고 ID - 상세정보 API 요청 항목
    public String UPP_AIS_TP_NM;        // 공고유형 명
    public String AIS_TP_CD_NM;         // 공고세부유형명
    public String CLSG_DT;              // 공고마감일
    public String PAN_DT;               // 모집공고일
    public String UPP_AIS_TP_CD;        // 상위매물유형코드 - 상세정보 API 요청 항목
    public String PAN_NM;               // 공고명
    public String ALL_CNT;              // 전체조회건수
    public String DTL_URL;              // 공고상세 URL
    public String CCR_CNNT_SYS_DS_CD;   // 고객센터연계시스템구분코드 - 상세정보 API 요청 항목

    @Override
    public String toString() {
        return "SubLeaseNoticeDto{" +
                "PAN_SS='" + PAN_SS + '\'' +
                ", RNUM='" + RNUM + '\'' +
                ", PAN_NT_ST_DT='" + PAN_NT_ST_DT + '\'' +
                ", AIS_TP_CD='" + AIS_TP_CD + '\'' +
                ", SPL_INF_TP_CD='" + SPL_INF_TP_CD + '\'' +
                ", CNP_CD_NM='" + CNP_CD_NM + '\'' +
                ", PAN_ID='" + PAN_ID + '\'' +
                ", UPP_AIS_TP_NM='" + UPP_AIS_TP_NM + '\'' +
                ", AIS_TP_CD_NM='" + AIS_TP_CD_NM + '\'' +
                ", CLSG_DT='" + CLSG_DT + '\'' +
                ", PAN_DT='" + PAN_DT + '\'' +
                ", UPP_AIS_TP_CD='" + UPP_AIS_TP_CD + '\'' +
                ", PAN_NM='" + PAN_NM + '\'' +
                ", ALL_CNT='" + ALL_CNT + '\'' +
                ", DTL_URL='" + DTL_URL + '\'' +
                ", CCR_CNNT_SYS_DS_CD='" + CCR_CNNT_SYS_DS_CD + '\'' +
                '}';
    }
}
