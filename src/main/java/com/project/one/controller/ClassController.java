package com.project.one.controller;

import java.io.File;
import java.io.InputStream;
import java.util.List;
import java.util.UUID;

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
import com.project.one.model.biz.PaymentBiz;
import com.project.one.model.biz.ReviewBiz;
import com.project.one.model.dto.ClassDto;
import com.project.one.model.dto.MemberDto;
import com.project.one.model.dto.PaymentDto;

@Controller
public class ClassController {

	@Autowired
	private ClassBiz cBiz;

	@Autowired
	private PaymentBiz pBiz;

	@Autowired
	private ReviewBiz rbiz;

	@RequestMapping("/classList.do")
	public String class_list(Model model) {
		model.addAttribute("list", cBiz.selectList());
		return "class_list";
	}

	@RequestMapping("/classDetail.do")
	public String class_detail(Model model, int class_no, HttpSession session) {

		MemberDto mDto = (MemberDto) session.getAttribute("mDto");
		if (mDto != null) {
			PaymentDto pDto = new PaymentDto();
			pDto.setMember_id(mDto.getMember_id());
			pDto.setClass_no(class_no);

			PaymentDto paid = pBiz.checkPaid(pDto);
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
		if (cBiz.insert(dto) > 0) {
			System.out.println("class insert 성공");
		}else {
			System.out.println("class insert 실패");
		}
		for(int i=0;i<multipartFile.size();i++) {
			System.out.println(multipartFile.get(i).getContentType());
		}
		
		String strResult = "{ \"result\":\"FAIL\" }";
		String contextRoot = new HttpServletRequestWrapper(request).getRealPath("/");
		String fileRoot;
		try {
			// 파일이 있을때 탄다.
			if (multipartFile.size() > 0 && !multipartFile.get(0).getOriginalFilename().equals("")) {

				for (MultipartFile file : multipartFile) {
					fileRoot = contextRoot + "resources/upload/";
					System.out.println(fileRoot);

					String originalFileName = file.getOriginalFilename(); // 오리지날 파일명
					String extension = originalFileName.substring(originalFileName.lastIndexOf(".")); // 파일 확장자
					String savedFileName = UUID.randomUUID() + extension; // 저장될 파일 명

					File targetFile = new File(fileRoot + savedFileName);
					try {
						InputStream fileStream = file.getInputStream();
						FileUtils.copyInputStreamToFile(fileStream, targetFile); // 파일 저장

					} catch (Exception e) {
						// 파일삭제
						FileUtils.deleteQuietly(targetFile); // 저장된 현재 파일 삭제
						e.printStackTrace();
						break;
					}
				}
				strResult = "{ \"result\":\"OK\" }";
			}
			// 파일 아무것도 첨부 안했을때 탄다.(게시판일때, 업로드 없이 글을 등록하는경우)
			else
				strResult = "{ \"result\":\"OK\" }";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return strResult;
	}
}
