package com.seu.app.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.seu.app.dao.NewsletterDAO;
import com.seu.app.vo.NewsletterVO;

@Service
public class NewsletterServiceImpl implements NewsletterService {
	@Inject
	NewsletterDAO dao;

	@Override
	public int newsletterOk(NewsletterVO vo) {
		return dao.newsletterOk(vo);
	}
}
