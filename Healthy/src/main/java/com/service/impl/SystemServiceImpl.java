package com.service.impl;
import javax.annotation.Resource;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Service;
import com.dao.SystemMapper;
import com.pojo.SystemUser;
import com.service.SystemService;
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
	//登录
	@Override
	public boolean toLogin(SystemUser ss) {
		// TODO Auto-generated method stub
		return systemMapper.toLogin(ss);
	}

}
