package test;

import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.pojo.VBuy;
import com.pojo.doctorlist;
import com.service.DoctorService;
import com.service.VBuyService;

public class Test {
	ApplicationContext ctx = new ClassPathXmlApplicationContext("applicationContext.xml");
	
	public void getAllDoctor(){
		DoctorService dd = (DoctorService) ctx.getBean("doctorService");
		List<doctorlist>  xx = dd.getAllDoctor();
				for (doctorlist ds : xx) {
					System.out.println(ds.getDname());
				}

		
	}
	public void getAllVBuy(){
		VBuyService vv = (VBuyService) ctx.getBean("vbuyService");
		List<VBuy>  xx = vv.getAllVbuy();
				for (VBuy ds : xx) {
					System.out.println(ds.getZhuangtai().getState());
				}
		
		

	}	
		
	public static void main(String[] args) {
		Test tt = new Test();
		tt.getAllVBuy();
	}
}
