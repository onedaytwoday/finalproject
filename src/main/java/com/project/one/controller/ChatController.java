package com.project.one.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;
import com.project.one.model.biz.ChattingBiz;
import com.project.one.model.biz.MemberBiz;
import com.project.one.model.biz.RoomBiz;
import com.project.one.model.dto.ChatSession;
import com.project.one.model.dto.ChattingDto;
import com.project.one.model.dto.MemberDto;
import com.project.one.model.dto.PaymentDto;
import com.project.one.model.dto.RoomDto;


@Controller
public class ChatController {
	
	@Autowired
	private RoomBiz roomBiz;
	
	@Autowired
	private ChattingBiz chatBiz;

	@Autowired
	private ChatSession chatSession;
	
	@Autowired
	private MemberBiz mBiz;
	
	//강사회원 리스트
	@RequestMapping("/consultList.do")
	public String consultList(Model model, String member_grade) {
		model.addAttribute("list",mBiz.selectListConsult(member_grade));
		
		return "consultList";
	}
	
	
	//채팅방목록
	@RequestMapping("/chatRoomList.do")
	public void chatRoomList(RoomDto roomDto, ChattingDto chatDto,String member_id, HttpServletResponse response) throws JsonIOException, IOException{
        
		 List<RoomDto> roomList = roomBiz.selectListByUser(member_id);
		 for(int i = 0; i < roomList.size(); i++) {
			 chatDto.setRoom_no(roomList.get(i).getRoom_no());
			 chatDto.setMember_id(roomList.get(i).getMember_id());

	        }
	        
	        response.setContentType("application/json; charset=utf-8");
	 
	        Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
	        gson.toJson(roomList,response.getWriter());

	}
	//해당 방 메세지들
    @RequestMapping(value="{room_no}.do")
    public void messageList(@PathVariable int room_no, String member_id, Model model, HttpServletResponse response) throws JsonIOException, IOException {
        
    	List<ChattingDto> chatList = chatBiz.selectListByRoom(room_no);
        response.setContentType("application/json; charset=utf-8");

        Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
        gson.toJson(chatList,response.getWriter());
    }
    
    //채팅방 생성
    @ResponseBody
    @RequestMapping("/createChat.do")
    public ModelAndView createChat(String member_id, HttpSession session){   
    	ModelAndView mav = new ModelAndView();
    	MemberDto mDto = (MemberDto)session.getAttribute("mDto");
    	RoomDto rDto = new RoomDto();
    	if(mDto != null) {
    		//로그인한 회원
    	    rDto.setMember_id(mDto.getMember_id());
    	    //강사 회원
            rDto.setConsult_id(member_id);
    	}
            
        RoomDto exist  = roomBiz.isRoom(rDto);
        mav.addObject("rDto", rDto);
        // DB에 방이 없을 때 생성
        if(exist == null) {
            System.out.println("방이 없다!!");
            int result = roomBiz.insert(rDto);
            if(result == 1) 
                System.out.println("방 만들었다!!");
            	mav.setViewName("newRoom");
                return mav;

        }
        // DB에 방이 있을 때 가져옴
        else{
            System.out.println("방이 있다!!");
            mav.setViewName("existRoom");
            mav.addObject("Room_no", exist.getRoom_no());
            return mav;
        }
    }
    
    //handlerInterceptor로?
    @RequestMapping("chatSession.do")
    public void chatSession( HttpServletResponse response) throws JsonIOException, IOException{
        
        ArrayList<String> chatSessionList = chatSession.getLoginUser();
        
        response.setContentType("application/json; charset=utf-8");
 
        Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
        gson.toJson(chatSessionList,response.getWriter());
    }
    
    @ResponseBody
	@RequestMapping(value="/chat_insert.do", method=RequestMethod.POST)
	public Map<String, String> update_status(@RequestBody ChattingDto dto) {
		Map<String, String> map = new HashMap<>();
		
		if(chatBiz.insert(dto) > 0) {
			map.put("msg", "성공");
		}else {
			map.put("msg", "실패");
		}
		
		return map;
	}
	@RequestMapping("/tts.do")
	public String tts() {
		return "tts";
	}

	
}
