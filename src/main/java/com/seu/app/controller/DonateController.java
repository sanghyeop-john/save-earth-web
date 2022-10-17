package com.seu.app.controller;

import java.nio.charset.Charset;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.seu.app.service.DonateService;
import com.seu.app.vo.DonateVO;

@RestController
@RequestMapping("/donate/*")
public class DonateController {
	@Inject
	DonateService servie;
	
	ModelAndView mav = null;
	
	// 후원창 
	@GetMapping("donateForm")
	public ModelAndView donateForm() {
		mav = new ModelAndView();
		mav.setViewName("donate/donateForm");
		return mav;
	}
	
	// 후원 DB
	@PostMapping("donateFormOk")
	public ResponseEntity<String> donateFormOk(DonateVO vo, HttpServletRequest request) {
		ResponseEntity<String> entity = null;
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(new MediaType("text", "html", Charset.forName("UTF-8")));
		headers.add("Content-Type", "text/html; charset=UTF-8");
			
		return entity;
	}

}
