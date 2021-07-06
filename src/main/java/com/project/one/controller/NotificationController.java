package com.project.one.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class NotificationController {

	@RequestMapping("/notification.do")
	public String push() {
		return "kakao";
	}
}
