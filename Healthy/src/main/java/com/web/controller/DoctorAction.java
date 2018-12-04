package com.web.controller;

import java.io.File;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FilenameUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.pojo.Doctorlist;
import com.pojo.VBuy;
import com.service.DoctorService;
import com.util.Excel;
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
	//添加
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
		//将所有属性封装到实体类
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
		//上传
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
	//删除
	@RequestMapping("/doctorDel")	
	@ResponseBody
	public String VbuyUpdate(HttpServletRequest request,@RequestParam(value="did",required=false) String did) throws Exception {
		boolean	xx = false;
		String[] uid=did.split(",");
		
	
		for (int i = 0; i < uid.length; i++) {
			xx = doctorService.doctorDel(Integer.parseInt(uid[i]));
		}
		
		if (xx) {
			return "true";
		}else {
			return "false";
		}
		
	}
	//修改
	@RequestMapping("/doctorUp")	
	@ResponseBody
	public String doctorUp(HttpServletRequest request,@RequestParam(value="did",required=false) String did){
		Doctorlist dd = doctorService.doctorUp(Integer.parseInt(did));
		System.out.println(dd.getName());
		JSONObject obj=new JSONObject();
		obj.put("did", dd.getDid());
		obj.put("name", dd.getName());
		obj.put("tel", dd.getTel());
		obj.put("photo", dd.getPhoto());
		obj.put("sex", dd.getSex());
		obj.put("age", dd.getAge());
		obj.put("idcard", dd.getIdcard());
		obj.put("liuprice", dd.getLiuprice());
		obj.put("zigecard", dd.getZigecard());
		obj.put("zhixingcard", dd.getZhixingcard());
		obj.put("zhixingpicture", dd.getZhixingpicture());
		obj.put("zigepicture", dd.getZigepicture());
		obj.put("idcardpicture", dd.getIdcardpicture());
		obj.put("gongzuopicture", dd.getGongzuopicture());
		obj.put("shid", dd.getShid());
		System.out.println(obj.toString());
		return obj.toString();
	}
	
	@RequestMapping(value="/doctorUpdate",method=RequestMethod.POST)	
	@ResponseBody
	public String doctorUpdate(HttpServletRequest request,
			@RequestParam(value="photo",required=false)MultipartFile photo,
			@RequestParam(value="zhixingpicture",required=false)MultipartFile zhixingpicture,
			@RequestParam(value="zigepicture",required=false)MultipartFile zigepicture,
			@RequestParam(value="idcardpicture",required=false)MultipartFile idcardpicture,
			@RequestParam(value="gongzuopicture",required=false)MultipartFile gongzuopicture) throws Exception {
		boolean	xx = false;
		
		//从jsp中获取所有非文件的属性
				String	did = request.getParameter("did");
				String name = request.getParameter("name");
				String sex = request.getParameter("sex");
				String age = request.getParameter("age");
				String idcard = request.getParameter("idcard");
				String liuprice = request.getParameter("liuprice");
				String zigecard = request.getParameter("zigecard");
				String zhixingcard = request.getParameter("zhixingcard");
				String shid = request.getParameter("shid");
				String tel = request.getParameter("tel");
				
				String photo1 = request.getParameter("photo1");
				String zhixingpicture1 = request.getParameter("zhixingpicture1");
				String zigepicture1 = request.getParameter("zigepicture1");
				String idcardpicture1 = request.getParameter("idcardpicture1");
				String gongzuopicture1 = request.getParameter("gongzuopicture1");
				Doctorlist dd = new Doctorlist();
				dd.setDid(Integer.parseInt(did));
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
				if (photo.getSize() < 100) {
					dd.setPhoto(photo1);
				}else {
					dd.setPhoto(name(photo,path,request));
				}
				
				if (zhixingpicture.getSize() < 100) {
					dd.setZhixingpicture(zhixingpicture1);
				}else {
					dd.setZhixingpicture(name(zhixingpicture,path,request));
				}
				
				if (zigepicture.getSize() <100) {
					dd.setZigepicture(zigepicture1);
				}else {
					dd.setZigepicture(name(zigepicture,path,request));
				}
				
				if (idcardpicture.getSize() <100) {
					dd.setIdcardpicture(idcardpicture1);
				}else {
					dd.setIdcardpicture(name(idcardpicture,path,request));
				}
				
				if (gongzuopicture.getSize() <100) {
					dd.setGongzuopicture(gongzuopicture1);
				}else {
					dd.setGongzuopicture(name(gongzuopicture,path,request));
				}
				
		xx = doctorService.doctorUpdate(dd);
		
		if (xx) {
			return "true";
		}else {
			return "false";
		}
		
	}
	
	@RequestMapping(value="/saveExcel")	
	@ResponseBody
	public String saveExcel(){
		
		List<Doctorlist> dlist = doctorService.getDoctor();
		
		boolean falg = Excel.sure(dlist);
		if (falg) {
			return "true";
		}else {
			return "false";
		}
		
		
	}
	
	@RequestMapping("/toDoctorXinXi")
	public String toDoctorXinXi(){
		return "DoctorXinXi";
	}
	
	@RequestMapping(value="/getXinBiaoDoctor")	
	@ResponseBody
	public String getXinBiaoDoctor(){
		
		List<Doctorlist> dlist = doctorService.getXinBiaoDoctor();
		
		boolean falg = Excel.sure1(dlist);
		if (falg) {
			return "true";
		}else {
			return "false";
		}
		
		
	}
	
	@RequestMapping("/getXinDoctor")
	@ResponseBody
	public String getXinDoctor(@RequestParam(value="page",required=false) String page,@RequestParam(value="rows",required=false) String rows){
		
		System.out.println(page+"---"+rows);
		List<Doctorlist> vv = doctorService.getXinDoctor(Integer.parseInt(page),Integer.parseInt(rows));
		System.out.println("这是ACTION层+遍历");
		
		JSONArray array = new JSONArray();
		for (Doctorlist v : vv) {
			JSONObject obj=new JSONObject();
			obj.put("did", v.getDid());
			obj.put("name", v.getName());
			obj.put("photo", v.getPhoto());
			obj.put("dname", v.getDept().getDname());
			obj.put("special", v.getSpecialty().getSpecial());
			obj.put("state", v.getZhuangtai().getState());
			obj.put("position", v.getDoctorIdentity().getPosition());
			obj.put("tjtime", PubDate.datToString(v.getTjtime()));
			obj.put("searchlable", v.getSearchlable());
			array.add(obj);
		}
		int total=doctorService.findCount();
		String ul= "{\"total\":"+total+",\"rows\":"+array.toString()+"}";
		return ul;
	}
	
	//添加
	@RequestMapping(value="doctorXinImport",method=RequestMethod.POST)
	@ResponseBody
	public String doctorXinImport(@RequestParam(value="photo",required=false)MultipartFile photo,
			HttpServletRequest request) throws Exception{
		//从jsp中获取所有非文件的属性
		String name = request.getParameter("name");
		String deptid = request.getParameter("deptid");
		String sid = request.getParameter("sid");
		String zid = request.getParameter("zid");
		String zfprice = request.getParameter("zfprice");
		String jianjie = request.getParameter("jianjie");
		String telprice = request.getParameter("telprice");
		String iid = request.getParameter("iid");
		String searchlable = request.getParameter("searchlable");
		String yizhen = request.getParameter("yizhen");
		String liuprice = request.getParameter("liuprice");
		Doctorlist dd = new Doctorlist();
		dd.setName(name);
		dd.setDeptid(Integer.parseInt(deptid));
		dd.setSid(Integer.parseInt(sid));
		dd.setZid(Integer.parseInt(zid));
		dd.setZfprice(zfprice);
		dd.setJianjie(jianjie);
		dd.setTelprice(Integer.parseInt(telprice));
		dd.setIid(Integer.parseInt(iid));
		dd.setSearchlable(searchlable);
		dd.setYizhen(Integer.parseInt(yizhen));
		dd.setLiuprice(Integer.parseInt(liuprice));
		String path = request.getServletContext().getRealPath("WEB-INF"+File.separator+"static"+File.separator+"upload");
		System.out.println(path);
		dd.setPhoto(name(photo,path,request));
		
		
		boolean falg = doctorService.doctorXinAdd(dd);
		if (falg) {
			return "true";
		}else {
			return "false";
		}
		
		
		
		
		
	}
	
	
	
	
	
	
	
	
}
