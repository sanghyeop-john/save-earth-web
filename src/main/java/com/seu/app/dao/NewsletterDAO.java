package com.seu.app.dao;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.seu.app.vo.NewsletterVO;

@Mapper
@Repository
public interface NewsletterDAO {
	public int newsletterOk(NewsletterVO vo); //뉴스레터 구독신청
}
