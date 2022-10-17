package com.seu.app.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.seu.app.vo.MemberVO;

@Mapper
@Repository
public interface ManagerDAO {
	public List<MemberVO> managerAllSelect();
	public List<MemberVO> managerSearch(String userid);
	public int managerInsert(String userid, String username);
	public void managerDelete(String userid);
}
