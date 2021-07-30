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

import com.project.one.model.biz.FileTableBiz;
import com.project.one.model.biz.ReviewBiz;
import com.project.one.model.dto.BoardDto;
import com.project.one.model.dto.ClassDto;
import com.project.one.model.dto.FileTableDto;
import com.project.one.model.dto.MemberDto;
import com.project.one.model.dto.PagingDto;
import com.project.one.model.dto.ProductDto;
import com.project.one.model.dto.ReviewDto;

import net.coobird.thumbnailator.Thumbnails;

@Controller
public class ReviewController {

	@Autowired
	private ReviewBiz rBiz;
	
	@Autowired
	private FileTableBiz fbiz;
	//리뷰 리스트(페이징)
	@RequestMapping("/review_list.do")
	public String review_list(Model model, int nowPage , HttpSession session) {
		int count = rBiz.reviewCount();
		System.out.println(count);
		PagingDto pDto = new PagingDto(count, nowPage);
		List<ReviewDto> list = rBiz.reviewPaging(pDto);
		for(int i=0;i<list.size();i++) {
			System.out.println(list.get(i).toString());
		}
		model.addAttribute("list", rBiz.reviewPaging(pDto));
		model.addAttribute("pDto", pDto);
		return "review/review_list";
	}
	
	@RequestMapping("/review_detail.do")
	public String review_detail_class(Model model,int review_no) {
		ReviewDto dto = rBiz.selectOne(review_no);
		model.addAttribute("dto" , dto);
		return "review/review_detail";
	}
	
	
	//클래스리뷰 인서트
	@RequestMapping("/review_insert_class.do")
	public String review_insert_class(Model model, int class_no,String class_title, HttpSession session) {
		
		MemberDto mDto = (MemberDto)session.getAttribute("mDto");
		if(mDto != null) {
			ClassDto cDto = new ClassDto();
			cDto.setClass_no(class_no);
			cDto.setClass_title(class_title);
			model.addAttribute("cDto", cDto);
			model.addAttribute("mDto", mDto);
			System.out.println(class_no);
		}
		
		return "review/review_insert_class";
	}
	
	//상품리뷰
	@RequestMapping("/review_insert_product.do")
	public String review_insert_product(Model model, int product_no, String product_name, HttpSession session) {
		
		MemberDto mDto = (MemberDto)session.getAttribute("mDto");
		if (mDto != null){
			ProductDto pDto = new ProductDto();
			pDto.setProduct_no(product_no);
			pDto.setProduct_name(product_name);
			model.addAttribute("pDto", pDto);
			model.addAttribute("mDto", mDto);
		}
		
		return "review/review_insert_product";
	}
	
	@ResponseBody
	@RequestMapping(value = "/review_insertres_class.do", method = RequestMethod.POST)
	public String review_insertres_class(@RequestParam("files") List<MultipartFile> multipartFile, ReviewDto rDto, String class_no_str,HttpServletRequest request) {
			rDto.setClass_no(Integer.parseInt(class_no_str));	
			if(rBiz.insert(rDto)>0) {
				System.out.println("review insert 성공");
			} else {
				System.out.println("review insert 실패");
			}
			int review_no = rDto.getReview_no();
			System.out.println("review_no : " + review_no);
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
						String savedFileName = review_no + "_" + Random(5) + extension; // 저장될 파일 명
						String size = Long.toString(file.getSize());

						FileTableDto fdto = new FileTableDto(0, fileRoot, originalFileName, savedFileName, extension, null,
								size, 0, 0, review_no, 0);
						if (fbiz.review_insert(fdto) > 0) {
							System.out.println("file db 넣기 성공");
						} else {
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
					File thumbnailFile = new File(fileRoot + review_no + "s_" + Random(5) + extensions.get(0));
					BufferedImage bo_image = ImageIO.read(files.get(0));
					// 비율
					double ratio = 3;
					// 넓이 높이
					int width = (int) (bo_image.getWidth() / ratio);
					int height = (int) (bo_image.getHeight() / ratio);

					Thumbnails.of(files.get(0)).size(width, height).toFile(thumbnailFile);

					String size = Long.toString(thumbnailFile.length());
					FileTableDto fdto = new FileTableDto(0, fileRoot, "thumbnail", thumbnailFile.getName(),
							extensions.get(0), null, size, 0, 0, review_no, 0);
					if (fbiz.review_insert(fdto) > 0) {
						System.out.println("썸네일 file db 넣기 성공");
					} else {
						System.out.println("썸네일 file db 넣기 실패");
					}

					strResult = "{ \"result\":\"OK\", \"review_no\":" + review_no + "}";
				}
				// (업로드 없이 등록하는경우)
				else {
					strResult = "{ \"result\":\"FAIL\", \"review_no\":" + review_no + "}";
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			return strResult;

		}
	@ResponseBody
	@RequestMapping(value = "/review_insertres_product.do", method = RequestMethod.POST)
	public String review_insertres_product(@RequestParam("files") List<MultipartFile> multipartFile, ReviewDto rDto, String product_no_str,HttpServletRequest request) {
		rDto.setProduct_no(Integer.parseInt(product_no_str));
			if(rBiz.insertProduct(rDto)>0) {
				System.out.println("review product insert 성공");
			} else {
				System.out.println("review product insert 실패");
			}
			int review_no = rDto.getReview_no();
			System.out.println("review_no : " + review_no);
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
						String savedFileName = review_no + "_" + Random(5) + extension; // 저장될 파일 명
						String size = Long.toString(file.getSize());

						FileTableDto fdto = new FileTableDto(0, fileRoot, originalFileName, savedFileName, extension, null,
								size, 0, 0, review_no, 0);
						if (fbiz.review_insert(fdto) > 0) {
							System.out.println("file db 넣기 성공");
						} else {
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
					File thumbnailFile = new File(fileRoot + review_no + "s_" + Random(5) + extensions.get(0));
					BufferedImage bo_image = ImageIO.read(files.get(0));
					// 비율
					double ratio = 3;
					// 넓이 높이
					int width = (int) (bo_image.getWidth() / ratio);
					int height = (int) (bo_image.getHeight() / ratio);

					Thumbnails.of(files.get(0)).size(width, height).toFile(thumbnailFile);

					String size = Long.toString(thumbnailFile.length());
					FileTableDto fdto = new FileTableDto(0, fileRoot, "thumbnail", thumbnailFile.getName(),
							extensions.get(0), null, size, 0, 0, review_no, 0);
					if (fbiz.review_insert(fdto) > 0) {
						System.out.println("썸네일 file db 넣기 성공");
					} else {
						System.out.println("썸네일 file db 넣기 실패");
					}

					strResult = "{ \"result\":\"OK\", \"review_no\":" + review_no + "}";
				}
				// (업로드 없이 등록하는경우)
				else {
					strResult = "{ \"result\":\"OK\", \"review_no\":" + review_no + "}";
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			return strResult;

		}
	
	@RequestMapping("/review_updateform.do")
	public String review_updateform(Model model, int review_no) {
		model.addAttribute("dto", rBiz.selectOne(review_no));
		return "review/review_updateform";
	}
	@RequestMapping("/review_updateRes.do")
	public String review_updateRes(ReviewDto dto) {
		if(rBiz.update(dto) > 0) {
			return "redirect:review_detail.do?review_no="+dto.getReview_no();
		}
		return "redirect:review_updateform.do?review_no="+dto.getReview_no();
	}
	
	@RequestMapping("/review_delete.do")
	public String reviewDelete(int review_no) {
		if(rBiz.delete(review_no)>0) {
			return "redirect:review_list.do";
		}
		return "redirect:review_list.do";
	}
	
	@RequestMapping("/mypage_review.do")
	public String mypage_review(Model model, int nowPage, HttpSession session) {
		MemberDto mDto = (MemberDto) session.getAttribute("mDto");
		
		int count = rBiz.reviewMyCount(mDto.getMember_id());
		
		PagingDto pDto = new PagingDto(count, nowPage);
		pDto.setMember_id(mDto.getMember_id());
		System.out.println(pDto);
		model.addAttribute("list", rBiz.myReviewList(pDto));
		model.addAttribute("pDto", pDto);
		model.addAttribute("path", "board");
		
		return "mypage/mypage_review";
	}
	
	public static String Random(int len) {
		char[] charSet = new char[] { 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'o', 'p', 'q',
				'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z' };
		int idx = 0;
		StringBuffer sb = new StringBuffer();
		for (int i = 0; i < len; i++) {
			idx = (int) (charSet.length * Math.random());
			sb.append(charSet[idx]);
		}
		return sb.toString();
	}
}
