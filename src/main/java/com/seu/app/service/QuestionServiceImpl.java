package com.seu.app.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.seu.app.dao.QuestionDAO;
import com.seu.app.vo.QuestionVO;

@Service
public class QuestionServiceImpl implements QuestionService {
	@Inject
	QuestionDAO dao;

	@Override
	public int qnaboardWriteOk(QuestionVO vo) {
		return dao.qnaboardWriteOk(vo);
	}

	@Override
	public QuestionVO qnaboardview(int no) {
		return dao.qnaboardView(no);
	}

	@Override
	public List<QuestionVO> qnaboardlist(String userid) {
		// TODO Auto-generated method stub
		return dao.qnaboardList(userid);
	}

	@Override
	public int qnaboardDel(int no, String userid) {
		// TODO Auto-generated method stub
		return dao.qnaboardDel(no, userid);
	}

	
}
