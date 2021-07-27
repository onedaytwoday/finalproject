package com.project.one.model.biz;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.one.model.dao.ReviewDao;
import com.project.one.model.dto.ClassDto;
import com.project.one.model.dto.PagingDto;
import com.project.one.model.dto.ProductDto;
import com.project.one.model.dto.ReviewDto;
import com.project.one.model.dto.SearchDto;

@Service
public class ReviewBizImpl implements ReviewBiz {

	@Autowired
	private ReviewDao dao;
	
	@Autowired
	private ClassBiz cBiz;
	
	@Autowired
	private ProductBiz pBiz;
	
	@Override
	public List<ReviewDto> selectList() {
		return dao.selectList();
	
	}
	
	@Override
	public List<SearchDto> search() {
		return dao.search();
	}
	
	@Override
	public List<ReviewDto> myReviewList(PagingDto pDto) {
		List<ReviewDto> list = dao.myReviewList(pDto);
		
		for(ReviewDto r : list) {
			if(r.getProduct_no() > 0) {
				ProductDto proDto = pBiz.selectOne(r.getProduct_no());
				r.setProduct_name(proDto.getProduct_name());
			
			} else if(r.getClass_no() > 0) {
				ClassDto cDto = cBiz.selectOne(r.getClass_no());
				r.setClass_title(cDto.getClass_title());
			}
		}
		
		return list;
	}
	
	@Override
	public double avgListByProduct(int product_no){
		return dao.avgListByProduct(product_no);
	}
	
	@Override
	public double avgListByClass(int class_no){
		return dao.avgListByClass(class_no);
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

	@Override
	public List<ReviewDto> reviewPaging(PagingDto pDto) {
		
		return dao.reviewPaging(pDto);
	}

	@Override
	public int reviewCount() {
		
		return dao.reviewCount();
	}

	@Override
	public int reviewMyCount(String member_id) {
		return dao.reviewMyCount(member_id);
	}
}
