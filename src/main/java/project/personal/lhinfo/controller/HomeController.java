package project.personal.lhinfo.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import project.personal.lhinfo.service.LHNoticeService;
import project.personal.lhinfo.service.SubLeaseNoticeService;
import project.personal.lhinfo.service.TypeService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.FileNotFoundException;
import java.io.IOException;

@Controller
@ControllerAdvice
public class HomeController {

    private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

    @Autowired
    TypeService typeService;

    @Autowired
    SubLeaseNoticeService subLeaseNoticeService;

    @Autowired
    LHNoticeService lhNoticeService;

    // 로그인, 회원가입 안내 화면으로 이동
    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String open(HttpServletRequest request) throws FileNotFoundException {
        logger.info("분양임대 정보 제공 서비스 - open");

        HttpSession session = request.getSession();
        if (session.getAttribute("account") != null) {
            return "redirect:/home";
        }

        return "open";
    }

    // 홈 화면으로 이동
    @RequestMapping(value = "/home", method = RequestMethod.GET)
    public String home(Model model) {
        logger.info("분양임대 정보 제공 서비스 - home");

        try {
            model.addAttribute("locationList", typeService.locationList());
            model.addAttribute("supplyTypeList", typeService.supplyTypeList());
            model.addAttribute("subLeaseNoticeList", subLeaseNoticeService.subLeaseNoticeSmallList());
            model.addAttribute("lhNoticeList", lhNoticeService.lhNoticeSmallList());
        } catch (IOException e) {
            e.printStackTrace();

            return "redirect:/home";
        }

        return "home";
    }

    // Error 처리
    @RequestMapping(value = "/error", method = RequestMethod.GET)
    @ExceptionHandler
    public String error(Exception e) {
        e.printStackTrace();

        return "error";
    }
}
