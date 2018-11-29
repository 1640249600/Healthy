package com.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dao.DoctorListMapper;
import com.pojo.Doctorlist;
import com.service.DoctorService;

@Service(value="doctorService")
@Transactional
public class DoctorServiceImpl implements DoctorService {
@Resource
private DoctorListMapper doctorListMapper;

	public DoctorListMapper getDoctorListMapper() {
	return doctorListMapper;
}

public void setDoctorListMapper(DoctorListMapper doctorListMapper) {
	this.doctorListMapper = doctorListMapper;
}

	@Override
	public List<Doctorlist> getAllDoctor(int page,int rows) {
		// TODO Auto-generated method stub
		return doctorListMapper.getAllDoctor(page,rows);
	}
	
	@Override
	public int findCount() {
		// TODO Auto-generated method stub
		return doctorListMapper.findCount();
	}
	
	
	public static void main(String[] args) {
		ApplicationContext ctx = new ClassPathXmlApplicationContext("applicationContext.xml");
		DoctorService dd = (DoctorService) ctx.getBean("doctorService");
		List<Doctorlist> ld = dd.getAllDoctor(1,3);
		for (Doctorlist ds : ld) {
			System.out.println(ds.getShenhe().getChecked());
		}
	}

	

}
