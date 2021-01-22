package project.personal.lhinfo.dao;

import project.personal.lhinfo.dto.AccountSigninDto;
import project.personal.lhinfo.dto.AccountSignupDto;
import project.personal.lhinfo.entity.Account;

public interface AccountDao {
    int createAccount(AccountSignupDto accountSignupDto);

    Account readAccount(String id);

    int checkIdentify(String identify);

    String checkExistence(AccountSigninDto accountSigninDto);
}
