package com.service;

import java.util.List;

import com.pojo.Doctorlist;

public interface DoctorService {
	public List<Doctorlist> getAllDoctor(int page,int rows);
	public int findCount();
	//添加
	public boolean doctorAdd(Doctorlist dd);
	
	//删除
	public boolean doctorDel(int did);
	
	//修改
	public Doctorlist doctorUp(int did);
	public boolean doctorUpdate(Doctorlist dd);
	
}
