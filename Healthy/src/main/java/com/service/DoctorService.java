package com.service;

import java.util.List;

import com.pojo.Doctorlist;

public interface DoctorService {
	public List<Doctorlist> getAllDoctor(int page,int rows);
	public int findCount();
	
	public List<Doctorlist> getDoctor();
	//添加
	public boolean doctorAdd(Doctorlist dd);
	
	//删除
	public boolean doctorDel(int did);
	
	//修改
	public Doctorlist doctorUp(int did);
	public boolean doctorUpdate(Doctorlist dd);
	
	//医生信息管理
	public List<Doctorlist> getXinDoctor(int page,int rows);
	public int getXinCount();
	//导出查找
	public List<Doctorlist> getXinBiaoDoctor();
	public boolean doctorXinAdd(Doctorlist dd);

	
}
