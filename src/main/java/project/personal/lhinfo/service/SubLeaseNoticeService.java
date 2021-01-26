package project.personal.lhinfo.service;

import project.personal.lhinfo.dto.SubLeaseNoticeDetailDto;
import project.personal.lhinfo.dto.SubLeaseNoticeDetailSearchDto;
import project.personal.lhinfo.dto.SubLeaseNoticeDto;
import project.personal.lhinfo.dto.SubLeaseNoticeSearchDto;

import java.io.IOException;
import java.util.List;

public interface SubLeaseNoticeService {

    List<SubLeaseNoticeDto> subLeaseNoticeList(SubLeaseNoticeSearchDto subLeaseNoticeSearchDto) throws IOException;

    List<SubLeaseNoticeDto> subLeaseNoticeSmallList() throws IOException;

    SubLeaseNoticeDetailDto subLeaseNoticeDetail(SubLeaseNoticeDetailSearchDto subLeaseNoticeDetailSearchDto) throws IOException;
}
