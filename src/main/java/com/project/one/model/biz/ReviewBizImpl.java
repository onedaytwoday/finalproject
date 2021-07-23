package com.project.one.model.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.one.model.dao.ReviewDao;
import com.project.one.model.dto.ReviewDto;
import com.project.one.model.dto.SearchDto;

@Service
public class ReviewBizImpl implements ReviewBiz {

	@Autowired
	private ReviewDao dao;
	
	@Override
	public List<ReviewDto> selectList() {
		return dao.selectList();
	
	}
	
	@Override
	public List<SearchDto> search() {
		return dao.search();
	}
	
	@Override
	public double avgListByProduct(int product_no){
		double rate = dao.avgListByProduct(product_no);
		rate = Math.round(rate/5);
		
		return rate;
	}
	
	@Override
	public double avgListByClass(int class_no){
		double rate = dao.avgListByClass(class_no);
		rate = Math.round(rate/5);
		
		return rate;
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

	@Override
	public List<ReviewDto> listByClass(int class_no) {
		return dao.listByClass(class_no);
	}

	@Override
	public List<ReviewDto> listByProduct(int product_no) {
		return dao.listByProduct(product_no);
	}

}
