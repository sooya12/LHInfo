package project.personal.lhinfo.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import project.personal.lhinfo.dto.AccountSigninDto;
import project.personal.lhinfo.dto.AccountSignupDto;
import project.personal.lhinfo.entity.Account;

@Repository
public class AccountDaoImpl implements AccountDao{

    @Autowired
    private SqlSessionTemplate session;

    @Override
    public int createAccount(AccountSignupDto accountSignupDto) {
        return session.insert("lhinfoDB.insertAccount", accountSignupDto);
    }

    @Override
    public Account readAccount(String id) {
        Account.setAccount(session.selectOne("lhinfoDB.selectAccount", id));
        return Account.SINGLETON_Account;
    }

    @Override
    public int checkIdentify(String identify) {
        return session.selectOne("lhinfoDB.checkIdentify", identify);
    }

    @Override
    public String checkExistence(AccountSigninDto accountSigninDto) {
        return session.selectOne("lhinfoDB.checkExistence", accountSigninDto);
    }

}
