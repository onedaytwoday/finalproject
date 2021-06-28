package com.project.one.model.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.one.model.dao.ChatDao;
import com.project.one.model.dto.ChatDto;

@Service
public class ChatBizImpl implements ChatBiz {

	@Autowired
	private ChatDao dao;
	
	@Override
	public List<ChatDto> selectList() {
		return dao.selectList();
	}

	@Override
	public List<ChatDto> selectListByUser(String member_id) {
		return dao.selectListByUser(member_id);
	}
	
	@Override
	public List<ChatDto> selectListByConsult(String consult_id) {
		return dao.selectListByConsult(consult_id);
	}

	@Override
	public ChatDto selectOne(int chat_no) {
		return dao.selectOne(chat_no);
	}

	@Override
	public int insert(ChatDto dto) {
		return dao.insert(dto);
	}

	@Override
	public int update(ChatDto dto) {
		return dao.update(dto);
	}

	@Override
	public int delete(int chat_no) {
		return dao.delete(chat_no);
	}

}
