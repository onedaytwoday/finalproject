package com.project.one.util;

import com.mashape.unirest.http.*;
import com.mashape.unirest.http.exceptions.UnirestException;

public class Notification {
	public static void main(String[] args) throws UnirestException {
		//getToken();
		//checkToken();
		sendPush();
	}
	
	public static void getToken() throws UnirestException {
		Unirest.setTimeouts(0, 0);
	    HttpResponse<String> response = Unirest.post("https://kapi.kakao.com/v2/push/register")
	      .header("Authorization", "KakaoAK 410af39d6d24b5ea8c1e327c81c35f9b")
	      .header("Content-Type", "application/x-www-form-urlencoded")
	      .field("uuid", "7285")
	      .field("device_id", "gsj7285")
	      .field("push_type", "fcm")
	      .field("push_token", "AAAAb9vCJM4:APA91bFU_KVdxSb-XeVmMSDV5394r_AXzZ4WisPNW91IpJJTq_m6vJernD0BWqDo81K8pvwoAKDXMye5MNETFHrQizmg87IUR_q-o1duRnyyNafzMCvdUdCkPwz3IVeA-pcmR5bYQ52z")
	      .asString();
	    
	    System.out.println(response.getBody());
	}
	
	public static void checkToken() throws UnirestException {
		 Unirest.setTimeouts(0, 0);
		    HttpResponse<String> response = Unirest.post("https://kapi.kakao.com/v2/push/tokens")
		      .header("Authorization", "KakaoAK 410af39d6d24b5ea8c1e327c81c35f9b")
		      .header("Content-Type", "application/x-www-form-urlencoded")
		      .field("uuid", "7285")
		      .asString();
		    
		    System.out.println(response.getBody());
	}
	
	public static void sendPush() throws UnirestException {
		Unirest.setTimeouts(0, 0);
	    HttpResponse<String> response = Unirest.post("https://kapi.kakao.com/v2/push/send")
	      .header("Authorization", "KakaoAK 410af39d6d24b5ea8c1e327c81c35f9b")
	      .header("Content-Type", "application/x-www-form-urlencoded")
	      .field("uuids", "[\"7285\"]")
	      .field("push_message", "{}").asString();
	    
	    System.out.println(response.getStatusText());
	    System.out.println(response.getBody());
	}
}
