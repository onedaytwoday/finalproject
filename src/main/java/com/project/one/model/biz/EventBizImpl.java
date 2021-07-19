package com.project.one.model.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.project.one.model.dao.EventDao;
import com.project.one.model.dto.ClassDto;
import com.project.one.model.dto.EventDto;
import com.project.one.model.dto.PagingDto;
import com.project.one.model.dto.ProductDto;

@Service
public class EventBizImpl implements EventBiz {

	@Autowired
	private EventDao dao;

	@Autowired
	private ClassBiz cBiz;

	@Autowired
	private ProductBiz pBiz;

	@Override
	public List<EventDto> selectList() {
		List<EventDto> eList = dao.selectList();

		for (EventDto e : eList) {
			if (e.getClass_no() >= 0 && e.getProduct_no() == 0) {
				ClassDto cDto = cBiz.selectOne(e.getClass_no());
				e.setOriginal_price(cDto.getClass_price());
				e.setEvent_sale(cDto.getClass_sale());
			} else {
				ProductDto pDto = pBiz.selectOne(e.getProduct_no());
				e.setOriginal_price(pDto.getProduct_price());
				e.setEvent_sale(pDto.getProduct_sale());
			}

		}

		return eList;
	}

	@Override
	public List<EventDto> eventList(PagingDto dto) {
		List<EventDto> eList = dao.eventList(dto);
		
		for(EventDto e : eList) {
			if (e.getClass_no() >= 0 && e.getProduct_no() == 0) {
				ClassDto cDto = cBiz.selectOne(e.getClass_no());
				e.setTitle(cDto.getClass_title());
			} else {
				ProductDto pDto = pBiz.selectOne(e.getProduct_no());
				e.setTitle(pDto.getProduct_name());
			}
		}
		
		return eList;
	}

	@Override
	public EventDto selectOne(int event_no) {
		return dao.selectOne(event_no);
	}

	@Transactional
	@Override
	public int insertEventClass(EventDto dto, String sale_rate) {
		int res = 0;

		ClassDto cDto = new ClassDto();
		cDto.setClass_no(dto.getClass_no());
		cDto.setClass_sale(Integer.parseInt(sale_rate));

		try {
			res = dao.insertEventClass(dto);
			if (res > 0) {
				cBiz.updateSale(cDto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return res;
	}

	@Transactional
	@Override
	public int insertEventProduct(EventDto dto, String sale_rate) {
		int res = 0;

		ProductDto pDto = new ProductDto();
		pDto.setProduct_no(dto.getProduct_no());
		pDto.setProduct_sale(Integer.parseInt(sale_rate));

		try {
			res = dao.insertEventProduct(dto);
			if (res > 0) {
				pBiz.updateSale(pDto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return res;
	}

	@Override
	public int update(EventDto dto) {
		return dao.update(dto);
	}

	@Override
	public int updateNoti(int event_no) {
		return dao.updateNoti(event_no);
	}

	@Override
	public int delete(int event_no) {
		return dao.delete(event_no);
	}

	@Override
	public int eventCount() {
		return dao.eventCount();
	}
}
