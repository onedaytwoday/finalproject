package com.project.one.controller;
	
import java.io.IOException;
import java.text.ParseException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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

import com.fasterxml.jackson.databind.JsonNode;
import com.github.scribejava.core.model.OAuth2AccessToken;
import com.project.one.model.biz.MemberBiz;
import com.project.one.model.dto.MemberDto;

@Controller
public class MemberController {
	
	private Logger logger = LoggerFactory.getLogger(MemberController.class);
	//네이버로그인
	private NaverLogin naverLogin;
	private String apiResult = null;
	
	@Autowired
	private void setNaverLogin(NaverLogin naverLogin) {
		this.naverLogin = naverLogin;
	}

	
	@Autowired
	private MemberBiz biz;	
	
	//20210628 로그인
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
	
	//회원가입
	@RequestMapping("/signup.do")
	public String signupForm() {
		return "signup";
	}
	
	@RequestMapping("/general_signup.do")
	public String general_signupForm() {
		return "general_signup";
	}
	
	@RequestMapping("/teacher_signup.do")
	public String teacher_signupForm() {
		return "teacher_signup";
	}
	
	@RequestMapping("/idcheck.do")
	public String idCheck(Model model, String member_id) {
		
		MemberDto dto = biz.selectOne(member_id);
		boolean idnotused = true;
		
		if(dto != null) {
			idnotused = false;
		}
		
		model.addAttribute("idnotused", idnotused);
		
		return "idchk";
	}
	
	@RequestMapping("/signupRes.do")
	public String signupRes(MemberDto dto) {
		if(biz.register(dto) > 0) {
			return "redirect:loginform.do";
		}
		
		return "redirect:general_signup.do";
	}
	
	//네이버로그인
	//로그인 첫 화면 요청 메소드
	@RequestMapping(value = "/loginform.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String login(Model model, HttpSession session) {
		// 네이버아이디로 인증 URL을 생성
		String naverAuthUrl = naverLogin.getAuthorizationUrl(session);
		String kakaoUrl = KakaoController.getAuthorizationUrl(session);
		
		System.out.println("네이버:" + naverAuthUrl);
		model.addAttribute("naverUrl", naverAuthUrl);
		model.addAttribute("kakaoUrl",kakaoUrl);
		return "login";
	}
	//네이버 로그인 성공시 callback호출 메소드
	@RequestMapping(value = "/callback", method = { RequestMethod.GET, RequestMethod.POST })
	public String callback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session) throws IOException, ParseException {
		System.out.println("여기는 callback");
		OAuth2AccessToken oauthToken;
		oauthToken = naverLogin.getAccessToken(session, code, state);
		//1. 로그인 사용자 정보를 읽어온다.
		apiResult = naverLogin.getUserProfile(oauthToken); //String형식의 json데이터

		//2. String형식인 apiResult를 json형태로 바꿈
		JSONParser parser = new JSONParser();
		Object obj;
		try {
			obj = parser.parse(apiResult);
			JSONObject jsonObj = (JSONObject) obj;

			//3. 데이터 파싱
			//Top레벨 단계 _response 파싱
			JSONObject response_obj = (JSONObject)jsonObj.get("response");
			//response의 nickname값 파싱
			String nickname = (String)response_obj.get("nickname");
			System.out.println(nickname);
			//4.파싱 닉네임 세션으로 저장
			session.setAttribute("sessionId",nickname); //세션 생성
			model.addAttribute("result", apiResult);
		} catch (org.json.simple.parser.ParseException e) {
			e.printStackTrace();
		}
		
		return "login";
	}
	
	//카카오
	@RequestMapping(value = "/kakaologin.do",produces = "application/json", method = { RequestMethod.GET, RequestMethod.POST })
	public String kakaoLogin(Model model, @RequestParam("code") String code, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) {
		
		JsonNode node = KakaoController.getAccessToken(code);
		JsonNode accessToken = node.get("access_token");
		//사용자정보
		JsonNode userInfo = KakaoController.getKakaoUserInfo(accessToken);
		String kemail = null;
		String kname = null;
		String kgender = null;
		String kbirthday = null;
		String kage = null;
		String kimage = null;
		//사용자정보 카카오에서 가져오기
		JsonNode properties = userInfo.path("properties");
		JsonNode kakao_account = userInfo.path("kakao_account");
		kemail = kakao_account.path("email").asText();
		kname = properties.path("nickname").asText();
		kgender = kakao_account.path("gender").asText();
		kbirthday = kakao_account.path("birthday").asText();
		kage = kakao_account.path("age").asText();
		kimage = properties.path("profile_image").asText();
		session.setAttribute("kemail", kemail);
		session.setAttribute("kname",kname);
		session.setAttribute("kgender",kgender);
		session.setAttribute("kbirthday",kbirthday);
		session.setAttribute("kage",kage);
		session.setAttribute("kimage",kimage);
		return "main";
	}
	
	//로그아웃
	@RequestMapping(value = "/logout.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String logout(HttpSession session)throws IOException {
		
		session.invalidate();
		return "redirect:main.do";
	}
	@RequestMapping("/main.do")
	public String main() {
		return "main";
	}

}
