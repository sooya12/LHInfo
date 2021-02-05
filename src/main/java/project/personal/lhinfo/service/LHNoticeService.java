package project.personal.lhinfo.service;

import project.personal.lhinfo.dto.LHNoticeDto;
import project.personal.lhinfo.dto.LHNoticeSearchDto;

import java.io.IOException;
import java.util.List;

public interface LHNoticeService {

    List<LHNoticeDto> lhNoticeList(LHNoticeSearchDto lhNoticeSearchDto) throws IOException;

    List<LHNoticeDto> lhNoticeSmallList() throws IOException;
}
