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
    public List<dsCtrtPlc> dsCtrtPlc;
    public List<dsSbdNm> dsSbdNm;
    public List<dsSbd> dsSbd;
    public List<dsSbdAhflNm> dsSbdAhflNm;
    public List<dsSbdAhfl> dsSbdAhfl;
    public List<dsSplScdlNm> dsSplScdlNm;
    public List<dsSplScdl> dsSplScdl;
    public List<dsSplScdl01Nm> dsSplScdl01Nm;
    public List<dsSplScdl01> dsSplScdl01;
    public List<dsSplScdl02> dsSplScdl02;
    public List<dsSplScdl02Nm> dsSplScdl02Nm;
    public List<dsAhflInfoNm> dsAhflInfoNm;
    public List<dsAhflInfo> dsAhflInfo;
    public List<dsEtcInfoNm> dsEtcInfoNm;
    public List<dsEtcInfo> dsEtcInfo;
    public List<dsEtcListNm> dsEtcListNm;
    public List<dsEtcList> dsEtcList;
    public List<dsSbdDongAhflNm> dsSbdDongAhflNm;
    public List<dsSbdDongAhfl> dsSbdDongAhfl;
    public List<dsSbdDongNm> dsSbdDongNm;
    public List<dsSbdDong> dsSbdDong;

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
                ", dsSplScdl02=" + dsSplScdl02 +
                ", dsSplScdl02Nm=" + dsSplScdl02Nm +
                ", dsAhflInfoNm=" + dsAhflInfoNm +
                ", dsAhflInfo=" + dsAhflInfo +
                ", dsEtcInfoNm=" + dsEtcInfoNm +
                ", dsEtcInfo=" + dsEtcInfo +
                ", dsEtcListNm=" + dsEtcListNm +
                ", dsEtcList=" + dsEtcList +
                ", dsSbdDongAhflNm=" + dsSbdDongAhflNm +
                ", dsSbdDongAhfl=" + dsSbdDongAhfl +
                ", dsSbdDongNm=" + dsSbdDongNm +
                ", dsSbdDong=" + dsSbdDong +
                '}';
    }
}
