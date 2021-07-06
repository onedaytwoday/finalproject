package com.project.one.controller;

import java.io.DataOutputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;

import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;

import org.apache.commons.codec.binary.Base64;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import java.io.BufferedReader;

public class SendSMS {
	
	
	public static void sendSMS(String phonenumber) {
		String hostNameUrl = "https://sens.apigw.ntruss.com";
		String requestUrl = "/sms/v2/services/";
		String requestUrlType = "/messages";
		String accessKey = "OyAlpR3VBplUwcOt7GbU";
		String secretKey = "U4BZQUGA0ildti8GPxNdHKG7tohCP8HeiGFbY6QS";
		String serviceId = "ncp:sms:kr:269419263053:final";
		String method = "POST";
		String timestamp = Long.toString(System.currentTimeMillis());
		requestUrl += serviceId + requestUrlType;
		String apiUrl = hostNameUrl + requestUrl;

		JSONObject bodyJson = new JSONObject();
		JSONObject toJson = new JSONObject();
		JSONArray toArr = new JSONArray();
		String content = Random(4);
		toJson.put("content", "인증번호는 " + content + "입니다.");
		toJson.put("to", phonenumber);
		toArr.add(toJson);

		bodyJson.put("type", "sms");
		bodyJson.put("contentType", "COMM");
		bodyJson.put("countryCode", "82");
		bodyJson.put("from", "01071826592");
		bodyJson.put("content", "hello");
		bodyJson.put("messages", toArr);

		String body = bodyJson.toJSONString();
		System.out.println(body);

		try {
			
			URL url = new URL(apiUrl);

			HttpURLConnection con = (HttpURLConnection) url.openConnection();
			con.setUseCaches(false);
			con.setDoInput(true);
			con.setDoOutput(true);
			con.setRequestProperty("content-type", "application/json");
			con.setRequestProperty("x-ncp-apigw-timestamp", timestamp);
			con.setRequestProperty("x-ncp-iam-access-key", accessKey);
			con.setRequestProperty("x-ncp-apigw-signatrue-v2", makeSignature(requestUrl, timestamp,method, accessKey, secretKey));
			
			con.setRequestMethod(method);	
			con.setDoOutput(true);
			DataOutputStream wr = new DataOutputStream(con.getOutputStream());
			
			wr.write(body.getBytes());
			wr.flush();
			wr.close();
			int responseCode = con.getResponseCode();
			BufferedReader br;
			System.out.println("responseCode" + " " + responseCode);
			System.out.println("responsemessage : " + con.getResponseMessage());
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
	
	public static String makeSignature(String url, String timestamp, String method, String accessKey, String secretKey)
			throws NoSuchAlgorithmException, InvalidKeyException {
		String space = " ";
		String newLine = "\n";

		String message = new StringBuilder().append(method).append(space).append(url).append(newLine).append(timestamp)
				.append(newLine).append(accessKey).toString();

		SecretKeySpec signingKey;
		String encodeBase64String;

		try {
			signingKey = new SecretKeySpec(secretKey.getBytes("UTF-8"), "HmacSHA256");
			Mac mac = Mac.getInstance("HmacSHA256");
			mac.init(signingKey);
			byte[] rawHmac = mac.doFinal(message.getBytes("UTF-8"));
			encodeBase64String = Base64.encodeBase64String(rawHmac);
		} catch (UnsupportedEncodingException e) {
			encodeBase64String = e.toString();
		}
		return encodeBase64String;
	}
	
	public static String Random(int len) {
		char[] charSet = new char[] { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9' };
		int idx = 0;
		StringBuffer sb = new StringBuffer();
		for (int i = 0; i < len; i++) {
			idx = (int) (charSet.length * Math.random());
			sb.append(charSet[idx]);
		}
		return sb.toString();
	}
	
}
