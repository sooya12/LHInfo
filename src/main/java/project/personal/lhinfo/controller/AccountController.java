package project.personal.lhinfo.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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

        if(accountService.createAccount(accountSignupDto) >= 1) {
            model.addAttribute("accountName", accountSignupDto.name);
            return "home";
        } else {
            return "error";
        }
    }

    @RequestMapping(value = "/checkIdentify", method = RequestMethod.GET)
    @ResponseBody
    public String checkIdentify(@RequestParam("identify") String identify) {
        int result = accountService.checkIdentify(identify);

        logger.info("회원 아이디 중복 확인 - " + identify + " / " + result);

        if(result < 1) {
            return "available";
        }

        return "re-enter";
    }
}
