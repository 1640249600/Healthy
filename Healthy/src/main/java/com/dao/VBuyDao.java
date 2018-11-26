package com.dao;

import java.util.List;

import com.pojo.VBuy;

public interface VBuyDao {
	public List<VBuy> getAllVbuy();
	
	public int findCount();
}
