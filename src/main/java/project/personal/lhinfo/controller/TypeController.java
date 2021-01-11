package project.personal.lhinfo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import project.personal.lhinfo.entity.Location;
import project.personal.lhinfo.entity.NoticeStatusType;
import project.personal.lhinfo.entity.NoticeType;
import project.personal.lhinfo.entity.SupplyType;
import project.personal.lhinfo.service.TypeService;

import java.util.List;

@Controller
@RequestMapping(value = "/type")
public class TypeController {

    @Autowired
    TypeService typeService;

    @RequestMapping(value = "/locations")
    public String locationList(Model model) {
        List<Location> locationList = typeService.locationList();
        List<SupplyType> supplyTypeList = typeService.supplyTypeList();
        List<NoticeType> noticeTypeList = typeService.noticeTypeList();
        List<NoticeStatusType> noticeStatusTypeList = typeService.noticeStatusTypeList();

        model.addAttribute("locationList", locationList);
        model.addAttribute("supplyTypeList", supplyTypeList);
        model.addAttribute("noticeTypeList", noticeTypeList);
        model.addAttribute("noticeStatusTypeList", noticeStatusTypeList);

        return "home";
    }

}
