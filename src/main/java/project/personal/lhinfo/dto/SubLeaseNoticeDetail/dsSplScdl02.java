package project.personal.lhinfo.dto.SubLeaseNoticeDetail;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class dsSplScdl02 {          // 공금일정-추첨
    public String CLSG_DTTM;        // 신청예약금입금마감일시
    public String RQS_DTTM;         // 신청일시
    public String PZWR_NT_DTTM;     // 결과게시일정
    public String CTRT_ST_DT;       // 계약체결일정시작일
    public String RNK;              // 순위
    public String LTR_DTTM;         // 추첨일정
    public String CTRT_ED_DT;       // 계약체결일정종료일

    @Override
    public String toString() {
        return "dsSplScdl02{" +
                "CLSG_DTTM='" + CLSG_DTTM + '\'' +
                ", RQS_DTTM='" + RQS_DTTM + '\'' +
                ", PZWR_NT_DTTM='" + PZWR_NT_DTTM + '\'' +
                ", CTRT_ST_DT='" + CTRT_ST_DT + '\'' +
                ", RNK='" + RNK + '\'' +
                ", LTR_DTTM='" + LTR_DTTM + '\'' +
                ", CTRT_ED_DT='" + CTRT_ED_DT + '\'' +
                '}';
    }
}
