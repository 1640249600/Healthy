package com.dao;

import java.util.List;

import com.pojo.doctorlist;

public interface DoctorDao {
	//得到所有医生信息
	public List<doctorlist> getAllDoctor();
}
