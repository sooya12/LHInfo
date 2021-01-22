package project.personal.lhinfo.service;

import project.personal.lhinfo.dto.AccountSigninDto;
import project.personal.lhinfo.dto.AccountSignupDto;
import project.personal.lhinfo.entity.Account;

public interface AccountService {

    int createAccount(AccountSignupDto accountSignupDto);

    Account readAccount(String id);

    int checkIdentify(String identify);

    String checkExistence(AccountSigninDto accountSigninDto);
}
