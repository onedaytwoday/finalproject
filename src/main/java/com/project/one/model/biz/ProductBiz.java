package com.project.one.model.biz;

import java.util.List;

import com.project.one.model.dto.PagingDto;
import com.project.one.model.dto.ProductDto;
import com.project.one.model.dto.StorePagingDto;

public interface ProductBiz {
	public List<ProductDto> selectList();
	
	public List<ProductDto> selectListPaging(StorePagingDto pDto);
	
	public List<ProductDto> productList(PagingDto pDto);

	public ProductDto selectOne(int product_no);
	
	public ProductDto selectOneByName(String product_name);

	public int insert(ProductDto dto);

	public int update(ProductDto dto);
	
	public int updateSale(ProductDto dto);

	public int delete(int product_no);
	
	public int productCount();
	
	public int productListCount();
}
