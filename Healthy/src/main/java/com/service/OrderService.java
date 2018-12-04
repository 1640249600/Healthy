package com.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.pojo.Orders;

 
public interface OrderService {
	//查询
		public List<Orders> getOrders(@Param(value="page")int page,@Param(value="rows")int rows);
		//统计所有信息
		public int countOrders();
		//添加
		public boolean OrderAdd(Orders oo);
		//删除
		public boolean OrderDelete(@Param(value="id")int id);
		//修改(先查询)
		public Orders OrdersSelect(@Param(value="id")int id);
		public boolean OrdersUpdate(Orders oo);
		
		//拼接查询
		public List<Orders> rearchOrder(@Param(value="page")int page,@Param(value="rows")int rows);

}
