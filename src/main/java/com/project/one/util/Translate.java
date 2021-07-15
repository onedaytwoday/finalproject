package com.project.one.util;

import java.io.DataOutputStream;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;

public class Translate {

	private static String CLIENT_ID = "";
	private static String CLIENT_SECRET = "";
	
	public static String detectLangs(String params, int timeout) throws Exception {
	    String response = null;
	        
	    HttpURLConnection conn = null;
	    DataOutputStream dos = null;
	    InputStream is = null;
	    try {
	        URL url = new URL("https://openapi.naver.com/v1/papago/detectLangs");
	        conn = (HttpURLConnection)url.openConnection();
	        conn.setDoInput(true);
	        conn.setDoOutput(true);
	        conn.setConnectTimeout(timeout);
	        conn.setRequestMethod("POST");
	        conn.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
	        conn.setRequestProperty("charset", "utf-8");
	        conn.setRequestProperty("Content-Length", Integer.toString(params.getBytes().length));
	        conn.addRequestProperty("X-Naver-Client-Id", CLIENT_ID);
	        conn.addRequestProperty("X-Naver-Client-Secret", CLIENT_SECRET);

	        
	        dos = new DataOutputStream(conn.getOutputStream());
	        dos.writeBytes(params);
	        dos.flush();
	        
	        is = conn.getInputStream();
	        //Scanner s = new Scanner(is).useDelimiter("\\A");
	        //response = s.hasNext() ? s.next() : null;
	    } finally {
	        if (dos != null) { 
	            dos.close(); 
	        }
	        
	        if (is != null) { 
	            is.close(); 
	        }
	        
	        if (conn != null) { 
	            conn.disconnect(); 
	        }
	    }
	    
	    return response;
	}
	
}
