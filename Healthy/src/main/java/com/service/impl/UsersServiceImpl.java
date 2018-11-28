package com.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
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
	public List<Users> getUsers() {
		// TODO Auto-generated method stub
		return userMapper.getUsers();
	}
//总记录数
	@Override
	public int countUsers() {
		// TODO Auto-generated method stub
		return userMapper.countUsers();
	}
//添加
	@Override
	public boolean UserAdd(Users uu) {
		// TODO Auto-generated method stub
		return userMapper.UserAdd(uu);
	}
//删除
	@Override
	public boolean UserDelete(int id) {
		// TODO Auto-generated method stub
		return userMapper.UserDelete(id);
	}
//修改(先查询后修改)
	@Override
	public Users Userselect(int id) {
		// TODO Auto-generated method stub
		return userMapper.Userselect(id);
	}
//修改
	@Override
	public boolean UserUpdate(Users uu) {
		// TODO Auto-generated method stub
		return userMapper.UserUpdate(uu);
	}
	public static void main(String[] args) {
		ApplicationContext ctx = new ClassPathXmlApplicationContext("applicationContext.xml");
		UsersService uu=(UsersService) ctx.getBean("usersService");
		Map<String, Integer> map = new HashMap();
		map.put("page", 1);
		map.put("rows", 2);
		List<Users> ll  =uu.getUsers();
		System.out.println(ll.size());
	}
	
}
