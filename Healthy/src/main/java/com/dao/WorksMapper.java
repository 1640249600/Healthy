package com.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.pojo.Words;

public interface WorksMapper {
	//查询
	public List<Words> getWorks(@Param(value="page")int page,@Param(value="rows")int rows);
	//统计所有信息
	public int countWorks();
	//增加
	public boolean wordsAdd(Words ww);
}
