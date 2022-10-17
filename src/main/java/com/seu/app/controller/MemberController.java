package com.seu.app.controller;

import java.nio.charset.Charset;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.seu.app.service.MemberService;
import com.seu.app.vo.ManagerVO;
import com.seu.app.vo.MemberVO;

@RestController
@RequestMapping("/member/*")
public class MemberController {
	@Inject
	MemberService service;
	
	ModelAndView mav = null;
	
	//회원가입 폼
	@GetMapping("memberForm")
	public ModelAndView memberForm() {
		mav = new ModelAndView();
		mav.setViewName("member/memberForm");
		return mav;
	}
	
	//아이디 중복검사
	@GetMapping("idCheck")
	public ModelAndView idCheck(String userid) {
		ModelAndView mav = new ModelAndView();
		
		//DB조회 (아이디가 존재하는지 확인)
		int cnt = service.idCheck(userid);
		
		mav.addObject("idCnt", cnt);
		mav.addObject("userid", userid);
		mav.setViewName("member/idCheck");
		return mav;
	}
	
	//회원가입
	@PostMapping("memberWrite")
	public ResponseEntity<String> memberWrite(MemberVO vo) {
		ResponseEntity<String> entity = null;
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(new MediaType("text","html",Charset.forName("UTF-8")));
		headers.add("Content-Type", "text/html; charset=UTF-8");
		
		try {//회원등록 성공 -> 로그인폼으로 이동
			int result = service.memberWrite(vo);
			
			String msg = "<script>";
			msg += "alert('회원가입이 성공하였습니다. 로그인페이지로 이동합니다.');";
			msg += "location.href='/member/login';";
			msg += "</script>";
			
			entity =  new ResponseEntity<String>(msg, headers, HttpStatus.OK);
		}catch(Exception e) {//회원등록실패 -> 이전페이지로 이동
			String msg = "<script>";
			msg += "alert('회원가입이 실패하였습니다.');";
			msg += "history.back();";
			msg += "</script>";
			
			entity = new ResponseEntity<String>(msg, headers, HttpStatus.BAD_REQUEST);
			
			e.printStackTrace();
		}
		return entity;
	}
	
	//로그인 폼
	@GetMapping("login")
	public ModelAndView login() {
		mav = new ModelAndView();
		mav.setViewName("member/login");
		return mav;
	}
	//로그인하기 (DB조회)
	@PostMapping("loginOk")
	public ModelAndView loginOk(MemberVO vo, HttpSession session) {
		mav = new ModelAndView();
		MemberVO logVO = service.loginOk(vo);
		ManagerVO mvo = service.managerCheck(logVO);
		
		if(logVO!=null) {//로그인 성공
			session.setAttribute("logId", logVO.getUserid());
			session.setAttribute("logName", logVO.getUsername());
			session.setAttribute("logStatus", "Y");
			if(mvo != null) {
				session.setAttribute("ManagerStatus", "Y");
			}
			mav.setViewName("redirect:/"); //홈으로 이동
		}else {//로그인 실패
			mav.setViewName("redirect:login"); //로그인페이지로 이동
		}
		return mav;
	}
	//로그아웃
	@GetMapping("logout")
	public ModelAndView logout(HttpSession session) {
		session.invalidate(); //세션의 로그인정보 제거
		mav = new ModelAndView();
		mav.setViewName("redirect:/"); //홈으로이동
		return mav;
	}
	
	//회원정보수정 폼
	@GetMapping("memberEdit")
	public ModelAndView memberEdit(HttpSession session) {
		String userid = (String)session.getAttribute("logId");
		
		MemberVO vo = service.getMember(userid);

		mav = new ModelAndView();
		mav.addObject("vo", vo);
		mav.setViewName("member/memberEdit");
		return mav;
	}
	
	//회원정보수정 (DB 업데이트)
	@PostMapping("memberEditOk")
	public ResponseEntity<String> memberEditOk(MemberVO vo){
		ResponseEntity<String> entity = null;
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(new MediaType("text","html", Charset.forName("UTF-8")));
		headers.add("Content-Type", "text/html; charset=UTF-8");
		
		String msg = "<script>";
		int cnt = service.memberEditOk(vo);
		
		if(cnt>0) {//수정됨 (마이페이지로 이동)
			msg += "alert('회원정보가 수정되었습니다.');";
			msg += "location.href='/member/mypage';";
		}else {//수정실패(정보수정페이지)
			msg += "alert('회원정보수정 실패하였습니다.');";
			msg += "location.href='/member/memberEdit';";
		}
		msg += "</script>";
		
		entity = new ResponseEntity<String>(msg, headers, HttpStatus.OK);
		return entity;
	}
	
	//마이페이지
	@GetMapping("mypage")
	public ModelAndView myPage(HttpSession session) {
		String userid = (String)session.getAttribute("logId");
		
		MemberVO vo = service.getMember(userid);
		
		mav = new ModelAndView();
		mav.addObject("vo", vo);
		mav.setViewName("member/mypage");
		return mav;
	}
}
