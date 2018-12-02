package com.web.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.miaodiyun.httpApiDemo.IndustrySMS;
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
@RequestMapping("/xgMima")
@ResponseBody
public String xgMima(HttpServletRequest request){
	String tel = request.getParameter("tel");
	int a= (int)((Math.random()*9+1)*100000);
	String mima = String.valueOf(a);
	System.out.println(tel+"---"+mima);
	
	IndustrySMS.tel(tel);
	IndustrySMS.mi(mima);
	IndustrySMS.execute();
	
	
	return mima;
}

@RequestMapping("/xgMimaEdit")
@ResponseBody
public String xgMimaEdit(HttpServletRequest request){
	String tel = request.getParameter("tel");
	
	String yanzheng = request.getParameter("yanzheng");
	String mi = request.getParameter("mi");
	String password = request.getParameter("password");
	System.out.println(tel+"---"+mi+"---"+yanzheng);
	
	SystemUser ss = systemService.sysFind(tel);
	
	JSONObject obj = new JSONObject();
	
		if (ss == null) {
			obj.put("result", "没有该用户");
		}else {
		
			if (mi.equalsIgnoreCase(yanzheng)) {
				
				ss.setPassword(password);
				boolean ff = systemService.sysSetPass(ss);
				if (ff) {
					obj.put("result", "修改成功");
				}else {
					obj.put("result", "修改失败");
				}
				
			}else {
				
				obj.put("result", "验证码错误");
			}
		
		
		}
	
	
	
	return obj.toString();
}
}
