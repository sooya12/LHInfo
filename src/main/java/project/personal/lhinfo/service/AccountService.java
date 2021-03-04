package project.personal.lhinfo.service;

import project.personal.lhinfo.dto.*;

import java.util.List;

public interface AccountService {

    int createAccount(AccountSignupDto accountSignupDto);

    AccountInfoDto readAccount(String id);

    int checkIdentify(String identify);

    String checkExistence(AccountSigninDto accountSigninDto);

    String checkExistenceByEmail(AccountFindPwdDto accountFindPwdDto);

    int updatePassword(AccountUpdatePwdDto accountUpdatePwdDto);

    int createAccountLookup(AccountLookupDto accountLookupDto);

    List<AccountLookupDto> accountLookupList(String accountid);

    List<AccountInfoDto> readAccounts();

    List<AccountLookupCountDto> readAccountLookupCountList();

    List<AccountLookupCountDto> readAccountLookupCategoryCountList(int categoryid);
}
