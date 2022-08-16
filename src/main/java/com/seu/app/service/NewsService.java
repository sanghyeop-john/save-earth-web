package com.seu.app.service;

import java.util.List;

import com.seu.app.vo.NewsVO;
import com.seu.app.vo.PagingVO;

public interface NewsService {
	
	// List DB
	public List<NewsVO> newsList(PagingVO pvo);
	
	// Write DB
	public int newsInsert(NewsVO vo); 
	
	// 총 record 수
	public int totalRecord(PagingVO pvo);
	
	// View DB
	public NewsVO getNews(int no);

	// 조회수 DB
	public void hitCount(int no);
	
	// Edit DB
	public int newsEditOk(NewsVO vo);
	
	// Delete DB
	public int newsDel(int no, String userid);
}
