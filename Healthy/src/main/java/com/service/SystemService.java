package com.service;

import com.pojo.SystemUser;
public interface SystemService {
	//登录
		public boolean toLogin(SystemUser ss);
		
		//通过电话找到用户
		public SystemUser sysFind(String tel);
		//修改密码
		public boolean sysSetPass(SystemUser ss);
}
