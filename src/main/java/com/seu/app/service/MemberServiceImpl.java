package com.seu.app.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.seu.app.dao.MemberDAO;
import com.seu.app.vo.ManagerVO;
import com.seu.app.vo.MemberVO;

@Service
public class MemberServiceImpl implements MemberService {
	@Inject
	MemberDAO dao;

	@Override
	public int idCheck(String userid) {
		return dao.idCheck(userid);
	}

	@Override
	public int memberWrite(MemberVO vo) {
		return dao.memberWrite(vo);
	}

	@Override
	public MemberVO loginOk(MemberVO vo) {
		return dao.loginOk(vo);
	}

	@Override
	public MemberVO getMember(String userid) {
		return dao.getMember(userid);
	}

	@Override
	public int memberEditOk(MemberVO vo) {
		return dao.memberEditOk(vo);
	}

	@Override
	public ManagerVO managerCheck(MemberVO vo) {
		return dao.managerCheck(vo);
	}

	@Override
	public List<MemberVO> memberAllSelect() {
		return dao.memberAllSelect();
	}
}
