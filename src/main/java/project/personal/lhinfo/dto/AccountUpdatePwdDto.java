package project.personal.lhinfo.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class AccountUpdatePwdDto {
    public String id;
    public String password;

    @Override
    public String toString() {
        return "AccountUpdatePwdDto{" +
                "id='" + id + '\'' +
                ", password='" + password + '\'' +
                '}';
    }
}
