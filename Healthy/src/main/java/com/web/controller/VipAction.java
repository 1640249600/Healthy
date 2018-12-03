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
	//跳转日志管理页面
	@RequestMapping("/toLoc")
	public String toLoc(){
		return "Loc";
	}
	//跳转部门管理页面
	@RequestMapping("/toDepartments")
	public String toDepartments(){
		return "Department";
	}
	//跳转订单管理页面
	@RequestMapping("/toOrder")
	public String toOrder(){
		return "Order";
	}
	//跳转编辑器
		@RequestMapping("/toEditor")
		public String toEditor(){
			return "ueditor";
		}
		//跳转扫描电话页面
		@RequestMapping("/toTelephone")
		public String toTelephone(){
			return "telephone";
		}
		//跳转名片页面
		@RequestMapping("/toMingPian")
		public String toMingPian(){
			return "MingPian";
		}
		//跳转微信公众号页面
		@RequestMapping("/toWeChat")
		public String toWeChat(){
			return "WeChat";
		}
		//跳转WiFi页面
		@RequestMapping("/toWifi")
		public String toWifi(){
			return "toWifi";
		}
		//跳转信息页面
		@RequestMapping("/toMessage")
		public String toMessage(){
			return "Message";
		}
		//进入视频页面
		@RequestMapping("/toMp4")
		public String toMp4(){
			return "Mp4";
		}
}
