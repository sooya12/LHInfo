package project.personal.lhinfo.service;

import project.personal.lhinfo.dto.LeaseComplexDto;
import project.personal.lhinfo.dto.LeaseComplexTypeDto;

import java.io.IOException;
import java.util.List;

public interface LeaseComplexService {

    public List<LeaseComplexDto> leaseComplexList(LeaseComplexTypeDto leaseComplexTypeDto) throws IOException;
}
