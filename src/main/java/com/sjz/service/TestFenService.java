package com.sjz.service;

import com.sjz.entity.TestFen;
import com.sjz.util.PagedResult;

public interface TestFenService {
	TestFen selectTestFenById(Integer id);
	
	PagedResult<TestFen> queryByPage(String loginid,Integer pageNo,Integer pageSize);
	
	void deleteById(Integer id);
}
