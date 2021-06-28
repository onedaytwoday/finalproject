package com.project.one.model.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.one.model.dao.FileTableDao;
import com.project.one.model.dto.FileTableDto;

@Service
public class FileTableBizImpl implements FileTableBiz {

	@Autowired
	private FileTableDao dao;
	
	@Override
	public List<FileTableDto> selectList() {
		return dao.selectList();
	}

	@Override
	public FileTableDto selectOne(int file_num) {
		return dao.selectOne(file_num);
	}

	@Override
	public int insert(FileTableDto dto) {
		return dao.insert(dto);
	}

	@Override
	public int update(FileTableDto dto) {
		return dao.update(dto);
	}

	@Override
	public int delete(int file_num) {
		return dao.delete(file_num);
	}

}