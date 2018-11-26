package com.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dao.DoctorDao;
import com.pojo.doctorlist;
import com.service.DoctorService;
@Service("doctorService")

@Transactional
public class DoctorServiceImpl implements DoctorService {
	@Resource
	private DoctorDao doctorDao;

	public DoctorDao getDoctorDao() {
		return doctorDao;
	}

	public void setDoctorDao(DoctorDao doctorDao) {
		this.doctorDao = doctorDao;
	}

	@Override
	public List<doctorlist> getAllDoctor() {
		// TODO Auto-generated method stub
		return doctorDao.getAllDoctor();
	}
	
}
