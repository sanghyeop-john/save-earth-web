package com.seu.app.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.seu.app.vo.QuestionVO;

@Mapper
@Repository
public interface QuestionDAO {
	//질문게시판 글등록
	public int qnaboardWriteOk(QuestionVO vo);
	public QuestionVO qnaboardView(int no);
	public List<QuestionVO> qnaboardList(String userid);
	public int qnaboardDel(int no, String userid);
}
