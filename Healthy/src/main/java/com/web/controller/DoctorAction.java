package com.web.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.pojo.Doctorlist;
import com.service.DoctorService;
import com.util.PubDate;

@Controller
public class DoctorAction {
	@Resource(name="doctorService")
	private DoctorService doctorService;

	public DoctorService getDoctorService() {
		return doctorService;
	}

	public void setDoctorService(DoctorService doctorService) {
		this.doctorService = doctorService;
	}
	@RequestMapping("/toDoctorList")
	public String toUsers(){
		return "DoctorList";
	}
	@RequestMapping("/DCFindAll")
	@ResponseBody
	public String findAll(@RequestParam(value="page",required=false) String page,@RequestParam(value="rows",required=false) String rows){
		
		System.out.println(page+"---"+rows);
		List<Doctorlist> vv = doctorService.getAllDoctor(Integer.parseInt(page),Integer.parseInt(rows));
		System.out.println("这是ACTION层+遍历");
		
		JSONArray array = new JSONArray();
		for (Doctorlist v : vv) {
			JSONObject obj=new JSONObject();
			obj.put("did", v.getDid());
			obj.put("name", v.getName());
			obj.put("photo", v.getPhoto());
			if (v.getSex() == 1) {
				obj.put("sex", "男");
			}else {
				obj.put("sex", "女");
			}
			
			obj.put("tel", v.getTel());
			obj.put("liuprice", v.getLiuprice());
			
			obj.put("tijiaotime", PubDate.datToString(v.getTijiaotime()));
			obj.put("check", v.getShenhe().getChecked());
			array.add(obj);
		}
		int total=doctorService.findCount();
		String ul= "{\"total\":"+total+",\"rows\":"+array.toString()+"}";
		return ul;
	}
	
}
