package com.web.controller;
import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.pojo.Department;
import com.service.DepartmentService;
@Controller
public class DepartmentAction {
	@Resource
	private DepartmentService departmentService;

	public DepartmentService getDepartmentService() {
		return departmentService;
	}
 
	public void setDepartmentService(DepartmentService departmentService) {
		this.departmentService = departmentService;
	}
	//分页
	@RequestMapping("/toDepartmentList")
	@ResponseBody
	public Object todeptList(@RequestParam(value="page",required=false)String page,@RequestParam(value="rows",required=false)String rows)throws Exception{
		System.out.println("进入action");
		List<Department> de=departmentService.getDepartmentList(Integer.parseInt(page), Integer.parseInt(rows));
		System.out.println("进入方法");
		JSONArray array=new JSONArray();
		for (Department dd : de) {
			JSONObject obj=new JSONObject();
			obj.put("id", dd.getId());//科室id
			obj.put("dname", dd.getDname());//科室名称
			array.add(obj);
		}
		System.out.println(array.toString());
		int total=departmentService.countDepartment();
		String ul="{\"total\":"+total+",\"rows\":"+array.toString()+"}";
		return ul;
	}
}
