package com.web.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
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

	@RequestMapping("/findAll")
	@ResponseBody
	public String findAll(){
		List<VBuy> vv = vbuyService.getAllVbuy();
		System.out.println("这是ACTION层+遍历");
		
		JSONArray array = new JSONArray();
		for (VBuy v : vv) {
			JSONObject obj=new JSONObject();
			obj.put("grade", v.getGrade());
			obj.put("state", v.getZhuangtai().getState());
			array.add(obj);
		}
		int total=vbuyService.findCount();
		String ul= "{\"total\":"+total+",\"rows\":"+array.toString()+"}";
		return ul;
	}
}
