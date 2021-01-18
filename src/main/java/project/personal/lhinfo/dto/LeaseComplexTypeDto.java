package project.personal.lhinfo.dto;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class LeaseComplexTypeDto {
    public String location;
    public String supplyType;
    public String page;

    public String getPage() {
        if(page == null) {
            return "1";
        } else {
            return this.page;
        }
    }
}
