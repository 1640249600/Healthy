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
import com.pojo.Words;
import com.service.WorksService;
import com.util.PubDate;
@Controller
public class WorksAction {
@Resource
private WorksService worksService;
public WorksService getWorksService() {
	return worksService;
}
public void setWorksService(WorksService worksService) {
	this.worksService = worksService;
}
//分页
@RequestMapping("/toWorksList")
@ResponseBody
public Object  toWorksList(@RequestParam(value="page",required=false)String page,@RequestParam(value="rows",required=false)String rows){
	System.out.println("------");
	//获取总记录数
	List<Words> list=worksService.getWorks(Integer.parseInt(page),Integer.parseInt(rows));
	System.out.println("这是action");
	JSONArray array=new JSONArray();
	for (Words ww : list) {
		JSONObject obj=new JSONObject();
		obj.put("id", ww.getId());
		obj.put("name", ww.getName());
		obj.put("content", ww.getContent());
		obj.put("time",PubDate.datToString(ww.getTime()));
		array.add(obj);
	}
	System.out.println(array.toString());
	int total=worksService.countWorks();
	//固定格式转换为easyui能接收的格式
	String ul="{\"total\":"+total+",\"rows\":"+array.toString()+"}";
	return ul;
	}
	//增加
@RequestMapping("/toworkAdd")
@ResponseBody
public String workAdd(HttpServletRequest request,@ModelAttribute(value="ww")Words ww){
	System.out.println("-----添加");
	boolean flag=worksService.wordsAdd(ww);
	if (flag) {
		return "true";
	}else {
		return "false";
	}
}

}
