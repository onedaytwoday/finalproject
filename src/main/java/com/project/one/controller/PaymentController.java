package com.project.one.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PaymentController {
	
	@RequestMapping("/payment.do")
    public String payment(){
        return "payment";
    }
}
