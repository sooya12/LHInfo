package project.personal.lhinfo.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class LHNoticeDto {
    public String LINK_URL;             // 공지사항상세URL
    public String PAGE;                 // 페이지번호
    public String RNUM;                 // 순번
    public String BBS_WOU_DTTM;         // 게시일
    public String ALL_CNT;              // 전체조회건수
    public String BBS_SN;               // 번호
    public String BBS_TL;               // 제목
    public String INQ_CNT;              // 조회수
    public String AIS_TP_CD_NM;         // 유형
    public String CCR_CNNT_SYS_DS_CD;   // 고객센터연계시스템구분코드
    public String DEP_NM;               // 담당부서

    @Override
    public String toString() {
        return "LHNoticeDto{" +
                "LINK_URL='" + LINK_URL + '\'' +
                ", PAGE='" + PAGE + '\'' +
                ", RNUM='" + RNUM + '\'' +
                ", BBS_WOU_DTTM='" + BBS_WOU_DTTM + '\'' +
                ", ALL_CNT='" + ALL_CNT + '\'' +
                ", BBS_SN='" + BBS_SN + '\'' +
                ", BBS_TL='" + BBS_TL + '\'' +
                ", INQ_CNT='" + INQ_CNT + '\'' +
                ", AIS_TP_CD_NM='" + AIS_TP_CD_NM + '\'' +
                ", CCR_CNNT_SYS_DS_CD='" + CCR_CNNT_SYS_DS_CD + '\'' +
                ", DEP_NM='" + DEP_NM + '\'' +
                '}';
    }
}
