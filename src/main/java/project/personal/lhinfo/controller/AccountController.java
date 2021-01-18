package project.personal.lhinfo.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import project.personal.lhinfo.dto.AccountSignupDto;
import project.personal.lhinfo.service.AccountService;

@Controller
@RequestMapping(value = "/account")
public class AccountController {

    private static final Logger logger = LoggerFactory.getLogger(AccountController.class);

    @Autowired
    AccountService accountService;

    @RequestMapping(value = "/signup", method = RequestMethod.GET)
    public String signup() {
        return "/account/signup";
    }

    @RequestMapping(value = "/signin", method = RequestMethod.GET)
    public String signin() {
        return "/account/signin";
    }

    @RequestMapping(value = "/", method = RequestMethod.POST)
    public String createAccount(Model model, AccountSignupDto accountSignupDto) {
        logger.info("회원 입력 정보 - " + accountSignupDto.toString());

        int result = accountService.createAccount(accountSignupDto);
        if(result >= 1) {
            model.addAttribute("accountName", accountSignupDto.name);
            return "home";
        } else {
            return "error";
        }
    }
}
