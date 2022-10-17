package com.seu.app.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
@RequestMapping("/content/*")
public class ContentController {
	
	ModelAndView mav = null;
	
	//활동 - 기후페이지 보기
	@GetMapping("climate")
	public ModelAndView climate() {
		mav = new ModelAndView();
		mav.setViewName("content/climate");
		return mav;
	}
	
	//활동 - 해양페이지 보기
	@GetMapping("oceans")
	public ModelAndView oceans() {
		mav = new ModelAndView();
		mav.setViewName("content/oceans");
		return mav;
	}
	
	//활동 - 야생동물페이지 보기
	@GetMapping("wildlife")
	public ModelAndView wildlife() {
		mav = new ModelAndView();
		mav.setViewName("content/wildlife");
		return mav;
	}
}
