package com.web.controller;
import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.pojo.Loc;
import com.service.LocService;
import com.util.PubDate;
@Controller
public class LocAction {
	//注入
@Resource
private LocService locService;

public LocService getLocService() {
	return locService;
}
 
public void setLocService(LocService locService) {
	this.locService = locService;
}
//分页
@RequestMapping("/toLocList")
@ResponseBody
public Object toLocList(@RequestParam(value="page",required=false)String page,@RequestParam(value="rows",required=false)String rows)throws Exception{
	System.out.println("进去action");
	//获取总记录数
	List<Loc> ll=locService.getLocList(Integer.parseInt(page),Integer.parseInt(rows));
	System.out.println("进入方法");
	JSONArray array=new JSONArray();
	for (Loc loc : ll) {
		JSONObject obj=new JSONObject();
		obj.put("id",loc.getId());//订单id
		obj.put("synopisis", loc.getSynopisis());//订单登录状态
		obj.put("type", loc.getType());//订单类型
		obj.put("name",loc.getSystemUser().getName());//订单名
		obj.put("time",PubDate.datToString(loc.getTime()));//订单时间
		array.add(obj);
	}
	
	System.out.println(array.toString());
	int total=locService.countLoc();
	String ul="{\"total\":"+total+",\"rows\":"+array.toString()+"}";
	return ul;
}
}
