package com.project.one.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.one.model.dto.FileDto;

@Repository
public class FileDaoImpl implements FileDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<FileDto> selectList() {
		List<FileDto> list = new ArrayList<FileDto>();
		
		try {
			list = sqlSession.selectList(NAMESPACE + "selectList");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public FileDto selectOne(int file_num) {
		FileDto dto = null;
	
		try {
			dto = sqlSession.selectOne(NAMESPACE + "selectOne", file_num);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public int insert(FileDto dto) {
		int res = 0;
		
		try {
			res = sqlSession.insert(NAMESPACE + "insert", dto);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public int update(FileDto dto) {
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
