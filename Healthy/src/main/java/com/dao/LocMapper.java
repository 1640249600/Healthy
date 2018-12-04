package com.dao;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.pojo.Loc;
import com.pojo.Orders;

public interface LocMapper {
	//分页
	public List<Loc> getLocList(@Param(value="page")int page,@Param(value="rows")int rows);
	//统计所有信息
	public int countLoc();
	//读取表格
	public List<Loc> readXls(Integer id,String synopisis,Integer sid,String type,Date time);
} 


