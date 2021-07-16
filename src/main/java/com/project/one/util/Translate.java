package com.project.one.util;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;


public class Translate {

	private static String TRANSLATE_URL = "https://openapi.naver.com/v1/papago/n2mt";
	private static String DETECT_URL = "https://openapi.naver.com/v1/papago/detectLangs";
	private static String CLIENT_ID = "qckL60NCrtcchSd1kZrm";
	private static String CLIENT_SECRET = "jCGug49JiT";
	private static HttpURLConnection con;

	public static String detectLangs(String text){
        HttpURLConnection con = connect(DETECT_URL);
        String postParams =  "query="  + addText(text);
        try {
            con.setRequestMethod("POST");
            con.setRequestProperty("X-Naver-Client-Id", CLIENT_ID);
			con.setRequestProperty("X-Naver-Client-Secret", CLIENT_SECRET);
            con.setDoOutput(true);
            
            try (DataOutputStream wr = new DataOutputStream(con.getOutputStream())) {
                wr.write(postParams.getBytes());
                wr.flush();
            }

            int responseCode = con.getResponseCode();
            if (responseCode == HttpURLConnection.HTTP_OK) { // 정상 응답
                return readBody(con.getInputStream());
            } else {  // 에러 응답
                return readBody(con.getErrorStream());
            }
        } catch (IOException e) {
            throw new RuntimeException("API 요청과 응답 실패", e);
        } finally {
            con.disconnect();
        }
    }
	
	public static String translate(String text, String lang, boolean bool){
        HttpURLConnection con = connect(TRANSLATE_URL);
        String postParams;
        if(bool) {
        	postParams = "source="+lang+"&target=ko&text=" + text;
        } else {
        	postParams = "source=ko&target="+lang+"&text=" + text;
        }
        
        try {
            con.setRequestMethod("POST");
            con.setRequestProperty("X-Naver-Client-Id", CLIENT_ID);
			con.setRequestProperty("X-Naver-Client-Secret", CLIENT_SECRET);
            con.setDoOutput(true);
            
            try (DataOutputStream wr = new DataOutputStream(con.getOutputStream())) {
                wr.write(postParams.getBytes());
                wr.flush();
            }

            int responseCode = con.getResponseCode();
            if (responseCode == HttpURLConnection.HTTP_OK) { // 정상 응답
                return readBody(con.getInputStream());
            } else {  // 에러 응답
                return readBody(con.getErrorStream());
            }
        } catch (IOException e) {
            throw new RuntimeException("API 요청과 응답 실패", e);
        } finally {
            con.disconnect();
        }
    }

    private static HttpURLConnection connect(String apiUrl){
        try {
            URL url = new URL(apiUrl);
            return (HttpURLConnection)url.openConnection();
        } catch (MalformedURLException e) {
            throw new RuntimeException("API URL이 잘못되었습니다. : " + apiUrl, e);
        } catch (IOException e) {
            throw new RuntimeException("연결이 실패했습니다. : " + apiUrl, e);
        }
    }

    private static String readBody(InputStream body){
        InputStreamReader streamReader = new InputStreamReader(body);
        String result="";
        
        try (BufferedReader lineReader = new BufferedReader(streamReader)) {
        	String responseText = lineReader.readLine();
        	
        	JSONParser parser = new JSONParser();
			JSONObject jsonObj = (JSONObject) parser.parse(responseText);
			
			if(jsonObj.get("langCode") != null) {
				result = (String) jsonObj.get("langCode");
			
			} else {
				JSONObject jsonObject1 = (JSONObject) jsonObj.get("message");
				JSONObject jsonObject2 = (JSONObject) jsonObject1.get("result");
				result = (String) jsonObject2.get("translatedText");
			}

            return result;
        } 
        
        catch (IOException | ParseException e) {
            throw new RuntimeException("API 응답을 읽는데 실패했습니다.", e);
        } 
    }
    
    private static String addText(String text) {
    	try {
            text = URLEncoder.encode(text, "UTF-8");
        } catch (UnsupportedEncodingException e) {
            throw new RuntimeException("인코딩 실패", e);
        }
    	
    	return text;
    }

}
