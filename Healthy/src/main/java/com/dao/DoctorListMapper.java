package com.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.pojo.Doctorlist;

public interface DoctorListMapper {
	//分页查询
	public List<Doctorlist> getAllDoctor(@Param(value="page")int page,@Param(value="rows")int rows);
	public int findCount();
	//导出查找
	public List<Doctorlist> getDoctor();
	//添加
	public boolean doctorAdd(Doctorlist dd);
	
	//删除
	public boolean doctorDel(@Param(value="did")int did);
	
	//修改
	public Doctorlist doctorUp(@Param(value="did")int did);
	public boolean doctorUpdate(Doctorlist dd);
	
	//医生信息管理
	public List<Doctorlist> getXinDoctor(@Param(value="page")int page,@Param(value="rows")int rows);
	public int getXinCount();
	//导出查找
	public List<Doctorlist> getXinBiaoDoctor();
	public boolean doctorXinAdd(Doctorlist dd);
	
	
}
