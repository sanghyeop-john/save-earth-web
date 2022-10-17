package com.seu.app.controller;

import javax.inject.Inject;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.seu.app.service.MemberService;

@RestController
@RequestMapping("/inform/*")
public class InformController {
	
	@Inject
	MemberService service;
	
	ModelAndView mav = null;
	
	@GetMapping("introduce")
	public ModelAndView introduce() {
		mav = new ModelAndView();
		mav.setViewName("inform/introduce");
		return mav;
	}

}
