package com.project.one.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.one.model.dto.PagingDto;
import com.project.one.model.dto.ProductDto;
import com.project.one.model.dto.StorePagingDto;

@Repository
public class ProductDaoImpl implements ProductDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<ProductDto> selectList() {
		List<ProductDto> list = new ArrayList<ProductDto>();
		
		try {
			list = sqlSession.selectList(NAMESPACE + "selectList");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	@Override
	public List<ProductDto> productList(PagingDto pDto) {
		List<ProductDto> list = new ArrayList<ProductDto>();
		
		try {
			list = sqlSession.selectList(NAMESPACE + "productList", pDto);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	@Override
	public List<ProductDto> main_selectList() {
		List<ProductDto> list = new ArrayList<ProductDto>();
		
		try {
			list = sqlSession.selectList(NAMESPACE + "main_selectList");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public ProductDto selectOne(int product_no) {
		ProductDto dto = null;
		
		try {
			dto = sqlSession.selectOne(NAMESPACE + "selectOne", product_no);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}
	
	@Override
	public ProductDto selectOneByName(String product_name) {
		ProductDto dto = null;
		
		try {
			dto = sqlSession.selectOne(NAMESPACE + "selectOneByName", product_name);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}


	@Override
	public int insert(ProductDto dto) {
		int res = 0;
		
		try {
			res = sqlSession.insert(NAMESPACE + "insert", dto);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public int update(ProductDto dto) {
		int res = 0;
		
		try {
			res = sqlSession.update(NAMESPACE + "update", dto);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return res;
	}
	
	@Override
	public int updateSale(ProductDto dto) {
		int res = 0;
		
		try {
			res = sqlSession.update(NAMESPACE + "updateSale", dto);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public int delete(int product_no) {
		int res = 0;
		
		try {
			res = sqlSession.delete(NAMESPACE + "delete", product_no);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public int productCount() {
		int res = 0;
		
		try {
			res = sqlSession.selectOne(NAMESPACE + "productCount");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public List<ProductDto> selectListPaging(StorePagingDto pDto) {
		List<ProductDto> list = new ArrayList<ProductDto>();
		
		try {
			list = sqlSession.selectList(NAMESPACE + "selectListPaging",pDto);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public List<ProductDto> categoryListPaging(StorePagingDto pDto) {
		List<ProductDto> list = new ArrayList<ProductDto>();
		
		try {
			list = sqlSession.selectList(NAMESPACE + "categoryListPaging",pDto);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	@Override
	public int productListCount() {
		int res = 0;
		
		try {
			res = sqlSession.selectOne(NAMESPACE + "productListCount");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return res;

	}

	@Override
	public List<ProductDto> selectListSearch(StorePagingDto pDto) {
		List<ProductDto> list = new ArrayList<ProductDto>();
		
		try {
			list = sqlSession.selectList(NAMESPACE + "selectListSearch",pDto);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public int productSearchCount(StorePagingDto pDto) {
		int res = 0;
		
		try {
			res = sqlSession.selectOne(NAMESPACE + "productSearchCount", pDto);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return res;
	}
	
	@Override
	public int productcategoryCount(String product_category) {
		int res = 0;
		
		try {
			res = sqlSession.selectOne(NAMESPACE + "productcategoryCount", product_category);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return res;
	}
	
	@Override
	public List<ProductDto> searchedList(String search_keyword) {
		List<ProductDto> list = new ArrayList<ProductDto>();
		
		try {
			list = sqlSession.selectList(NAMESPACE + "searchedList",search_keyword);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

}
