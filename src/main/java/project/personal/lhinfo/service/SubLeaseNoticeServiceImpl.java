package project.personal.lhinfo.service;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import project.personal.lhinfo.dto.*;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

@Service
public class SubLeaseNoticeServiceImpl implements SubLeaseNoticeService {

    private static final Logger logger = LoggerFactory.getLogger(LeaseComplexServiceImpl.class);

    private static String serviceKey = "IhlOKKhbrN3s3DDJbBOWAXyGUX8JND9y16Yg%2Fbrs3nGCYyPxywXIyC%2Fu4Uzi9xUd4AR8XYpnGlcm2E%2FgskkKiQ%3D%3D";

    @Override
    public List<SubLeaseNoticeDto> subLeaseNoticeList(SubLeaseNoticeSearchDto subLeaseNoticeSearchDto) throws IOException {
        StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/B552555/lhLeaseNoticeInfo/lhLeaseNoticeInfo"); /*URL*/
        urlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + "=" + serviceKey); /*Service Key*/
        urlBuilder.append("&" + URLEncoder.encode("PG_SZ","UTF-8") + "=" + URLEncoder.encode("50", "UTF-8")); /*한 페이지 결과 수*/
        urlBuilder.append("&" + URLEncoder.encode("PAGE","UTF-8") + "=" + URLEncoder.encode(subLeaseNoticeSearchDto.getPage(), "UTF-8")); /*페이지 번호*/
        urlBuilder.append("&" + URLEncoder.encode("PAN_NM","UTF-8") + "=" + URLEncoder.encode(subLeaseNoticeSearchDto.getNoticeName(), "UTF-8")); /*공고명으로 조회*/
        urlBuilder.append("&" + URLEncoder.encode("UPP_AIS_TP_CD","UTF-8") + "=" + URLEncoder.encode(subLeaseNoticeSearchDto.getNoticeType(), "UTF-8")); /*공고유형코드*/
        urlBuilder.append("&" + URLEncoder.encode("CNP_CD","UTF-8") + "=" + URLEncoder.encode(subLeaseNoticeSearchDto.getLocation(), "UTF-8")); /*지역코드*/
        urlBuilder.append("&" + URLEncoder.encode("PAN_SS","UTF-8") + "=" + URLEncoder.encode(subLeaseNoticeSearchDto.getNoticeStatusType(), "UTF-8")); /*공고상태코드*/

        if(!"".equals(subLeaseNoticeSearchDto.getStartDate())) {
            urlBuilder.append("&" + URLEncoder.encode("PAN_ST_DT", "UTF-8") + "=" + URLEncoder.encode(subLeaseNoticeSearchDto.getStartDate(), "UTF-8")); /*공고게시일-시작일*/
        }

        if(!"".equals(subLeaseNoticeSearchDto.getEndDate())) {
            urlBuilder.append("&" + URLEncoder.encode("PAN_ED_DT", "UTF-8") + "=" + URLEncoder.encode(subLeaseNoticeSearchDto.getEndDate(), "UTF-8")); /*공고게시일-종료일*/
        }

        if(!"".equals(subLeaseNoticeSearchDto.getEndStartDate())) {
            urlBuilder.append("&" + URLEncoder.encode("CLSG_ST_DT", "UTF-8") + "=" + URLEncoder.encode(subLeaseNoticeSearchDto.getEndStartDate(), "UTF-8")); /*공고마감일-시작일*/
        }

        if(!"".equals(subLeaseNoticeSearchDto.getEndEndDate())) {
            urlBuilder.append("&" + URLEncoder.encode("CLSG_ED_DT", "UTF-8") + "=" + URLEncoder.encode(subLeaseNoticeSearchDto.getEndEndDate(), "UTF-8")); /*공고마감일-종료일*/
        }

        return getNoticeList(urlBuilder.toString());
    }

    @Override
    public List<SubLeaseNoticeDto> subLeaseNoticeSmallList() throws IOException {
        StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/B552555/lhLeaseNoticeInfo/lhLeaseNoticeInfo"); /*URL*/
        urlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + "=" + serviceKey); /*Service Key*/
        urlBuilder.append("&" + URLEncoder.encode("PG_SZ","UTF-8") + "=" + URLEncoder.encode("10", "UTF-8")); /*한 페이지 결과 수*/
        urlBuilder.append("&" + URLEncoder.encode("PAGE","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*페이지 번호*/

        return getNoticeList(urlBuilder.toString());
    }

    private List<SubLeaseNoticeDto> getNoticeList(String urlStr) throws IOException {
        URL url = new URL(urlStr);

        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");
        conn.setRequestProperty("Content-type", "application/json");

        logger.info("Response code: " + conn.getResponseCode());

        BufferedReader rd;
        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        } else {
            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
        }
        StringBuilder sb = new StringBuilder();
        String line;
        while ((line = rd.readLine()) != null) {
            sb.append(line);
        }
        rd.close();
        conn.disconnect();
        logger.info(sb.toString());

        List<SubLeaseNoticeDto> resultList = new ArrayList<>();
        ObjectMapper objectMapper = new ObjectMapper();

        JsonArray jsonArray = JsonParser.parseString(sb.toString()).getAsJsonArray();
        JsonObject jsonObject = jsonArray.get(1).getAsJsonObject();

        JsonArray subLeaseNoticeArray = jsonObject.get("dsList").getAsJsonArray();

        for (int i = 0; i < subLeaseNoticeArray.size(); i++) {
            resultList.add(objectMapper.readValue(subLeaseNoticeArray.get(i).getAsJsonObject().toString(), SubLeaseNoticeDto.class));
        }
        logger.info(resultList.toString());

        return resultList;
    }

    @Override
    public SubLeaseNoticeDetailDto subLeaseNoticeDetail(SubLeaseNoticeDetailSearchDto subLeaseNoticeDetailSearchDto) throws IOException {
        StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/B552555/lhLeaseNoticeDtlInfo/getLeaseNoticeDtlInfo"); /*URL*/
        urlBuilder.append("?" + URLEncoder.encode("ServiceKey", "UTF-8") + "=" + serviceKey); /*Service Key*/
        urlBuilder.append("&" + URLEncoder.encode("SPL_INF_TP_CD", "UTF-8") + "=" + URLEncoder.encode(subLeaseNoticeDetailSearchDto.SPL_INF_TP_CD, "UTF-8")); /*분양임대공고문조회 API의 특정 공고의 응답 메시지 중 공급정보구분코드*/
        urlBuilder.append("&" + URLEncoder.encode("CCR_CNNT_SYS_DS_CD", "UTF-8") + "=" + URLEncoder.encode(subLeaseNoticeDetailSearchDto.CCR_CNNT_SYS_DS_CD, "UTF-8")); /*분양임대공고문조회 API의 특정 공고의 응답 메시지 중 고객센터연계시스템구분코드*/
        urlBuilder.append("&" + URLEncoder.encode("PAN_ID", "UTF-8") + "=" + URLEncoder.encode(subLeaseNoticeDetailSearchDto.PAN_ID, "UTF-8")); /*분양임대공고문조회 API의 특정 공고의 응답 메시지 중 공고아이디*/
        urlBuilder.append("&" + URLEncoder.encode("UPP_AIS_TP_CD", "UTF-8") + "=" + URLEncoder.encode(subLeaseNoticeDetailSearchDto.UPP_AIS_TP_CD, "UTF-8")); /*분양임대공고문조회 API의 특정 공고의 응답 메시지 중 상위매물유형코드*/
        urlBuilder.append("&" + URLEncoder.encode("AIS_TP_CD", "UTF-8") + "=" + URLEncoder.encode(subLeaseNoticeDetailSearchDto.AIS_TP_CD, "UTF-8")); /*분양임대공고문조회 API의 특정 공고의 응답 메시지 중 매물유형코드*/

        URL url = new URL(urlBuilder.toString());

        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");
        conn.setRequestProperty("Content-type", "application/json");

        logger.info("Response code: " + conn.getResponseCode());

        BufferedReader rd;
        if (conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        } else {
            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
        }
        StringBuilder sb = new StringBuilder();
        String line;
        while ((line = rd.readLine()) != null) {
            sb.append(line);
        }
        rd.close();
        conn.disconnect();
        logger.info(sb.toString());

        ObjectMapper objectMapper = new ObjectMapper();
        objectMapper.configure(com.fasterxml.jackson.core.JsonParser.Feature.ALLOW_UNQUOTED_CONTROL_CHARS, true);
        JsonArray jsonArray = JsonParser.parseString(sb.toString()).getAsJsonArray();
        JsonObject jsonObject = jsonArray.get(1).getAsJsonObject();

        SubLeaseNoticeDetailDto detail = objectMapper.readValue(jsonObject.toString(), SubLeaseNoticeDetailDto.class);
        logger.info(detail.toString());

        return detail;
    }

    @Override
    public JsonArray subLeaseNoticeDetailStore(String x, String y) throws IOException {
        StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/B553077/api/open/sdsc/storeStatsUpjongInRadius"); /*URL*/
        urlBuilder.append("?" + URLEncoder.encode("ServiceKey", "UTF-8") + "=" + serviceKey); /*Service Key*/
        urlBuilder.append("&" + URLEncoder.encode("radius", "UTF-8") + "=" + URLEncoder.encode("500", "UTF-8")); /* 반경 */
        urlBuilder.append("&" + URLEncoder.encode("cy", "UTF-8") + "=" + URLEncoder.encode(y, "UTF-8")); /* 경도 */
        urlBuilder.append("&" + URLEncoder.encode("cx", "UTF-8") + "=" + URLEncoder.encode(x, "UTF-8")); /* 위도 */
        urlBuilder.append("&" + URLEncoder.encode("type", "UTF-8") + "=" + URLEncoder.encode("json", "UTF-8")); /* 결과 형식 */

        URL url = new URL(urlBuilder.toString());

        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");
        conn.setRequestProperty("Content-type", "application/json");

        logger.info("Response code: " + conn.getResponseCode());

        BufferedReader rd;
        if (conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        } else {
            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
        }
        StringBuilder sb = new StringBuilder();
        String line;
        while ((line = rd.readLine()) != null) {
            sb.append(line);
        }
        rd.close();
        conn.disconnect();
        logger.info(sb.toString());

        JsonObject jsonObject = JsonParser.parseString(sb.toString()).getAsJsonObject().get("body").getAsJsonObject();
        JsonArray storeInfoArray = jsonObject.get("items").getAsJsonArray();

        return storeInfoArray;
    }
}
