package com.project.one.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.URL;
import java.net.URLEncoder;
 
import javax.net.ssl.HttpsURLConnection;

//REST API가 뭐지...
//이거 값을 받아서 뭘 어째야 하는거지....ㅠㅠ

public class KakaoMap {
	public static void main(String[] args) throws Exception {
        
	     
       System.out.println(addrToCoord(URLEncoder.encode("주소입력","UTF-8")));
       System.out.println(coordToAddr("37.5665958","126.9783813"));
   }
    
   public static String addrToCoord(String addr){
        
       String url = "https://dapi.kakao.com/v2/local/search/address.json?query="+addr;
       String json = "";
       try{
           json = getJSONData(url);
       }catch(Exception e){
            
           e.printStackTrace();
       }
       return json;
   }

   public static String coordToAddr(String x, String y){
        
       String url = "https://dapi.kakao.com/v2/local/geo/coord2address.json?x="+x+"&y="+y+"&input_coord=WGS84";
       String json = "";
       try{
           json = getJSONData(url);
       }catch(Exception e){
            
           e.printStackTrace();
       }
       return json;
   }
    
    
   private static String getJSONData(String apiUrl) throws Exception {
       String jsonString = new String();
       String buf;
       String apikey = "7eb418111cb9d90de5cf381fd7efd09c"; //apikey	*REST API 키
        
       URL url = new URL(apiUrl);
       HttpsURLConnection conn = (HttpsURLConnection) url.openConnection();
       String auth = "KakaoAK "+apikey;
       conn.setRequestMethod("GET");
       conn.setRequestProperty("X-Requested-With", "curl");
       conn.setRequestProperty("Authorization", auth);
        
       BufferedReader br = new BufferedReader(new InputStreamReader(
               conn.getInputStream(), "UTF-8"));
       while ((buf = br.readLine()) != null) {
           jsonString += buf;
       }
       return jsonString;
   }
	}


