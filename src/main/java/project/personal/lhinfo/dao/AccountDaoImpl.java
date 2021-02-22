package project.personal.lhinfo.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import project.personal.lhinfo.dto.AccountFindPwdDto;
import project.personal.lhinfo.dto.AccountSigninDto;
import project.personal.lhinfo.dto.AccountSignupDto;
import project.personal.lhinfo.dto.AccountUpdatePwdDto;
import project.personal.lhinfo.entity.Account;

@Repository
public class AccountDaoImpl implements AccountDao{

    @Autowired
    private SqlSessionTemplate session;

    @Autowired
    Account account;

    @Override
    public int createAccount(AccountSignupDto accountSignupDto) {
        return session.insert("lhinfoDB.insertAccount", accountSignupDto);
    }

    @Override
    public Account readAccount(String id) {
        account = session.selectOne("lhinfoDB.selectAccount", id);
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

}
