package com.project.one.model.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.one.model.dao.FileDao;
import com.project.one.model.dto.FileDto;

@Service
public class FileBizImpl implements FileBiz {

	@Autowired
	private FileDao dao;
	
	@Override
	public List<FileDto> selectList() {
		return dao.selectList();
	}

	@Override
	public FileDto selectOne(int file_num) {
		return dao.selectOne(file_num);
	}

	@Override
	public int insert(FileDto dto) {
		return dao.insert(dto);
	}

	@Override
	public int update(FileDto dto) {
		return dao.update(dto);
	}

	@Override
	public int delete(int file_num) {
		return dao.delete(file_num);
	}

}
