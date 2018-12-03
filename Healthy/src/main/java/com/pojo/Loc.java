package com.pojo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.alibaba.fastjson.annotation.JSONField;

public class Loc {
	private SystemUser systemUser;
	public SystemUser getSystemUser() {
		return systemUser;
	}
	public void setSystemUser(SystemUser systemUser) {
		this.systemUser = systemUser;
	}
	private int id;
	private int sid;
	private String type;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getSid() {
		return sid;
	}
	public void setSid(int sid) {
		this.sid = sid;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getSynopisis() {
		return synopisis;
	}
	public void setSynopisis(String synopisis) {
		this.synopisis = synopisis;
	}
	public Date getTime() {
		return time;
	}
	public void setTime(Date time) {
		this.time = time;
	}
	private String synopisis;
	@DateTimeFormat(pattern="yyyy-MM-dd")//强制要求日期格式
	@JSONField(format="yyyy-MM-dd")//相当于 SimpleDateformat
	private Date time;
}
