package com.project.one.util;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;

import org.json.simple.JSONObject;

public class Payment {
	private static String imp_key = "1270560309367009";
    private static String imp_secret = "z589m2YsfIvQnyaqsu5dy6bfZY2TppQZvY9R17kgPP6cnhDQMI4kPfAOeCID2yCyxMpyTJOJzVWXczOZ";
    
	public void post(){
        try {
            URL url = new URL("https://api.iamport.kr/users/getToken");
            HttpURLConnection con = (HttpURLConnection) url.openConnection();
            con.setConnectTimeout(5000); //서버에 연결되는 Timeout 시간 설정
            con.setReadTimeout(5000); // InputStream 읽어 오는 Timeout 시간 설정
            con.setRequestProperty("Content-Type", "application/json; charset=UTF-8");
            con.setRequestProperty("Accept", "application/json");
//            con.addRequestProperty("x-api-key", RestTestCommon.API_KEY); //key값 설정

            con.setRequestMethod("POST");

            //json으로 message를 전달하고자 할 때
            con.setRequestProperty("Content-Type", "application/json");
            con.setDoInput(true);
            con.setDoOutput(true); //POST 데이터를 OutputStream으로 넘겨 주겠다는 설정
            con.setUseCaches(false);
            con.setDefaultUseCaches(false);

            JSONObject key = new JSONObject();
            JSONObject secret = new JSONObject();
            key.put("imp_key", imp_key);
            key.put("imp_secret", imp_secret);

//            Map<String, String> key = new HashMap<>();
//            key.put("imp_key", imp_key);
//            key.put("imp_secret", imp_secret);

            OutputStreamWriter wr = new OutputStreamWriter(con.getOutputStream());
            wr.write(key.toString());
            wr.flush();

            StringBuilder sb = new StringBuilder();
            if (con.getResponseCode() == HttpURLConnection.HTTP_OK) {
                //Stream을 처리해줘야 하는 귀찮음이 있음.
                BufferedReader br = new BufferedReader(
                        new InputStreamReader(con.getInputStream(), "utf-8"));
                String line;
                while ((line = br.readLine()) != null) {
                    sb.append(line).append("\n");
                }
                br.close();
                System.out.println("" + sb.toString());
            } else {
                System.out.println(con.getResponseMessage());
            }
        } catch (Exception e){
            System.err.println(e.toString());
        }
    }
}
