package com.project.one.controller;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class KakaoMap {
	
	//메인에서 지도 클릭시
	@RequestMapping("/map.do")
	public String map() {
		return "map";
	}
	
	//등록된 클래스의 위치..클래스컨트롤러로 옮기는게 나은가...
	@RequestMapping("/classmap.do")
	public String classMap() {
		
		
		
		/*아래 코드는 예제 코드입니다.
		 * 
		 * 			PrintWriter out = response.getWriter();
			
			List<BusinessDto> list = biz.bookableMap();
			JSONObject obj = new JSONObject();
			JSONArray jsonArray = new JSONArray();
			for(int i = 0; i<list.size(); i++) {
				
				
				obj.put("business_addr",list.get(i).getBusiness_addr());
			    obj.put("business_name", list.get(i).getBusiness_name());
				
				jsonArray.add(obj);
			
			}
						
			out.print(jsonArray);
			out.flush();
		 */
		
		return null;
	}
	

}
