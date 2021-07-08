package com.project.one.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.multipart.MultipartFile;

import com.project.one.model.biz.FileTableBiz;
import com.project.one.model.dto.FileTableDto;
@Controller
public class FileTableController {
	
	@Autowired
	private FileTableBiz biz;
	
	public String insertRes(MultipartFile file) {
		FileTableDto dto = new FileTableDto();
		if(biz.insert(dto) > 0) {
			return "성공";
		}
		return "실패";
	}
	
}
