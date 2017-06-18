package com.sjz.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.sjz.dao.TestFenDao;
import com.sjz.entity.TestFen;
import com.sjz.util.BeanUtil;
import com.sjz.util.PagedResult;
@Service
public class TestFenServiceImpl implements TestFenService {

	@Autowired
	private TestFenDao testFenDao;
	
	@Override
	public TestFen selectTestFenById(Integer id) {
		return testFenDao.selectTestFenById(id);
	}

	@Override
	public PagedResult<TestFen> queryByPage(String loginid, Integer pageNo, Integer pageSize) {
		pageNo = pageNo == null?1:pageNo;  
	    pageSize = pageSize == null?10:pageSize;  
	    PageHelper.startPage(pageNo,pageSize);  //startPage是告诉拦截器说我要开始分页了。分页参数是这两个。  
	    return BeanUtil.toPagedResult(testFenDao.selectTestFenByLoginid(loginid));
	}

	@Override
	public void deleteById(Integer id) {
		testFenDao.deleteById(id);
	}

}
