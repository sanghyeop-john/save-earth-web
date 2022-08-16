package com.seu.app.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.seu.app.vo.ReportVO;

@Mapper
@Repository
public interface ReportDAO {
	public List<ReportVO> reportSelect();
	public int reportInsert(ReportVO rvo);
}
