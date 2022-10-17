package com.seu.app.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.seu.app.dao.ReportDAO;
import com.seu.app.vo.ReportPagingVO;
import com.seu.app.vo.ReportVO;

@Service
public class ReportServiceImpl implements ReportService {
	
	@Inject
	ReportDAO dao;

	@Override
	public List<ReportVO> reportAllSelect(ReportPagingVO prvo) {
		
		return dao.reportAllSelect(prvo);
	}

	@Override
	public int reportInsert(ReportVO rvo) {
		
		return dao.reportInsert(rvo);
	}

	@Override
	public ReportVO reportSelect(int no) {
		
		return dao.reportSelect(no);
	}

	@Override
	public void hitUpdate(int no) {
		dao.hitUpdate(no);
	}

	@Override
	public String getFilename(int no) {
		
		return dao.getFilename(no);
	}

	@Override
	public int reportUpdate(ReportVO rvo) {
		
		return dao.reportUpdate(rvo);
	}

	@Override
	public int reportDelete(int no) {
		
		return dao.reportDelete(no);
	}

	@Override
	public int totalRecord(ReportPagingVO pvo) {
		
		return dao.totalRecord(pvo);
	}
}
