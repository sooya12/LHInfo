package project.personal.lhinfo.service;

import project.personal.lhinfo.dto.SubLeaseNoticeDto;
import project.personal.lhinfo.dto.SubLeaseNoticeSearchDto;

import java.io.IOException;
import java.util.List;

public interface SubLeaseNoticeService {

    List<SubLeaseNoticeDto> subLeaseNoticeList(SubLeaseNoticeSearchDto subLeaseNoticeSearchDto) throws IOException;
}
