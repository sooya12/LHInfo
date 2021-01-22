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
import project.personal.lhinfo.dto.AccountSigninDto;
import project.personal.lhinfo.dto.AccountSignupDto;
import project.personal.lhinfo.entity.Account;
import project.personal.lhinfo.service.AccountService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping(value = "/account")
public class AccountController {

    private static final Logger logger = LoggerFactory.getLogger(AccountController.class);

    @Autowired
    AccountService accountService;

    // 회원가입 화면으로 이동
    @RequestMapping(value = "/signup", method = RequestMethod.GET)
    public String signup() {
        return "/account/signup";
    }

    // 로그인 화면으로 이동
    @RequestMapping(value = "/signin", method = RequestMethod.GET)
    public String signin() {
        return "/account/signin";
    }

    // 회원가입 기능. AccountSignupDto로 identify, password를 받음
    @RequestMapping(value = "/", method = RequestMethod.POST)
    public String createAccount(Model model, AccountSignupDto accountSignupDto) {
        logger.info("회원 입력 정보 - " + accountSignupDto.toString());

        if(accountService.createAccount(accountSignupDto) >= 1) {
            model.addAttribute("accountName", accountSignupDto.name);
            return "open";
        } else {
            return "error";
        }
    }

    // 회원가입 시, 아이디 중복확인 기능
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

    // 로그인 시, 회원정보 존재 확인 기능. AccountSigninDto로 identify, password 받음
    @RequestMapping(value = "/checkExistence", method = RequestMethod.POST)
    @ResponseBody
    public String checkExistence(AccountSigninDto accountSigninDto) {
        String result = accountService.checkExistence(accountSigninDto);

        logger.info("존재하는 회원 정보 확인 - " + result);

        if(result != null) {
            return result;
        }

        return "re-enter";
    }

    // 로그인 시, 회원정보 조회 기능. 세션에 회원정보 저장
    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String readAccount(@RequestParam("id") String id, HttpServletRequest request) {
        Account account = accountService.readAccount(id);

        logger.info("회원 로그인 - " + account.toString());

        HttpSession session = request.getSession();
        session.setAttribute("account", account);

        return "redirect:/home";
    }

    // 로그아웃 기능. 세션에서 회원정보 삭제
    @RequestMapping(value = "/signout", method = RequestMethod.GET)
    public String signout(HttpServletRequest request) {
        logger.info("회원 로그아웃");
        
        HttpSession session = request.getSession();
        session.removeAttribute("account");
        session.invalidate();

        return "redirect:/";
    }
}
