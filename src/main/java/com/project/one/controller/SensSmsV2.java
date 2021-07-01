package com.project.one.controller;

import java.io.DataOutputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;

import javax.crypto.Mac;
import javax.crypto.SecretKey;
import javax.crypto.spec.SecretKeySpec;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import java.io.BufferedReader;

public class SensSmsV2 {
	public static void main(String[] args) {
		String hostNameUrl = "https://sens.apigw.ntruss.com";		// 호스트 URL
		String requestUrl = "sms/v2/services";						// 요청 URL
		String requestUrlType = "/messages";						// 요청 URL
		String accessKey = "jbrtaEOGdQ09E1GmSqsM";										// 네이버클라우드플랫폼 API인증
		String SecretKey = "cxbotWR85UrgDDlPU6078L0Ka5xzQPwGaODRZxCb";										// 2차인증용 Secret Key 
		String serviceId ="ncp:sms:kr:269263696443:onedaytwoday";										// 프로젝트에 할당된 SMS서비스 ID???
		String method = "POST";										// 요청 method
		String timestamp = Long.toString(System.currentTimeMillis());
		requestUrl += serviceId + requestUrlType;
		
		String apiUrl = hostNameUrl+requestUrl;
		
		//JSON 을 활용한 body data 생성
		
		JSONObject bodyJson = new JSONObject();
		JSONObject toJson = new JSONObject();
		
		JSONArray toArr = new JSONArray();
		
		toJson.put("subject", "");			//메시지 내용 * LMS Type에서만 사용 가능
		toJson.put("content", "이건 테스트 메시지");			//메시지 내용 * Type별 최대 byte제한이 다름. * SMS:80/LMS: 2000
		toJson.put("to", "01093986630");				//수신번호 목록
		toArr.add(toJson);				
		
		bodyJson.put("type", "sms");			//메시지 타입 (sms|lms)
		bodyJson.put("contentType", "COMM");	//메시지내용타입(AD|COMM) *AD: 광고용/COMM: 일반용
		bodyJson.put("countryCode", "82");	//국가 전화번호
		bodyJson.put("from", "01093986630");			//발신번호*사전에인증,등록된 번호만 사용가능
		bodyJson.put("subject", "");		//메시지 제목 * LMS Type에서만 사용 가능
		bodyJson.put("content", "");		//메시지 내용 * Type별 최대 byte제한이 다름. * SMS:80/LMS: 2000
		bodyJson.put("messages", toArr);
		
		String body = bodyJson.toJSONString();
		
		System.out.println(body);
		
		try {
			
			URL url = new URL(apiUrl);
			
			HttpURLConnection con = (HttpURLConnection)url.openConnection();
			con.setUseCaches(false);
			con.setDoOutput(true);
			con.setDoInput(true);
			con.setRequestProperty("content-type", "application/json");
			con.setRequestProperty("x-ncp-apigw-timestamp", "timestamp");
			con.setRequestProperty("x-ncp-iam-access-key", "accessKey");
			con.setRequestProperty("x-ncp-apigw-signatrue-v2", makeSignature(requestUrl, timestamp, method, accessKey, SecretKey));
			con.setRequestMethod(method);
			con.setDoOutput(true);
			DataOutputStream wr = new DataOutputStream(con.getOutputStream());
			
			wr.write(body.getBytes());
			wr.flush();
			wr.close();
			
			int responseCode = con.getResponseCode();
			BufferedReader br;
			System.out.println("responseCode" + " " + responseCode);
			if(responseCode==202) {		//정상호출
				br = new BufferedReader(new InputStreamReader(con.getInputStream()));
			}else {						//에러발생
				br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
			}
			
			String inputLine;
			StringBuffer response = new StringBuffer();
			while ((inputLine = br.readLine()) !=null) {
				response.append(inputLine);
			}
			br.close();
			
			System.out.println(response.toString());
	
		}catch (Exception e) {
			System.out.println(e);
		}
	}
	
	
	public static String makeSignature(String url, String timestamp, String method, String accessKey, String SecretKey) throws NoSuchAlgorithmException, InvalidKeyException {
		String space = " "; 		//one space
		String newLine = "\n";		//new line
		
		String message = new StringBuilder()
				.append(method)
				.append(space)
				.append(url)
				.append(newLine)
				.append(timestamp)
				.append(newLine)
				.append(accessKey)
				.toString();
		
		SecretKeySpec signingKey;
		String encodeBase64String;
		
		try {
			signingKey = new SecretKeySpec(SecretKey.getBytes("UTF-8"), "HmacSHA256");
			Mac mac = Mac.getInstance("HmacSHA256");
			mac.init(signingKey);
			byte[] rawHmac = mac.doFinal(message.getBytes("UTF-8"));
			encodeBase64String = Base64.getEncoder().encodeToString(rawHmac);
		} catch (UnsupportedEncodingException e) {
				encodeBase64String = e.toString();
			
			e.printStackTrace();
		}
		return encodeBase64String;
		
		
		
	}
	
	
	
	
		
	
	
}
