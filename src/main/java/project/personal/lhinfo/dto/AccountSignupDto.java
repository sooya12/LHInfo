package project.personal.lhinfo.dto;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class AccountSignupDto {
    public int id;
    public String identify;
    public String password;
    public String name;
    public String email;
}
