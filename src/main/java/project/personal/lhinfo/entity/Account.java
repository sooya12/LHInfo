package project.personal.lhinfo.entity;

import lombok.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

@Component
@Getter
@Setter
@AllArgsConstructor
public class Account {

    Logger logger = LoggerFactory.getLogger(Account.class);

    public int id;
    public String identify;
    public String password;
    public String name;
    public String email;

    public Account() {
        logger.info("회원 싱글톤 객체 생성");
    }

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
