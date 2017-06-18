package com.sjz.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.sjz.dao.MedicalDao;
import com.sjz.entity.Medical;
import com.sjz.util.BeanUtil;
import com.sjz.util.PagedResult;
@Service
public class MedicalServiceImpl implements MedicalService {
	@Autowired
	private MedicalDao medicalDao;
	
	@Override
	public PagedResult<Medical> queryByPage(String mfunction, Integer pageNo, Integer pageSize) {
		pageNo = pageNo == null?1:pageNo;  
	    pageSize = pageSize == null?10:pageSize;  
	    PageHelper.startPage(pageNo,pageSize);  //startPage是告诉拦截器说我要开始分页了。分页参数是这两个。  
	    return BeanUtil.toPagedResult(medicalDao.selectMedicalByName(mfunction));
	}

	@Override
	public boolean save(Medical medical) {
		try{
			medicalDao.save(medical);
			return true;
		}catch(Exception e){
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public Medical queryById(Integer medical_id) {
		return medicalDao.selectMedicalById(medical_id);
	}

	@Override
	public boolean updateMedical(Medical medical) {
		try{
			medicalDao.updateMedical(medical);
			return true;
		}catch(Exception e){
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public boolean deleteMedical(Integer medical_id) {
		try{
			medicalDao.deleteMedicalById(medical_id);
			return true;
		}catch(Exception e){
			e.printStackTrace();
		}
		return false;
	}

}
