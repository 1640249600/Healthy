package com.dao;
import org.apache.ibatis.annotations.Param;

import com.pojo.SystemUser;

public interface SystemMapper {
//登录
	public boolean toLogin(SystemUser ss);
	//通过电话找到用户
	public SystemUser sysFind(@Param(value="tel") String tel);
	//修改密码
	public boolean sysSetPass(SystemUser ss);
} 

