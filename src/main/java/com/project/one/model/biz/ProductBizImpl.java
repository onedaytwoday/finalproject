package com.project.one.model.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.one.model.dao.ProductDao;
import com.project.one.model.dto.PagingDto;
import com.project.one.model.dto.ProductDto;

@Service
public class ProductBizImpl implements ProductBiz {

	@Autowired
	private ProductDao dao;
	
	@Override
	public List<ProductDto> selectList() {
		return dao.selectList();
	}
	
	@Override
	public List<ProductDto> productList(PagingDto pDto) {
		return dao.productList(pDto);
	}

	@Override
	public ProductDto selectOne(int product_no) {
		return dao.selectOne(product_no);
	}
	
	@Override
	public ProductDto selectOneByName(String product_name) {
		return dao.selectOneByName(product_name);
	}

	@Override
	public int insert(ProductDto dto) {
		return dao.insert(dto);
	}

	@Override
	public int update(ProductDto dto) {
		return dao.update(dto);
	}
	
	@Override
	public int updateSale(ProductDto dto) {
		return dao.updateSale(dto);
	}

	@Override
	public int delete(int product_no) {
		return dao.delete(product_no);
	}

	@Override
	public int productCount() {
		return dao.productCount();
	}

}
