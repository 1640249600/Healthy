package com.pojo;

import java.io.Serializable;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.alibaba.fastjson.annotation.JSONField;

public class Users implements Serializable{

	private Zhuangtai zhuangtai;
	private VBuy vbuy;
	
	private Integer id;
	private String name;
	private String telephone;
	private Integer vid;
	private Integer zid;
	public Integer getVid() {
		return vid;
	}
	public void setVid(Integer vid) {
		this.vid = vid;
	}
	public Integer getZid() {
		return zid;
	}
	public void setZid(Integer zid) {
		this.zid = zid;
	}
	@DateTimeFormat(pattern="yyyy-MM-dd")//强制要求日期格式
	@JSONField(format="yyyy-MM-dd")//相当于 SimpleDateformat
	private Date birthday;
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
	public Date getBirthday() {
		return birthday;
	}
	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}
	public String getTelephone() {
		return telephone;
	}
	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}

	
	

	
}
