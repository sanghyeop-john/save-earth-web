package com.seu.app.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.seu.app.vo.DonateVO;

@Mapper
@Repository
public interface DonateDAO {

	// 후원 정보 등록 
	public int donateFormOk(DonateVO vo);
	

	public List<DonateVO> donateAllSelect();
	public int donateSum();
	public List<DonateVO> donateSelectByUser();
	public List<DonateVO> donateSelectByMonth();
	public List<DonateVO> donateSelectByCategory();
	public List<DonateVO> donateSelectByUserid(String userid);

}
