package com.service;

import java.util.List;

import com.pojo.Doctorlist;

public interface DoctorService {
	public List<Doctorlist> getAllDoctor(int page,int rows);
	public int findCount();
	//添加
	public boolean doctorAdd(Doctorlist dd);
}
