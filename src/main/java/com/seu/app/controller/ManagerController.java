package com.seu.app.controller;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.seu.app.service.DonateService;
import com.seu.app.service.ManagerService;
import com.seu.app.service.MemberService;
import com.seu.app.service.ReportService;
import com.seu.app.vo.DonateVO;
import com.seu.app.vo.MemberVO;
import com.seu.app.vo.ReportPagingVO;
import com.seu.app.vo.ReportVO;

@RestController
@RequestMapping("/manager/*")
public class ManagerController {

	@Inject
	ManagerService service;
	
	@Inject
	ReportService rser;
	
	@Inject
	MemberService mser;
	
	@Inject
	DonateService dser;
	
	@Inject
	ReportController rcon;
	
	ModelAndView mav = null;
	
	@GetMapping("managerForm")
	public ModelAndView managerForm() {
		mav = new ModelAndView();
		List<MemberVO> list = new ArrayList<MemberVO>();
		
		list = service.managerAllSelect();
		
		mav.addObject("managerList", list);
		
		mav.setViewName("manager/managerForm");
		return mav;
	}
	
	@GetMapping("managerSearch")
	public ModelAndView managerSearch(String userid) {
		mav = new ModelAndView();
		List<MemberVO> list = new ArrayList<MemberVO>();
		
		if(userid != null && !userid.equals("")) {
			list = service.managerSearch(userid);
		}
		
		mav.addObject("userList", list);
		
		mav.setViewName("manager/managerSearch");
		return mav;
	}
	
	@PostMapping("managerInsert")
	public ModelAndView managerInsert(String userid, String username) {
		mav = new ModelAndView();
		
		int cnt = service.managerInsert(userid, username);
		
		mav.setViewName("redirect:/manager/managerForm");
		return mav; 
	}
	
	@GetMapping("managerDelete")
	public void managerDelete(String userid) {
		
		service.managerDelete(userid);
	}
	
	@GetMapping("managerReport")
	public ModelAndView managerReport(int category, ReportPagingVO prvo) {
		mav = new ModelAndView();
		
		mav = rcon.reportList(category, prvo, rser);
		mav.setViewName("manager/managerReport");
		return mav;
	}
	
	@GetMapping("managerReportWrite")
	public ModelAndView managerReportWrite() {
		mav = new ModelAndView();
		mav.setViewName("manager/managerReportWrite");
		return mav;
	}
	
	@PostMapping("managerReportWriteOk")
	public ResponseEntity<String> managerReportWriteOk(ReportVO rvo, HttpServletRequest request){
		return rcon.reportWriteOk(rvo, request, rser);
	}
	
	@GetMapping("managerReportView")
	public ModelAndView managerReportView(int no, ReportPagingVO prvo) {
		mav = new ModelAndView();
		mav.addObject("reportVO", rser.reportSelect(no));
		mav.addObject("prvo", prvo);
		mav.setViewName("manager/managerReportView");
		return mav;
	}
	
	@GetMapping("managerReportEdit/{no}")
	public ModelAndView managerReportEdit(@PathVariable("no") int no) {
		mav = new ModelAndView();
		mav.addObject("reportVO", rser.reportSelect(no));
		mav.setViewName("manager/managerReportEdit");
		return mav;
	}
	
	@PostMapping("managerReportEditOk")
	public ResponseEntity<String> managerReportEditOk(ReportVO rvo, HttpServletRequest request){
		return rcon.reportEditOk(rvo, request, rser);
	}
	
	@GetMapping("managerReportDelete/{no}")
	public ModelAndView managerReportDelete(@PathVariable("no") int no, HttpSession session) {
		return rcon.dataDelete(no, session, rser);
	}
	
	@GetMapping("managerUserInfo")
	public ModelAndView managerUserInfo() {
		mav = new ModelAndView();
		List<MemberVO> list = new ArrayList<MemberVO>();
		list = mser.memberAllSelect();
		
		mav.addObject("memberVO",list);
		mav.setViewName("manager/managerUserInfo");
		return mav;
	}
	
	@GetMapping("managerDonation")
	public ModelAndView managerDonation() {
		mav = new ModelAndView();
		List<DonateVO> dlist = new ArrayList<DonateVO>();
		dlist = dser.donateAllSelect();
		
		int dsum = dser.donateSum();
		
		mav.addObject("donateVO", dlist);
		mav.addObject("dsum", dsum);
		mav.setViewName("manager/managerDonation");
		return mav;
	}
	
	@GetMapping("managerDonationByUser")
	public ModelAndView managerDonationByUser() {
		mav = new ModelAndView();
		List<DonateVO> dlist = new ArrayList<DonateVO>();
		dlist = dser.donateSelectByUser();
		
		mav.addObject("donatebyuserVO", dlist);
		mav.setViewName("manager/managerDonationByUser");
		return mav;
	}
	
	@GetMapping("managerDonationByMonth")
	public ModelAndView managerDonationByMonth() {
		mav = new ModelAndView();
		List<DonateVO> dlist = new ArrayList<DonateVO>();
		dlist = dser.donateSelectByMonth();
		
		mav.addObject("donatebymonthVO", dlist);
		mav.setViewName("manager/managerDonationByMonth");
		return mav;
	}
	
	@GetMapping("managerDonationByCategory")
	public ModelAndView managerDonationByCategory() {
		mav = new ModelAndView();
		List<DonateVO> dlist = new ArrayList<DonateVO>();
		dlist = dser.donateSelectByCategory();
		
		mav.addObject("donatebycategoryVO", dlist);
		mav.setViewName("manager/managerDonationByCategory");
		return mav;
	}
	
	@PostMapping("managerDonationSearch")
	public ModelAndView managerDonationSearch(String userid) {
		mav = new ModelAndView();
		List<DonateVO> dlist = new ArrayList<DonateVO>();
		dlist = dser.donateSelectByUserid(userid);
		
		mav.addObject("donatebyuserVO", dlist);
		mav.setViewName("manager/managerDonationByUser");
		return mav;
	}
}
