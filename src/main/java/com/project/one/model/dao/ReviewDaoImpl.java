package com.project.one.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.one.model.dto.PagingDto;
import com.project.one.model.dto.ReviewDto;
import com.project.one.model.dto.SearchDto;

@Repository
public class ReviewDaoImpl implements ReviewDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<ReviewDto> selectList() {
		List<ReviewDto> list = new ArrayList<ReviewDto>();

		try {
			list = sqlSession.selectList(NAMESPACE + "selectList");

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}
	
	@Override
	public List<SearchDto> search() {
		List<SearchDto> list = new ArrayList<SearchDto>();

		try {
			list = sqlSession.selectList(NAMESPACE + "search");

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}
	
	@Override
	public double avgListByProduct(int product_no) {
		double res = 0;
		
		try {
			res = sqlSession.selectOne(NAMESPACE + "avgListByProduct", product_no);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return res;
	}
	
	@Override
	public double avgListByClass(int class_no) {
		double res = 0;
		
		try {
			res = sqlSession.selectOne(NAMESPACE + "avgListByClass", class_no);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public ReviewDto selectOne(int review_no) {
		ReviewDto dto = null;

		try {
			dto = sqlSession.selectOne(NAMESPACE + "selectOne", review_no);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return dto;
	}

	@Override
	public int insert(ReviewDto dto) {
		int res = 0;

		try {
			res = sqlSession.insert(NAMESPACE + "insert", dto);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return res;
	}

	@Override
	public int update(ReviewDto dto) {
		int res = 0;

		try {
			res = sqlSession.update(NAMESPACE + "update", dto);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return res;
	}

	@Override
	public int delete(int review_no) {
		int res = 0;

		try {
			res = sqlSession.delete(NAMESPACE + "delete", review_no);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return res;
	}

	@Override
	public List<ReviewDto> selectClass() {
		List<ReviewDto> list = new ArrayList<ReviewDto>();
		try {
			list = sqlSession.selectList(NAMESPACE+"selectClass");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<ReviewDto> selectProduct() {
		List<ReviewDto> list = new ArrayList<ReviewDto>();
		try {
			list = sqlSession.selectList(NAMESPACE+"selectProduct");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int insertProduct(ReviewDto dto) {
		int res = 0;

		try {
			res = sqlSession.insert(NAMESPACE + "insertProduct", dto);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return res;
		
	}

	@Override
	public List<ReviewDto> listByClass(int class_no) {
		List<ReviewDto> list = new ArrayList<ReviewDto>();
		
		try {
			list = sqlSession.selectList(NAMESPACE+"listByClass", class_no);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public List<ReviewDto> listByProduct(int product_no) {
		List<ReviewDto> list = new ArrayList<ReviewDto>();
		
		try {
			list = sqlSession.selectList(NAMESPACE+"listByProduct", product_no);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public List<ReviewDto> reviewPaging(PagingDto pDto) {
		List<ReviewDto> list = new ArrayList<ReviewDto>();
		try {
			list = sqlSession.selectList(NAMESPACE+"reviewPaging",pDto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int reviewCount() {
		int res = 0;
		
		try {
			res = sqlSession.selectOne(NAMESPACE + "reviewCount");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public int reviewMyCount(String member_id) {
		int res = 0;
		
		try {
			res = sqlSession.selectOne(NAMESPACE + "reviewMyCount", member_id);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public List<ReviewDto> myReviewList(PagingDto pDto) {
		List<ReviewDto> list = new ArrayList<ReviewDto>();
		try {
			list = sqlSession.selectList(NAMESPACE+"myReviewList", pDto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}


}
