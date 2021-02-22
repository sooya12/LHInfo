package project.personal.lhinfo.dto;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
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
