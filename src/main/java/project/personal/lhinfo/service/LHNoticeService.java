package project.personal.lhinfo.service;

import project.personal.lhinfo.dto.LHNoticeDto;

import java.io.IOException;
import java.util.List;

public interface LHNoticeService {

    List<LHNoticeDto> lhNoticeList() throws IOException;

    List<LHNoticeDto> lhNoticeSmallList() throws IOException;
}
