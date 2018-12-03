package com.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.pojo.Loc;
import com.pojo.Orders;

public interface LocService {
	//分页
		public List<Loc> getLocList(@Param(value="page")int page,@Param(value="rows")int rows);
		//统计所有信息
		public int countLoc();
}
