package project.personal.lhinfo.service;

import project.personal.lhinfo.dto.AccountFindPwdDto;
import project.personal.lhinfo.dto.AccountSigninDto;
import project.personal.lhinfo.dto.AccountSignupDto;
import project.personal.lhinfo.dto.AccountUpdatePwdDto;
import project.personal.lhinfo.entity.Account;

public interface AccountService {

    int createAccount(AccountSignupDto accountSignupDto);

    Account readAccount(String id);

    int checkIdentify(String identify);

    String checkExistence(AccountSigninDto accountSigninDto);

    String checkExistenceByEmail(AccountFindPwdDto accountFindPwdDto);

    int updatePassword(AccountUpdatePwdDto accountUpdatePwdDto);
}
