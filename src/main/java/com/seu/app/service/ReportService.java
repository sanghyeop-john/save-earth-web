package com.seu.app.service;

import java.util.List;

import com.seu.app.vo.ReportVO;

public interface ReportService {
	public List<ReportVO> reportSelect();
	public int reportInsert(ReportVO rvo);
}
