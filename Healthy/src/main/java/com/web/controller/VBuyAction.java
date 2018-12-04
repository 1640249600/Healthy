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
import com.pojo.VBuy;
import com.service.VBuyService;

@Controller
public class VBuyAction {
	@Resource(name="vbuyService")	
	private VBuyService vbuyService;
	
	public VBuyService getVbuyService() {
		return vbuyService;
	}
 
	public void setVbuyService(VBuyService vbuyService) {
		this.vbuyService = vbuyService;
	}

	@RequestMapping("/VbuyFindAll")
	@ResponseBody
	public String findAll(@RequestParam(value="page",required=false) String page,@RequestParam(value="rows",required=false) String rows){
		
		System.out.println(page+"---"+rows);
		List<VBuy> vv = vbuyService.getAllVbuy(Integer.parseInt(page),Integer.parseInt(rows));
		System.out.println("这是ACTION层+遍历");
		
		JSONArray array = new JSONArray();
		for (VBuy v : vv) {
			JSONObject obj=new JSONObject();
			obj.put("id", v.getId());
			obj.put("grade", v.getGrade());
			obj.put("state", v.getZhuangtai().getState());
			array.add(obj);
		}
		int total=vbuyService.findCount();
		String ul= "{\"total\":"+total+",\"rows\":"+array.toString()+"}";
		return ul;
	}
	
	@RequestMapping("/VbuySave")
	@ResponseBody
	public String Vsave(HttpServletRequest request,@ModelAttribute(value="vv") VBuy vv){
		boolean falg = vbuyService.vBuySave(vv);		
		if (falg) {
			return "true";
		}else {
			return "false";
		}
		
	}
	@RequestMapping("/Vbuydel")	
	@ResponseBody
	public String Vbuydel(HttpServletRequest request,@RequestParam(value="id",required=false) String id) throws Exception {
		System.out.println(id);
		String[] uid=id.split(",");
		System.out.println(uid);
		boolean	xx = false;
		for (int i = 0; i < uid.length; i++) {
		xx = vbuyService.vBuyDel(Integer.parseInt(uid[i]));
		}
		if (xx) {
			return "true";
		}else {
			return "false";
		}
	}
	@RequestMapping("/VbuyUp")	
	@ResponseBody
	public String VbuyUp(HttpServletRequest request,@RequestParam(value="id",required=false) String id) throws Exception {
		System.out.println(id);		
		VBuy v = vbuyService.vBuyUp(Integer.parseInt(id));
		JSONObject obj=new JSONObject();
		obj.put("id", v.getId());
		obj.put("grade", v.getGrade());
		obj.put("zid", v.getZid());
		System.out.println(obj.toString());
		return obj.toString();		
	}
	
	@RequestMapping("/VbuyUpdate")	
	@ResponseBody
	public String VbuyUpdate(HttpServletRequest request,@ModelAttribute(value="vv") VBuy vv) throws Exception {
		boolean	xx = false;
		System.out.println(vv.getZid()+"=="+vv.getGrade()+"=="+vv.getId());
		xx = vbuyService.vBuyUpdate(vv);
		
		if (xx) {
			return "true";
		}else {
			return "false";
		}
		
	}
	
}
