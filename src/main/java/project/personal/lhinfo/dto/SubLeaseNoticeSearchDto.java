package project.personal.lhinfo.dto;

import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@NoArgsConstructor
@AllArgsConstructor
public class SubLeaseNoticeSearchDto {
    public String location;
    public String noticeType;
    public String noticeStatusType;
    public String page;
    public String noticeName;

    public String getLocation() {
        if(location == null || "00".equals(location)) {
            return "";
        }
        return location;
    }

    public String getNoticeType() {
        if(noticeType == null || "00".equals(noticeType)) {
            return "";
        }
        return noticeType;
    }

    public String getNoticeStatusType() {
        if(noticeStatusType == null || "전체".equals(noticeStatusType)) {
            return "";
        }
        return noticeStatusType;
    }

    public String getPage() {
        if(page == null) {
            return "1";
        }
        return page;
    }

    public String getNoticeName() {
        if(noticeName == null) {
            return "";
        }
        return noticeName;
    }

    @Override
    public String toString() {
        return "SubLeaseNoticeSearchDto{" +
                "location='" + location + '\'' +
                ", noticeType='" + noticeType + '\'' +
                ", noticeStatusType='" + noticeStatusType + '\'' +
                ", page='" + page + '\'' +
                ", noticeName='" + noticeName + '\'' +
                '}';
    }
}
