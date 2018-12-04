package com.util;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

public class PubDate {
			private static final DateFormat[] dfs = { 
			new SimpleDateFormat("yyyy 年MM 月dd 日"),
			new SimpleDateFormat("yyyy-MM-dd"),
			new SimpleDateFormat("MM/dd/yyyy"),
			new SimpleDateFormat("yyyy.MM.dd"), 
			new SimpleDateFormat("yyyyMMdd"),
			new SimpleDateFormat("yyyy/MM/dd") };
			
	 public static Date strToDate(String date){
		 
	       
	        Date dd= null;
	        for (int i = 0; i < dfs.length; i++) {// ��������֧�ָ�ʽ,����ת��
				try {
					dd =  dfs[i].parse(date);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
	        
	        return dd;
	    }
	 
	 
	 public static String datToString(Date date){
		 
	        
	        String dd= null;
	        for (int i = 0; i < dfs.length; i++) {// ��������֧�ָ�ʽ,����ת��
				try {
					dd = dfs[i].format(date);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
	        }
	        return dd;
	    }
}
