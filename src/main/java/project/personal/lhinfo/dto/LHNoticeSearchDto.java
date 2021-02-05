package project.personal.lhinfo.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@NoArgsConstructor
@AllArgsConstructor
public class LHNoticeSearchDto {
    public String searchType;
    public String searchContent;
    public String noticeType;
    public String page;

    public String getSearchType() {
        if(searchType == null) {
            return "";
        }
        return searchType;
    }

    public String getSearchContent() {
        if(searchContent == null) {
            return "";
        }
        return searchContent;
    }

    public String getNoticeType() {
        if(noticeType == null || "00".equals(noticeType)) {
            return "";
        }
        return noticeType;
    }

    public String getPage() {
        if(page == null || Integer.parseInt(page) < 1) {
            return "1";
        }
        return page;
    }

    @Override
    public String toString() {
        return "LHNoticeSearchDto{" +
                "searchType='" + searchType + '\'' +
                ", searchContent='" + searchContent + '\'' +
                ", noticeType='" + noticeType + '\'' +
                ", page='" + page + '\'' +
                '}';
    }
}
