package com.web.controller;


import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import com.service.DoctorService;

@Controller
public class VipAction {
	@Resource(name="doctorService")
	private DoctorService doctorService;

	public DoctorService getDoctorService() {
		return doctorService;
	}

	public void setDoctorService(DoctorService doctorService) {
		this.doctorService = doctorService;
	}
	
	
	@RequestMapping("/login")
	public String pageCount(){
		
		return "index";
	}
	
	@RequestMapping("/vip")
	public String vip(){
		
		return "Vip";
	}
	
	
}
