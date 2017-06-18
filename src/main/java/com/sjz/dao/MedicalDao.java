package com.sjz.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.sjz.entity.Medical;

public interface MedicalDao {
	List<Medical> selectMedicalByName(@Param("mname")String mname);
	
	void save(Medical medical);
	
	Medical selectMedicalById(@Param("medical_id")Integer medical_id);
	
	void deleteMedicalById(@Param("medical_id")Integer medical_id);
	
	void updateMedical(Medical medical);
}
