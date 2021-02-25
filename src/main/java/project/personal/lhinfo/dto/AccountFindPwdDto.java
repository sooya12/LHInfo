package project.personal.lhinfo.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class AccountFindPwdDto {
    public String identify;
    public String email;

    @Override
    public String toString() {
        return "AccountFindPwdDto{" +
                "identify='" + identify + '\'' +
                ", email='" + email + '\'' +
                '}';
    }
}
