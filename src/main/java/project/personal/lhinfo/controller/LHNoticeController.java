package project.personal.lhinfo.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import project.personal.lhinfo.dto.LHNoticeDto;
import project.personal.lhinfo.service.LHNoticeService;

import java.util.List;

@Controller
public class LHNoticeController {

    Logger logger = LoggerFactory.getLogger(SubLeaseNoticeController.class);

    @Autowired
    LHNoticeService lhNoticeService;

    @RequestMapping("/lhnotice")
    public String lhNoticeList(Model model) {
        logger.info("청약센터 공고문 조회");

        try {
            List<LHNoticeDto> noticeList = lhNoticeService.lhNoticeList();
            model.addAttribute("noticeList", noticeList);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return "lhNoticeList";
    }
}
