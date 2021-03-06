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
		List<Doctorlist> ds = dd.getXinBiaoDoctor();
		for (Doctorlist ld : ds) {
			System.out.println(ld.getDept().getDname());
		}
		
	}
	//添加
	@Override
	public boolean doctorAdd(Doctorlist dd) {
		// TODO Auto-generated method stub
		return doctorListMapper.doctorAdd(dd);
	}
	//删除
	@Override
	public boolean doctorDel(int did) {
		// TODO Auto-generated method stub
		return doctorListMapper.doctorDel(did);
	}

	//医生审核修改查询
	@Override
	public Doctorlist doctorUp(int did) {
		// TODO Auto-generated method stub
		return doctorListMapper.doctorUp(did);
	}
	//医生审核更新
	@Override
	public boolean doctorUpdate(Doctorlist dd) {
		// TODO Auto-generated method stub
		return doctorListMapper.doctorUpdate(dd);
	}
	//医生审核倒表
	@Override
	public List<Doctorlist> getDoctor() {
		// TODO Auto-generated method stub
		return doctorListMapper.getDoctor();
	}
	//医生信息管理
	@Override
	public List<Doctorlist> getXinDoctor(int page, int rows) {
		// TODO Auto-generated method stub
		return doctorListMapper.getXinDoctor(page,rows);
	}

	@Override
	public int getXinCount() {
		// TODO Auto-generated method stub
		return doctorListMapper.getXinCount();
	}
	//医生信息倒表
	@Override
	public List<Doctorlist> getXinBiaoDoctor() {
		// TODO Auto-generated method stub
		return doctorListMapper.getXinBiaoDoctor();
	}
	//医生信息管理添加
	@Override
	public boolean doctorXinAdd(Doctorlist dd) {
		// TODO Auto-generated method stub
		return doctorListMapper.doctorXinAdd(dd);
	}

}
