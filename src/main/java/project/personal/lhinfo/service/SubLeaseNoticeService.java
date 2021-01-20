package project.personal.lhinfo.service;

import project.personal.lhinfo.dto.SubLeaseNoticeDto;

import java.io.IOException;
import java.util.List;

public interface SubLeaseNoticeService {

    List<SubLeaseNoticeDto> subLeaseNoticeList() throws IOException;
}
