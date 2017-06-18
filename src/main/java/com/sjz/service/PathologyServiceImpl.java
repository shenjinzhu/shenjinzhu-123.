package com.sjz.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.sjz.dao.PathologyDao;
import com.sjz.entity.Pathology;
import com.sjz.util.BeanUtil;
import com.sjz.util.PagedResult;
@Service
public class PathologyServiceImpl implements PathologyService{
	@Autowired
	private PathologyDao pathologyDao;
	
	
	@Override
	public PagedResult<Pathology> queryByPage(String sysmptom, Integer pageNo, Integer pageSize) {
		pageNo=pageNo==null?1:pageNo;
		pageSize = pageSize == null?10:pageSize;  
	    PageHelper.startPage(pageNo,pageSize);  //startPage是告诉拦截器说我要开始分页了。分页参数是这两个。  
	    return BeanUtil.toPagedResult(pathologyDao.selectPathologyBySys(sysmptom));
	}


	@Override
	public boolean add(Pathology pathology) {
		try{
			pathologyDao.insertPathology(pathology);
			return true;
		}catch(Exception e){
			e.printStackTrace();
		}
		return false;
	}


	@Override
	public Pathology getPathology(Integer pathology_id) {
		return pathologyDao.selectPathologyById(pathology_id);
	}


	@Override
	public boolean update(Pathology pathology) {
		try{
			pathologyDao.updatePathology(pathology);
			return true;
		}catch(Exception e){
			e.printStackTrace();
		}
		return false;
	}


	@Override
	public void delete(Integer pathology_id) {
		pathologyDao.deletePathology(pathology_id);
	}

}
