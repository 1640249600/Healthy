package com.web.controller;



import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

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
		
}
