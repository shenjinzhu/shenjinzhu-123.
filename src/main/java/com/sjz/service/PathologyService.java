package com.sjz.service;

import com.sjz.entity.Pathology;
import com.sjz.util.PagedResult;

public interface PathologyService {
	PagedResult<Pathology> queryByPage(String sysmptom,Integer pageNo,Integer pageSize);;
	
	boolean add(Pathology pathology);
	
	Pathology getPathology(Integer pathology_id);
	
	boolean update(Pathology pathology);
	
	void delete(Integer pathology_id);
}
