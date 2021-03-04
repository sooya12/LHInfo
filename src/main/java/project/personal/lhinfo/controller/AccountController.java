package project.personal.lhinfo.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import project.personal.lhinfo.dto.*;
import project.personal.lhinfo.service.AccountService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping(value = "/account")
public class AccountController {

    private static final Logger logger = LoggerFactory.getLogger(AccountController.class);

    @Autowired
    AccountService accountService;

    // 회원가입 기능. AccountSignupDto로 identify, password를 받음
    @RequestMapping(value = "/", method = RequestMethod.POST)
    public String createAccount(Model model, AccountSignupDto accountSignupDto) {
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

        if(result != null) {
            return result;
        }

        return "re-enter";
    }

    // 로그인 시, 회원정보 조회 기능. 세션에 회원정보 저장
    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String readAccount(@RequestParam("id") String id, HttpServletRequest request) {
        logger.info("회원 로그인");
        AccountInfoDto account = accountService.readAccount(id);

        HttpSession session = request.getSession();
        session.setAttribute("accountId", account.getId());
        session.setAttribute("accountIdentify", account.getIdentify());
        session.setAttribute("accountName", account.getName());
        session.setAttribute("accountEmail", account.getEmail());

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

    // 임시 비밀번호 발급 시, 회원정보 존재 확인 기능
    @RequestMapping(value = "/checkExistenceByEmail", method = RequestMethod.GET)
    @ResponseBody
    public String checkExistenceByEmail(AccountFindPwdDto accountFindPwdDto) {
        String id = accountService.checkExistenceByEmail(accountFindPwdDto);
        if(id == null || "".equals(id)) {
            return "re-enter";
        } else {
            return id;
        }
    }

    // 임시 비밀번호 발급 시, 회원정보 비밀번호 변경 기능
    @RequestMapping(value = "/updatePassword", method = RequestMethod.PUT)
    @ResponseBody
    public String updatePassword(@RequestBody String id) {
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < 6; i++) {
            int idx = (int)(Math.random() * 2);

            if(idx == 0) {
                sb.append((char)(Math.random() * 10 + '0'));
            } else {
                sb.append((char)(Math.random() * 26 + 'a'));
            }
        }

        String tempPwd = sb.toString();
        AccountUpdatePwdDto accountUpdatePwdDto = new AccountUpdatePwdDto(id, tempPwd);

        int result = accountService.updatePassword(accountUpdatePwdDto);
        if(result == 1) {
            return tempPwd;
        } else {
            return "fail";
        }
    }

    // 검색내역 저장
    @RequestMapping(value = "/createAccountLookup", method = RequestMethod.POST)
    @ResponseBody
    public String createAccountLookup(AccountLookupDto accountLookupDto) {
        int result = accountService.createAccountLookup(accountLookupDto);

        if(result == 1) {
            return "success";
        } else {
            return "fail";
        }
    }

    // 최근 5개의 검색내역 조회
    @RequestMapping(value = "/readAccountLookupList", method = RequestMethod.GET)
    @ResponseBody
    public List<AccountLookupDto> readAccountLookupList(HttpServletRequest request) {
        HttpSession session = request.getSession();
        String accountid = (String)session.getAttribute("accountId");

        List<AccountLookupDto> totalList = accountService.accountLookupList(accountid);
        List<AccountLookupDto> accountLookupList = new ArrayList<>();
        AccountLookupDto tmp;
        ArrayList<String> urlList = new ArrayList<>();

        for (int i = 0; i < totalList.size(); i++) {
            if(urlList.size() == 5) {
                break;
            }

            tmp = totalList.get(i);

            if(urlList.contains(tmp.getUrl())) {
                continue;
            }

            urlList.add(tmp.getUrl());
            accountLookupList.add(tmp);
        }

        return accountLookupList;
    }

    // 회원 목록 조회
    @RequestMapping(value = "/readAccountList", method = RequestMethod.GET)
    public String readAccountList(Model model) {
        List<AccountInfoDto> accountInfoList = accountService.readAccounts();

        if(accountInfoList == null) {
            accountInfoList = new ArrayList<>();
        }
        model.addAttribute("accountInfoList", accountInfoList);

        return "accountList";
    }

    // 회원 검색 내역 카테고리별 조회
    @RequestMapping(value = "/readAccountLookupCountList", method = RequestMethod.GET)
    @ResponseBody
    public List<AccountLookupCountDto> readAccountLookupCountList() {
        List<AccountLookupCountDto> accountLookupCountList = accountService.readAccountLookupCountList();

        if(accountLookupCountList == null) {
            accountLookupCountList = new ArrayList<>();
        }

        return accountLookupCountList;
    }

    // 회원 검색 내역 카테고리 유형별 조회
    @RequestMapping(value = "/readAccountLookupCategoryCountList", method = RequestMethod.GET)
    @ResponseBody
    public List<AccountLookupCountDto> readAccountLookupCategoryCountList(@RequestParam int categoryid) {
        List<AccountLookupCountDto> accountLookupCountList = accountService.readAccountLookupCategoryCountList(categoryid);

        if(accountLookupCountList == null) {
            accountLookupCountList = new ArrayList<>();
        }

        return accountLookupCountList;
    }
}
