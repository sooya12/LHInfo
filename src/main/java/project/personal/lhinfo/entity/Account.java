package project.personal.lhinfo.entity;

import lombok.*;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class Account {
    public static Account SINGLETON_Account = new Account();

    public int id;
    public String identify;
    public String password;
    public String name;
    public String email;

    public static Account getAccount() {
        if(SINGLETON_Account == null) {
            SINGLETON_Account = new Account();
        }

        return SINGLETON_Account;
    }

    public static void setAccount(Account account) {
        if(SINGLETON_Account == null) {
            SINGLETON_Account = new Account();
        }

        SINGLETON_Account.setId(account.getId());
        SINGLETON_Account.setIdentify(account.getIdentify());
        SINGLETON_Account.setName(account.getName());
        SINGLETON_Account.setEmail(account.getEmail());
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
