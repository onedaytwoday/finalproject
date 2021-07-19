package com.project.one.model.biz;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.one.model.dao.RoomDao;
import com.project.one.model.dto.ChatreadDto;
import com.project.one.model.dto.RoomDto;
import com.project.one.util.DateConvert;
@Service
public class RoomBizImpl implements RoomBiz {

	@Autowired
	private RoomDao dao;
	
	@Override
	public List<RoomDto> selectList(Map<String, Object> map) {
		List<RoomDto> list = dao.selectList(map);
		return list;
	}

	@Override
	public List<RoomDto> selectListByUser(String member_id) {
		// Date 타입 -> String 결과값으로 변환 util에 calculateTime 메서드 사용
		List<RoomDto> list = dao.selectListByUser(member_id);
		List<RoomDto> res = new ArrayList<RoomDto>();
		
		for(int i=0;i<list.size();i++) {
			String convert = DateConvert.calculateTime(list.get(i).getRoom_date());
			RoomDto dto = new RoomDto(list.get(i).getRoom_no(), list.get(i).getMember_id(), 
							list.get(i).getConsult_id(), list.get(i).getRoom_content(), convert);
			res.add(dto);
		}
		
		return res;
	}
	
	@Override
	public List<RoomDto> selectListByConsult(String consult_id) {
		List<RoomDto> list = dao.selectListByConsult(consult_id);
		List<RoomDto> res = new ArrayList<RoomDto>();
		
		for(int i=0;i<list.size();i++) {
			String convert = DateConvert.calculateTime(list.get(i).getRoom_date());
			RoomDto dto = new RoomDto(list.get(i).getRoom_no(), list.get(i).getMember_id(), 
							list.get(i).getConsult_id(), list.get(i).getRoom_content(), convert);
			res.add(dto);
		}
		
		return res;
	}
	
	@Override
	public List<ChatreadDto> member_read(String member_id) {
		return dao.member_read(member_id);
	}

	@Override
	public List<ChatreadDto> consult_read(String member_id) {
		return dao.consult_read(member_id);
	}
	
	@Override
	public RoomDto selectOne(int room_no) {
		return dao.selectOne(room_no);
	}

	@Override
	public int insert(RoomDto dto) {
		return dao.insert(dto);
	}

	@Override
	public int update(RoomDto dto) {
		return dao.update(dto);
	}

	@Override
	public int delete(int room_no) {
		return dao.delete(room_no);
	}

	@Override
	public RoomDto isRoom(RoomDto roomDto) {
		
		return dao.isRoom(roomDto);
	}

}
