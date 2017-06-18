package com.sjz.serviceTest;

import java.util.List;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.sjz.baseTest.SpringTestCase;
import com.sjz.dao.DoctorDao;
import com.sjz.entity.Doctor;
import com.sjz.service.DoctorService;
import com.sjz.util.PagedResult;

public class DoctorCase extends SpringTestCase{
	@Autowired
	private DoctorDao doctorDao;
	@Autowired
	private DoctorService dss;
	@Test
	public void add(){
		Doctor d=new Doctor();
		d.setHospital("yy");
		d.setId(3);
		d.setMajor("yy");
		d.setName("萨达");
		d.setWorkTime("12-16");
		doctorDao.addDoctor(d);
	}
	@Test
	public void ssse(){
//		Doctor d=doctorDao.selectDoctorById(2);
//		System.out.println(d);
//		d.setHospital("bj");
//		doctorDao.updateDoctor(d);
		//PagedResult<Doctor> d=dss.queryByPage(null,null, 1, 10);
		List<Doctor> d=doctorDao.selectDoctorByName("%三%", null);
		for(Doctor ds:d){
			System.out.println(ds);
		}

	}
	@Test
	public void Page(){
		dss.queryByPage(null, null, 1, 10);
	}
}

