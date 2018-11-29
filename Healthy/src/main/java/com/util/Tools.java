package com.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;


public class Tools {
	//字符串转成日期
	public static Date StringToDate(String dd){
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		Date date=null;
		try {
			date=sdf.parse(dd);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return date;
	}
	//日期转成字符串
	public static String dateToString(Date  date){
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		String da=null;
		
		
			da = sdf.format(date);
		
		return da ;
	}
	
	public static void main(String[] args) {
			System.out.println(Tools.dateToString(Tools.StringToDate("1998-06-12")));
	}
}
