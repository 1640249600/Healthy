package com.util;

import java.io.FileOutputStream;
import java.util.List;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;

import com.pojo.Doctorlist;

public class Excel {
		public static void createExcel(List<Doctorlist> dlist) throws Exception {
			//创建一个工作薄对象
			HSSFWorkbook workbook = new HSSFWorkbook();
			//创建一个工作表
			HSSFSheet sheet = workbook.createSheet();
			//设置工作表的序号，名字，编码
			workbook.setSheetName(0, "日志",HSSFWorkbook.ENCODING_UTF_16);
			//创建一行
			/*ApplicationContext ctx = new ClassPathXmlApplicationContext("applicationContext.xml");
			DoctorService dd = (DoctorService) ctx.getBean("doctorService");
			List<Doctorlist> dlist =  dd.getDoctor();*/
			
			//创建第一行的标题
			HSSFRow firstfRow = sheet.createRow((short)0);
			for (int i = 0; i < 7; i++) {
				HSSFCell firstCell = firstfRow.createCell((short)i);
				//设置第i个单元格的字符类型
				firstCell.setCellType(HSSFCell.CELL_TYPE_STRING);
				//设置第i个单元格的编码
				firstCell.setEncoding(HSSFCell.ENCODING_UTF_16);
				//写入第i个单元格的内容
				if(i==0){
					firstCell.setCellValue("医生账号");
				}else if(i==1){
					firstCell.setCellValue("医生名称");
				}else if(i==2){
					firstCell.setCellValue("性别");
				}else if(i==3){
					firstCell.setCellValue("联系方式");
				}else if(i==4){
					firstCell.setCellValue("留言咨询费用");
				}else if(i==5){
					firstCell.setCellValue("提交时间");
				}else if(i==6){
					firstCell.setCellValue("是否审核");
				}
				//通过输出流导出
				
			}
			int hang=1;
			for (Doctorlist ds : dlist) {
				//创建第hang行
				HSSFRow firstrRow=sheet.createRow((short)hang);
				
						for (int i = 0; i < 7; i++) {
							//创建第hang+1行的第一个单元格
							HSSFCell firstCell=firstrRow.createCell((short)i);
							//设置第i+1个单元格的字符类型
							firstCell.setCellType(HSSFCell.CELL_TYPE_STRING);
							//设置第i+1个单元格 的编码
							firstCell.setEncoding(HSSFCell.ENCODING_UTF_16);
							//写入第i+1个单元格的内容
							if(i==0){
								firstCell.setCellValue(ds.getDid());
							}else if(i==1){
								firstCell.setCellValue(ds.getName());
							}else if(i==2){
								firstCell.setCellValue(ds.getSex());
							}else if(i==3){
								firstCell.setCellValue(ds.getTel());
							}else if(i==4){
								firstCell.setCellValue(ds.getLiuprice());
							}else if(i==5){
								firstCell.setCellValue(PubDate.datToString(ds.getTijiaotime()));
							}else if(i==6){
								if (ds.getShid() == 0) {
									firstCell.setCellValue("未审核");
								}else {
									firstCell.setCellValue("已审核");
								}
								
							}
					//通过输出流导出
					
				
					
							}
						hang++;
		
			}
			FileOutputStream outputStream=new FileOutputStream("G:\\apache-tomcat-8.0.36-windows-x64\\apache-tomcat-8.0.36\\webapps\\Healthy\\WEB-INF\\static\\upload\\DoctorShenhe.xls");
			workbook.write(outputStream);
			
			//关闭
			outputStream.flush();
			outputStream.close();
		}
		public static void createExcel1(List<Doctorlist> dlist) throws Exception {
			//创建一个工作薄对象
			HSSFWorkbook workbook = new HSSFWorkbook();
			//创建一个工作表
			HSSFSheet sheet = workbook.createSheet();
			//设置工作表的序号，名字，编码
			workbook.setSheetName(0, "日志",HSSFWorkbook.ENCODING_UTF_16);
			//创建一行
			/*ApplicationContext ctx = new ClassPathXmlApplicationContext("applicationContext.xml");
			DoctorService dd = (DoctorService) ctx.getBean("doctorService");
			List<Doctorlist> dlist =  dd.getDoctor();*/
			
			//创建第一行的标题
			HSSFRow firstfRow = sheet.createRow((short)0);
			for (int i = 0; i < 8; i++) {
				HSSFCell firstCell = firstfRow.createCell((short)i);
				//设置第i个单元格的字符类型
				firstCell.setCellType(HSSFCell.CELL_TYPE_STRING);
				//设置第i个单元格的编码
				firstCell.setEncoding(HSSFCell.ENCODING_UTF_16);
				//写入第i个单元格的内容
				if(i==0){
					firstCell.setCellValue("医生账号");
				}else if(i==1){
					firstCell.setCellValue("医生名称");
				}else if(i==2){
					firstCell.setCellValue("科室");
				}else if(i==3){
					firstCell.setCellValue("专长");
				}else if(i==4){
					firstCell.setCellValue("状态");
				}else if(i==5){
					firstCell.setCellValue("医生身份");
				}else if(i==6){
					firstCell.setCellValue("搜索标签");
				}else{
					firstCell.setCellValue("添加时间");
				}
				//通过输出流导出
				
			}
			int hang=1;
			for (Doctorlist ds : dlist) {
				//创建第hang行
				HSSFRow firstrRow=sheet.createRow((short)hang);
				
						for (int i = 0; i < 8; i++) {
							//创建第hang+1行的第一个单元格
							HSSFCell firstCell=firstrRow.createCell((short)i);
							//设置第i+1个单元格的字符类型
							firstCell.setCellType(HSSFCell.CELL_TYPE_STRING);
							//设置第i+1个单元格 的编码
							firstCell.setEncoding(HSSFCell.ENCODING_UTF_16);
							//写入第i+1个单元格的内容
							if(i==0){
								firstCell.setCellValue(ds.getDid());
							}else if(i==1){
								firstCell.setCellValue(ds.getName());
							}else if(i==2){
								firstCell.setCellValue(ds.getDept().getDname());
							}else if(i==3){
								firstCell.setCellValue(ds.getSpecialty().getSpecial());
							}else if(i==4){
								firstCell.setCellValue(ds.getZhuangtai().getState());
							}else if(i==5){
								firstCell.setCellValue(ds.getDoctorIdentity().getPosition());
							}else if(i==6){
								
								firstCell.setCellValue(ds.getSearchlable());
							}else {
								firstCell.setCellValue(PubDate.datToString(ds.getTjtime()));
								
							}
					//通过输出流导出
					
				
					
							}
						hang++;
		
			}
			FileOutputStream outputStream=new FileOutputStream("G:\\apache-tomcat-8.0.36-windows-x64\\apache-tomcat-8.0.36\\webapps\\Healthy\\WEB-INF\\static\\upload\\DoctorXinXi.xls");
			workbook.write(outputStream);
			
			//关闭
			outputStream.flush();
			outputStream.close();
		}
		public static boolean sure(List<Doctorlist> dlist){
			
			try {
				Excel.createExcel(dlist);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				
			}
			
			return true;
		} 
		
			public static boolean sure1(List<Doctorlist> dlist){
			
			try {
				Excel.createExcel1(dlist);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				
			}
			
			return true;
		} 
}
