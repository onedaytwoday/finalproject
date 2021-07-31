package com.project.one.util;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

public class ElasticSearch {
	private static String CLASS_URL = "https://onedaytwoday.ent.us-west1.gcp.cloud.es.io/api/as/v1/engines/my-search-class/query_suggestion";
	private static String PRODUCT_URL = "https://onedaytwoday.ent.us-west1.gcp.cloud.es.io/api/as/v1/engines/my-search-product/query_suggestion";
	private static String PUBLIC_KEY = "search-5k8tjm2fv1y1c977mrmgtm72";
	
	public static List<String> getAutoCompleted(String category, String keyword) {
		List<String> list = new ArrayList<>();
		
		try {
			URL url = new URL(category.equals("class") ? CLASS_URL : PRODUCT_URL);
			HttpURLConnection con = (HttpURLConnection) url.openConnection();
			con.setConnectTimeout(5000); 
			con.setReadTimeout(5000); 
			con.setRequestProperty("Content-Type", "application/json; charset=UTF-8");
			con.setRequestProperty("Accept", "application/json");
			con.addRequestProperty("Authorization", "Bearer " + PUBLIC_KEY);
			con.setRequestMethod("POST");

			con.setRequestProperty("Content-Type", "application/json");
			con.setDoInput(true);
			con.setDoOutput(true); 
			con.setUseCaches(false);
			con.setDefaultUseCaches(false);

			JSONObject key = new JSONObject();
			key.put("query", keyword);

			OutputStreamWriter wr = new OutputStreamWriter(con.getOutputStream());
			wr.write(key.toString());
			wr.flush();
			
			if (con.getResponseCode() == HttpURLConnection.HTTP_OK) {
				BufferedReader br = new BufferedReader(new InputStreamReader(con.getInputStream(), "utf-8"));

				String responseText = br.readLine();
				
				System.out.println("성공 : "+responseText);
				
				list = getResult(responseText);
				
				br.close();
				
				
			} else {
				System.out.println("실패 : " + con.getResponseMessage());
			}
		} catch (Exception e) {
			System.err.println(e.toString());
		}
		
		return list;
	}
	
	public static List<String> getResult(String res) throws ParseException {
		JSONParser parser = new JSONParser();
		JSONObject jsonObj = (JSONObject) parser.parse(res);
		JSONObject jsonObj2 = (JSONObject) jsonObj.get("results");
		JSONArray jsonArr = (JSONArray) jsonObj2.get("documents");

		List<String> list = new ArrayList<>();
		
		for(Object obj : jsonArr) {
			JSONObject jObj = (JSONObject)obj;
			String result = (String)jObj.get("suggestion");
			list.add(result);
		}
		
		return list;
	}

}
