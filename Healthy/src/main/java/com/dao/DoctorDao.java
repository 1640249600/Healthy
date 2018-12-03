package com.dao;

import java.util.List;

import com.pojo.Doctorlist;

public interface DoctorDao {
	//得到所有医生信息
	public List<Doctorlist> getAllDoctor();
}

