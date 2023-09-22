package com.shopping.model.bean;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.io.BufferedReader;
import java.io.IOException;

public class ApiExplorer {
    public static void main(String[] args) throws IOException {
        StringBuilder urlBuilder = new StringBuilder("http://api.data.go.kr/openapi/tn_pubr_public_car_rental_api"); /*URL*/
        urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "=KmSD%2BU%2B3R4TTLX%2B%2BBJTTSzxPmO3apldl6NfCAD7H8LjCXk2Jd0q24cVBwygkKOYyH50C%2BXNnt%2Flj3Vh5vCZ7HQ%3D%3D"); /*Service Key*/
        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("3", "UTF-8")); /*페이지 번호*/
        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("100", "UTF-8")); /*한 페이지 결과 수*/
        urlBuilder.append("&" + URLEncoder.encode("type","UTF-8") + "=" + URLEncoder.encode("json", "UTF-8")); /*XML/JSON 여부*/
        urlBuilder.append("&" + URLEncoder.encode("entrpsNm","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*업체명*/
        urlBuilder.append("&" + URLEncoder.encode("bplcType","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*사업장구분*/
        urlBuilder.append("&" + URLEncoder.encode("rdnmadr","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*소재지도로명주소*/
        urlBuilder.append("&" + URLEncoder.encode("lnmadr","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*소재지지번주소*/
        urlBuilder.append("&" + URLEncoder.encode("latitude","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*위도*/
        urlBuilder.append("&" + URLEncoder.encode("longitude","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*경도*/
        urlBuilder.append("&" + URLEncoder.encode("garageRdnmadr","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*차고지도로명주소*/
        urlBuilder.append("&" + URLEncoder.encode("garageLnmadr","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*차고지지번주소*/
        urlBuilder.append("&" + URLEncoder.encode("garageAceptncCo","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*보유차고지수용능력*/
        urlBuilder.append("&" + URLEncoder.encode("vhcleHoldCo","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*자동차총보유대수*/
        urlBuilder.append("&" + URLEncoder.encode("carHoldCo","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*승용차보유대수*/
        urlBuilder.append("&" + URLEncoder.encode("vansHoldCo","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*승합차보유대수*/
        urlBuilder.append("&" + URLEncoder.encode("eleCarHoldCo","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*전기승용자동차보유대수*/
        urlBuilder.append("&" + URLEncoder.encode("eleVansCarHoldCo","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*전기승합자동차보유대수*/
        urlBuilder.append("&" + URLEncoder.encode("lghvhclChrge","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*경차요금*/
        urlBuilder.append("&" + URLEncoder.encode("cmhvhclChrge","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*소형차요금*/
        urlBuilder.append("&" + URLEncoder.encode("mdhvhclChrge","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*중형차요금*/
        urlBuilder.append("&" + URLEncoder.encode("lgshvhclChrge","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*대형차요금*/
        urlBuilder.append("&" + URLEncoder.encode("vahvhclChrge","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*승합차요금*/
        urlBuilder.append("&" + URLEncoder.encode("lshvhclChrge","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*레저용차요금*/
        urlBuilder.append("&" + URLEncoder.encode("imhvhclChrge","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*수입차요금*/
        urlBuilder.append("&" + URLEncoder.encode("weekdayOperOpenHhmm","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*평일운영시작시각*/
        urlBuilder.append("&" + URLEncoder.encode("weekdayOperColseHhmm","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*평일운영종료시각*/
        urlBuilder.append("&" + URLEncoder.encode("wkendOperOpenHhmm","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*주말운영시작시각*/
        urlBuilder.append("&" + URLEncoder.encode("wkendOperCloseHhmm","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*주말운영종료시각*/
        urlBuilder.append("&" + URLEncoder.encode("holidayOperOpenHhmm","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*공휴일운영시작시각*/
        urlBuilder.append("&" + URLEncoder.encode("holidayCloseOpenHhmm","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*공휴일운영종료시각*/
        urlBuilder.append("&" + URLEncoder.encode("rstde","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*휴무일*/
        urlBuilder.append("&" + URLEncoder.encode("homepageUrl","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*홈페이지주소*/
        urlBuilder.append("&" + URLEncoder.encode("rprsntvNm","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*대표자명*/
        urlBuilder.append("&" + URLEncoder.encode("phoneNumber","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*전화번호*/
        urlBuilder.append("&" + URLEncoder.encode("referenceDate","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*데이터기준일자*/
        urlBuilder.append("&" + URLEncoder.encode("instt_code","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*제공기관코드*/
        URL url = new URL(urlBuilder.toString());
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
    }
}