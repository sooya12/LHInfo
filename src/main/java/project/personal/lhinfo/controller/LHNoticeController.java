package project.personal.lhinfo.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import project.personal.lhinfo.dto.LHNoticeDto;
import project.personal.lhinfo.dto.LHNoticeSearchDto;
import project.personal.lhinfo.entity.NoticeType;
import project.personal.lhinfo.entity.SupplyType;
import project.personal.lhinfo.service.LHNoticeService;
import project.personal.lhinfo.service.TypeService;

import java.util.List;

@Controller
public class LHNoticeController {

    Logger logger = LoggerFactory.getLogger(SubLeaseNoticeController.class);

    @Autowired
    LHNoticeService lhNoticeService;

    @Autowired
    TypeService typeService;

    // 청약센터 공고문 조회 화면으로 이동
    @RequestMapping("/lhnotice")
    public String lhNoticeList(Model model, LHNoticeSearchDto lhNoticeSearchDto, RedirectAttributes redirect) {
        logger.info("청약센터 공고문 조회 - " + lhNoticeSearchDto.toString());

        try {
            List<LHNoticeDto> lhnoticeList = lhNoticeService.lhNoticeList(lhNoticeSearchDto);

            int totalCnt = 0;
            if(lhnoticeList.size() > 0) {
                totalCnt = Integer.parseInt(lhnoticeList.get(0).ALL_CNT);
            }

            int pageCnt = totalCnt / 50 + 1;

            if(pageCnt < 2) {
                pageCnt = 1;
                lhNoticeSearchDto.setPage("1");
                lhnoticeList = lhNoticeService.lhNoticeList(lhNoticeSearchDto);
            }
            model.addAttribute("pageCnt", pageCnt);
            model.addAttribute("lhnoticeList", lhnoticeList);

            List<NoticeType> noticeTypeList = typeService.noticeTypeList();
            model.addAttribute("noticeTypeList", noticeTypeList);

            model.addAttribute("currentValue", lhNoticeSearchDto);
        } catch (Exception e) {
            e.printStackTrace();
            redirect.addAttribute("searchType", lhNoticeSearchDto.searchType);
            redirect.addAttribute("searchContent", lhNoticeSearchDto.searchContent);
            redirect.addAttribute("noticeType", lhNoticeSearchDto.noticeType);
            redirect.addAttribute("page", lhNoticeSearchDto.page);
            redirect.addAttribute("startDate", lhNoticeSearchDto.startDate);

            return "redirect:/lhnotice";
        }

        return "lhNoticeList";
    }
}
