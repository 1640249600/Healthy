package com.pojo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.alibaba.fastjson.annotation.JSONField;

public class Doctorlist {
	 private Integer did;
	   private String name;                 //VARCHAR2(20),
	   private String photo;                //VARCHAR2(800),
	   private Integer deptid;               //NUMBER(8),--科室
	   private Integer sid;                  //NUMBER(8),--专长
	   private Integer zid;                  //NUMBER(8),--状态
	   private Integer iid;             	//number(2),--医生身份   0是网络医生1是平台医生
	   private String searchlable;          //varchar2(11),--搜索标签
	   @DateTimeFormat(pattern="yyyy-MM-dd")//强制要求日期格式
	   @JSONField(format="yyyy-MM-dd")//相当于 SimpleDateformat
	   private Date tjtime;               //date,--添加时间
	   private Integer yizhen;               //number(2),--是否加入义诊 0为否 1为是
	   private Integer sex;                  //number(2),--性别 0为女 1为男
	   private Integer age;                 //number(3),--年龄
	   private String tel;                  //number(15),--联系方式
	   private Integer liuprice;             //number(4),--留言费用

	   private Integer telprice;             //number(4),--电话费用
	   private String zfprice;              //varchar2(11),--支付宝账户
	   private String jianjie;              //varchar2(300),--简介
	   @DateTimeFormat(pattern="yyyy-MM-dd")//强制要求日期格式
	   @JSONField(format="yyyy-MM-dd")//相当于 SimpleDateformat
	   private Date tijiaotime;           //date,--提交时间
	   private Integer shid;               //number(2),--是否审核 0为否 1为是
	   private String idcard;               //number(15),--身份证
	   private String zigecard;             //number(15),--资格证编号
	   private String zhixingcard;          //number(15),--执行证编号
	   private String zigepicture;          //varchar2(300),--资格证图片
	   private String zhixingpicture;       //varchar2(300),--执行证图片
	   private String idcardpicture;        //varchar2(300),--身份证图片
	   private String gongzuopicture;       //varchar2(300)--工作证图片 
	
	private Zhuangtai zhuangtai;
	private Department dept;
	private DoctorIdentity doctorIdentity;
	private Specialty specialty;
	private DoctotShenhe shenhe;
	public DoctotShenhe getShenhe() {
		return shenhe;
	}
	public void setShenhe(DoctotShenhe shenhe) {
		this.shenhe = shenhe;
	}
	public Integer getDid() {
		return did;
	}
	public void setDid(Integer did) {
		this.did = did;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	public Integer getDeptid() {
		return deptid;
	}
	public void setDeptid(Integer deptid) {
		this.deptid = deptid;
	}
	public Integer getSid() {
		return sid;
	}
	public void setSid(Integer sid) {
		this.sid = sid;
	}
	public Integer getZid() {
		return zid;
	}
	public void setZid(Integer zid) {
		this.zid = zid;
	}
	public Integer getIid() {
		return iid;
	}
	public void setIid(Integer iid) {
		this.iid = iid;
	}
	public String getSearchlable() {
		return searchlable;
	}
	public void setSearchlable(String searchlable) {
		this.searchlable = searchlable;
	}
	public Date getTjtime() {
		return tjtime;
	}
	public void setTjtime(Date tjtime) {
		this.tjtime = tjtime;
	}
	public Integer getYizhen() {
		return yizhen;
	}
	public void setYizhen(Integer yizhen) {
		this.yizhen = yizhen;
	}
	public Integer getSex() {
		return sex;
	}
	public void setSex(Integer sex) {
		this.sex = sex;
	}
	public Integer getAge() {
		return age;
	}
	public void setAge(Integer age) {
		this.age = age;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public Integer getLiuprice() {
		return liuprice;
	}
	public void setLiuprice(Integer liuprice) {
		this.liuprice = liuprice;
	}
	public Integer getTelprice() {
		return telprice;
	}
	public void setTelprice(Integer telprice) {
		this.telprice = telprice;
	}
	public String getZfprice() {
		return zfprice;
	}
	public void setZfprice(String zfprice) {
		this.zfprice = zfprice;
	}
	public String getJianjie() {
		return jianjie;
	}
	public void setJianjie(String jianjie) {
		this.jianjie = jianjie;
	}
	public Date getTijiaotime() {
		return tijiaotime;
	}
	public void setTijiaotime(Date tijiaotime) {
		this.tijiaotime = tijiaotime;
	}
	public Integer getShid() {
		return shid;
	}
	public void setShid(Integer shid) {
		this.shid = shid;
	}
	public String getIdcard() {
		return idcard;
	}
	public void setIdcard(String idcard) {
		this.idcard = idcard;
	}
	public String getZigecard() {
		return zigecard;
	}
	public void setZigecard(String zigecard) {
		this.zigecard = zigecard;
	}
	public String getZhixingcard() {
		return zhixingcard;
	}
	public void setZhixingcard(String zhixingcard) {
		this.zhixingcard = zhixingcard;
	}
	public String getZigepicture() {
		return zigepicture;
	}
	public void setZigepicture(String zigepicture) {
		this.zigepicture = zigepicture;
	}
	public String getZhixingpicture() {
		return zhixingpicture;
	}
	public void setZhixingpicture(String zhixingpicture) {
		this.zhixingpicture = zhixingpicture;
	}
	public String getIdcardpicture() {
		return idcardpicture;
	}
	public void setIdcardpicture(String idcardpicture) {
		this.idcardpicture = idcardpicture;
	}
	public String getGongzuopicture() {
		return gongzuopicture;
	}
	public void setGongzuopicture(String gongzuopicture) {
		this.gongzuopicture = gongzuopicture;
	}
	public Zhuangtai getZhuangtai() {
		return zhuangtai;
	}
	public void setZhuangtai(Zhuangtai zhuangtai) {
		this.zhuangtai = zhuangtai;
	}
	public Department getDept() {
		return dept;
	}
	public void setDept(Department dept) {
		this.dept = dept;
	}
	public DoctorIdentity getDoctorIdentity() {
		return doctorIdentity;
	}
	public void setDoctorIdentity(DoctorIdentity doctorIdentity) {
		this.doctorIdentity = doctorIdentity;
	}
	public Specialty getSpecialty() {
		return specialty;
	}
	public void setSpecialty(Specialty specialty) {
		this.specialty = specialty;
	}
	
	
	   
}
