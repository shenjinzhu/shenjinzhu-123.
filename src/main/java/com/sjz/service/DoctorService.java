package com.sjz.service;

import java.util.List;

import com.sjz.entity.Doctor;
import com.sjz.util.PagedResult;

public interface DoctorService {
	PagedResult<Doctor> queryByPage(String mfunction,String now,Integer pageNo,Integer pageSize);
	
	boolean addDoctor(Doctor doctor);
	
	boolean deleteDoctor(Integer doctor_id);
	
	Doctor getDoctor(Integer doctor_id);
	
	boolean updateDoctor(Doctor doctor);
	
	int one(Doctor doctor);
	
	int two(Doctor doctor);
	
	int fail(Integer doctor_id);
	
	List<Doctor> findOnLineDoctor();
}
