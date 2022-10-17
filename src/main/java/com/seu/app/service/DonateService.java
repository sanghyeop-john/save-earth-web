package com.seu.app.service;

import java.util.List;
import com.seu.app.vo.DonateVO;


public interface DonateService {
	
	// 후원정보등록 
	public int donateFormOk(DonateVO vo);

	public List<DonateVO> donateAllSelect();
	public int donateSum();
	public List<DonateVO> donateSelectByUser();
	public List<DonateVO> donateSelectByMonth();
	public List<DonateVO> donateSelectByCategory();
	public List<DonateVO> donateSelectByUserid(String userid);
}
