package com.seu.app.dao;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.seu.app.vo.MemberVO;

@Mapper
@Repository
public interface MemberDAO {
	public int idCheck(String userid); //아이디 중복검사
	public int memberWrite(MemberVO vo); //회원등록
	public MemberVO loginOk(MemberVO vo); //로그인
	public MemberVO getMember(String userid); //정보수정할(로그인한) 회원 선택
	public int memberEditOk(MemberVO vo); //회원정보수정
}
