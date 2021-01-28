package project.personal.lhinfo.dto.SubLeaseNoticeDetail;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class resHeader {
    public String SS_CODE;
    public String RS_DTTM;

    @Override
    public String toString() {
        return "resHeader{" +
                "SS_CODE='" + SS_CODE + '\'' +
                ", RS_DTTM='" + RS_DTTM + '\'' +
                '}';
    }
}
