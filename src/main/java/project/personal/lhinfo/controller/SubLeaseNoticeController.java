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
    public String subLeaseNoticeList(Model model, SubLeaseNoticeSearchDto subLeaseNoticeSearchDto, RedirectAttributes redirect) {
        logger.info("분양임대 공고문 목록 조회 - " + subLeaseNoticeSearchDto.toString());

        try {
            List<SubLeaseNoticeDto> subLeaseNoticeList = subLeaseNoticeService.subLeaseNoticeList(subLeaseNoticeSearchDto);
            model.addAttribute("subLeaseNoticeList", subLeaseNoticeList);

            if(subLeaseNoticeList.isEmpty()) {
                model.addAttribute("totalCnt", 0);
            } else {
                model.addAttribute("totalCnt", subLeaseNoticeList.get(0).ALL_CNT);
            }

            List<Location> locationList = typeService.locationList();
            model.addAttribute("locationList", locationList);

            List<NoticeType> noticeTypeList = typeService.noticeTypeList();
            model.addAttribute("noticeTypeList", noticeTypeList);

            List<NoticeStatusType> noticeStatusTypeList = typeService.noticeStatusTypeList();
            model.addAttribute("noticeStatusTypeList", noticeStatusTypeList);
        } catch (IOException e) {
            e.printStackTrace();

            redirect.addAttribute("location", subLeaseNoticeSearchDto.location);
            redirect.addAttribute("noticeType", subLeaseNoticeSearchDto.noticeType);
            redirect.addAttribute("noticeStatusType", subLeaseNoticeSearchDto.noticeStatusType);
            redirect.addAttribute("page", subLeaseNoticeSearchDto.page);
            redirect.addAttribute("noticeName", subLeaseNoticeSearchDto.noticeName);

            return "redirect:/subleasenotice/list";
        }

        model.addAttribute("currentValue", subLeaseNoticeSearchDto);

        return "subLeaseNoticeList";
    }

    // 분양임대 공고문 상세 화면으로 이동
    @RequestMapping(value = "/detail", method = RequestMethod.GET)
    public String subLeaseNoticeDetail(Model model, SubLeaseNoticeDetailSearchDto subLeaseNoticeDetailSearchDto, RedirectAttributes redirect) {
        logger.info("분양임대 공고문 상세 조회 - " + subLeaseNoticeDetailSearchDto.toString());

        try {
            SubLeaseNoticeDetailDto subLeaseNoticeDetailDto = subLeaseNoticeService.subLeaseNoticeDetail(subLeaseNoticeDetailSearchDto);
            model.addAttribute("detail", subLeaseNoticeDetailDto);
        } catch (Exception e) {
            e.printStackTrace();
            redirect.addAttribute("AIS_TP_CD", subLeaseNoticeDetailSearchDto.AIS_TP_CD);
            redirect.addAttribute("SPL_INF_TP_CD", subLeaseNoticeDetailSearchDto.SPL_INF_TP_CD);
            redirect.addAttribute("PAN_ID", subLeaseNoticeDetailSearchDto.PAN_ID);
            redirect.addAttribute("UPP_AIS_TP_CD", subLeaseNoticeDetailSearchDto.UPP_AIS_TP_CD);
            redirect.addAttribute("CCR_CNNT_SYS_DS_CD", subLeaseNoticeDetailSearchDto.CCR_CNNT_SYS_DS_CD);

            return "redirect:/subleasenotice/detail";
        }

        return "subLeaseNoticeDetail";
    }

    // 분양임대 공고문 상세 화면 중 500m 반경 이내 상권 정보 조회
    @RequestMapping(value = "/store", method = RequestMethod.GET, produces = "application/text; charset=UTF-8")
    @ResponseBody
    public String subLeaseNoticeDetailStore(String x, String y, RedirectAttributes redirect) {
        logger.info("분양임대 공고문 상세 상권 조회");

        try {
            JsonArray store = subLeaseNoticeService.subLeaseNoticeDetailStore(x, y);

            return store.toString();
        } catch (Exception e) {
            e.printStackTrace();
            redirect.addAttribute("x", x);
            redirect.addAttribute("y", y);

            return "redirect:/subleasenotice/store";
        }
    }
}
