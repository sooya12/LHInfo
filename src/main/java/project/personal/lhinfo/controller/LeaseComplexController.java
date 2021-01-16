package project.personal.lhinfo.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import project.personal.lhinfo.dto.LeaseComplexDto;
import project.personal.lhinfo.dto.LeaseComplexListDto;
import project.personal.lhinfo.entity.Location;
import project.personal.lhinfo.entity.SupplyType;
import project.personal.lhinfo.service.LeaseComplexService;
import project.personal.lhinfo.service.TypeService;

import java.util.List;

@Controller
@RequestMapping(value = "/leasecomplex")
public class LeaseComplexController {

    private static final Logger logger = LoggerFactory.getLogger(LeaseComplexController.class);

    @Autowired
    LeaseComplexService leaseComplexService;

    @Autowired
    TypeService typeService;

    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public String leaseComplexList(Model model, LeaseComplexListDto leaseComplexListDto) {
        String location = leaseComplexListDto.getLocation();
        String supplyType = leaseComplexListDto.getSupplyType();
        String page = leaseComplexListDto.getPage();

        logger.info(location + ", " + supplyType + ", " + page);

        List<Location> locationList = typeService.locationList();
        logger.info(locationList.toString());
        model.addAttribute("locationList", locationList);

        List<SupplyType> supplyTypeList = typeService.supplyTypeList();
        logger.info(supplyTypeList.toString());
        model.addAttribute("supplyTypeList", supplyTypeList);

        try {
            List<LeaseComplexDto> leaseComplexList = leaseComplexService.leaseComplexList(location, supplyType, page);
            System.out.println(leaseComplexList.toString());
            model.addAttribute("leaseComplexList", leaseComplexList);

            int totalCnt = Integer.parseInt(leaseComplexList.get(0).ALL_CNT);
            int pageCnt = totalCnt / 100 + 1;

            if(pageCnt < 2) {
                pageCnt = 1;
                leaseComplexListDto.setPage("1");
            }
            model.addAttribute("pageCnt", pageCnt);
        } catch (Exception e) {
            e.printStackTrace();
        }

        model.addAttribute("currentValue", leaseComplexListDto);

        return "leaseComplex";
    }
}
