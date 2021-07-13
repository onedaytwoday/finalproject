package com.project.one.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
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
import com.project.one.model.dto.RoomDto;


@Controller
public class ChatController {
	
	@Autowired
	private RoomBiz roomBiz;
	
	@Autowired
	private ChattingBiz chatBiz;

	@Autowired
	private MemberBiz mBiz;
	
	
	@RequestMapping("/chat_main.do")
	public String chat_main(Model model,String member_id, HttpSession session) {
		MemberDto mDto = (MemberDto)session.getAttribute("mDto");
		if(mDto.getMember_grade().equals("강사회원")) {
			List<RoomDto> roomlist = roomBiz.selectListByConsult(member_id);
			model.addAttribute("roomlist",roomlist);
			model.addAttribute("mDto",mDto);
			return "chat_consult";
		}
		List<RoomDto> roomlist = roomBiz.selectListByUser(member_id);
		model.addAttribute("roomlist",roomlist);
		model.addAttribute("mDto",mDto);
		return "chat_main";
	}
	//강사회원 리스트
	@RequestMapping("/chat_newlist.do")
	public String consultList(Model model, String member_grade) {
		model.addAttribute("list",mBiz.selectListConsult(member_grade));
		
		return "chat_newlist";
	}
	
	// 채팅방 있으면 채팅방 없으면 만들어서 채팅방
    @ResponseBody
    @RequestMapping("/chat_room.do")
    public ModelAndView createChat(String member_id, HttpSession session){   
    	ModelAndView mav = new ModelAndView();
    	MemberDto mDto = (MemberDto)session.getAttribute("mDto");
    	RoomDto rDto = new RoomDto();
    	if(mDto.getMember_grade().equals("강사회원")) {
    		RoomDto dto = new RoomDto();
    		dto.setMember_id(member_id);
    		dto.setConsult_id(mDto.getMember_id());
    		RoomDto exist  = roomBiz.isRoom(dto);
    		if(exist!=null) {
    			System.out.println("방이 있다!!");
                List<ChattingDto> chatlist = chatBiz.selectList(exist.getRoom_no());
                rDto.setConsult_id(member_id);
                rDto.setMember_id(mDto.getMember_id());
                mav.addObject("rDto", rDto);
                mav.addObject("Room_no", exist.getRoom_no());
                mav.addObject("chatlist",chatlist);
                mav.setViewName("chat_room");
                return mav;
    		}
    	}
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
            	mav.setViewName("chat_room");
                return mav;

        }
        // DB에 방이 있을 때 가져옴
        else{
            System.out.println("방이 있다!!");
            List<ChattingDto> chatlist = chatBiz.selectList(exist.getRoom_no());
            mav.addObject("Room_no", exist.getRoom_no());
            mav.addObject("chatlist",chatlist);
            mav.setViewName("chat_room");
            return mav;
        }
    }
    
    // websocket 종료 room 마지막 시간, 내용 update
    @ResponseBody
    @RequestMapping(value="/room_update.do", method=RequestMethod.POST)
    public Map<String, String> update_status(@RequestBody RoomDto dto) {
		Map<String, String> map = new HashMap<>();
		
		if(roomBiz.update(dto) > 0) {
			map.put("msg", "성공");
		}else {
			map.put("msg", "실패");
		}
		
		return map;
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
    
    @RequestMapping("/chat_delete.do")
    public String deleteRoom(int room_no, HttpSession session) {
    	MemberDto mDto = (MemberDto)session.getAttribute("mDto");
    	if(chatBiz.deleteByRoom(room_no)>0 && roomBiz.delete(room_no)>0 ) {
    		return "redirect:chat_main.do?member_id="+mDto.getMember_id();
    	}
    	return "redirect:chat_main.do?member_id="+mDto.getMember_id();
    }
    
    
	@RequestMapping("/tts.do")
	public String tts() {
		return "tts";
	}

	
}
