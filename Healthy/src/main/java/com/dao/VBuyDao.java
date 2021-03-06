package com.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.pojo.VBuy;

public interface VBuyDao {
	public List<VBuy> getAllVbuy(@Param(value="page")int page,@Param(value="rows")int rows);
	
	public int findCount();
	//添加22
	public boolean vBuySave(VBuy vv);
	//删除  
	public boolean vBuyDel(@Param(value="id")int id);
	//修改
	public VBuy vBuyUp(@Param(value="id")int id);
	public boolean vBuyUpdate(VBuy vv);
	
}
