package com.sjz.serviceTest;

import java.io.File;

import org.apache.log4j.Logger;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.sjz.baseTest.SpringTestCase;
import com.sjz.entity.TestFen;
import com.sjz.service.TestFenService;
import com.sjz.util.PagedResult;

public class TestFenCase extends SpringTestCase{

	@Autowired
	private TestFenService testFenService;
	
	Logger logger = Logger.getLogger(TestFenCase.class);
	
	@Test
	public void selectById(){
		TestFen tf=testFenService.selectTestFenById(5);
		logger.debug("查找结果"+tf);
	}
	
	
	@Test  
	public void queryByPage(){  
	     PagedResult<TestFen>  pagedResult = testFenService.queryByPage(null,1,10);//null表示查全部    
	     logger.debug("查找结果" + pagedResult);  
	}  
	@Test
	public void ewe(){
		   File html_file = new File("src/main/webapp/WEB-INF/file/gp.xlsx");  
	}
}
