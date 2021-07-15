package com.project.one.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.one.model.dto.FileTableDto;

@Repository
public class FileTableDaoImpl implements FileTableDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<FileTableDto> selectList() {
		List<FileTableDto> list = new ArrayList<FileTableDto>();
		
		try {
			list = sqlSession.selectList(NAMESPACE + "selectList");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public FileTableDto selectOne(int file_num) {
		FileTableDto dto = null;
	
		try {
			dto = sqlSession.selectOne(NAMESPACE + "selectOne", file_num);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public int class_insert(FileTableDto dto) {
		int res = 0;
		
		try {
			res = sqlSession.insert(NAMESPACE + "class_insert", dto);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return res;
	}
	
	@Override
	public int product_insert(FileTableDto dto) {
		int res = 0;
		
		try {
			res = sqlSession.insert(NAMESPACE + "product_insert", dto);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return res;
	}
	
	@Override
	public int event_insert(FileTableDto dto) {
		int res = 0;
		
		try {
			res = sqlSession.insert(NAMESPACE + "event_insert", dto);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return res;
	}
	
	@Override
	public int review_insert(FileTableDto dto) {
		int res = 0;
		
		try {
			res = sqlSession.insert(NAMESPACE + "review_insert", dto);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return res;
	}
	
	@Override
	public int update(FileTableDto dto) {
		int res = 0;
		
		try {
			res = sqlSession.update(NAMESPACE + "update", dto);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public int delete(int file_num) {
		int res = 0;
		
		try {
			res = sqlSession.delete(NAMESPACE + "delete", file_num);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return res;
	}

}
