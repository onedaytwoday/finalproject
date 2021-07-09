package com.project.one.controller;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

//REST API가 뭐지...
//이거 값을 받아서 뭘 어째야 하는거지....ㅠㅠ
@Controller
public class KakaoMap {
	
	//메인에서 지도 클릭시
	@RequestMapping("/map.do")
	public String map() {
		return "map";
	}
	
	@RequestMapping("/classmap.do")
	public String classMap() {
		return null;
	}
	

}
