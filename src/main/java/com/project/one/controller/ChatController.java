package com.project.one.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;
import com.project.one.model.biz.ChattingBiz;
import com.project.one.model.biz.MemberBiz;
import com.project.one.model.biz.RoomBiz;
import com.project.one.model.dto.ChatSession;
import com.project.one.model.dto.ChattingDto;
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
    @RequestMapping("createChat.do")
    public String createChat(RoomDto roomDto, String member_id, String consult_id){     
        roomDto.setMember_id(member_id);
        roomDto.setConsult_id(consult_id);;
        
        RoomDto exist  = roomBiz.isRoom(roomDto);
        
        // DB에 방이 없을 때
        if(exist == null) {
            System.out.println("방이 없다!!");
            int result = roomBiz.insert(roomDto);
            if(result == 1) {
                System.out.println("방 만들었다!!");
                return "new";
            }else {
                return "fail";
            }
        }
        // DB에 방이 있을 때
        else{
            System.out.println("방이 있다!!");
            return "exist";
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
    
	@RequestMapping("/tts.do")
	public String tts() {
		return "tts";
	}

	
}
