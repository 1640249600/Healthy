package com.service;

import java.util.List;


import com.pojo.VBuy;

public interface VBuyService {
	
	//分页 
	public int findCount();

	public List<VBuy> getAllVbuy(int page, int rows);
	//添加
	public boolean vBuySave(VBuy vv);
	//删除
	public boolean vBuyDel(int id);
	//修改
	public VBuy vBuyUp(int id);
	public boolean vBuyUpdate(VBuy vv);
}
