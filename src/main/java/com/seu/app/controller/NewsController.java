package com.seu.app.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.nio.charset.Charset;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;


import com.seu.app.service.NewsService;
import com.seu.app.vo.NewsVO;
import com.seu.app.vo.PagingVO;

@RestController 
@RequestMapping("/news/*") // 
public class NewsController {
	
	@Autowired
	NewsService service;
	
	ModelAndView mav = null;
	
	// News List
	@GetMapping("newsList")
	public ModelAndView newsList(PagingVO pvo) {
		
		mav = new ModelAndView();
		
		// 총 record 수 
		pvo.setTotalRecord(service.totalRecord(pvo));
		
		// DB 조회
		mav.addObject("list", service.newsList(pvo));
		mav.addObject("pvo", pvo); 
		
		// view name
		mav.setViewName("news/newsList");
		return mav;
	}
	
	// News write form : 뉴스 작성폼
	@GetMapping("newsWrite") // GET 요청을 하여 newsWrite 의 데이터를 가져오자 
	public ModelAndView newsWrite() {
		mav = new ModelAndView();
		mav.setViewName("news/newsWrite");
		return mav;
	}
	
	// write + file upload
	@PostMapping("newsWriteOk")	// file upload 위치, MultipartRequest 객체를 구함
	public ResponseEntity<String> newsWriteOk(NewsVO vo, HttpServletRequest request) {
		
		// upload할 위치의 절대 경로
		String path = request.getSession().getServletContext().getRealPath("/upload/thumbnail");
		System.out.println(path);
		
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(new MediaType("text","html", Charset.forName("UTF-8")));
		headers.add("Content-Type", "text/html; charset=UTF-8");
		
		String msg = ""; // entity의 content
		
		// file upload
		try {
			// 1. NewsVO에 제목, 글 내용은 request 되어 있는 상태임
			// 2. client 컴퓨터에 있는 file을 server로 복사하기 위해서는 MultipartHttpServletRequest 객체를 request 객체에서 type-casting으로 구함
			
			MultipartHttpServletRequest mr = (MultipartHttpServletRequest)request;
			
			// mr에는 upload한 파일 수만큼 HultipartFile 객체가 존재
			// MultipartFile 객체를 list collection에 담아 return
			List<MultipartFile> files = mr.getFiles("filename");
			
			// upload한 파일이 있을 때
			if(files != null) {
				// 첨부한 파일의 수만큼 반복적으로 업로드
				
				int cnt = 0; // upload 번호 매기기
				for(int i = 0; i < files.size(); i++) {
					// list에서 MultipartFile 객체 얻어오기
					MultipartFile mf = files.get(i);
					
					// upload한 실제 파일명
					String orgName = mf.getOriginalFilename();
					
					// 이미 파일명이 존재할 경우 rename
					if(orgName != null && !orgName.equals("")) { // upload 시킬 파일명이 이미 server에 존재할 때
						File f = new File(path, orgName);
						
						// 파일명이 이미 존재하면 업로드할 파일 명을 변경해야됨
						if(f.exists()) {
							// 파일명 변경
							for(int renameNum = 1; ; renameNum++) {
								int dot = orgName.lastIndexOf(".");
								String fileName = orgName.substring(0, dot);
								String extName = orgName.substring(dot+1);
								
								f = new File(path, fileName + "(" + renameNum + ")."+extName);
								
								if(!f.exists()) { // 새로 만든 파일명이 없으면
									orgName = f.getName();
									break;
								}
							}	
						}
						
						// file upload 실행
						
						mf.transferTo(f);
						cnt++;
						if(cnt==1) vo.setFilename1(f.getName());
					}
					
				}
			}
			
			// DB 등록
			vo.setUserid((String)request.getSession().getAttribute("logId"));
			
			int cnt = service.newsInsert(vo);
			
			if(cnt > 0) { // 파일 등록 성공 -> list page로 이동
				msg += "<script>";
				msg += "alert('file upload 성공');";
				msg += "location.href = '/news/newsList';";
				msg += "</script>";
			} else { // 실패
				throw new Exception();
			}
		} catch (Exception e) { // 파일 등록 실패
			// 등록한 파일을 지우고, 글 등록으로 다시 보냄
			fileDelete(path, vo.getFilename1());
			
			msg += "<script>";
			msg += "alert('file upload 실패');";
			msg += "history.go(-1);";
			msg += "</script>";
			e.printStackTrace();
		}
		
		ResponseEntity<String> entity = new ResponseEntity<String>(msg, headers, HttpStatus.OK);
		return entity;
	}
	
	public void fileDelete(String path, String filename) {
		try {
			if(filename != null) {
				File file = new File(path, filename);
				file.delete();
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
	}


	// 게시글 이미지 파일전송요청
	@GetMapping("display")
	public ResponseEntity<byte[]> getFile(String filename1 , HttpServletRequest req, HttpServletResponse resp){
		
		File file = new File(req.getSession().getServletContext().getRealPath("/resources/images/thumbnail"+ "\\" + filename1));
		
		ResponseEntity<byte[]> result = null;
		
		try {
		HttpHeaders headers = new HttpHeaders();
	
			headers.add("Content-Type", Files.probeContentType(file.toPath()));
			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), headers, HttpStatus.OK);
		} catch (IOException e) {
			e.printStackTrace();
		}
	
		return result;
	}
	
	// view
	@GetMapping("newsView")
	public ModelAndView newsView(int no, PagingVO pvo) {
		mav = new ModelAndView();
		service.hitCount(no);
		mav.addObject("newsVO", service.getNews(no));
		mav.addObject("pvo", pvo);
		mav.setViewName("news/newsView");
		return mav;
	}
	
	// edit
	@GetMapping("newsEditForm/{no}")
	public ModelAndView newsEditForm(@PathVariable("no") int no) {
		mav = new ModelAndView();
		mav.addObject("newsVO", service.getNews(no));
		mav.setViewName("news/newsEditForm");
		return mav;
	}
		
	// delete
	@GetMapping("newsDel")
	public ModelAndView newsDel(int no, HttpSession session) {
		
		int cnt = service.newsDel(no, (String)session.getAttribute("logId"));
		mav = new ModelAndView();
		
		if(cnt > 0) {
			mav.setViewName("redirect:newsList");
		} else {
			mav.setViewName("redirect:newsView");
		}
		
		return mav;
	}
	
}
