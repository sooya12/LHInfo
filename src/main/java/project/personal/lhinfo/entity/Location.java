package project.personal.lhinfo.entity;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class Location {
    private String code;
    private String info;

    @Override
    public String toString() {
        return "Location{" +
                "code='" + code + '\'' +
                ", info='" + info + '\'' +
                '}';
    }
}
