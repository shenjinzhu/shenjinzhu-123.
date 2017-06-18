package com.sjz.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.sjz.entity.TestFen;

public interface TestFenDao {
				
	public TestFen selectTestFenById(Integer id);
	
	List<TestFen> selectTestFenByLoginid(@Param("loginid")String loginid);
	
	void deleteById(Integer id);
}
