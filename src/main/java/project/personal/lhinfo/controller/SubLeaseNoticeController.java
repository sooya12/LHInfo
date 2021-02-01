package project.personal.lhinfo.controller;

import com.google.gson.JsonArray;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import project.personal.lhinfo.dto.SubLeaseNoticeDetailDto;
import project.personal.lhinfo.dto.SubLeaseNoticeDetailSearchDto;
import project.personal.lhinfo.dto.SubLeaseNoticeDto;
import project.personal.lhinfo.dto.SubLeaseNoticeSearchDto;
import project.personal.lhinfo.entity.Location;
import project.personal.lhinfo.entity.NoticeStatusType;
import project.personal.lhinfo.entity.NoticeType;
import project.personal.lhinfo.service.SubLeaseNoticeService;
import project.personal.lhinfo.service.TypeService;

import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping(value = "/subleasenotice")
public class SubLeaseNoticeController {

    Logger logger = LoggerFactory.getLogger(SubLeaseNoticeController.class);

    @Autowired
    SubLeaseNoticeService subLeaseNoticeService;

    @Autowired
    TypeService typeService;

    // 분양임대 공고문 목록 화면으로 이동
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public String subLeaseNoticeList(Model model, SubLeaseNoticeSearchDto subLeaseNoticeSearchDto) {
        logger.info("분양임대 공고문 목록 - " + subLeaseNoticeSearchDto.toString());

        try {
            List<SubLeaseNoticeDto> subLeaseNoticeList = subLeaseNoticeService.subLeaseNoticeList(subLeaseNoticeSearchDto);
            model.addAttribute("subLeaseNoticeList", subLeaseNoticeList);

            List<Location> locationList = typeService.locationList();
            model.addAttribute("locationList", locationList);

            List<NoticeType> noticeTypeList = typeService.noticeTypeList();
            model.addAttribute("noticeTypeList", noticeTypeList);

            List<NoticeStatusType> noticeStatusTypeList = typeService.noticeStatusTypeList();
            model.addAttribute("noticeStatusTypeList", noticeStatusTypeList);

            int pageCnt = 0;

            if (subLeaseNoticeList.size() > 0) {
                int totalCnt = Integer.parseInt(subLeaseNoticeList.get(0).ALL_CNT);
                pageCnt = totalCnt / 50 + 1;
            }

            if (pageCnt < 2) {
                pageCnt = 1;
            }
            model.addAttribute("pageCnt", pageCnt);
        } catch (IOException e) {
            e.printStackTrace();
        }

        model.addAttribute("currentValue", subLeaseNoticeSearchDto);

        return "subLeaseNoticeList";
    }

    // 분양임대 공고문 상세 화면으로 이동
    @RequestMapping(value = "/detail", method = RequestMethod.GET)
    public String subLeaseNoticeDetail(Model model, SubLeaseNoticeDetailSearchDto subLeaseNoticeDetailSearchDto, RedirectAttributes redirect) {
        logger.info("분양임대 공고문 상세 - " + subLeaseNoticeDetailSearchDto.toString());

        try {
            SubLeaseNoticeDetailDto subLeaseNoticeDetailDto = subLeaseNoticeService.subLeaseNoticeDetail(subLeaseNoticeDetailSearchDto);
            model.addAttribute("detail", subLeaseNoticeDetailDto);
            return "subLeaseNoticeDetail";
        } catch (Exception e) {
            e.printStackTrace();
            redirect.addAttribute("subLeaseNoticeDetailSearchDto", subLeaseNoticeDetailSearchDto);
            return "redirect:/detail";
        }
    }

    // 분양임대 공고문 상세 화면 중 500m 반경 이내 상권 정보 조회
    @RequestMapping(value = "/store", method = RequestMethod.GET, produces = "application/text; charset=UTF-8")
    @ResponseBody
    public String subLeaseNoticeDetailStore(Model model, String x, String y) {
        logger.info("분야임대 공고문 상세 상권 조회");

        try {
            JsonArray store = subLeaseNoticeService.subLeaseNoticeDetailStore(x, y);
            return store.toString();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }
}
