package com.service.impl;
import java.util.List;
import javax.annotation.Resource;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.dao.LocMapper;
import com.pojo.Loc;
import com.service.LocService;
@Service("locService")
@Transactional
public class LocServiceImpl implements LocService {
	@Resource
	private LocMapper locMapper;
	public LocMapper getLocMapper() {
		return locMapper;
	}

	public void setLocMapper(LocMapper locMapper) {
		this.locMapper = locMapper;
	}

	@Override
	public List<Loc> getLocList(int page, int rows) {
		// TODO Auto-generated method stub
		return locMapper.getLocList(page, rows);
	}

	@Override
	public int countLoc() {
		// TODO Auto-generated method stub
		return locMapper.countLoc();
	}
	public static void main(String[] args) {
		ApplicationContext ac=new ClassPathXmlApplicationContext("applicationContext.xml");
		LocService ll=(LocService) ac.getBean("locService");
		List<Loc> lo=ll.getLocList(1,2);
		for (Loc loc : lo) {
			System.out.println(loc.getSystemUser().getName());
			System.out.println(loc.getId());
		}
	}
}
