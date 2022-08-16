package com.seu.app.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.seu.app.dao.NewsDAO;
import com.seu.app.vo.NewsVO;
import com.seu.app.vo.PagingVO;

@Service
public class NewsServiceImpl implements NewsService {
	
	@Autowired // DAO로 DB에 접근하고 DTO로 데이터를 전달받은 다음, 비지니스 로직을 처리해 적절한 데이터를 반환한다.
	NewsDAO dao;
	
	@Override
	public List<NewsVO> newsList(PagingVO pvo) {
		return dao.newsList(pvo);
	}

	@Override
	public int newsInsert(NewsVO vo) {
		return dao.newsInsert(vo);
	}

	@Override
	public int totalRecord(PagingVO pvo) {
		return dao.totalRecord(pvo);
	}

	@Override
	public NewsVO getNews(int no) {
		return dao.getNews(no);
	}

	@Override
	public void hitCount(int no) {
		dao.hitCount(no);
		
	}

	@Override
	public int newsEditOk(NewsVO vo) {
		return dao.newsEditOk(vo);
	}

	@Override
	public int newsDel(int no, String userid) {
		return dao.newsDel(no, userid);
	}

}
