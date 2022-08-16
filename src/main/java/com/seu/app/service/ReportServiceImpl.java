package com.seu.app.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.seu.app.dao.ReportDAO;
import com.seu.app.vo.ReportVO;

@Service
public class ReportServiceImpl implements ReportService {
	
	@Inject
	ReportDAO dao;

	@Override
	public List<ReportVO> reportSelect() {
		
		return dao.reportSelect();
	}

	@Override
	public int reportInsert(ReportVO rvo) {
		
		return dao.reportInsert(rvo);
	}
}
