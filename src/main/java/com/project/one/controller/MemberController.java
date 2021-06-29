package com.project.one.controller;
	
import java.io.IOException;
import java.text.ParseException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.scribejava.core.model.OAuth2AccessToken;
import com.project.one.model.biz.MemberBiz;
import com.project.one.model.dto.MemberDto;

@Controller
public class MemberController {
	
	private Logger logger = LoggerFactory.getLogger(MemberController.class);
	//�꽕�씠踰꾨줈洹몄씤
	private NaverLogin naverLogin;
	private String apiResult = null;
	
	@Autowired
	private void setNaverLogin(NaverLogin naverLogin) {
		this.naverLogin = naverLogin;
	}

	
	@Autowired
	private MemberBiz biz;	
	
	//20210628 濡쒓렇�씤
	@RequestMapping("/loginform.do")
	public String loginForm() {
				
		return "login";
	}
	
	@ResponseBody
	@RequestMapping(value="/ajaxlogin.do",method=RequestMethod.POST)
	public Map<String, Boolean> ajaxLogin(@RequestBody MemberDto dto, HttpSession session){
		//logger.info("[Controller] ajaxlogin.do");
		MemberDto res = biz.login(dto);
		boolean chk = false;
		if(res != null) {
			chk = true;
			session.setAttribute("login", res);
		}
		Map<String, Boolean> map = new HashMap<String, Boolean>();
		map.put("chk", chk);
		return map;
		
	}
	
	//�꽕�씠踰꾨줈洹몄씤
	//濡쒓렇�씤 泥� �솕硫� �슂泥� 硫붿냼�뱶
	@RequestMapping(value = "/login", method = { RequestMethod.GET, RequestMethod.POST })
	public String login(Model model, HttpSession session) {
		// �꽕�씠踰꾩븘�씠�뵒濡� �씤利� URL�쓣 �깮�꽦
		String naverAuthUrl = naverLogin.getAuthorizationUrl(session);
		System.out.println("�꽕�씠踰�:" + naverAuthUrl);
		model.addAttribute("url", naverAuthUrl);
		return "login";
	}
	//�꽕�씠踰� 濡쒓렇�씤 �꽦怨듭떆 callback�샇異� 硫붿냼�뱶
	@RequestMapping(value = "/callback", method = { RequestMethod.GET, RequestMethod.POST })
	public String callback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session) throws IOException, ParseException {
		System.out.println("�뿬湲곕뒗 callback");
		OAuth2AccessToken oauthToken;
		oauthToken = naverLogin.getAccessToken(session, code, state);
		//1. 濡쒓렇�씤 �궗�슜�옄 �젙蹂대�� �씫�뼱�삩�떎.
		apiResult = naverLogin.getUserProfile(oauthToken); //String�삎�떇�쓽 json�뜲�씠�꽣

		//2. String�삎�떇�씤 apiResult瑜� json�삎�깭濡� 諛붽퓞
		JSONParser parser = new JSONParser();
		Object obj;
		try {
			obj = parser.parse(apiResult);
			JSONObject jsonObj = (JSONObject) obj;

			//3. �뜲�씠�꽣 �뙆�떛
			//Top�젅踰� �떒怨� _response �뙆�떛
			JSONObject response_obj = (JSONObject)jsonObj.get("response");
			//response�쓽 nickname媛� �뙆�떛
			String nickname = (String)response_obj.get("nickname");
			System.out.println(nickname);
			//4.�뙆�떛 �땳�꽕�엫 �꽭�뀡�쑝濡� ���옣
			session.setAttribute("sessionId",nickname); //�꽭�뀡 �깮�꽦
			model.addAttribute("result", apiResult);
		} catch (org.json.simple.parser.ParseException e) {
			e.printStackTrace();
		}
		
		return "login";
	}
	//濡쒓렇�븘�썐
	@RequestMapping(value = "/logout", method = { RequestMethod.GET, RequestMethod.POST })
	public String logout(HttpSession session)throws IOException {
		
		session.invalidate();
		return "redirect:index.jsp";
	}
	
	
	//회원가입
	@RequestMapping("/signup.do")
	public String SignForm() {
				
		return "signup";
	}
	
	@RequestMapping("/general_signup.do")
	public String general_signup() {
		
		return "general_signup";
		
	}
	
	@RequestMapping("/teacher_signup.do")
	public String teacher_signup() {
		
		return "teacher_signup";
		
	}
}
