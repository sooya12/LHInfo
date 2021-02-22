package project.personal.lhinfo.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import project.personal.lhinfo.dto.LeaseComplexDto;
import project.personal.lhinfo.dto.LeaseComplexTypeDto;
import project.personal.lhinfo.entity.Location;
import project.personal.lhinfo.entity.SupplyType;
import project.personal.lhinfo.service.LeaseComplexService;
import project.personal.lhinfo.service.TypeService;

import java.util.List;

@Controller
public class LeaseComplexController {

    private static final Logger logger = LoggerFactory.getLogger(LeaseComplexController.class);

    @Autowired
    LeaseComplexService leaseComplexService;

    @Autowired
    TypeService typeService;

    // 임대단지 목록 조회 화면으로 이동
    @RequestMapping(value = "/leasecomplex", method = RequestMethod.GET)
    public String leaseComplexList(Model model, LeaseComplexTypeDto leaseComplexTypeDto, RedirectAttributes redirect) {
        List<Location> locationList = typeService.locationList();
        model.addAttribute("locationList", locationList);

        List<SupplyType> supplyTypeList = typeService.supplyTypeList();
        model.addAttribute("supplyTypeList", supplyTypeList);

        try {
            List<LeaseComplexDto> leaseComplexList = leaseComplexService.leaseComplexList(leaseComplexTypeDto);

            model.addAttribute("leaseComplexList", leaseComplexList);
        } catch (Exception e) {
            e.printStackTrace();
            redirect.addAttribute("location", leaseComplexTypeDto.location);
            redirect.addAttribute("supplyType", leaseComplexTypeDto.supplyType);
            redirect.addAttribute("page", leaseComplexTypeDto.page);

            return "redirect:/leasecomplex";
        }

        model.addAttribute("currentValue", leaseComplexTypeDto);

        return "leaseComplex";
    }
}
