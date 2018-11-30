package com.web.controller;

import java.io.File;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FilenameUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

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
	
	@RequestMapping(value="doctorImport",method=RequestMethod.POST)
	@ResponseBody
	public String doctorImport(@RequestParam(value="photo",required=false)MultipartFile photo,
			@RequestParam(value="zhixingpicture",required=false)MultipartFile zhixingpicture,
			@RequestParam(value="zigepicture",required=false)MultipartFile zigepicture,
			@RequestParam(value="idcardpicture",required=false)MultipartFile idcardpicture,
			@RequestParam(value="gongzuopicture",required=false)MultipartFile gongzuopicture,
			HttpServletRequest request) throws Exception{
		//从jsp中获取所有非文件的属性
		String name = request.getParameter("name");
		String sex = request.getParameter("sex");
		String age = request.getParameter("age");
		String idcard = request.getParameter("idcard");
		String liuprice = request.getParameter("liuprice");
		String zigecard = request.getParameter("zigecard");
		String zhixingcard = request.getParameter("zhixingcard");
		String shid = request.getParameter("shid");
		String tel = request.getParameter("tel");
		Doctorlist dd = new Doctorlist();
		dd.setName(name);
		dd.setSex(Integer.parseInt(sex));
		dd.setAge(Integer.parseInt(age));
		dd.setIdcard(idcard);
		dd.setLiuprice(Integer.parseInt(liuprice));
		dd.setZigecard(zigecard);
		dd.setZhixingcard(zhixingcard);
		dd.setShid(Integer.parseInt(shid));
		dd.setTel(tel);
		String path = request.getServletContext().getRealPath("WEB-INF"+File.separator+"static"+File.separator+"upload");
		System.out.println(path);
		dd.setPhoto(name(photo,path,request));
		dd.setZhixingpicture(name(zhixingpicture,path,request));
		dd.setZigepicture(name(zigepicture,path,request));
		dd.setIdcardpicture(name(idcardpicture,path,request));
		dd.setGongzuopicture(name(gongzuopicture,path,request));
		
		boolean falg = doctorService.doctorAdd(dd);
		if (falg) {
			return "true";
		}else {
			return "false";
		}
		
		
		
		
		
	}
	public static String name(MultipartFile photo,String path,HttpServletRequest request) throws Exception {
		
			String photoname = photo.getOriginalFilename();
			System.out.println(photoname);
			
			String prefix = FilenameUtils.getExtension(photoname);
			System.out.println(prefix);
			
			String photoName = System.currentTimeMillis()+UUID.randomUUID().toString()+"."+prefix;  
			System.out.println("全球唯一的名字======== " + photoName);
			
			
			 File targetFile = new File(path, photoName);  //最终上传文件位置与文件名
	            if(!targetFile.exists()){   //如果不存在，则创建目录 
	                targetFile.mkdirs(); 
	            }
	            
	            photo.transferTo(targetFile);  //也可做个异常处理
	            return "/Healthy/static/upload/"+photoName;
		
	}
	
}
