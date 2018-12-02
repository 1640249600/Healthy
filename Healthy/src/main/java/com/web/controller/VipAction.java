package com.web.controller;



import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.miaodiyun.httpApiDemo.IndustrySMS;

@Controller
public class VipAction {
	
	@RequestMapping("/login")
	public String pageCount(){
		
		return "index";
	}
	
	@RequestMapping("/vip")
	public String vip(){
		
		return "Vip";
	}
	//跳转用户页面
	@RequestMapping("/toUsers")
	public String toUsers(){
		return "Users";
	}
	
	//跳转编辑器
		@RequestMapping("/toEditor")
		public String toEditor(){
			return "ueditor";
		}
		
	//跳转编辑器
	@RequestMapping("/miaodi")
	public String miaodi(){
		return "miaodi";
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
		System.out.println(tel+"---"+mi+"---"+yanzheng);
		
		if (mi.equalsIgnoreCase(yanzheng)) {
			return "true";
		}else {
			return "false";
		}
		
	}
}
