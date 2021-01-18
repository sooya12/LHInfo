package project.personal.lhinfo.dto;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class AccountSignupDto {
    public String identify;
    public String password;
    public String name;
    public String email;

    @Override
    public String toString() {
        return "AccountSignupDto{" +
                "identify='" + identify + '\'' +
                ", password='" + password + '\'' +
                ", name='" + name + '\'' +
                ", email='" + email + '\'' +
                '}';
    }
}
