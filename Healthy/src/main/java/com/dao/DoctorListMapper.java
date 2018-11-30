package com.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.pojo.Doctorlist;

public interface DoctorListMapper {
	//分页查询
	public List<Doctorlist> getAllDoctor(@Param(value="page")int page,@Param(value="rows")int rows);
	
	public int findCount();
	public boolean doctorAdd(Doctorlist dd);
}
