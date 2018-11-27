package com.service;

import java.util.List;

import com.pojo.Users;

public interface UsersService {
	//查询
	public List<Users> getUsers(int pageNo);
		//统计所有信息
	public int countUsers();
}
