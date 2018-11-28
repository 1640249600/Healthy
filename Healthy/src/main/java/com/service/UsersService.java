package com.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.pojo.Users;

public interface UsersService {
	//查询
	public List<Users> getUsers(int page, int rows);
		//统计所有信息
	public int countUsers();
	//添加
	public boolean UserAdd(Users uu);
	//删除
	public boolean UserDelete(@Param(value="id")int id);
	//修改(先查询后修改)
	public Users Userselect(@Param(value="id")int id);
	public boolean UserUpdate(Users uu);
}
