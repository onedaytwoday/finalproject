package com.project.one.model.dao;

import java.util.List;

import com.project.one.model.dto.PagingDto;
import com.project.one.model.dto.ReviewDto;
import com.project.one.model.dto.SearchDto;

public interface ReviewDao {
	String NAMESPACE = "review.";

	public List<ReviewDto> selectList();
	
	public List<ReviewDto> reviewPaging(PagingDto pDto);
	
	public int reviewCount();
	


	public List<SearchDto> search();
	// 작성자별 후기 조회
	public List<ReviewDto> selectListByUser(String member_id);
	
	public ReviewDto selectOne(int review_no);

	public int insert(ReviewDto dto);

	public int update(ReviewDto dto);

	public int delete(int review_no);

	public double avgListByProduct(int product_no);
	
	public double avgListByClass(int class_no);
	
	public List<ReviewDto> selectClass();

	public List<ReviewDto> selectProduct();
	
	public int insertProduct(ReviewDto dto);
	
	public List<ReviewDto> listByClass(int class_no);
	
	public List<ReviewDto> listByProduct(int product_no);
}
