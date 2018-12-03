package com.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dao.DepartmentMapper;
import com.pojo.Department;
import com.service.DepartmentService;
@Service("departmentService")
@Transactional
public class DepartmentServiceImpl implements DepartmentService{
@Resource
private DepartmentMapper departmentMapper;
	@Override
	public List<Department> getDepartmentList(int page, int rows) {
		// TODO Auto-generated method stub
		return departmentMapper.getDepartmentList(page, rows);
	}

	public DepartmentMapper getDepartmentMapper() {
		return departmentMapper;
	}

	public void setDepartmentMapper(DepartmentMapper departmentMapper) {
		this.departmentMapper = departmentMapper;
	}

	@Override
	public int countDepartment() {
		// TODO Auto-generated method stub
		return departmentMapper.countDepartment();
	}
		public static void main(String[] args) {
			ApplicationContext ac=new ClassPathXmlApplicationContext("applicationContext.xml");
			DepartmentService de=(DepartmentService) ac.getBean("departmentService");
			List<Department> list=de.getDepartmentList(1, 2);
			for (Department department : list) {
				System.out.println(department.getId());
				System.out.println(department.getDname());
			}
		}

}
