package com.seu.app.controller;

import java.io.File;
import java.nio.charset.Charset;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.seu.app.service.ReportService;
import com.seu.app.vo.ReportPagingVO;
import com.seu.app.vo.ReportVO;

@RestController
@RequestMapping("/report/*")
public class ReportController {

	@Inject
	ReportService service;
	
	ModelAndView mav = null;
	
	@GetMapping("reportList")
	public ModelAndView reportList(int category, ReportPagingVO prvo) {
		mav = new ModelAndView();
		prvo.setCategory(category);
		
		prvo.setTotalRecord(service.totalRecord(prvo));
		//System.out.println(prvo.getTotalRecord());
		
		mav.addObject("reportList", service.reportAllSelect(prvo));
		mav.addObject("prvo", prvo);
		mav.setViewName("report/reportList");
		
		return mav;
	}
	
	public ModelAndView reportList(int category, ReportPagingVO prvo, ReportService rservice) {
		mav = new ModelAndView();
		prvo.setCategory(category);
		
		prvo.setTotalRecord(rservice.totalRecord(prvo));
		//System.out.println(prvo.getTotalRecord());
		
		mav.addObject("reportList", rservice.reportAllSelect(prvo));
		mav.addObject("prvo", prvo);
		
		return mav;
	}
	
	@GetMapping("reportWrite")
	public ModelAndView reportWrite() {
		
		mav = new ModelAndView();
		mav.setViewName("report/reportWrite");
		return mav;
	}
	
	@PostMapping("reportWriteOk")
	public ResponseEntity<String> reportWriteOk(ReportVO rvo, HttpServletRequest request){
		
		String path = request.getSession().getServletContext().getRealPath("/upload/report");
		
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(new MediaType("text", "html", Charset.forName("UTF-8")));
		headers.add("Content-Type", "text/html; charset=UTF-8");
		
		String msg = "";
		
		try {
			MultipartHttpServletRequest mr = (MultipartHttpServletRequest)request;
			
			List<MultipartFile> files = mr.getFiles("filename");
			
			if(files != null) {
				for(int i = 0; i < files.size(); i++) {
					MultipartFile mf = files.get(i);
					
					String orgName = mf.getOriginalFilename();
					
					if(orgName != null && !orgName.equals("")) {
						File f = new File(path, orgName);
						
						if(f.exists()) {
							for(int renameNum = 1 ; ; renameNum++) {
								int dot = orgName.lastIndexOf(".");
								String fileName = orgName.substring(0, dot);
								String extName = orgName.substring(dot + 1);
								
								f = new File(path, fileName + "(" + renameNum + ")." + extName);
								
								if(!f.exists()) {
									orgName = f.getName();
									break;
								}
							}
						}
						mf.transferTo(f);
						rvo.setFilename_t(f.getName());
					}
				}
			}
			
			rvo.setUserid((String)request.getSession().getAttribute("logId"));
			
			int cnt = service.reportInsert(rvo);
			
			if(cnt > 0) {
				msg += "<script>";
				msg += "alert('보고서가 등록되었습니다');";
				msg += "location.href='/report/reportList?category="+rvo.getCategory()+"';";
				msg += "</script>";
			} else {
				throw new Exception();
			}
		} catch(Exception e) {
			fileDelete(path, rvo.getFilename_t());
			
			msg += "<script>";
			msg += "alert('보고서가 등록에 실패하였습니다');";
			msg += "history.go(-1)";
			msg += "</script>";
			e.printStackTrace();
		}
		
		ResponseEntity<String> entity = new ResponseEntity<String>(msg, headers, HttpStatus.OK);
		return entity;
	}
	
	public ResponseEntity<String> reportWriteOk(ReportVO rvo, HttpServletRequest request, ReportService rservice){
		
		String path = request.getSession().getServletContext().getRealPath("/upload/report");
		
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(new MediaType("text", "html", Charset.forName("UTF-8")));
		headers.add("Content-Type", "text/html; charset=UTF-8");
		
		String msg = "";
		
		try {
			MultipartHttpServletRequest mr = (MultipartHttpServletRequest)request;
			
			List<MultipartFile> files = mr.getFiles("filename");
			
			if(files != null) {
				for(int i = 0; i < files.size(); i++) {
					MultipartFile mf = files.get(i);
					
					String orgName = mf.getOriginalFilename();
					
					if(orgName != null && !orgName.equals("")) {
						File f = new File(path, orgName);
						
						if(f.exists()) {
							for(int renameNum = 1 ; ; renameNum++) {
								int dot = orgName.lastIndexOf(".");
								String fileName = orgName.substring(0, dot);
								String extName = orgName.substring(dot + 1);
								
								f = new File(path, fileName + "(" + renameNum + ")." + extName);
								
								if(!f.exists()) {
									orgName = f.getName();
									break;
								}
							}
						}
						mf.transferTo(f);
						rvo.setFilename_t(f.getName());
					}
				}
			}
			
			rvo.setUserid((String)request.getSession().getAttribute("logId"));
			
			int cnt = rservice.reportInsert(rvo);
			
			if(cnt > 0) {
				msg += "<script>";
				msg += "alert('보고서가 등록되었습니다');";
				msg += "location.href='/manager/managerReport?category="+rvo.getCategory()+"';";
				msg += "</script>";
			} else {
				throw new Exception();
			}
		} catch(Exception e) {
			fileDelete(path, rvo.getFilename_t());
			
			msg += "<script>";
			msg += "alert('보고서가 등록에 실패하였습니다');";
			msg += "history.go(-1)";
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
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@GetMapping("reportView")
	public ModelAndView reportView(int no, ReportPagingVO prvo) {
		mav = new ModelAndView();
		mav.addObject("reportVO", service.reportSelect(no));
		mav.addObject("prvo", prvo);
		mav.setViewName("report/reportView");
		return mav;
	}
	
	@GetMapping("hitUpdate")
	public void hitUpdate(int no) {
		service.hitUpdate(no);
	}
	
	@GetMapping("reportEdit/{no}")
	public ModelAndView reportEdit(@PathVariable("no") int no) {
		mav = new ModelAndView();
		mav.addObject("reportVO", service.reportSelect(no));
		mav.setViewName("report/reportEdit");
		return mav;
	}
	
	@PostMapping("reportEditOk")
	public ResponseEntity<String> reportEditOk(ReportVO rvo, HttpServletRequest request){
		
		String temp_filename = service.getFilename(rvo.getNo());
		
		String path = request.getSession().getServletContext().getRealPath("/upload/report");
		
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(new MediaType("text", "html", Charset.forName("UTF-8")));
		headers.add("Content-Type", "text/html; charset=UTF-8");
		
		String msg = "";
		
		try {
			MultipartHttpServletRequest mr = (MultipartHttpServletRequest)request;
			
			List<MultipartFile> files = mr.getFiles("filename");
			
			if(files != null) {
				for(int i = 0; i < files.size(); i++) {
					MultipartFile mf = files.get(i);
					
					String orgName = mf.getOriginalFilename();
					
					if(orgName != null && !orgName.equals("")) {
						File f = new File(path, orgName);
						
						if(f.exists()) {
							for(int renameNum = 1 ; ; renameNum++) {
								int dot = orgName.lastIndexOf(".");
								String fileName = orgName.substring(0, dot);
								String extName = orgName.substring(dot + 1);
								
								f = new File(path, fileName + "(" + renameNum + ")." + extName);
								
								if(!f.exists()) {
									orgName = f.getName();
									break;
								}
							}
						}
						mf.transferTo(f);
						rvo.setFilename_t(f.getName());
					}
				}
			}
			
			rvo.setUserid((String)request.getSession().getAttribute("logId"));
			
			int cnt = service.reportUpdate(rvo);
			
			if(cnt > 0) {
				
				if(temp_filename != null) {
					fileDelete(path, temp_filename);
				}
				msg += "<script>";
				msg += "alert('보고서가 등록되었습니다');";
				msg += "location.href='/report/reportList?category="+rvo.getCategory()+"';";
				msg += "</script>";
			} else {
				throw new Exception();
			}
		} catch(Exception e) {
			fileDelete(path, rvo.getFilename_t());
			
			msg += "<script>";
			msg += "alert('보고서가 등록에 실패하였습니다');";
			msg += "history.go(-1)";
			msg += "</script>";
			e.printStackTrace();
		}
		
		ResponseEntity<String> entity = new ResponseEntity<String>(msg, headers, HttpStatus.OK);
		return entity;
	}
	
	public ResponseEntity<String> reportEditOk(ReportVO rvo, HttpServletRequest request, ReportService rservice){
		
		String temp_filename = service.getFilename(rvo.getNo());
		
		String path = request.getSession().getServletContext().getRealPath("/upload/report");
		
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(new MediaType("text", "html", Charset.forName("UTF-8")));
		headers.add("Content-Type", "text/html; charset=UTF-8");
		
		String msg = "";
		
		try {
			MultipartHttpServletRequest mr = (MultipartHttpServletRequest)request;
			
			List<MultipartFile> files = mr.getFiles("filename");
			
			if(files != null) {
				for(int i = 0; i < files.size(); i++) {
					MultipartFile mf = files.get(i);
					
					String orgName = mf.getOriginalFilename();
					
					if(orgName != null && !orgName.equals("")) {
						File f = new File(path, orgName);
						
						if(f.exists()) {
							for(int renameNum = 1 ; ; renameNum++) {
								int dot = orgName.lastIndexOf(".");
								String fileName = orgName.substring(0, dot);
								String extName = orgName.substring(dot + 1);
								
								f = new File(path, fileName + "(" + renameNum + ")." + extName);
								
								if(!f.exists()) {
									orgName = f.getName();
									break;
								}
							}
						}
						mf.transferTo(f);
						rvo.setFilename_t(f.getName());
					}
				}
			}
			
			rvo.setUserid((String)request.getSession().getAttribute("logId"));
			
			int cnt = rservice.reportUpdate(rvo);
			
			if(cnt > 0) {
				
				if(temp_filename != null) {
					fileDelete(path, temp_filename);
				}
				msg += "<script>";
				msg += "alert('보고서가 등록되었습니다');";
				msg += "location.href='/manager/managerReport?category="+rvo.getCategory()+"';";
				msg += "</script>";
			} else {
				throw new Exception();
			}
		} catch(Exception e) {
			fileDelete(path, rvo.getFilename_t());
			
			msg += "<script>";
			msg += "alert('보고서가 등록에 실패하였습니다');";
			msg += "history.go(-1)";
			msg += "</script>";
			e.printStackTrace();
		}
		
		ResponseEntity<String> entity = new ResponseEntity<String>(msg, headers, HttpStatus.OK);
		return entity;
	}
	
	@GetMapping("reportDelete/{no}")
	public ModelAndView dataDelete(@PathVariable("no") int no, HttpSession session) {
		mav = new ModelAndView();
		
		String filename = service.getFilename(no);
		
		int cnt = service.reportDelete(no);
		
		if(cnt > 0) {
			String path = session.getServletContext().getRealPath("/upload/report");
			fileDelete(path, filename);
			
			mav.setViewName("redirect:/report/reportList?category=1");
		} else {
			mav.setViewName("redirect:/report/reportView" + no);
		}
		return mav;
	}
	
	public ModelAndView dataDelete(@PathVariable("no") int no, HttpSession session, ReportService rservice) {
		mav = new ModelAndView();
		
		String filename = rservice.getFilename(no);
		
		int cnt = rservice.reportDelete(no);
		
		if(cnt > 0) {
			String path = session.getServletContext().getRealPath("/upload/report");
			fileDelete(path, filename);
			
			mav.setViewName("redirect:/manager/managerReport?category=1");
		} else {
			mav.setViewName("redirect:/manager/managerReportView" + no);
		}
		return mav;
	}
}
