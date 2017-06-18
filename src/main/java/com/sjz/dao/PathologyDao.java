package com.sjz.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.sjz.entity.Pathology;

public interface PathologyDao {
	List<Pathology> selectPathologyBySys(@Param("sysmptom") String sysmptom);
			 
	Pathology selectPathologyById(@Param("pathology_id") Integer pathology_id);
	
	void insertPathology(Pathology pathology);
	
	void updatePathology(Pathology pathology);
	
	void deletePathology(@Param("pathology_id") Integer pathology_id);
}
