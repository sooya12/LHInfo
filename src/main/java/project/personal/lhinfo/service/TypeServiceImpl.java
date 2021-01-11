package project.personal.lhinfo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import project.personal.lhinfo.dao.TypeDao;
import project.personal.lhinfo.entity.Location;
import project.personal.lhinfo.entity.NoticeStatusType;
import project.personal.lhinfo.entity.NoticeType;
import project.personal.lhinfo.entity.SupplyType;

import java.util.List;

@Service
public class TypeServiceImpl implements TypeService {

    @Autowired
    TypeDao typeDao;

    @Override
    public List<Location> locationList() {
        return typeDao.locationList();
    }

    @Override
    public List<SupplyType> supplyTypeList() {
        return typeDao.supplyTypeList();
    }

    @Override
    public List<NoticeType> noticeTypeList() {
        return typeDao.noticeTypeList();
    }

    @Override
    public List<NoticeStatusType> noticeStatusTypeList() {
        return typeDao.noticeStatusTypeList();
    }
}
