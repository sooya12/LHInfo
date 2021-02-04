package project.personal.lhinfo.dto;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class SubLeaseNoticeDetailStoreDto {
    public String indsLclsCd;   // 상권업종 대분류 코드
    public String indsLclsNm;   // 상권업종 대분류 이름
    public String indsMclsCd;   // 미사용
    public String indsMclsNm;   // 미사용
    public String indsSclsCd;   // 미사용
    public String indsSclsNm;   // 미사용
    public String statCnt;      // 해당 업종 수

    @Override
    public String toString() {
        return "SubLeaseNoticeDetailStoreDto{" +
                "indsLclsCd='" + indsLclsCd + '\'' +
                ", indsLclsNm='" + indsLclsNm + '\'' +
                ", indsMclsCd='" + indsMclsCd + '\'' +
                ", indsMclsNm='" + indsMclsNm + '\'' +
                ", indsSclsCd='" + indsSclsCd + '\'' +
                ", indsSclsNm='" + indsSclsNm + '\'' +
                ", statCnt='" + statCnt + '\'' +
                '}';
    }
}
