package com.seu.app.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.seu.app.dao.ManagerDAO;
import com.seu.app.vo.MemberVO;

@Service
public class ManagerServiceImpl implements ManagerService{
	@Inject
	ManagerDAO dao;

	@Override
	public List<MemberVO> managerSearch(String userid) {
		
		return dao.managerSearch(userid);
	}

	@Override
	public int managerInsert(String userid, String username) {
		
		return dao.managerInsert(userid, username);
	}

	@Override
	public List<MemberVO> managerAllSelect() {
		
		return dao.managerAllSelect();
	}

	@Override
	public void managerDelete(String userid) {
		dao.managerDelete(userid);
	}
}
