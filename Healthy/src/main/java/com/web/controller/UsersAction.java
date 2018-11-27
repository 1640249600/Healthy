package com.web.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.pojo.Users;
import com.service.UsersService;

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
public Object toUsersList(HttpServletRequest request){
	System.out.println("------");
	//获取总记录数
	String pageNo=request.getParameter("pageNo");
	List<Users> list=usersService.getUsers(Integer.parseInt(pageNo));
	JSONArray array=new JSONArray();
	for (Users users : list) {
		JSONObject obj=new JSONObject();
		obj.put("id", users.getId());
		obj.put("identity", users.getVbuy().getGrade());
		obj.put("telephone", users.getTelephone());
		obj.put("birthday", users.getBirthday());
		obj.put("zhuangtai", users.getZhuangtai().getZid());
		array.add(obj);
	}
	int total=usersService.countUsers();
	//固定格式转换为easyui能接收的格式
	String ul="{\"total\":"+total+",\"rows\":"+array.toString()+"}";
	return ul;
}
}
