package com.web.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.pojo.Users;
import com.service.UsersService;
import com.util.PubDate;

@Controller
public class UsersAction {
@Resource
private UsersService usersService;

public UsersService getUsersService() {
	return usersService;
}
 
public void setUsersService(UsersService usersService) {
	this.usersService = usersService;
}
//分页
@RequestMapping("/toUsersList")
@ResponseBody
public Object toUsersList(@RequestParam(value="page",required=false)String page,@RequestParam(value="rows",required=false)String rows){
	System.out.println("------");
	//获取总记录数
	
	List<Users> list=usersService.getUsers(Integer.parseInt(page),Integer.parseInt(rows));
	System.out.println("这是action");
	JSONArray array=new JSONArray();
	for (Users users : list) {
		JSONObject obj=new JSONObject();
		obj.put("id", users.getId());
		obj.put("name", users.getName());
		obj.put("grade", users.getVbuy().getGrade());
		obj.put("telephone", users.getTelephone());
		obj.put("birthday",PubDate.datToString(users.getBirthday()));
		obj.put("state", users.getZhuangtai().getZid());
		array.add(obj);
	}
	int total=usersService.countUsers();
	//固定格式转换为easyui能接收的格式
	String ul="{\"total\":"+total+",\"rows\":"+array.toString()+"}";
	return ul;
}
//增加
	@RequestMapping("/userAdd")
	@ResponseBody
	public String uAdd(HttpServletRequest request,@ModelAttribute(value="uu")Users uu){
		boolean flag=usersService.UserAdd(uu);
		if (flag) {
			return "true";
		}else {
			return "false";
		}
	}
	//删除
	@RequestMapping("/userDelete")
	@ResponseBody
	public String uDelete(HttpServletRequest request,@RequestParam(value="id",required=false)String id)throws Exception{
		System.out.println(id);
		//分隔
		String[] uid=id.split(",");
		System.out.println(uid);
		boolean uu=false;
		for(int i=0;i<uid.length;i++){
			uu=usersService.UserDelete(Integer.parseInt(uid[i]));
		}
		if (uu) {
			return "true";
		}else{
			return "false";
		}
	}
	//修改
	@RequestMapping("/userSelect")
	@ResponseBody
	public String USelect(HttpServletRequest request,@RequestParam(value="id",required=false)String id)throws Exception{
		System.out.println(id);
		Users uu=usersService.Userselect(Integer.parseInt(id));
		JSONObject obj=new JSONObject();
		obj.put("id", uu.getId());
		obj.put("name", uu.getName());
		obj.put("grade", uu.getVbuy().getGrade());
		obj.put("telephone", uu.getTelephone());
		obj.put("birthday", uu.getBirthday());
		obj.put("state", uu.getZhuangtai().getZid());
		System.out.println(obj.toString());
		return obj.toString();
	}
	//修改
	@RequestMapping("/userUpdate")
	@ResponseBody
	public String uUpdate(HttpServletRequest request,@ModelAttribute(value="uu")Users uu)throws Exception{
		boolean u=false;
		System.out.println(uu.getId()+"=="+uu.getVbuy().getGrade()+"=="+uu.getTelephone()+"=="+uu.getBirthday()+"=="+uu.getZhuangtai().getState());
		u=usersService.UserUpdate(uu);
		if (u) {
			return "true";
		}else {
			return "false";
		}
	}
	
}
