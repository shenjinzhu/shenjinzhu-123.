package com.sjz.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.sjz.dao.DoctorDao;
import com.sjz.dao.PersonDao;
import com.sjz.entity.Doctor;
import com.sjz.entity.Person;
import com.sjz.util.BeanUtil;
import com.sjz.util.PagedResult;
@Service
public class DoctorServiceImpl implements DoctorService{
	@Autowired
	private DoctorDao doctorDao;
	@Autowired
	private PersonDao pd;
	
	@Override
	public PagedResult<Doctor> queryByPage(String name,String now,Integer pageNo, Integer pageSize) {
		pageNo = pageNo == null?1:pageNo;  
	    pageSize = pageSize == null?10:pageSize;  
	    PageHelper.startPage(pageNo,pageSize);  //startPage是告诉拦截器说我要开始分页了。分页参数是这两个。  
	    return BeanUtil.toPagedResult(doctorDao.selectDoctorByName(name,now));
	}

	@Override
	public boolean addDoctor(Doctor doctor) {
		try{
			doctorDao.addDoctor(doctor);
			return true;
		}catch(Exception e){
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public boolean deleteDoctor(Integer doctor_id) {
		try{
			doctorDao.deleteDoctor(doctor_id);
			return true;
		}catch(Exception e){
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public Doctor getDoctor(Integer doctor_id) {
		return doctorDao.selectDoctorById(doctor_id);
	}

	@Override
	public boolean updateDoctor(Doctor doctor) {
		try{
			doctorDao.updateDoctor(doctor);
			return true;
		}catch(Exception e){
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public int one(Doctor doctor) {
		Doctor d=null;
		try{
			d=doctorDao.selectDocByPersonId(doctor.getId());
		}catch(Exception e){
			e.printStackTrace();
		}
		if(d!=null){
			//表示已经存在
			return 1;
		}
		doctor.setNow("1");
		doctorDao.addDoctor(doctor);
		//表示新增一条数据
		return 0;
	}

	@Override
	public int two(Doctor doctor) {
		Doctor d=doctorDao.selectDoctorById(doctor.getDoctor_id());
		if(d.getNow().equals("2")){
			//审核失败，已经通过
			return 1;
		}
		doctor.setNow("2");
		doctorDao.updateDoctor(doctor);
		Person p=new Person();
		p.setPersonId(doctor.getId());
		p.setIden(3);
		pd.updatePerson(p);
		//审核通过
		return 0;
	}

	@Override
	public int fail(Integer doctor_id) {
		try{
			doctorDao.deleteDoctor(doctor_id);
			//审核失败，删除成功
			return 0;
		}catch(Exception e){
			e.printStackTrace();
		}
		//删除失败
		return 1;
	}

	@Override
	public List<Doctor> findOnLineDoctor() {
		List<Doctor> list=doctorDao.selectDoctorOn();
		return list;
	}

}
