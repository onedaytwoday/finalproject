package com.project.one.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class KakaoMap {
    
   @RequestMapping("/map.do")
   public String map() {
	   return "map";
   }
}


