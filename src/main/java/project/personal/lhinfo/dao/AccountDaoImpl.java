package project.personal.lhinfo.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import project.personal.lhinfo.dto.*;

import java.util.List;

@Repository
public class AccountDaoImpl implements AccountDao{

    @Autowired
    private SqlSessionTemplate session;

    @Override
    public int createAccount(AccountSignupDto accountSignupDto) {
        return session.insert("lhinfoDB.insertAccount", accountSignupDto);
    }

    @Override
    public AccountInfoDto readAccount(String id) {
        AccountInfoDto account = session.selectOne("lhinfoDB.selectAccount", id);
        return account;
    }

    @Override
    public int checkIdentify(String identify) {
        return session.selectOne("lhinfoDB.checkIdentify", identify);
    }

    @Override
    public String checkExistence(AccountSigninDto accountSigninDto) {
        return session.selectOne("lhinfoDB.checkExistence", accountSigninDto);
    }

    @Override
    public String checkExistenceByEmail(AccountFindPwdDto accountFindPwdDto) {
        return session.selectOne("lhinfoDB.checkExistenceByEmail", accountFindPwdDto);
    }

    @Override
    public int updatePassword(AccountUpdatePwdDto accountUpdatePwdDto) {
        return session.update("lhinfoDB.updatePassword", accountUpdatePwdDto);
    }

    @Override
    public int createAccountLookup(AccountLookupDto accountLookupDto) {
        return session.insert("lhinfoDB.insertAccountLookup", accountLookupDto);
    }

    @Override
    public List<AccountLookupDto> accountLookupList(String accountid) {
        return session.selectList("lhinfoDB.selectAccountLookups", accountid);
    }

    @Override
    public List<AccountInfoDto> readAccounts() {
        return session.selectList("lhinfoDB.selectAccounts");
    }

    @Override
    public List<AccountLookupCountDto> readAccountLookupCountList() {
        return session.selectList("lhinfoDB.selectAccountLookupCounts");
    }

    @Override
    public List<AccountLookupCountDto> readAccountLookupCategoryCountList(int categoryid) {
        return session.selectList("lhinfoDB.selectAccountLookupCategoryCounts", categoryid);
    }

}
