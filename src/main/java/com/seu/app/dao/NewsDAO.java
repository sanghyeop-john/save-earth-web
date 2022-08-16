package com.seu.app.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.seu.app.vo.NewsVO;
import com.seu.app.vo.PagingVO;

@Mapper
@Repository
public interface NewsDAO {
	
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
