package com.seu.app.service;

import java.util.List;

import com.seu.app.vo.MemberVO;

public interface ManagerService {
	public List<MemberVO> managerAllSelect();
	public List<MemberVO> managerSearch(String userid);
	public int managerInsert(String userid, String username);
	public void managerDelete(String userid);
}
