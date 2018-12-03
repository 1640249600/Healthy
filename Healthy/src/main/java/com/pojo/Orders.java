package com.pojo;

public class Orders {
	private Integer id;//订单id
	private Integer userId;//用户id
	private Integer ostate;//订单状态
	private Integer doctorId;
	private Users user;
	private Doctorlist doctor;
	
	public Integer getId() {
		return id;
	} 
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	public Integer getOstate() {
		return ostate;
	}
	public void setOstate(Integer ostate) {
		this.ostate = ostate;
	}
	public Integer getDoctorId() {
		return doctorId;
	}
	public void setDoctorId(Integer doctorId) {
		this.doctorId = doctorId;
	}
	public Users getUser() {
		return user;
	}
	public void setUser(Users user) {
		this.user = user;
	}
	public Doctorlist getDoctor() {
		return doctor;
	}
	public void setDoctor(Doctorlist doctor) {
		this.doctor = doctor;
	}
}
