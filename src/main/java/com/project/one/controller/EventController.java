package com.project.one.controller;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.InputStream;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

import org.apache.commons.io.FileUtils;
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
import com.project.one.model.biz.EventBiz;
import com.project.one.model.biz.FileTableBiz;
import com.project.one.model.biz.ProductBiz;
import com.project.one.model.dto.EventDto;
import com.project.one.model.dto.FileTableDto;
import com.project.one.model.dto.ProductDto;

import net.coobird.thumbnailator.Thumbnails;

@Controller
public class EventController {

	@Autowired
	private ClassBiz cBiz;

	@Autowired
	private ProductBiz pBiz;

	@Autowired
	private EventBiz eBiz;

	@Autowired
	private FileTableBiz fbiz;

	@RequestMapping("/eventInsert.do")
	public String event_form(Model model) {
		model.addAttribute("cList", cBiz.selectList());
		model.addAttribute("pList", pBiz.selectList());

		return "event_insertform";
	}

	@ResponseBody
	@RequestMapping(value = "/eventInsertRes.do", method = RequestMethod.POST)
	public String fileUpload(@RequestParam("files") List<MultipartFile> multipartFile, EventDto dto, String start,
			String end, String sale_rate, String category, HttpServletRequest request) throws ParseException {
		int res = 0;
		dto.setEvent_noti("N");

		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");

		Date start_date = format.parse(start);
		Date end_date = format.parse(end);

		dto.setEvent_start(start_date);
		dto.setEvent_end(end_date);
		
		if (category.equals("product")) {
			dto.setClass_no(0);
			res = eBiz.insertEventProduct(dto, sale_rate);
			
		} else if (category.equals("class")) {
			dto.setProduct_no(0);
			res = eBiz.insertEventClass(dto, sale_rate);
		}
		
		if (res > 0) {
			System.out.println("event insert 성공");
		} else {
			System.out.println("event insert 성공");
		}
		
		int event_no = dto.getEvent_no();

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
					String savedFileName = event_no + "_" + Random(5) + extension; // 저장될 파일 명
					String size = Long.toString(file.getSize());

					FileTableDto fdto = new FileTableDto(0, fileRoot, originalFileName, savedFileName, extension, null,
							size, 0, 0, 0, event_no);
					if (fbiz.event_insert(fdto) > 0) {
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
				File thumbnailFile = new File(fileRoot + event_no + "s_" + Random(5) + extensions.get(0));
				BufferedImage bo_image = ImageIO.read(files.get(0));
				// 비율
				double ratio = 3;
				// 넓이 높이
				int width = (int) (bo_image.getWidth() / ratio);
				int height = (int) (bo_image.getHeight() / ratio);

				Thumbnails.of(files.get(0)).size(width, height).toFile(thumbnailFile);

				String size = Long.toString(thumbnailFile.length());
				FileTableDto fdto = new FileTableDto(0, fileRoot, "thumbnail", thumbnailFile.getName(),
						extensions.get(0), null, size, 0, 0, 0, event_no);
				if (fbiz.event_insert(fdto) > 0) {
					System.out.println("썸네일 file db 넣기 성공");
				} else {
					System.out.println("썸네일 file db 넣기 실패");
				}

				strResult = "{ \"result\":\"OK\", \"event_no\":" + event_no + "}";
			}
			// (업로드 없이 등록하는경우)
			else {
				strResult = "{ \"result\":\"FAIL\", \"event_no\":" + event_no + "}";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return strResult;
	}
	
	@ResponseBody
	@RequestMapping("/getEvents.do")
	public Map<String, List<EventDto>> get_events(){
		Map<String, List<EventDto>> map = new HashMap<>();
		List<EventDto> list = eBiz.selectList();
		
		map.put("list", list);
		
		
		return map;
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
