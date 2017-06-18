package com.sjz.service;


import com.sjz.entity.Medical;
import com.sjz.util.PagedResult;

public interface MedicalService {
	PagedResult<Medical> queryByPage(String mname,Integer pageNo,Integer pageSize);
	
	boolean save(Medical medical);
	
	Medical queryById(Integer medical_id);
	
	boolean updateMedical(Medical medical);
	
	boolean deleteMedical(Integer medical_id);
}
