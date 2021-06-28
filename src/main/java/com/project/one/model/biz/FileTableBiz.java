package com.project.one.model.biz;

import java.util.List;

import com.project.one.model.dto.FileTableDto;

public interface FileTableBiz {
	public List<FileTableDto> selectList();

	public FileTableDto selectOne(int file_num);

	public int insert(FileTableDto dto);

	public int update(FileTableDto dto);

	public int delete(int file_num);
}