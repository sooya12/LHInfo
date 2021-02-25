package project.personal.lhinfo.entity;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;
import org.springframework.stereotype.Component;

@Getter
@Setter
@AllArgsConstructor
public class Account {
    public int id;
    public String identify;
    public String password;
    public String name;
    public String email;

    @Override
    public String toString() {
        return "Account{" +
                "id=" + id +
                ", identify='" + identify + '\'' +
                ", password='" + password + '\'' +
                ", name='" + name + '\'' +
                ", email='" + email + '\'' +
                '}';
    }
}
