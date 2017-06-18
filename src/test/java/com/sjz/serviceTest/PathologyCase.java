package com.sjz.serviceTest;

import java.util.List;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.sjz.baseTest.SpringTestCase;
import com.sjz.dao.PathologyDao;
import com.sjz.entity.Pathology;
import com.sjz.service.PathologyService;

public class PathologyCase extends SpringTestCase{
	@Autowired
	private PathologyDao pathologyDao;
	@Autowired
	private PathologyService pathologyService;
	
	@Test
	public void s(){
		List<Pathology> s=pathologyDao.selectPathologyBySys(null);
		for(Pathology l:s){
			System.out.println(l);
		}
		pathologyService.queryByPage(null, 1, 10);
	}
	@Test
	public void add(){
		Pathology p=new Pathology();
		p.setSysmptom("傻傻的");
		p.setMatters_Needing_Attention("这心辞职信");
		p.setMedical_use("asdas d");
		p.setPintroduce("asd ");
		pathologyDao.insertPathology(p);
	}
	@Test
	public void update(){
		Pathology p=new Pathology();
		p.setPathology_id(1);
		p.setPintroduce("xiugai");
		p.setSysmptom("asdasd");
		pathologyDao.updatePathology(p);
	}
	@Test
	public void se(){
		Pathology p=pathologyDao.selectPathologyById(1);
		System.out.println(p);
	}
}
