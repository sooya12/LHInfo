package project.personal.lhinfo.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import project.personal.lhinfo.entity.Location;
import project.personal.lhinfo.entity.NoticeStatusType;
import project.personal.lhinfo.entity.NoticeType;
import project.personal.lhinfo.entity.SupplyType;

import java.util.List;

@Repository
public class TypeDaoImpl implements TypeDao {

    @Autowired
    private SqlSessionTemplate session;

    public List<Location> locationList() {
        return session.selectList("lhinfoDB.selectLocations");
    }

    public List<SupplyType> supplyTypeList() {
        return session.selectList("lhinfoDB.selectSupplyTypes");
    }

    public List<NoticeType> noticeTypeList() {
        return session.selectList("lhinfoDB.selectNoticeTypes");
    }

    public List<NoticeStatusType> noticeStatusTypeList() {
        return session.selectList("lhinfoDB.selectNoticeStatusTypes");
    }
}
