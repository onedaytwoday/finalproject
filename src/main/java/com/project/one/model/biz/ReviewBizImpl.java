package com.project.one.model.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.one.model.dao.ReviewDao;
import com.project.one.model.dto.ReviewDto;

@Service
public class ReviewBizImpl implements ReviewBiz {

	@Autowired
	private ReviewDao dao;
	
	@Override
	public List<ReviewDto> selectList() {
		return dao.selectList();
	
	}
	
	@Override
	public List<ReviewDto> avgList(int product_no){
		return dao.avgList(product_no);
	}

	@Override
	public List<ReviewDto> selectListByUser(String member_id) {
		return dao.selectListByUser(member_id);
	}
	
	

	@Override
	public ReviewDto selectOne(int review_no) {
		return dao.selectOne(review_no);
	}

	@Override
	public int insert(ReviewDto dto) {
		return dao.insert(dto);
	}

	@Override
	public int update(ReviewDto dto) {
		return dao.update(dto);
	}

	@Override
	public int delete(int review_no) {
		return dao.delete(review_no);
	}

	@Override
	public List<ReviewDto> selectClass() {
		
		return dao.selectClass();
	}

	@Override
	public List<ReviewDto> selectProduct() {
		
		return dao.selectProduct();
	}

	@Override
	public int insertProduct(ReviewDto dto) {
		
		return dao.insertProduct(dto);
	}

}
