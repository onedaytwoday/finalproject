package com.project.one.controller;
	
import java.io.IOException;
import java.text.ParseException;
import java.util.HashMap;
import java.util.List;
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
import com.project.one.model.biz.BasketBiz;
import com.project.one.model.biz.ClassBiz;
import com.project.one.model.biz.EventBiz;
import com.project.one.model.biz.MemberBiz;
import com.project.one.model.biz.ProductBiz;
import com.project.one.model.biz.RankBiz;
import com.project.one.model.biz.ReviewBiz;
import com.project.one.model.dto.BasketDto;
import com.project.one.model.dto.ChatSession;
import com.project.one.model.dto.ClassDto;
import com.project.one.model.dto.EventDto;
import com.project.one.model.dto.MemberDto;
import com.project.one.model.dto.ProductDto;
import com.project.one.model.dto.RankDto;
import com.project.one.model.dto.SearchDto;

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
	
	@Autowired
	private ReviewBiz rbiz;
	
	@Autowired
	private EventBiz eBiz;
	
	@Autowired
	private ProductBiz pbiz;
	
	@Autowired
	private ClassBiz cBiz;
	
	@Autowired
	private RankBiz Rbiz;
	
	@RequestMapping("/index.do")
	public String index(Model model) {
		int res = eBiz.updateNoti();
		System.out.println("res : " + res);
		
		List<SearchDto> list = rbiz.search();
		for(int i=0;i<list.size();i++) {
			if(list.get(i).getProduct_no() == 0) {
				  ClassDto dto = cBiz.selectOne(list.get(i).getClass_no());
				  
				  RankDto Rdto = new RankDto(i+1,dto.getClass_title());
				  if(Rbiz.update(Rdto) > 0) {
					  System.out.println("rank update 성공");
				  }else {
					  System.out.println("rank update 실패");
				  }
			}else {
				ProductDto dto = pbiz.selectOne(list.get(i).getProduct_no());
				
				RankDto Rdto = new RankDto(i+1,dto.getProduct_name());
				  if(Rbiz.update(Rdto) > 0) {
					  System.out.println("rank update 성공");
				  }else {
					  System.out.println("rank update 실패");
				  }
			}
		}
		model.addAttribute("list", eBiz.selectList());
		model.addAttribute("clist", cBiz.main_selectList());
		model.addAttribute("plist", pbiz.main_selectList());
		return "main";
	}
	
	//20210628 로그인
	@RequestMapping("/loginform.do")
	public String loginForm() {
		return "login";
	}
	
	@ResponseBody
	@RequestMapping(value="/ajaxlogin.do",method=RequestMethod.POST)
	public Map<String, Boolean> ajaxLogin(@RequestBody MemberDto dto, HttpSession session){
		//logger.info("[Controller] ajaxlogin.do");
		Map<String, Boolean> map = new HashMap<String, Boolean>();
		
		MemberDto mDto = biz.login(dto);
		boolean chk = false;
		boolean ip_chk = false;
		boolean alarm = false;
		
		if(mDto != null && mDto.getMember_grade() != "관리자") {
			if(mDto.getMember_join().equals("N")) {
				map.put("lock", true);
				
			} else {
				chk = true;
				session.setAttribute("mDto", mDto);
				
				if(mDto.getMember_notify().equals("N")) {
					ip_chk = true;
				
				} else if (mDto.getMember_notify().equals("Y")) {
					if(dto.getMember_ip().equals(mDto.getMember_ip())) {
						ip_chk = true;
					}
					if(eBiz.selectList() != null) {
						 alarm = true;
					}
				}
			}
		}
		
		map.put("chk", chk);
		map.put("ip_chk", ip_chk);
		map.put("alarm", alarm);
		
		return map;
		
	}	
	
	//회원가입
	@RequestMapping("/signup.do")
	public String signupForm(MemberDto dto, HttpSession session) {
		if(dto.getMember_id()!=null) {
			MemberDto mDto = biz.selectOne(dto.getMember_id());
			if(mDto!=null) {
				session.setAttribute("mDto", mDto);
				session.setMaxInactiveInterval(-1);
				return "redirect:main.do";
			}	
		}
		return "signup";
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
		
		return "redirect:signup.do";
	}
	@RequestMapping("/sns_signupRes.do")
	public String sns_signupRes(MemberDto mDto, HttpSession session) {
		if(biz.register(mDto) > 0) {
			session.setAttribute("mdto", mDto);
			session.setMaxInactiveInterval(-1);
			return "redirect:main.do";
		}
		
		return "redirect:signup.do?mDto="+mDto;
	}
	
	
	// 아이디 / 비밀번호 찾기
	@RequestMapping("/findIdPwForm.do")
	public String find_id_pw_form() {
		return "find_id_pw";
	}
	
	@ResponseBody
	@RequestMapping(value="/findIdPw.do", method=RequestMethod.POST)
	public  Map<String, String> find_id(@RequestBody MemberDto dto) {
		if(dto.getMember_id() != null) {
			dto.setMember_name("");
		} else {
			dto.setMember_id("");
		}

		MemberDto checkUser = biz.findIdPw(dto);
		Map<String, String> map = new HashMap<>();

		if(checkUser != null) {
			String num = Random(4);
			SendSMS.sendSMS(checkUser.getMember_phone(),num);
			map.put("num", num);
			map.put("member_id", checkUser.getMember_id());
			
		} else {
			map.put("msg", "존재하지 않는 회원입니다");
		}
				
		return map;
	}
	
	@RequestMapping("/updatePw.do")
	public String update_pw(MemberDto dto) {
		if(biz.updatePw(dto) > 0) {
			return "redirect:loginform.do";
		}
		
		return "redirect:findIdPwForm.do";
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
	@RequestMapping(value = "/callback.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String callback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session) throws IOException, ParseException {
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
			
			String member_id = (String)response_obj.get("id");
			String member_name = (String)response_obj.get("username");
			String member_nickname = (String)response_obj.get("nickname");
			String member_email = (String)response_obj.get("email");
			String member_phone = (String)response_obj.get("mobile");
			
			MemberDto mDto = new MemberDto();
			mDto.setMember_id(member_id);
			mDto.setMember_name(member_name);
			mDto.setMember_nicname(member_nickname);
			mDto.setMember_email(member_email);
			mDto.setMember_phone(member_phone);
			
			MemberDto res = biz.selectOne(member_id);
			if(res != null) {
				if(res.getMember_join().equals("Y")) {
					session.setAttribute("mDto", res);
					session.setMaxInactiveInterval(-1);
					return "redirect:main.do";
				}else {
					return "redirect:main.do";
				}
			}
			model.addAttribute("mDto",mDto);
		} catch (org.json.simple.parser.ParseException e) {
			e.printStackTrace();
		}
		
		return "signup";
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
		String kid = null;
		//사용자정보 카카오에서 가져오기
		JsonNode properties = userInfo.path("properties");
		JsonNode kakao_account = userInfo.path("kakao_account");
		JsonNode id = userInfo.path("id");
		kid = id.asText();
		kemail = kakao_account.path("email").asText();
		kname = properties.path("nickname").asText();
		MemberDto mDto = new MemberDto();
		mDto.setMember_id(kid);
		mDto.setMember_email(kemail);
		mDto.setMember_name(kname);
		
		MemberDto res = biz.selectOne(kid);
		if(res != null) {
			if(res.getMember_join().equals("Y")) {
				session.setAttribute("mDto", res);
				session.setMaxInactiveInterval(-1);
				
				return "redirect:main.do";
			}else {
				return "redirect:main.do";
			}
		}
		
		model.addAttribute("mDto" , mDto);
		return "signup";
	}
	
	//로그아웃
	@RequestMapping(value = "/logout.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String logout(HttpSession session)throws IOException {
		
		session.invalidate();

		return "redirect:main.do";
	}
	@RequestMapping("/main.do")
	public String main(Model model) {
		model.addAttribute("list", eBiz.selectList());
		model.addAttribute("clist", cBiz.main_selectList());
		model.addAttribute("plist", pbiz.main_selectList());
		return "main";
	}
	
	
	//마이 페이지
	@RequestMapping("/mypage_update.do")
	public String mypage(Model model, HttpSession session) {
		MemberDto mDto = (MemberDto)session.getAttribute("mDto");
		
		model.addAttribute("dto", biz.selectOne(mDto.getMember_id()));
		model.addAttribute("path", "update");
		
		return "mypage/mypage_update";
	}
	
	@RequestMapping("/mypage_updateres.do")
	public String update(MemberDto dto) {
		System.out.println(dto);
		if(biz.update(dto) > 0) {
			
			return "redirect:mypage_update.do?member_id="+dto.getMember_id();
		}
		
		
		return "redirect:main.do";
	}
	
	@RequestMapping("/mypage_del.do")
	public String delete(String member_id) {
		if(biz.delete(member_id) > 0) {
			return "redirect:logout.do";
		}
		
		return "redirect:mypage_update.do?member_id="+member_id;
	}
	
	
	public static String Random(int len) {
		char[] charSet = new char[] { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9' };
		int idx = 0;
		StringBuffer sb = new StringBuffer();
		for (int i = 0; i < len; i++) {
			idx = (int) (charSet.length * Math.random());
			sb.append(charSet[idx]);
		}
		return sb.toString();
	}
}
