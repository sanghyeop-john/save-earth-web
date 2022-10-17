package com.seu.app.service;

import java.util.List;

import com.seu.app.vo.ManagerVO;
import com.seu.app.vo.MemberVO;

public interface MemberService {
	public int idCheck(String userid);
	public int memberWrite(MemberVO vo);
	public MemberVO loginOk(MemberVO vo);
	public MemberVO getMember(String userid);
	public int memberEditOk(MemberVO vo);
	public ManagerVO managerCheck(MemberVO vo);
	public List<MemberVO> memberAllSelect();
}
