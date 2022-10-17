package com.seu.app.controller;

import java.nio.charset.Charset;

import javax.inject.Inject;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.seu.app.service.NewsletterService;
import com.seu.app.vo.NewsletterVO;

@RestController
@RequestMapping("/newsletter/*")
public class NewsletterController {
	@Inject
	NewsletterService service;
	
	ModelAndView mav = null;
	
	//뉴스레터신청 (DB에 이메일 저장)
	@PostMapping("newsletterOk")
	public ResponseEntity<String> newsletterOk(NewsletterVO vo){
		ResponseEntity<String> entity = null;
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(new MediaType("text","html",Charset.forName("UTF-8")));
		headers.add("Content-Type", "text/html; charset=UTF-8");
		
		try {//뉴스레터 신청 성공
			int result = service.newsletterOk(vo);
			
			String msg = "<script>";
			msg += "alert('뉴스레터 구독 신청되었습니다.');";
			msg += "location.href='/';";
			msg += "</script>";
			
			entity = new ResponseEntity<String>(msg, headers, HttpStatus.OK);
		}catch(Exception e) {//신청실패
			String msg = "<script>";
			msg += "alert('뉴스레터 구독 신청에 실패하였습니다.');";
			msg += "location.href='/';";
			msg += "</script>";
			
			entity = new ResponseEntity<String>(msg, headers, HttpStatus.BAD_REQUEST);
			
			e.printStackTrace();
		}
		return entity;
	}
}
