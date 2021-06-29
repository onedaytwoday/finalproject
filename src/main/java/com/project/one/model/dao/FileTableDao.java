package com.project.one.model.dao;

import java.util.List;

import com.project.one.model.dto.FileTableDto;

public interface FileTableDao {
	
	String NAMESPACE = "fileTable.";
	
	public List<FileTableDto> selectList();
	
	public FileTableDto selectOne(int file_num);
	
	public int insert(FileTableDto dto);
	
	public int update(FileTableDto dto);
	
	public int delete(int file_num);
}
