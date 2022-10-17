package com.seu.app.service;


import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.seu.app.dao.DonateDAO;
import com.seu.app.vo.DonateVO;


@Service
public class DonateServiceImpl implements DonateService {

	@Inject
	DonateDAO dao;
  
  @Override
	public int donateFormOk(DonateVO vo) {
		
		return dao.donateFormOk(vo);
	}

	@Override
	public List<DonateVO> donateAllSelect() {
		
		return dao.donateAllSelect();
	}

	@Override
	public int donateSum() {
		
		return dao.donateSum();
	}

	@Override
	public List<DonateVO> donateSelectByUser() {
		return dao.donateSelectByUser();
	}

	@Override
	public List<DonateVO> donateSelectByMonth() {
		return dao.donateSelectByMonth();
	}

	@Override
	public List<DonateVO> donateSelectByCategory() {
		return dao.donateSelectByCategory();
	}

	@Override
	public List<DonateVO> donateSelectByUserid(String userid) {
		return dao.donateSelectByUserid(userid);
	}

}
