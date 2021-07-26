package com.project.one.model.biz;

import java.util.Date;
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
	public EventDto eventClass(int class_no) {
		return dao.eventClass(class_no);
	}

	@Override
	public EventDto eventProduct(int product_no) {
		return dao.eventProduct(product_no);
	}

	@Transactional
	@Override
	public int insertEventClass(EventDto dto, String sale_rate) {
		int res = 0;

		try {
			res = dao.insertEventClass(dto);
			if (res > 0) {
				updateClassSale(dto.getClass_no(), Integer.parseInt(sale_rate));
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

		try {
			res = dao.insertEventProduct(dto);
			if (res > 0) {
				updateProductSale(dto.getProduct_no(), Integer.parseInt(sale_rate));
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
	public int updateNoti() {
		Date today = new Date();
		int res = 0;
		
		List<EventDto> list = dao.allList();
		for(EventDto d : list) {
			if(d.getEvent_start().before(today) && d.getEvent_end().after(today)) {
				res += dao.updateNotiY(d.getEvent_no());
			
			} else {
				res += dao.updateNotiN(d.getEvent_no());
				if(res > 0 && d.getProduct_no() > 0) {
					updateProductSale(d.getProduct_no(), 0);
				
				} else if(res > 0 && d.getClass_no() > 0) {
					updateClassSale(d.getClass_no(), 0);
				}
			}
			
		}
		return res;
	}

	@Override
	public int delete(int event_no) {
		return dao.delete(event_no);
	}

	@Override
	public int eventCount() {
		return dao.eventCount();
	}
	
	private int updateProductSale(int product_no, int sale_rate) {
		ProductDto pDto = new ProductDto();
		pDto.setProduct_no(product_no);
		pDto.setProduct_sale(sale_rate);
		
		int res = 0;
		
		try {
			res = pBiz.updateSale(pDto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return res;
	}
	
	private int updateClassSale(int class_no, int sale_rate) {
		ClassDto cDto = new ClassDto();
		cDto.setClass_no(class_no);
		cDto.setClass_sale(sale_rate);
		
		int res = 0;
		
		try {
			res = cBiz.updateSale(cDto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return res;
	}

}
