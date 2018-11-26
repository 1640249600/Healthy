package com.pojo;

import java.sql.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.alibaba.fastjson.annotation.JSONField;

public class VBuy {
		private Integer id;
		private Zhuangtai zhuangtai;
		
		private String grade;
		private Integer sixPrice;
		private Integer twelvePrivce;
		private Integer twentyfourPrice;
		private Integer thirtysixPrice;
		private Integer discount;
		private Date time;
		//针对日期属性
		@DateTimeFormat(pattern="yyyy-MM-dd")//强制要求日期格式
		@JSONField(format="yyyy-MM-dd")//相当于 SimpleDateformat
		public Integer getId() {
			return id;
		}
		public void setId(Integer id) {
			this.id = id;
		}
		public Zhuangtai getZhuangtai() {
			return zhuangtai;
		}
		public void setZhuangtai(Zhuangtai zhuangtai) {
			this.zhuangtai = zhuangtai;
		}
		public String getGrade() {
			return grade;
		}
		public void setGrade(String grade) {
			this.grade = grade;
		}
		public Integer getSixPrice() {
			return sixPrice;
		}
		public void setSixPrice(Integer sixPrice) {
			this.sixPrice = sixPrice;
		}
		public Integer getTwelvePrivce() {
			return twelvePrivce;
		}
		public void setTwelvePrivce(Integer twelvePrivce) {
			this.twelvePrivce = twelvePrivce;
		}
		public Integer getTwentyfourPrice() {
			return twentyfourPrice;
		}
		public void setTwentyfourPrice(Integer twentyfourPrice) {
			this.twentyfourPrice = twentyfourPrice;
		}
		public Integer getThirtysixPrice() {
			return thirtysixPrice;
		}
		public void setThirtysixPrice(Integer thirtysixPrice) {
			this.thirtysixPrice = thirtysixPrice;
		}
		public Integer getDiscount() {
			return discount;
		}
		public void setDiscount(Integer discount) {
			this.discount = discount;
		}
		public Date getTime() {
			return time;
		}
		public void setTime(Date time) {
			this.time = time;
		}
		
		
		
}
