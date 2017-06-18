package com.sjz.serviceTest;

import java.util.List;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.sjz.baseTest.SpringTestCase;
import com.sjz.dao.MedicalDao;
import com.sjz.entity.Medical;
import com.sjz.service.MedicalService;
import com.sjz.util.PagedResult;

public class MedicalCase extends SpringTestCase{
	@Autowired
	private MedicalDao medicalDao;
	@Autowired
	private MedicalService medicalService;
	//Logger logger = Logger.getLogger(MedicalCase.class);
	
	@Test
	public void t(){
		List<Medical> l=medicalDao.selectMedicalByName("234");
		for(Medical s:l){
			System.out.println(s);
		}
		PagedResult<Medical>  pagedResult = medicalService.queryByPage(null,1,10);//null表示查全部    
	     logger.debug("查找结果" + pagedResult);
	}
	
	@Test
	public void te(){
		Medical m=new Medical();
		m.setEname("eee");
		m.setMname("mmm");
		m.setMcharacteristic("很多哦");
		m.setMfunction("nobb");
		m.setSide_effect("安静");
		m.setSource("asdklas");
		m.setmGrowth_envir("bank");
		medicalDao.save(m);
		List<Medical> l=medicalDao.selectMedicalByName(null);
		for(Medical s:l){
			System.out.println(s);
		}
	}
	//单独查询+修改
	@Test
	public void test(){
		Medical m=medicalDao.selectMedicalById(2);
		//System.out.println(m);
		m.setEname("我是修改的");
		m.setMcharacteristic(null);
		medicalDao.updateMedical(m);
		Medical l=medicalDao.selectMedicalById(2);
		System.out.println(l);
	}
	@Test
	public void test2(){
		System.out.println(medicalDao.selectMedicalById(1));
	}
}
