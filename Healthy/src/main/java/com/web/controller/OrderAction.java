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
import com.pojo.Orders;
import com.service.OrderService;

@Controller
public class OrderAction {
@Resource
	private OrderService orderService;

public OrderService getOrderService() {
	return orderService;
}
 
public void setOrderService(OrderService orderService) {
	this.orderService = orderService;
}	
			//分页
			@RequestMapping("/toOrderList")
			@ResponseBody
			public Object toOrderList(@RequestParam(value="page",required=false)String page,@RequestParam(value="rows")String rows){
				System.out.println("------");
				List<Orders> list=orderService.getOrders(Integer.parseInt(page), Integer.parseInt(rows));
				System.out.println("这是action");
				JSONArray array=new JSONArray();
				for (Orders orders : list) {
					JSONObject obj=new JSONObject();
					obj.put("oid", orders.getId());//订单号
					System.out.println(orders.getId());
					obj.put("doctorid", orders.getDoctorId());//医生账号
					obj.put("dname", orders.getDoctor().getName());//医生昵称
					obj.put("userid", orders.getUserId());//用户账号
					obj.put("uname", orders.getUser().getName());//用户昵称
					obj.put("money", orders.getUser().getVbuy().getThirtysixPrice());//费用
					obj.put("zid",orders.getUser().getZhuangtai().getZid());//状态
					if (orders.getOstate()==1){
						obj.put("ostate","已结算");
					}else {
						obj.put("ostate","未结算");
					}
					obj.put("grade",orders.getUser().getVbuy().getGrade());//用户身份
					array.add(obj);
				}
				System.out.println(array.toString());
				int total=orderService.countOrders();
				String ul="{\"total\":"+total+",\"rows\":"+array.toString()+"}";
				return ul;
			}
			//添加
			@RequestMapping("/orderAdd")
			@ResponseBody
			public String oAdd(HttpServletRequest request,@ModelAttribute(value="or") Orders or){
				System.out.println("------添加");
				boolean flag=orderService.OrderAdd(or);
				if(flag){
					return "true";
				}else {
					return "false";
				}
			}
			//删除
			@RequestMapping("/orderDelete")
			@ResponseBody
			public String oDelete(HttpServletRequest request,@RequestParam(value="id",required=false)String id)throws Exception{
				System.out.println(id);
				//分隔
				String[] oid=id.split(",");
				System.out.println(oid);
				boolean uu=false;
				for (int i = 0; i < oid.length; i++) {
					uu=orderService.OrderDelete(Integer.parseInt(oid[1]));
				}
				if (uu) {
					return "true";
				}else {
					return "false";
				}
			}
			//修改
			@RequestMapping("/orderSelect")
			@ResponseBody
			public String Oselect(HttpServletRequest request,@RequestParam(value="id",required=false)String id)throws Exception{
				System.out.println(id);
				Orders orders=orderService.OrdersSelect(Integer.parseInt(id));
				JSONObject obj=new JSONObject();
				return null;
			}
			//修改
			@RequestMapping("/orderUpdate")
			@ResponseBody
			public String oUpdate(HttpServletRequest request,@ModelAttribute(value="oo")Orders oo)throws Exception{
				boolean o=false;
				o=orderService.OrdersUpdate(oo);
				if (o) {
					return "true";
				}else {
					return "false";
				}
			}
			//拼接查询
			@RequestMapping("/rearchOrders")
			@ResponseBody
			public Object rearch(@RequestParam(value="page",required=false)String page,@RequestParam(value="rows",required=false)String rows)throws Exception{
				System.out.println("-----");
				//获取总记录数
				List<Orders> list=orderService.rearchOrder(Integer.parseInt(page), Integer.parseInt(rows));
				System.out.println("这是action");
				JSONArray array=new JSONArray();
				for (Orders orders : list) {
					JSONObject obj2=new JSONObject();
					obj2.put("id", orders.getId());
					obj2.put("doctorId", orders.getDoctorId());
					array.add(obj2);
				}
				return array;
			}
}