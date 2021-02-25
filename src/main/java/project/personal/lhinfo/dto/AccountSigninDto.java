package project.personal.lhinfo.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
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
