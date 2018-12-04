package com.service.impl;
import javax.annotation.Resource;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Service;
import com.dao.SystemMapper;
import com.pojo.SystemUser;
import com.service.SystemService;
import com.service.UsersService;
@Service("systemService")
public class SystemServiceImpl implements SystemService {
	@Resource
	private SystemMapper systemMapper;
	public SystemMapper getSystemMapper() {
		return systemMapper;
	} 
	public void setSystemMapper(SystemMapper systemMapper) {
		this.systemMapper = systemMapper;
	}
	//登录222
	@Override
	public boolean toLogin(SystemUser ss) {
		// TODO Auto-generated method stub
		return systemMapper.toLogin(ss);
	}
	//找到用户
	@Override
	public SystemUser sysFind(String tel) {
		// TODO Auto-generated method stub
		return systemMapper.sysFind(tel);
	}
	//修改密码
	@Override
	public boolean sysSetPass(SystemUser ss) {
		// TODO Auto-generated method stub
		return systemMapper.sysSetPass(ss);
	}
	

}
