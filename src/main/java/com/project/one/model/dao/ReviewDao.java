package com.project.one.model.dao;

import java.util.List;

import com.project.one.model.dto.ReviewDto;

public interface ReviewDao {
	String NAMESPACE = "review.";

	public List<ReviewDto> selectList();

	// 작성자별 후기 조회
	public List<ReviewDto> selectListByUser(String member_id);

	public ReviewDto selectOne(int review_no);

	public int insert(ReviewDto dto);

	public int update(ReviewDto dto);

	public int delete(int review_no);

	List<ReviewDto> avgList(int product_no);
}
