package com.project.one.model.biz;

import java.util.List;

import com.project.one.model.dto.FileDto;

public interface FileBiz {
	public List<FileDto> selectList();

	public FileDto selectOne(int file_num);

	public int insert(FileDto dto);

	public int update(FileDto dto);

	public int delete(int file_num);
}
