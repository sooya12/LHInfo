package project.personal.lhinfo.service;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import org.springframework.stereotype.Service;
import project.personal.lhinfo.dto.LHNoticeDto;
import project.personal.lhinfo.dto.LHNoticeSearchDto;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

@Service
public class LHNoticeServiceImpl implements LHNoticeService {
    public String serviceKey = "IhlOKKhbrN3s3DDJbBOWAXyGUX8JND9y16Yg%2Fbrs3nGCYyPxywXIyC%2Fu4Uzi9xUd4AR8XYpnGlcm2E%2FgskkKiQ%3D%3D";

    @Override
    public List<LHNoticeDto> lhNoticeList(LHNoticeSearchDto lhNoticeSearchDto) throws IOException {
        StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/B552555/lhNoticeInfo/getNoticeInfo"); /*URL*/
        urlBuilder.append("?" + URLEncoder.encode("ServiceKey", "UTF-8") + "=" + serviceKey); /*Service Key*/
        urlBuilder.append("&" + URLEncoder.encode("PG_SZ", "UTF-8") + "=" + URLEncoder.encode("50", "UTF-8")); /*한 페이지 결과 수*/
//        urlBuilder.append("&" + URLEncoder.encode("SCH_ST_DT", "UTF-8") + "=" + URLEncoder.encode("2019-01-01", "UTF-8")); /*기간검색-시작일*/
//        urlBuilder.append("&" + URLEncoder.encode("SCH_ED_DT", "UTF-8") + "=" + URLEncoder.encode("2019-10-10", "UTF-8")); /*기간검색-종료일*/
        if("제목".equals(lhNoticeSearchDto.getSearchType())) {
            urlBuilder.append("&" + URLEncoder.encode("BBS_TL", "UTF-8") + "=" + URLEncoder.encode(lhNoticeSearchDto.getSearchContent(), "UTF-8")); /*검색어-제목*/
        } else if("내용".equals(lhNoticeSearchDto.getSearchType())) {
            urlBuilder.append("&" + URLEncoder.encode("BBS_DTL_CTS", "UTF-8") + "=" + URLEncoder.encode(lhNoticeSearchDto.getSearchContent(), "UTF-8")); /*검색어-내용*/
        }
        urlBuilder.append("&" + URLEncoder.encode("UPP_AIS_TP_CD", "UTF-8") + "=" + URLEncoder.encode(lhNoticeSearchDto.getNoticeType(), "UTF-8")); /*상위유형코드 토지,분양주택,신혼희망타운,임대주택,매입임대/전세임대,상가,기타*/
//        urlBuilder.append("&" + URLEncoder.encode("AIS_TP_CD", "UTF-8") + "=" + URLEncoder.encode("02", "UTF-8")); /*유형코드 주택용지,국민임대,집주인임대 등 상위유형코드의 하위유형코드*/
//        urlBuilder.append("&" + URLEncoder.encode("AIS_TP_CD_INT", "UTF-8") + "=" + URLEncoder.encode("36", "UTF-8")); /*유형코드-추가 집주인임대 조회용*/
//        urlBuilder.append("&" + URLEncoder.encode("AIS_TP_CD_INT2", "UTF-8") + "=" + URLEncoder.encode("26", "UTF-8")); /*유형코드-추가2 매입임대 조회용*/
//        urlBuilder.append("&" + URLEncoder.encode("AIS_TP_CD_INT3", "UTF-8") + "=" + URLEncoder.encode("17", "UTF-8")); /*유형코드-추가3 전세임대 조회용*/
        urlBuilder.append("&" + URLEncoder.encode("PAGE", "UTF-8") + "=" + URLEncoder.encode(lhNoticeSearchDto.getPage(), "UTF-8")); /*페이지번호*/
        URL url = new URL(urlBuilder.toString());
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");
        conn.setRequestProperty("Content-type", "application/json");
        System.out.println("Response code: " + conn.getResponseCode());
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
        System.out.println(sb.toString());

        List<LHNoticeDto> result = new ArrayList<>();
        ObjectMapper objectMapper = new ObjectMapper();

        JsonArray jsonArray = JsonParser.parseString(sb.toString()).getAsJsonArray();
        JsonObject jsonObject = jsonArray.get(1).getAsJsonObject();

        if(jsonObject.get("dsList") != null) {
            JsonArray noticeInfoArray = jsonObject.get("dsList").getAsJsonArray();
            for (int i = 0; i < noticeInfoArray.size(); i++) {
                result.add(objectMapper.readValue(noticeInfoArray.get(i).getAsJsonObject().toString(), LHNoticeDto.class));
            }
        }

        System.out.println(result.toString());

        return result;
    }

    @Override
    public List<LHNoticeDto> lhNoticeSmallList() throws IOException {
        StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/B552555/lhNoticeInfo/getNoticeInfo"); /*URL*/
        urlBuilder.append("?" + URLEncoder.encode("ServiceKey", "UTF-8") + "=" + serviceKey); /*Service Key*/
        urlBuilder.append("&" + URLEncoder.encode("PG_SZ", "UTF-8") + "=" + URLEncoder.encode("10", "UTF-8")); /*한 페이지 결과 수*/
        urlBuilder.append("&" + URLEncoder.encode("SCH_ST_DT", "UTF-8") + "=" + URLEncoder.encode("2019-01-01", "UTF-8")); /*기간검색-시작일*/
        urlBuilder.append("&" + URLEncoder.encode("PAGE", "UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*페이지번호*/
        URL url = new URL(urlBuilder.toString());
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");
        conn.setRequestProperty("Content-type", "application/json");
        System.out.println("Response code: " + conn.getResponseCode());
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
        System.out.println(sb.toString());

        List<LHNoticeDto> result = new ArrayList<>();
        ObjectMapper objectMapper = new ObjectMapper();

        JsonArray jsonArray = JsonParser.parseString(sb.toString()).getAsJsonArray();
        JsonObject jsonObject = jsonArray.get(1).getAsJsonObject();
        JsonArray noticeInfoArray = jsonObject.get("dsList").getAsJsonArray();

        for (int i = 0; i < noticeInfoArray.size(); i++) {
            result.add(objectMapper.readValue(noticeInfoArray.get(i).getAsJsonObject().toString(), LHNoticeDto.class));
        }

        System.out.println(result.toString());

        return result;
    }
}
