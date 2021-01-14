package project.personal.lhinfo.service;

import project.personal.lhinfo.dto.LeaseComplexDto;

import java.io.IOException;
import java.util.List;

public interface LeaseComplexService {

    public List<LeaseComplexDto> leaseComplexList(String location, String supplyType, String page) throws IOException;
}
