package com.sjz.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.sjz.entity.Doctor;

public interface DoctorDao {
	List<Doctor> selectDoctorByName(@Param("name") String name,@Param("now")String now);
	
	void addDoctor(Doctor doctor);
	
	void deleteDoctor(@Param("doctor_id")Integer doctor_id);
	
	void updateDoctor(Doctor doctor);
	
	Doctor selectDoctorById(@Param("doctor_id")Integer doctor_id);
	
	Doctor selectDocByPersonId(@Param("id")Integer id);
	//查找当前在线的医生
	List<Doctor> selectDoctorOn();
}
