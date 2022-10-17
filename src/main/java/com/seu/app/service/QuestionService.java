package com.seu.app.service;

import java.util.List;

import com.seu.app.vo.QuestionVO;

public interface QuestionService {

	public int qnaboardWriteOk(QuestionVO vo);

	public QuestionVO qnaboardview(int no);
	
	public List<QuestionVO> qnaboardlist(String userid);
	
	public int qnaboardDel(int no, String userid);
}
