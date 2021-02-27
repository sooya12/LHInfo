package project.personal.lhinfo.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class AccountLookupDto {
    public String id;
    public String accountid;
    public String category;
    public String type1;
    public String type2;
    public String url;

    public String getType1() {
        if(type1 == null || "".equals(type1)) {
            return "-";
        }
        return type1;
    }

    public String getType2() {
        if(type2 == null || "".equals(type2)) {
            return "-";
        }
        return type2;
    }

    @Override
    public String toString() {
        return "AccountLookupDto{" +
                "id='" + id + '\'' +
                ", accountid='" + accountid + '\'' +
                ", category='" + category + '\'' +
                ", type1='" + type1 + '\'' +
                ", type2='" + type2 + '\'' +
                ", url='" + url + '\'' +
                '}';
    }
}
