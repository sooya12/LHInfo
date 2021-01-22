package project.personal.lhinfo.dto;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class AccountSigninDto {
    public String identify;
    public String password;

    @Override
    public String toString() {
        return "AccountSigninDto{" +
                "identify='" + identify + '\'' +
                ", password='" + password + '\'' +
                '}';
    }
}
