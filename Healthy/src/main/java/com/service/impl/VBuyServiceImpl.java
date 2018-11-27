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

	
//分页
	@Override
	public int findCount() {
		// TODO Auto-generated method stub
		return vbuyDao.findCount();
	}

	@Override
	public List<VBuy> getAllVbuy(int page, int rows) {
		// TODO Auto-generated method stub
		return vbuyDao.getAllVbuy(page, rows);
	}
//添加
	@Override
	public boolean vBuySave(VBuy vv) {
		// TODO Auto-generated method stub
		return vbuyDao.vBuySave(vv);
	}

	@Override
	public boolean vBuyDel(int id) {
		// TODO Auto-generated method stub
		return vbuyDao.vBuyDel(id);
	}
//修改
	@Override
	public VBuy vBuyUp(int id) {
		// TODO Auto-generated method stub
		return vbuyDao.vBuyUp(id);
	}

	@Override
	public boolean vBuyUpdate(VBuy vv) {
		// TODO Auto-generated method stub
		return vbuyDao.vBuyUpdate(vv);
	}

}
