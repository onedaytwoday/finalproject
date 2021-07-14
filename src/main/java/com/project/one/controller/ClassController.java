package com.project.one.controller;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.project.one.model.biz.ClassBiz;
import com.project.one.model.biz.DetailBiz;
import com.project.one.model.biz.FileTableBiz;
import com.project.one.model.biz.PaymentBiz;
import com.project.one.model.biz.ReviewBiz;
import com.project.one.model.dto.ClassDto;
import com.project.one.model.dto.DetailDto;
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
	private DetailBiz dBiz;

	@Autowired
	private FileTableBiz fbiz;
	
	private static int CLASS_NO;

	@RequestMapping("/classList.do")
	public String class_list(Model model) {
		model.addAttribute("list", cBiz.selectList());
		return "class_list";
	}

	@RequestMapping("/classSelect.do")
	public String class_select(Model model, int class_no, HttpSession session) {
		CLASS_NO = class_no;
		
		MemberDto mDto = (MemberDto) session.getAttribute("mDto");
		if (mDto != null) {
			PaymentDto pDto = new PaymentDto();
			pDto.setMember_id(mDto.getMember_id());
			pDto.setDetail_no(class_no);
			
			PaymentDto paid = pBiz.checkPaid(pDto);
			boolean checkPaid = false;

			if (paid != null) {
				checkPaid = true;
			}

			model.addAttribute("checkPaid", checkPaid);
		}
		
		model.addAttribute("dto", cBiz.selectOne(class_no));
		model.addAttribute("rdto", rbiz.avgList(class_no));

		return "class_select";
	}
	
	@ResponseBody
	@RequestMapping(value="/getSchedules.do", method=RequestMethod.POST)
	public Map<String, List<DetailDto>> get_schedules(@RequestBody Map<String, Date> dates) {
		Map<String, List<DetailDto>> map = new HashMap<String, List<DetailDto>>();

		Date start = dates.get("start");
		Date end = dates.get("end");
		List<DetailDto> list = new ArrayList<>();
		
		for(DetailDto d : dBiz.selectList(CLASS_NO)) {
			if(d.getDetail_date().after(start) && d.getDetail_date().before(end)) {
				list.add(d);
			}
		}
		map.put("list", list);
		
		return map;
	}

	@RequestMapping("/classInsert.do")
	public String class_insert_form() {
		return "class_insertform";
	}
	
	@RequestMapping("/detailInsertForm.do")
	public String detail_insert_form(Model model, int class_no) {
		List<DetailDto> dList = dBiz.selectList(class_no);
		
		model.addAttribute("dList", dList);
		model.addAttribute("class_no", class_no);
		
		return "detail_insertform";
	}
	
	@ResponseBody
	@RequestMapping("/detailInsertRes.do")
	public Map<String, String> detail_insert_res(int class_no, @RequestBody Map<String, String[]> details) {
		int res = 0;
		Map<String, String> map = new HashMap<String, String>();
		DetailDto dto = new DetailDto();
		dto.setClass_no(class_no);
		
		String[] nums = details.get("nums");
		String[] dates = details.get("dates");
		String[] times = details.get("times");
		
		for(int i = 0; i < nums.length; i++) {
			
			String date_time = dates[i] + " " + times[i];
	        SimpleDateFormat dateParser = new SimpleDateFormat("yyyy-MM-dd HH:mm");
	        {
	            try {
	                Date date = dateParser.parse(date_time);
	                dto.setDetail_date(date);
	                dto.setDetail_member_num(Integer.parseInt(nums[i]));
	
	                res += dBiz.insert(dto);                
	            } catch (Exception e) {
	                e.printStackTrace();
	            }
	        }			
		}
		
		map.put("msg", res > 0 ? "성공" : "실패");
		
		return map;
	}
	
	@RequestMapping("/detailDelete.do")
	public String detail_delete(int detail_no) {
		if(dBiz.delete(detail_no) > 0) {
			return "redirect:classSelect.do?class_no="+CLASS_NO;
		}
		return "redirect:detailInsertForm.do?class_no="+CLASS_NO;
	}

	@RequestMapping("/classUpdate.do")
	public String class_updateForm(Model model, int class_no) {
		model.addAttribute("dto", cBiz.selectOne(class_no));

		return "class_updateform";
	}

	@RequestMapping("/classUpdateRes.do")
	public String class_update_res(ClassDto dto) {
		if (cBiz.update(dto) > 0) {
			return "redirect:classSelect.do?class_no=" + dto.getClass_no();
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

	@RequestMapping("/mypage_class.do")
	public String class_selectOne(Model model, String member_id) {

		model.addAttribute("list", cBiz.userClass(member_id));
		model.addAttribute("member_id", member_id);

		return "mypage_class";
	}

	@ResponseBody
	@RequestMapping(value = "/classInsertRes.do", method = RequestMethod.POST)
	public String fileUpload(@RequestParam("files") List<MultipartFile> multipartFile, ClassDto dto,
			HttpServletRequest request) {
		if (cBiz.insert(dto) > 0) {
			System.out.println("class insert 성공");
		} else {
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

					FileTableDto fdto = new FileTableDto(0, fileRoot, originalFileName, savedFileName, extension, null,
							size, dto.getMember_id(), 0, class_no, 0, 0);
					if (fbiz.class_insert(fdto) > 0) {
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
				File thumbnailFile = new File(fileRoot + class_no + "s_" + Random(5) + extensions.get(0));
				BufferedImage bo_image = ImageIO.read(files.get(0));
				// 비율
				double ratio = 3;
				// 넓이 높이
				int width = (int) (bo_image.getWidth() / ratio);
				int height = (int) (bo_image.getHeight() / ratio);

				Thumbnails.of(files.get(0)).size(width, height).toFile(thumbnailFile);

				String size = Long.toString(thumbnailFile.length());
				FileTableDto fdto = new FileTableDto(0, fileRoot, "thumbnail", thumbnailFile.getName(),
						extensions.get(0), null, size, dto.getMember_id(), 0, class_no, 0, 0);
				if (fbiz.class_insert(fdto) > 0) {
					System.out.println("썸네일 file db 넣기 성공");
				} else {
					System.out.println("썸네일 file db 넣기 실패");
				}

				strResult = "{ \"result\":\"OK\", \"class_no\":" + class_no + "}";
			}
			// (업로드 없이 등록하는경우)
			else
				strResult = "{ \"result\":\"OK\", \"class_no\":" + class_no + "}";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return strResult;
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
