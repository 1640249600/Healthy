package com.pojo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.alibaba.fastjson.annotation.JSONField;

public class Users {
	private Zhuangtai zhuangtai;
	private VBuy vbuy;
	private int id;
	private String name;
	private Integer telephone;
	private Date birthday;
	@DateTimeFormat(pattern="yyyy-MM-dd")//强制要求日期格式
	@JSONField(format="yyyy-MM-dd")//相当于 SimpleDateformat
	public Zhuangtai getZhuangtai() {
		return zhuangtai;
	}
	public void setZhuangtai(Zhuangtai zhuangtai) {
		this.zhuangtai = zhuangtai;
	}
	public VBuy getVbuy() {
		return vbuy;
	}
	public void setVbuy(VBuy vbuy) {
		this.vbuy = vbuy;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Integer getTelephone() {
		return telephone;
	}
	public void setTelephone(Integer telephone) {
		this.telephone = telephone;
	}
	public Date getBirthday() {
		return birthday;
	}
	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}
	
}
