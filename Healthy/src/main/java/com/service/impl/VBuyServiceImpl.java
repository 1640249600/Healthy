package com.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dao.VBuyDao;
import com.pojo.VBuy;
import com.service.VBuyService;
@Service("vbuyService")

@Transactional
public class VBuyServiceImpl implements VBuyService {
	@Resource
	private VBuyDao vbuyDao;
	
	public VBuyDao getVbuyDao() {
		return vbuyDao;
	}

	public void setVbuyDao(VBuyDao vbuyDao) {
		this.vbuyDao = vbuyDao;
	}

	@Override
	public List<VBuy> getAllVbuy() {
		// TODO Auto-generated method stub
		return vbuyDao.getAllVbuy();
	}

	@Override
	public int findCount() {
		// TODO Auto-generated method stub
		return vbuyDao.findCount();
	}

}
