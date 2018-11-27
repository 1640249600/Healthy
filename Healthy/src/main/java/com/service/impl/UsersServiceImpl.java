package com.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dao.UserMapper;
import com.pojo.Users;
import com.service.UsersService;
@Service("usersService")
@Transactional
public class UsersServiceImpl implements UsersService {
	@Resource
	private UserMapper userMapper;
	public UserMapper getUserMapper() {
		return userMapper;
	}

	public void setUserMapper(UserMapper userMapper) {
		this.userMapper = userMapper;
	}
//分页
	@Override
	public List<Users> getUsers(int pageNo) {
		// TODO Auto-generated method stub
		return userMapper.getUsers(pageNo);
	}
//总记录数
	@Override
	public int countUsers() {
		// TODO Auto-generated method stub
		return userMapper.countUsers();
	}

}
