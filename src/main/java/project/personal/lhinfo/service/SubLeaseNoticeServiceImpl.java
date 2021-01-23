package project.personal.lhinfo.service;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import org.springframework.stereotype.Service;
import project.personal.lhinfo.dto.SubLeaseNoticeDto;
import project.personal.lhinfo.dto.SubLeaseNoticeSearchDto;

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
//        urlBuilder.append("&" + URLEncoder.encode("PAN_NT_ST_DT","UTF-8") + "=" + URLEncoder.encode("2019.12.01", "UTF-8")); /*공고게시일*/
//        urlBuilder.append("&" + URLEncoder.encode("CLSG_DT","UTF-8") + "=" + URLEncoder.encode("2019.08.22", "UTF-8")); /*공고마감일*/

        return sendURL(urlBuilder.toString());
    }

    @Override
    public List<SubLeaseNoticeDto> subLeaseNoticeSmallList() throws IOException {
        StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/B552555/lhLeaseNoticeInfo/lhLeaseNoticeInfo"); /*URL*/
        urlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + "=" + serviceKey); /*Service Key*/
        urlBuilder.append("&" + URLEncoder.encode("PG_SZ","UTF-8") + "=" + URLEncoder.encode("5", "UTF-8")); /*한 페이지 결과 수*/
        urlBuilder.append("&" + URLEncoder.encode("PAGE","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*페이지 번호*/

        return sendURL(urlBuilder.toString());
    }

    private List<SubLeaseNoticeDto> sendURL(String urlStr) throws IOException {
        URL url = new URL(urlStr);
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");
        conn.setRequestProperty("Content-type", "application/json");
        System.out.println("Response code: " + conn.getResponseCode());
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
        System.out.println(sb.toString());

        List<SubLeaseNoticeDto> resultList = new ArrayList<>();
        ObjectMapper objectMapper = new ObjectMapper();

        JsonArray jsonArray = JsonParser.parseString(sb.toString()).getAsJsonArray();
        JsonObject jsonObject = jsonArray.get(1).getAsJsonObject();

        JsonArray subLeaseNoticeArray = jsonObject.get("dsList").getAsJsonArray();

        for (int i = 0; i < subLeaseNoticeArray.size(); i++) {
            resultList.add(objectMapper.readValue(subLeaseNoticeArray.get(i).getAsJsonObject().toString(), SubLeaseNoticeDto.class));
        }
        System.out.println(resultList.toString());

        return resultList;
    }
}
