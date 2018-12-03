package com.web.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pojo.SystemUser;
import com.service.SystemService;

@Controller
public class SystemAction {
@Resource
private SystemService systemService;

public SystemService getSystemService() {
	return systemService;
}
 
public void setSystemService(SystemService systemService) {
	this.systemService = systemService;
}
//进入登录页面
@RequestMapping("Login")
public String SoLogin(){
	return "Login";
	}
//返回json数据
@RequestMapping(value="Login1",method=RequestMethod.POST)
@ResponseBody
public boolean Login(HttpServletRequest request,@ModelAttribute("system")SystemUser system){
	System.out.println("-----------");
	Boolean flag=systemService.toLogin(system);
	System.out.println(flag);
	return flag;
}
}
