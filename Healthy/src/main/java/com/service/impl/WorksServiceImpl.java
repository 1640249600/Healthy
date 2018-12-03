package com.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dao.WorksMapper;
import com.pojo.Words;
import com.service.WorksService;
@Service("worksService")
@Transactional
public class WorksServiceImpl implements WorksService {
@Resource
private WorksMapper worksMapper;
	public WorksMapper getWorksMapper() {
	return worksMapper;
}

public void setWorksMapper(WorksMapper worksMapper) {
	this.worksMapper = worksMapper;
}

	@Override
	public List<Words> getWorks(int page, int rows) {
		// TODO Auto-generated method stub
		return worksMapper.getWorks(page, rows);
	}

	@Override
	public int countWorks() {
		// TODO Auto-generated method stub
		return worksMapper.countWorks();
	}
public static void main(String[] args) {
	ApplicationContext act=new ClassPathXmlApplicationContext("applicationContext.xml");
	WorksService ww=(WorksService) act.getBean("worksService");
	List<Words> w=ww.getWorks(1, 2);
	for (Words words : w) {
		System.out.println(words.getId());
		System.out.println(words.getContent());
		System.out.println(words.getTime());
	}
}

@Override
public boolean wordsAdd(Words ww) {
	// TODO Auto-generated method stub
	return worksMapper.wordsAdd(ww);
}
}
