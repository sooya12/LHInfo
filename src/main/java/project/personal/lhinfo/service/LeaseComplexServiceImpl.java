package project.personal.lhinfo.service;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import project.personal.lhinfo.dto.LeaseComplexDto;
import project.personal.lhinfo.dto.LeaseComplexTypeDto;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

@Service
public class LeaseComplexServiceImpl implements LeaseComplexService {

    private static final Logger logger = LoggerFactory.getLogger(LeaseComplexServiceImpl.class);

    @Override
    public List<LeaseComplexDto> leaseComplexList(LeaseComplexTypeDto leaseComplexTypeDto) throws IOException {

        String serviceKey = "IhlOKKhbrN3s3DDJbBOWAXyGUX8JND9y16Yg%2Fbrs3nGCYyPxywXIyC%2Fu4Uzi9xUd4AR8XYpnGlcm2E%2FgskkKiQ%3D%3D";

        StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/B552555/lhLeaseInfo/lhLeaseInfo"); /*URL*/
        urlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + "=" + serviceKey); /*Service Key*/
        urlBuilder.append("&" + URLEncoder.encode("PG_SZ","UTF-8") + "=" + URLEncoder.encode("50", "UTF-8")); /*한 페이지 결과 수*/
        urlBuilder.append("&" + URLEncoder.encode("PAGE","UTF-8") + "=" + URLEncoder.encode(leaseComplexTypeDto.getPage(), "UTF-8")); /*페이지 번호*/
        urlBuilder.append("&" + URLEncoder.encode("CNP_CD","UTF-8") + "=" + URLEncoder.encode(leaseComplexTypeDto.getLocation(), "UTF-8")); /*지역코드*/
        urlBuilder.append("&" + URLEncoder.encode("SPL_TP_CD","UTF-8") + "=" + URLEncoder.encode(leaseComplexTypeDto.getSupplyType(), "UTF-8")); /*공급유형코드*/

        URL url = new URL(urlBuilder.toString());

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

        List<LeaseComplexDto> resultList = new ArrayList<>();
        ObjectMapper objectMapper = new ObjectMapper();

        JsonArray jsonArray = JsonParser.parseString(sb.toString()).getAsJsonArray();
        JsonObject jsonObject = jsonArray.get(1).getAsJsonObject();
        JsonArray leaseComplexArray = jsonObject.get("dsList").getAsJsonArray();

        for (int i = 0; i < leaseComplexArray.size(); i++) {
            resultList.add(objectMapper.readValue(leaseComplexArray.get(i).getAsJsonObject().toString(), LeaseComplexDto.class));
        }

        logger.info(resultList.toString());

        return resultList;
    }
}
