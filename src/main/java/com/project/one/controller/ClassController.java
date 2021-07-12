package com.project.one.controller;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.project.one.model.biz.ClassBiz;
import com.project.one.model.biz.FileTableBiz;
import com.project.one.model.biz.PaymentBiz;
import com.project.one.model.biz.ReviewBiz;
import com.project.one.model.dto.ClassDto;
import com.project.one.model.dto.FileTableDto;
import com.project.one.model.dto.MemberDto;
import com.project.one.model.dto.PaymentDto;

import net.coobird.thumbnailator.Thumbnails;

@Controller
public class ClassController {

	@Autowired
	private ClassBiz cBiz;

	@Autowired
	private PaymentBiz pBiz;
	
	@Autowired
	private ReviewBiz rbiz;
	
	@Autowired
	private FileTableBiz fbiz;
	
	@RequestMapping("/classList.do")
	public String class_list(Model model) {
		model.addAttribute("list", cBiz.selectList());
		return "class_list";
	}

	@RequestMapping("/classDetail.do")
	public String class_detail(Model model, int class_no, HttpSession session) {

		MemberDto mDto = (MemberDto) session.getAttribute("mDto");
		if(mDto != null) {
			PaymentDto pDto = new PaymentDto();
			pDto.setMember_id(mDto.getMember_id());
			pDto.setClass_no(class_no);
			
			System.out.println("pDto : " + pDto);
			
			PaymentDto paid = pBiz.checkPaid(pDto);
			System.out.println(paid);
			boolean checkPaid = false;

			if (paid != null) {
				checkPaid = true;
			}

			model.addAttribute("checkPaid", checkPaid);
		}

		model.addAttribute("dto", cBiz.selectOne(class_no));
		model.addAttribute("rdto", rbiz.avgList(class_no));

		return "class_detail";
	}

	@RequestMapping("/classInsert.do")
	public String class_insertForm() {
		return "class_insertform";
	}

	@RequestMapping("/classUpdate.do")
	public String class_updateForm(Model model, int class_no) {
		model.addAttribute("dto", cBiz.selectOne(class_no));

		return "class_updateform";
	}

	@RequestMapping("/classUpdateRes.do")
	public String class_update_res(ClassDto dto) {
		if (cBiz.update(dto) > 0) {
			return "redirect:classDetail.do?class_no=" + dto.getClass_no();
		}

		return "redirect:classUpdate.do?class_no=" + dto.getClass_no();
	}

	@RequestMapping("/classDelete.do")
	public String class_delete(int class_no) {

		if (cBiz.delete(class_no) > 0) {
			return "redirect:classList.do";
		}

		return "redirect:classList.do";
	}

	@ResponseBody
	@RequestMapping(value = "/classInsertRes.do", method = RequestMethod.POST)
	public String fileUpload(@RequestParam("files") List<MultipartFile> multipartFile, ClassDto dto, HttpServletRequest request) {
		if(cBiz.insert(dto) > 0) {
			System.out.println("class insert 성공");
		}else {
			System.out.println("class insert 실패");
		}
		int class_no = dto.getClass_no();
		System.out.println("class no : " + class_no);
		String strResult = "{ \"result\":\"FAIL\" }";
		String contextRoot = new HttpServletRequestWrapper(request).getRealPath("/");
		String fileRoot;
		try {
			// 파일이 있을때 탄다.
			if (multipartFile.size() > 0 && !multipartFile.get(0).getOriginalFilename().equals("")) {
				List<File> files = new ArrayList<File>();
				List<String> extensions = new ArrayList<String>();
				for (MultipartFile file : multipartFile) {
					fileRoot = contextRoot + "resources/upload/";
					String originalFileName = file.getOriginalFilename(); // 오리지날 파일명
					String extension = originalFileName.substring(originalFileName.lastIndexOf(".")); // 파일 확장자
					String savedFileName = class_no + "_" + Random(5) + extension; // 저장될 파일 명
					String size = Long.toString(file.getSize());
					
					FileTableDto fdto = new FileTableDto(0,fileRoot,originalFileName,
						savedFileName,extension,null,size,dto.getMember_id(),0,class_no,0,0);
					if(fbiz.class_insert(fdto) > 0) {
						System.out.println("file db 넣기 성공");
					}else {
						System.out.println("file db 넣기 실패");
					}
					File targetFile = new File(fileRoot + savedFileName);
					try {
						InputStream fileStream = file.getInputStream();
						FileUtils.copyInputStreamToFile(fileStream, targetFile); // 파일 저장
						files.add(targetFile);
						extensions.add(extension);
					} catch (Exception e) {
						// 파일삭제
						FileUtils.deleteQuietly(targetFile); // 저장된 현재 파일 삭제
						e.printStackTrace();
						break;
					}
				}
					fileRoot = contextRoot + "resources/upload/";
					File thumbnailFile = new File(fileRoot + class_no + "s_" + Random(5) + extensions.get(0));	
					BufferedImage bo_image = ImageIO.read(files.get(0));
					//비율 
					double ratio = 3;
					//넓이 높이
					int width = (int) (bo_image.getWidth() / ratio);
					int height = (int) (bo_image.getHeight() / ratio);					
			
					Thumbnails.of(files.get(0))
					.size(width, height)
					.toFile(thumbnailFile);
					
					String size = Long.toString(thumbnailFile.length());
					FileTableDto fdto = new FileTableDto(0,fileRoot,"thumbnail",
							thumbnailFile.getName(),extensions.get(0),null,size,dto.getMember_id(),0,class_no,0,0);
					if(fbiz.class_insert(fdto) > 0) {
						System.out.println("썸네일 file db 넣기 성공");
					}else {
						System.out.println("썸네일 file db 넣기 실패");
					}
					
				strResult = "{ \"result\":\"OK\" }";
			}
			// (업로드 없이 등록하는경우)
			else
				strResult = "{ \"result\":\"OK\" }";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return strResult;
	}
	
	public static String Random(int len) {
		char[] charSet = new char[] { 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l',
				'm', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z'};
		int idx = 0;
		StringBuffer sb = new StringBuffer();
		for (int i = 0; i < len; i++) {
			idx = (int) (charSet.length * Math.random());
			sb.append(charSet[idx]);
		}
		return sb.toString();
	}
}
