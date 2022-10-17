package com.seu.app.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.seu.app.service.QuestionService;
import com.seu.app.vo.QuestionVO;

@Controller
public class QuestionController {
	@Inject
	QuestionService service;
	
	ModelAndView mav = null; 

	// QNA글목록
	@RequestMapping("/qnaboard/list")
	public ModelAndView questionList(HttpServletRequest request) {
		mav = new ModelAndView();
		
		String userid = null;
		if( request.getParameter("userid") != null ) {
			
			userid = request.getParameter("userid");
			System.out.println(userid);
		} else {
			
		}
		 
		// DB조회
		mav.addObject("list", service.qnaboardlist(userid));

		mav.setViewName("qnaboard/qnaboardList");

		return mav;
	}

	// 질문글 작성폼
	@RequestMapping("/qnaboard/write")
	public String qnaboardWrite() {
		return "qnaboard/qnaboardWrite";
	}
	//질문글 작성 DB
	@PostMapping("/qnaboard/writeOk")
	public ModelAndView qnaboardWriteOk(QuestionVO vo, HttpServletRequest request) {
		mav = new ModelAndView();
		vo.setIp(request.getRemoteAddr());
		
		HttpSession session = request.getSession();
		String userid = (String)session.getAttribute("logId");
		vo.setUserid(userid);
		
		int cnt = service.qnaboardWriteOk(vo);
		
		if(cnt>0) {
			mav.setViewName("redirect:/qnaboard/list");
		}else {
			mav.setViewName("qnaboard/qnaboardResult");
		}
		return mav;
	}
	@GetMapping("/qnaboard/qnaboardView")
	public ModelAndView qnaboardView(int no) {
		
		System.out.println(no);
		mav = new ModelAndView();
		
		QuestionVO vo = service.qnaboardview(no);
		mav.addObject("viewVO", vo);
		mav.setViewName("qnaboard/qnaboardView");

		return mav;
	}
	
	//게시글 삭제
	@GetMapping("/qnaboard/qnaboardDel")
	public ModelAndView qnaboardDel(int no, HttpSession session) {
		
		int cnt = service.qnaboardDel(no, (String)session.getAttribute("logId"));
		mav = new ModelAndView();
		
		if(cnt > 0) {
			mav.setViewName("redirect:list");
		} else {
			mav.setViewName("redirect:qnaboardView");
		}
		
		return mav;
	}

}
