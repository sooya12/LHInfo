package project.personal.lhinfo.service;

import com.google.gson.JsonArray;
import project.personal.lhinfo.dto.*;

import java.io.IOException;
import java.util.List;

public interface SubLeaseNoticeService {

    List<SubLeaseNoticeDto> subLeaseNoticeList(SubLeaseNoticeSearchDto subLeaseNoticeSearchDto) throws IOException;

    List<SubLeaseNoticeDto> subLeaseNoticeSmallList() throws IOException;

    SubLeaseNoticeDetailDto subLeaseNoticeDetail(SubLeaseNoticeDetailSearchDto subLeaseNoticeDetailSearchDto) throws IOException;

    JsonArray subLeaseNoticeDetailStore(String x, String y) throws IOException;
}
