package project.personal.lhinfo.dto.SubLeaseNoticeDetail;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class dsSplScdl01 {          // 공급일정-입찰
    public String CLSG_DTTM;        // 입찰보증금납부일시
    public String OPB_RSL_NT_DTTM;  // 개찰결과게시일시
    public String RQS_DTTM;         // 신청일시
    public String CTRT_ST_DT;       // 계약체결일정시작일
    public String OPB_DTTM;         // 개찰일시
    public String RNK;              // 순위
    public String CTRT_ED_DT;       // 계약체결일정종료일

    @Override
    public String toString() {
        return "dsSplScdl01{" +
                "CLSG_DTTM='" + CLSG_DTTM + '\'' +
                ", OPB_RSL_NT_DTTM='" + OPB_RSL_NT_DTTM + '\'' +
                ", RQS_DTTM='" + RQS_DTTM + '\'' +
                ", CTRT_ST_DT='" + CTRT_ST_DT + '\'' +
                ", OPB_DTTM='" + OPB_DTTM + '\'' +
                ", RNK='" + RNK + '\'' +
                ", CTRT_ED_DT='" + CTRT_ED_DT + '\'' +
                '}';
    }
}
