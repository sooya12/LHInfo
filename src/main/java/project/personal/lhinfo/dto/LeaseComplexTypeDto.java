package project.personal.lhinfo.dto;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class LeaseComplexTypeDto {
    public String location;
    public String supplyType;
    public String page;

    public String getLocation() {
        if(location == null || "00".equals(location)) {
            return "";
        } else {
            return this.location;
        }
    }

    public String getSupplyType() {
        if(supplyType == null || "00".equals(supplyType)) {
            return "";
        } else {
            return this.supplyType;
        }
    }

    public String getPage() {
        if(page == null || "".equals(page)) {
            return "1";
        } else {
            return this.page;
        }
    }
}
