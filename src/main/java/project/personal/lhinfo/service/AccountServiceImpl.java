package project.personal.lhinfo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import project.personal.lhinfo.dao.AccountDao;
import project.personal.lhinfo.dto.*;

import java.util.List;

@Service
public class AccountServiceImpl implements AccountService {

    @Autowired
    AccountDao accountDao;

    @Override
    public int createAccount(AccountSignupDto accountSignupDto) {
        return accountDao.createAccount(accountSignupDto);
    }

    @Override
    public AccountInfoDto readAccount(String id) {
        return accountDao.readAccount(id);
    }

    @Override
    public int checkIdentify(String identify) {
        return accountDao.checkIdentify(identify);
    }

    @Override
    public String checkExistence(AccountSigninDto accountSigninDto) {
        return accountDao.checkExistence(accountSigninDto);
    }

    @Override
    public String checkExistenceByEmail(AccountFindPwdDto accountFindPwdDto) {
        return accountDao.checkExistenceByEmail(accountFindPwdDto);
    }

    @Override
    public int updatePassword(AccountUpdatePwdDto accountUpdatePwdDto) {
        return accountDao.updatePassword(accountUpdatePwdDto);
    }

    @Override
    public int createAccountLookup(AccountLookupDto accountLookupDto) {
        return accountDao.createAccountLookup(accountLookupDto);
    }

    @Override
    public List<AccountLookupDto> accountLookupList(String accountid) {
        return accountDao.accountLookupList(accountid);
    }
}
