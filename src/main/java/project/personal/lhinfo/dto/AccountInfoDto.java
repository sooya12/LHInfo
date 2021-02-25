package project.personal.lhinfo.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class AccountInfoDto {
    public String id;
    public String identify;
    public String name;
    public String email;

    @Override
    public String toString() {
        return "AccountInfoDto{" +
                "id='" + id + '\'' +
                ", identify='" + identify + '\'' +
                ", name='" + name + '\'' +
                ", email='" + email + '\'' +
                '}';
    }
}
