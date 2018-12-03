package com.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.dao.OrderMapper;
import com.pojo.Orders;
import com.service.OrderService;
@Service("orderService")
@Transactional
public class OrderServiceImpl implements OrderService {
	@Resource
	private OrderMapper orderMapper;
	public OrderMapper getOrderMapper() {
		return orderMapper;
	}

	public void setOrderMapper(OrderMapper orderMapper) {
		this.orderMapper = orderMapper;
	}

	@Override
	public List<Orders> getOrders(int page, int rows) {
		// TODO Auto-generated method stub
		return orderMapper.getOrders(page, rows);
	}

	@Override
	public int countOrders() {
		// TODO Auto-generated method stub
		return orderMapper.countOrders();
	}
	public static void main(String[] args) {
		ApplicationContext ctx=new ClassPathXmlApplicationContext("applicationContext.xml");
		OrderService oo=(OrderService) ctx.getBean("orderService");
		List<Orders> uu=oo.rearchOrder(1, 2);
		
		/*List<Orders> uu=oo.getOrders(1, 2);
		for (Orders orders : uu) {
			System.out.println(orders.getId());
			System.out.println(orders.toString());
			System.out.println(orders.getUser().getVbuy().getGrade());
			System.out.println(orders.getDoctorId());
			System.out.println(orders.getUser().getVbuy().getThirtysixPrice());
			System.out.println(orders.getUser().getZhuangtai().getZid());
		}*/
		
			
	}
//添加
	@Override
	public boolean OrderAdd(Orders oo) {
		// TODO Auto-generated method stub
		return orderMapper.OrderAdd(oo);
	}
//删除
	@Override
	public boolean OrderDelete(int id) {
		// TODO Auto-generated method stub
		return orderMapper.OrderDelete(id);
	}
//修改(先查询)
	@Override
	public Orders OrdersSelect(int id) {
		// TODO Auto-generated method stub
		return orderMapper.OrdersSelect(id);
	}

	@Override
	public boolean OrdersUpdate(Orders oo) {
		// TODO Auto-generated method stub
		return orderMapper.OrdersUpdate(oo);
	}

	@Override
	public List<Orders> rearchOrder(int page, int rows) {
		// TODO Auto-generated method stub
		return orderMapper.rearchOrder(page, rows);
	}
}
