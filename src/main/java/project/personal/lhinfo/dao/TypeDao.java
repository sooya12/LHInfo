package project.personal.lhinfo.dao;

import project.personal.lhinfo.entity.Location;
import project.personal.lhinfo.entity.NoticeStatusType;
import project.personal.lhinfo.entity.NoticeType;
import project.personal.lhinfo.entity.SupplyType;

import java.util.List;

public interface TypeDao {
    List<Location> locationList();

    List<SupplyType> supplyTypeList();

    List<NoticeType> noticeTypeList();

    List<NoticeStatusType> noticeStatusTypeList();
}
