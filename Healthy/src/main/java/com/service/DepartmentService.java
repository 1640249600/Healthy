package com.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.pojo.Department;
 
public interface DepartmentService {
	//分页
		public List<Department> getDepartmentList(@Param(value="page")int page,@Param(value="rows")int rows);
		//查询总数
		public int countDepartment();
}
