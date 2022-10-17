package com.seu.app.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
@RequestMapping("/faqboard/*")
public class FaqController {

	ModelAndView mav = null; 
	
	@GetMapping("faqList")
	public ModelAndView boardList() {
		mav = new ModelAndView();
		
		mav.setViewName("faqboard/faqList");
		return mav;
	}
}
