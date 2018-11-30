package test;

import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.pojo.VBuy;
import com.service.VBuyService;

public class Test {
	ApplicationContext ctx = new ClassPathXmlApplicationContext("applicationContext.xml");
	
	/*谁谁谁谁谁谁撒、
	*/
	public void getAllVBuy(){
		VBuyService vv = (VBuyService) ctx.getBean("vbuyService");
		List<VBuy>  xx = vv.getAllVbuy(1,2);
				for (VBuy ds : xx) {
					System.out.println(ds.getZhuangtai().getState());
					System.out.println(ds.getGrade());
					System.out.println(ds.getId());
				}

	}	
	//
	/*public void getUser(){
		UsersService uu=(UsersService) ctx.getBean("usersService");
		List<Users> list=uu.getUsers(1,2);
		System.out.println(list.size());
	}*/
	public void VbuySave(){
		VBuyService vv = (VBuyService) ctx.getBean("vbuyService");
		VBuy aa = new VBuy();
		aa.setGrade("aaa");
		aa.setZid(0);
		
		boolean  xx = vv.vBuySave(aa);
				System.out.println(xx);

	}
	public void VbuyDel(){
		VBuyService vv = (VBuyService) ctx.getBean("vbuyService");
		
		
		boolean  xx = vv.vBuyDel(13);
				System.out.println(xx);

	}
		
	public static void main(String[] args) {
		Test tt = new Test();
		tt.getAllVBuy();
		tt.getAllVBuy();
	}
}
