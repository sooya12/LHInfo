package project.personal.lhinfo.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import project.personal.lhinfo.dto.AccountSigninDto;
import project.personal.lhinfo.service.AccountService;

@Controller
@RequestMapping(value = "/account")
public class AccountController {

    private static final Logger logger = LoggerFactory.getLogger(AccountController.class);

    @Autowired
    AccountService accountService;

    @RequestMapping(value = "/signin", method = RequestMethod.GET)
    public String signin(AccountSigninDto accountSigninDto) {
        // 회원 정보를 뿌려줘야 하기 때문에 그 부분을 고려해야 함
        
        return null;
    }
}
