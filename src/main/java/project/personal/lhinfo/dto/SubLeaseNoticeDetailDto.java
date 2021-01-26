package project.personal.lhinfo.dto;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import project.personal.lhinfo.dto.SubLeaseNoticeDetail.*;

import java.util.List;

@Getter
@Setter
@NoArgsConstructor
public class SubLeaseNoticeDetailDto {
    public List<resHeader> resHeader;
    public List<dsCtrtPlcNm> dsCtrtPlcNm;
    public List<dsCtrtPlc> dsCtrtPlc;               // 접수처 정보
    public List<dsSbdNm> dsSbdNm;                   
    public List<dsSbd> dsSbd;                       // 단지 정보
    public List<dsSbdAhflNm> dsSbdAhflNm;            
    public List<dsSbdAhfl> dsSbdAhfl;               // 단지 첨부파일 정보 
    public List<dsSplScdlNm> dsSplScdlNm;           
    public List<dsSplScdl> dsSplScdl;               // 공급 정보
    public List<dsSplScdl01Nm> dsSplScdl01Nm;        
    public List<dsSplScdl01> dsSplScdl01;           // 공급일정-입찰 정보
    public List<dsSplScdl02Nm> dsSplScdl02Nm;        
    public List<dsSplScdl02> dsSplScdl02;           // 공급일정-추첨 정보 
    public List<dsAhflInfoNm> dsAhflInfoNm;          
    public List<dsAhflInfo> dsAhflInfo;             // 첨부파일 정보
    public List<dsEtcInfoNm> dsEtcInfoNm;            
    public List<dsEtcInfo> dsEtcInfo;               // 기타 정보
    public List<dsEtcListNm> dsEtcListNm;            
    public List<dsEtcList> dsEtcList;               // 신청자격 정보
    public List<dsSbdDongNm> dsSbdDongNm;
    public List<dsSbdDong> dsSbdDong;               // 단지내상가동 정보
    public List<dsSbdDongAhflNm> dsSbdDongAhflNm;
    public List<dsSbdDongAhfl> dsSbdDongAhfl;       // 단지내상가동별이미지 정보

    @Override
    public String toString() {
        return "SubLeaseNoticeDetailDto{" +
                "resHeader=" + resHeader +
                ", dsCtrtPlcNm=" + dsCtrtPlcNm +
                ", dsCtrtPlc=" + dsCtrtPlc +
                ", dsSbdNm=" + dsSbdNm +
                ", dsSbd=" + dsSbd +
                ", dsSbdAhflNm=" + dsSbdAhflNm +
                ", dsSbdAhfl=" + dsSbdAhfl +
                ", dsSplScdlNm=" + dsSplScdlNm +
                ", dsSplScdl=" + dsSplScdl +
                ", dsSplScdl01Nm=" + dsSplScdl01Nm +
                ", dsSplScdl01=" + dsSplScdl01 +
                ", dsSplScdl02Nm=" + dsSplScdl02Nm +
                ", dsSplScdl02=" + dsSplScdl02 +
                ", dsAhflInfoNm=" + dsAhflInfoNm +
                ", dsAhflInfo=" + dsAhflInfo +
                ", dsEtcInfoNm=" + dsEtcInfoNm +
                ", dsEtcInfo=" + dsEtcInfo +
                ", dsEtcListNm=" + dsEtcListNm +
                ", dsEtcList=" + dsEtcList +
                ", dsSbdDongNm=" + dsSbdDongNm +
                ", dsSbdDong=" + dsSbdDong +
                ", dsSbdDongAhflNm=" + dsSbdDongAhflNm +
                ", dsSbdDongAhfl=" + dsSbdDongAhfl +
                '}';
    }
}
