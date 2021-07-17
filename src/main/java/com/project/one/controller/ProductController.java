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
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.project.one.model.biz.BoardBiz;
import com.project.one.model.biz.FileTableBiz;
import com.project.one.model.biz.ProductBiz;
import com.project.one.model.biz.ReviewBiz;
import com.project.one.model.dto.ClassDto;
import com.project.one.model.dto.FileTableDto;
import com.project.one.model.dto.MemberDto;
import com.project.one.model.dto.PagingDto;
import com.project.one.model.dto.ProductDto;
import com.project.one.model.dto.StorePagingDto;

import net.coobird.thumbnailator.Thumbnails;

@Controller
public class ProductController {
	private Logger logger = LoggerFactory.getLogger(ProductController.class);

	@Autowired
	private ProductBiz biz;
	@Autowired
	private ReviewBiz rbiz;
	@Autowired
	private FileTableBiz fbiz;
	

	@RequestMapping("/store.do")
	public String Product_list(Model model,int nowPage) {
		int count = biz.productListCount();
		StorePagingDto pDto = new StorePagingDto(count, nowPage);
		model.addAttribute("list", biz.selectListPaging(pDto));
		model.addAttribute("pDto", pDto);
		model.addAttribute("rlist",rbiz.selectList());
		return "store/store";

	}

	@RequestMapping("/store_search.do")
	public String store_search(Model model,String search_keyword, int nowPage) {
		StorePagingDto pDto = new StorePagingDto();
		pDto.setSearch_keyword(search_keyword);
		pDto.setNowPage(nowPage);
		int count = biz.productSearchCount(pDto);
		StorePagingDto dto = new StorePagingDto(count, nowPage);
		dto.setSearch_keyword(search_keyword);
		List<ProductDto> list = biz.selectListSearch(dto);
		for(int i=0;i<list.size();i++) {
			System.out.println(list.get(i));
		}
		model.addAttribute("list", list);
		model.addAttribute("pDto", dto);
		return "store/store";
	}

	@RequestMapping("/store_select.do")
	public String Product_selectOne(Model model, int product_no) {
		model.addAttribute("dto", biz.selectOne(product_no));
		model.addAttribute("list",rbiz.avgList(product_no));

		return "store/store_select";
	}
	
	@RequestMapping("/store_insertform.do")
	public String Product_insertForm() {

		return "store/store_insertform";
	}

	@ResponseBody
	@RequestMapping(value = "/productInsertRes.do", method = RequestMethod.POST)
	public String fileUpload(@RequestParam("files") List<MultipartFile> multipartFile, ProductDto dto,HttpServletRequest request) {
			if (biz.insert(dto) > 0) {
				System.out.println("product insert 성공");
			} else {
				System.out.println("product insert 실패");
			}
			int product_no = dto.getProduct_no();
			System.out.println("product_no : " + product_no);
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
						String savedFileName = product_no + "_" + Random(5) + extension; // 저장될 파일 명
						String size = Long.toString(file.getSize());

						FileTableDto fdto = new FileTableDto(0, fileRoot, originalFileName, savedFileName, extension, null,
								size, product_no, 0, 0, 0);
						if (fbiz.product_insert(fdto) > 0) {
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
					File thumbnailFile = new File(fileRoot + product_no + "s_" + Random(5) + extensions.get(0));
					BufferedImage bo_image = ImageIO.read(files.get(0));
					// 비율
					double ratio = 3;
					// 넓이 높이
					int width = (int) (bo_image.getWidth() / ratio);
					int height = (int) (bo_image.getHeight() / ratio);

					Thumbnails.of(files.get(0)).size(width, height).toFile(thumbnailFile);

					String size = Long.toString(thumbnailFile.length());
					FileTableDto fdto = new FileTableDto(0, fileRoot, "thumbnail", thumbnailFile.getName(),
							extensions.get(0), null, size, product_no, 0, 0, 0);
					if (fbiz.product_insert(fdto) > 0) {
						System.out.println("썸네일 file db 넣기 성공");
					} else {
						System.out.println("썸네일 file db 넣기 실패");
					}

					strResult = "{ \"result\":\"OK\", \"product_no\":" + product_no + "}";
				}
				// (업로드 없이 등록하는경우)
				else {
					strResult = "{ \"result\":\"OK\", \"product_no\":" + product_no + "}";
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			return strResult;
		}
	
	@RequestMapping("/store_updateform.do")
	public String Product_updateForm(Model model,int product_no) {
		model.addAttribute("dto",biz.selectOne(product_no));

		return "store/store_updateform";
	}
	
	@RequestMapping("/store_updateres.do")
	public String Product_updateRes(ProductDto dto) {
		
		if(biz.update(dto)>0) {
			return "redirect:store_select.do?product_no="+dto.getProduct_no();
		}
		
		return "redirect:store_updateform.do?product_no="+dto.getProduct_no();
	}
	
	@RequestMapping("/store_delete.do")
	public String Product_delete(int product_no) {
		
		if(biz.delete(product_no)>0) {
			return "redirect:store.do?nowPage="+1;
		}

		return "redirect:store_select.do?product_no="+product_no;
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
