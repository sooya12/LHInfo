package project.personal.lhinfo.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class AccountLookupCountDto {
    public String category;
    public String count;

    @Override
    public String toString() {
        return "AccountLookupCountDto{" +
                "category='" + category + '\'' +
                ", count='" + count + '\'' +
                '}';
    }
}
